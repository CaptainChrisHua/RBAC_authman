package com.chris.java.authman.controller;

import com.chris.java.authman.annotation.OperLog;
import com.feilong.core.Validator;
import com.chris.java.authman.common.MD5Util;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.chris.java.authman.model.SysMenu;
import com.chris.java.authman.model.SysUser;
import com.chris.java.authman.service.SysMenuService;
import com.chris.java.authman.service.SysOperLogService;
import com.chris.java.authman.service.SysUserService;
import com.chris.java.authman.util.RandomValidateCodeUtil;
import com.chris.java.authman.util.TreeUtil;
import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * User account table front-end controller
 * </p>
 *
 * @author xj
 * @since 2016-12-20
 */
@Controller
public class IndexController {
    private Logger logger = LogManager.getLogger(IndexController.class.getName());

    @Resource
    private SysMenuService menuService;

    @Autowired
    SysOperLogService logService;

    @Autowired
    SysUserService userService;

    @RequestMapping({"/", "/index"})
    public String index(Map<String, Object> map, String page) {
        SysUser userEntity = (SysUser) SecurityUtils.getSubject().getPrincipal();
        List<SysMenu> treeMenuList = null;
        // Check if user has been assigned a role
        if (userEntity.getRole() == null) {
            return "403";
        }
        if (userEntity.getRole().getRoleCode().equals("administrator")) {
            treeMenuList = new TreeUtil().treeMenuList((List<SysMenu>) menuService.listByMap(null), 0);
        } else {
            treeMenuList = menuService.findTreeMenusByUserId(userEntity.getId());
        }
        map.put("menus", treeMenuList);
        map.put("user", userEntity);
        map.put("page", page);

        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(HttpServletResponse response, ServletRequest request, @RequestHeader HttpHeaders header, Map<String, Object> map, String msg) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            return "redirect:index";
        }
        if (Validator.isNotNullOrEmpty(header.get("X-Requested-With"))) {
            response.setHeader("sessionstatus", "timeout");
        }
        return "login";
    }

    @ResponseBody
    @RequestMapping(value = "/dologin", method = RequestMethod.POST)
    public Result<String> doLogin(String username, String password, String rememberMe,
                                  String verifyCode, Map<String, Object> map,
                                  HttpSession session) {
        logger.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>{},{},{}", username, password, rememberMe);
        String msg = "";
        Subject subject = SecurityUtils.getSubject();
        ;
        // Verify captcha code
        String sessionVerifyCode = (String) session.getAttribute("SESSION_VERIFY_CODE");
        if (!verifyCode.equals(sessionVerifyCode)) {
            msg = "Verification code error!";
        } else {
            UsernamePasswordToken token = new UsernamePasswordToken(username, password);
            token.setRememberMe(rememberMe == null ? false : true);
            subject.getSession().setAttribute("account", username);
            try {
                subject.login(token);
                logger.info("{} login successful!", username);
                subject.getSession().removeAttribute("msg");
                //return "redirect:/index";
                return ResultUtil.ok();
            } catch (UnknownAccountException e) {
                msg = "Account does not exist!";
            } catch (IncorrectCredentialsException e) {
                msg = "Password error!";
            } catch (LockedAccountException e) {
                msg = "Your account has been locked, please contact the administrator!";
            } catch (ExcessiveAttemptsException e) {
                msg = "Too many login failures, please try again later!";
            } catch (Exception e) {
                msg = "System error, please contact the administrator!";
            }
        }

        map.put("msg", msg);
        // This method does not handle login success, it is handled by shiro.
        logger.info("{} login failed, error={}!", username, msg);
        subject.getSession().setAttribute("msg", msg);
        return ResultUtil.fail(msg);
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {
        // Log out
        SecurityUtils.getSubject().logout();
        return "redirect:login";
    }

    /**
     * Generate verification code
     */
    @RequestMapping(value = "/getVerifyCode")
    public void getVerify(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.setContentType("image/jpeg");//Set the response type, telling the browser the output content is an image
            response.setHeader("Pragma", "No-cache");//Set response header information, telling the browser not to cache this content
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expire", 0);
            RandomValidateCodeUtil randomValidateCode = new RandomValidateCodeUtil();
            randomValidateCode.getRandcode(request, response);//Output verification code image method
        } catch (Exception e) {
            logger.error("Failed to get verification code>>>>   ", e);
        }
    }

    /**
     * Change password
     *
     * @param param
     * @return
     */
    @PostMapping("/modifyPassword")
    @ResponseBody
    public Result<String> modifyPassword(@RequestBody Map<String, String> param, HttpServletRequest request) {
        // Verify password
        String oldPassword = param.get("oldPassword");
        String newPassword = param.get("newPassword");
        String newPassword2 = param.get("newPassword2");

        if (StringUtils.isEmpty(oldPassword)) {
            return ResultUtil.fail("Original password cannot be empty!");
        }

        if (StringUtils.isEmpty(newPassword)) {
            return ResultUtil.fail("New password cannot be empty!");
        }

        if (StringUtils.isEmpty(newPassword2)) {
            return ResultUtil.fail("Confirmation password cannot be empty!");
        }

        SysUser user = (SysUser) request.getSession().getAttribute("userSession");

        String realPassword = user.getPassword();
        if (!(MD5Util.md5Password(oldPassword, 2).equals(realPassword))) {
            return ResultUtil.fail("Original password input error!");
        }

        if (!(newPassword.equals(newPassword2))) {
            return ResultUtil.fail("New passwords do not match!");
        }

        user.setPassword(MD5Util.md5Password(newPassword, 2));

        userService.saveOrUpdate(user);

        return ResultUtil.ok();
    }
}