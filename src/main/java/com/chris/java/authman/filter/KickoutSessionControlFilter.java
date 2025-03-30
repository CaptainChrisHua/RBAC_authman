package com.chris.java.authman.filter;

import com.chris.java.authman.model.SysUser;
import com.chris.java.authman.util.ShiroUtils;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.mgt.DefaultSessionKey;
import org.apache.shiro.session.mgt.SessionManager;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import java.io.Serializable;
import java.util.Deque;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.Map;

public class KickoutSessionControlFilter extends AccessControlFilter {

    private String kickoutUrl; //URL to redirect after being kicked out
    private boolean kickoutAfter = false; //Kick out previous login/later login users, default is to kick out previous login users
    private int maxSession = 1; //Maximum number of sessions for the same account, default is 1

    private SessionManager sessionManager;
    private Cache<String, Deque<Serializable>> cache;

    public void setKickoutUrl(String kickoutUrl) {
        this.kickoutUrl = kickoutUrl;
    }

    public void setKickoutAfter(boolean kickoutAfter) {
        this.kickoutAfter = kickoutAfter;
    }

    public void setMaxSession(int maxSession) {
        this.maxSession = maxSession;
    }

    public void setSessionManager(SessionManager sessionManager) {
        this.sessionManager = sessionManager;
    }

    //Set the prefix of the Cache key
    public void setCacheManager(CacheManager cacheManager) {
        this.cache = cacheManager.getCache("shiro-kickout-session");
    }

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        return false;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        Subject subject = getSubject(request, response);
        if (!subject.isAuthenticated() && !subject.isRemembered()) {
            //If not logged in, proceed with the subsequent flow
            return true;
        }

        Session session = subject.getSession();
        SysUser user = (SysUser) subject.getPrincipal();
        String username = user.getUsername();
        Serializable sessionId = session.getId();
        //Read from cache, if not exists then store it
        Deque<Serializable> deque = cache.get(username);

        if (deque == null) {
            deque = new LinkedList<Serializable>();
            cache.put(username, deque);
        }

        //If the queue doesn't contain this sessionId and the user hasn't been kicked out, add to the queue
        if (!deque.contains(sessionId) && session.getAttribute("kickout") == null) {
            //Store sessionId in the queue
            deque.push(sessionId);
        }

        //If the number of sessionIds in the queue exceeds the maximum session limit, start kicking users
        while (deque.size() > maxSession) {
            Serializable kickoutSessionId = null;
            if (kickoutAfter) { //If kicking out the later one
                kickoutSessionId = deque.removeFirst();
            } else { //Otherwise kick out the earlier one
                kickoutSessionId = deque.removeLast();
            }
            try {
                //Get the session object of the kicked out sessionId
                Session kickoutSession = sessionManager.getSession(new DefaultSessionKey(kickoutSessionId));
                if (kickoutSession != null) {
                    //Set the kickout attribute of the session to indicate it's been kicked out
                    kickoutSession.setAttribute("kickout", true);
                }
            } catch (Exception e) {//ignore exception
            }
        }

        //If kicked out, log out directly and redirect to the kickout URL
        if ((Boolean) session.getAttribute("kickout") != null) {
            //Session has been kicked out
            try {
                //Log out
                subject.logout();
            } catch (Exception e) { //ignore
            }
            Map<String, Object> result = new HashMap<String, Object>();
            //Check if it's an Ajax request
            if (ShiroUtils.isAjax(request)) {
                result.put("status", "403");
                result.put("message", "You have been kicked out, please log in again!");
                ShiroUtils.writeJson(response, result);
            } else {
                WebUtils.getSavedRequest(request);
                //Redirect to the login page
                WebUtils.issueRedirect(request, response, kickoutUrl);
            }
            return false;
        }
        return true;
    }
}