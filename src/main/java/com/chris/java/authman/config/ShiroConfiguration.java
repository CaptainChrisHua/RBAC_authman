package com.chris.java.authman.config;

import at.pollux.thymeleaf.shiro.dialect.ShiroDialect;
import com.chris.java.authman.filter.KickoutSessionControlFilter;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.ehcache.EhCacheManager;
import org.apache.shiro.mgt.SecurityManager;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.session.mgt.eis.JavaUuidSessionIdGenerator;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.spring.security.interceptor.AuthorizationAttributeSourceAdvisor;
import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.mgt.CookieRememberMeManager;
import org.apache.shiro.web.mgt.DefaultWebSecurityManager;
import org.apache.shiro.web.servlet.SimpleCookie;
import org.apache.shiro.web.session.mgt.DefaultWebSessionManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.servlet.Filter;
import java.util.LinkedHashMap;
import java.util.Map;

@Configuration
public class ShiroConfiguration {

	/**
	 * ShiroFilterFactoryBean 处理拦截资源文件问题。
	 * 注意：单独一个ShiroFilterFactoryBean配置是或报错的，以为在
	 * 初始化ShiroFilterFactoryBean的时候需要注入：SecurityManager
	 *
	 * Filter Chain定义说明 1、一个URL可以配置多个Filter，使用逗号分隔 2、当设置多个过滤器时，全部验证通过，才视为通过
	 * 3、部分过滤器可指定参数，如perms，roles
	 */
	@Bean
	public ShiroFilterFactoryBean shirFilter(SecurityManager securityManager) {
		ShiroFilterFactoryBean shiroFilterFactoryBean = new ShiroFilterFactoryBean();

		// 必须设置 SecurityManager
		shiroFilterFactoryBean.setSecurityManager(securityManager);

		Map<String, Filter> filtersMap = new LinkedHashMap<String, Filter>();
		//限制同一帐号同时在线的个数。
		filtersMap.put("kickout", kickoutSessionControlFilter());
		shiroFilterFactoryBean.setFilters(filtersMap);
		// 拦截器.
		Map<String, String> filterChainDefinitionMap = new LinkedHashMap<String, String>();

		// 配置退出过滤器,其中的具体的退出代码Shiro已经替我们实现了
		filterChainDefinitionMap.put("/logout", "logout");

		//配置记住我或认证通过可以访问的地址
        filterChainDefinitionMap.put("/index", "user");
        filterChainDefinitionMap.put("/", "user");

        filterChainDefinitionMap.put("/bootstrap/**", "anon");
        filterChainDefinitionMap.put("/static/**", "anon");
        filterChainDefinitionMap.put("/plugins/**", "anon");
        filterChainDefinitionMap.put("/ui/**", "anon");
        filterChainDefinitionMap.put("/dologin", "anon");
        filterChainDefinitionMap.put("/getVerifyCode","anon");

        filterChainDefinitionMap.put("/article", "anon");


		// <!-- authc:所有url都必须认证通过才可以访问; anon:所有url都都可以匿名访问-->
		filterChainDefinitionMap.put("/**", "authc,kickout");
		// 如果不设置默认会自动寻找Web工程根目录下的"/login.jsp"页面
		shiroFilterFactoryBean.setLoginUrl("/login");
		// 登录成功后要跳转的链接
		shiroFilterFactoryBean.setSuccessUrl("/index");
		// 未授权界面;
		shiroFilterFactoryBean.setUnauthorizedUrl("/403");

		shiroFilterFactoryBean.setFilterChainDefinitionMap(filterChainDefinitionMap);


		return shiroFilterFactoryBean;
	}

	@Bean
	public SecurityManager securityManager() {
		DefaultWebSecurityManager securityManager = new DefaultWebSecurityManager();
		//设置realm.
	    securityManager.setRealm(myShiroRealm());
	    //注入缓存管理器;
	    securityManager.setCacheManager(ehCacheManager());//这个如果执行多次，也是同样的一个对象;
	    //注入记住我管理器;
	    securityManager.setRememberMeManager(rememberMeManager());
	    securityManager.setSessionManager(sessionManager());
		return securityManager;
	}

	@Bean
    public MyShiroRealm myShiroRealm(){
       MyShiroRealm myShiroRealm = new MyShiroRealm();
       myShiroRealm.setCredentialsMatcher(hashedCredentialsMatcher());
       return myShiroRealm;
    }

	@Bean
    public HashedCredentialsMatcher hashedCredentialsMatcher(){
       HashedCredentialsMatcher hashedCredentialsMatcher = new RetryLimitHashedCredentialsMatcher(ehCacheManager());

       hashedCredentialsMatcher.setHashAlgorithmName("md5");//散列算法:这里使用MD5算法;
       hashedCredentialsMatcher.setHashIterations(2);//散列的次数，比如散列两次，相当于 md5(md5(""));

       return hashedCredentialsMatcher;
    }

	@Bean
    public AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor(SecurityManager securityManager){
       AuthorizationAttributeSourceAdvisor authorizationAttributeSourceAdvisor = new AuthorizationAttributeSourceAdvisor();
       authorizationAttributeSourceAdvisor.setSecurityManager(securityManager);
       return authorizationAttributeSourceAdvisor;
    }

     /**
     * shiro缓存管理器;
     * 需要注入对应的其它的实体类中：
     * 1、安全管理器：securityManager
     * 可见securityManager是整个shiro的核心；
     * @return
     */
    @Bean
    public EhCacheManager ehCacheManager(){
       EhCacheManager cacheManager = new EhCacheManager();
        cacheManager.setCacheManagerConfigFile("classpath:config/ehcache.xml");
       return cacheManager;
    }

    @Bean
	public DefaultWebSessionManager sessionManager() {
    	 DefaultWebSessionManager sessionManager = new DefaultWebSessionManager();
         sessionManager.setSessionDAO(sessionDAO());
         sessionManager.setSessionIdCookieEnabled(true);
         sessionManager.setSessionIdCookie(sessionIdCookie());
         return sessionManager;
	}

    public SimpleCookie sessionIdCookie(){
    	return new SimpleCookie("authman.session.id");
    }


    @Bean
    public SessionDAO sessionDAO(){
    	//LocalSessionDAO sessionDao = new LocalSessionDAO();
    	EnterpriseCacheSessionDAO sessionDao = new EnterpriseCacheSessionDAO();
    	sessionDao.setCacheManager(ehCacheManager());
    	sessionDao.setActiveSessionsCacheName("shiro-activeSessionCache");
    	sessionDao.setSessionIdGenerator(new JavaUuidSessionIdGenerator());
    	return sessionDao;
    }

     /**
     * cookie对象;
     * @return
	  */
    @Bean
    public SimpleCookie rememberMeCookie(){
       //这个参数是cookie的名称，对应前端的checkbox的name = rememberMe
       SimpleCookie simpleCookie = new SimpleCookie("rememberMe");
       //<!-- 记住我cookie生效时间30天 ,单位秒;-->
       simpleCookie.setMaxAge(259200);
       return simpleCookie;
    }

     /**
     * cookie管理对象;
     * @return
	  */
    @Bean
    public CookieRememberMeManager rememberMeManager(){
       CookieRememberMeManager cookieRememberMeManager = new CookieRememberMeManager();
       cookieRememberMeManager.setCookie(rememberMeCookie());
       return cookieRememberMeManager;
    }

     /**
     * ShiroDialect，为了在thymeleaf里使用shiro的标签的bean
     * @return
	 */
    @Bean
    public ShiroDialect shiroDialect(){
    	return new ShiroDialect();
    }

    @Bean
    public KickoutSessionControlFilter kickoutSessionControlFilter(){
     	KickoutSessionControlFilter kickoutSessionControlFilter = new KickoutSessionControlFilter();
     	//使用cacheManager获取相应的cache来缓存用户登录的会话；用于保存用户—会话之间的关系的；
     	//这里我们还是用之前shiro使用的redisManager()实现的cacheManager()缓存管理
     	//也可以重新另写一个，重新配置缓存时间之类的自定义缓存属性
     	kickoutSessionControlFilter.setCacheManager(ehCacheManager());
     	//用于根据会话ID，获取会话进行踢出操作的；
     	kickoutSessionControlFilter.setSessionManager(sessionManager());
     	//是否踢出后来登录的，默认是false；即后者登录的用户踢出前者登录的用户；踢出顺序。
     	kickoutSessionControlFilter.setKickoutAfter(false);
     	//同一个用户最大的会话数，默认1；比如2的意思是同一个用户允许最多同时两个人登录；
     	kickoutSessionControlFilter.setMaxSession(1);
     	//被踢出后重定向到的地址；
     	kickoutSessionControlFilter.setKickoutUrl("/login");
         return kickoutSessionControlFilter;
      }
}
