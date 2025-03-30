package com.chris.java.authman.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.feilong.core.Validator;
import com.feilong.core.bean.ConvertUtil;
import com.chris.java.authman.annotation.OperLog;
import com.chris.java.authman.common.MD5Util;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.chris.java.authman.model.SysRole;
import com.chris.java.authman.model.SysUser;
import com.chris.java.authman.service.SysDeptService;
import com.chris.java.authman.service.SysRoleService;
import com.chris.java.authman.service.SysRoleUserService;
import com.chris.java.authman.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <p>
 * User front-end controller
 * </p>
 * <p>
 * .
 *
 * @since 2020-11-04
 */
@Controller
@RequestMapping("/sysUser")
public class SysUserController {
    @Autowired
    private SysUserService userService;

    @Autowired
    private SysRoleService roleService;

    @Autowired
    private SysDeptService deptService;

    @Autowired
    private SysRoleUserService roleUserService;

    @GetMapping("listUI")
    public String listUI() {
        return "user/list";
    }

    @GetMapping("toSelectDept")
    public String SelectDept() {
        return "user/selectDept";
    }

    @GetMapping("selectRole/{userId}")
    public String SelectRole(@PathVariable Integer userId, Model model) {
        // Query roles owned by user ID
        //List<Map<String,Object>> roles = userService.selectRolesByUserId(userId);
        SysUser entity = userService.getById(userId);
        model.addAttribute("user", entity);

        return "user/selectRole";
    }

    @PostMapping("list")
    @ResponseBody
    public Result<IPage<SysUser>> list(@RequestParam(value = "username", required = false) String username, @RequestParam(value = "deptId", required = false) Integer deptId, @RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
        // Get current logged-in user's department ID
        /*Integer currentDeptId = getUserEntity().getDeptId();
        if(deptId==null){
            deptId = currentDeptId;
        }*/
        QueryWrapper<SysUser> queryWrapper = new QueryWrapper<>();
        Page<SysUser> page = new Page<>(pageNo, pageSize);
        IPage<SysUser> result = userService.selectUserList(page, username, deptId);
        // Set total records
        result.setTotal(userService.count(queryWrapper));


        return ResultUtil.ok(result);
    }

    @GetMapping("checkAccount")
    @ResponseBody
    public boolean checkAccount(@RequestParam(required = true) String username) {
        List<SysUser> user = (List<SysUser>) userService.listByMap(ConvertUtil.toMap("username", (Object) username));
        if (!Validator.isNullOrEmpty(user)) {
            return false;
        }
        return true;
    }

    @OperLog(operModule = "User Management", operType = "Modify", operDesc = "Modify User")
    @PostMapping("save")
    @ResponseBody
    public Result<String> add(@RequestBody SysUser user, Map<String, Object> map) {
        if (user.getId() == null) {
            // Check if user exists
            if (!checkAccount(user.getUsername())) {
                return ResultUtil.fail("Username already exists!");
            }
            // Set password and encryption salt for the new user
            user.setPassword(MD5Util.md5Password(user.getPassword(), 2));
            //user.setSalt(userEntity.getSalt());
            // Set creator name
            user.setCreateUser("");
            user.setCreateTime(new Date());

            // Save user
            boolean result = userService.save(user);
            if (!result) {
                return ResultUtil.fail("Add failed!");
            }

            // Add role and user relationship record
            /*SysRoleUser roleUser = new SysRoleUser();
            roleUser.setRoleId(user.getRole().getId());
            roleUser.setUserId(user.getId());
            roleUserService.save(roleUser);*/
        } else {
            user.setUpdateTime(new Date());
            userService.saveOrUpdate(user);
        }
        return ResultUtil.ok();
    }

    @OperLog(operModule = "User Management", operType = "Delete", operDesc = "Delete User")
    @PostMapping("remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id) {
        // 1. Delete user and role association records
        Map<String, Object> param = new HashMap<>();
        param.put("user_id", id);
        roleUserService.removeByMap(param);
        // 2. Delete user
        if (!userService.removeById(id)) {
            return ResultUtil.fail("Delete failed!");
        }
        return ResultUtil.ok();
    }

    @GetMapping("info/{userId}")
    public String selectInfo(Map<String, Object> map, @PathVariable(required = true) Integer userId) {
        SysUser user = userService.getById(userId);
        map.put("user", user);
        return "user/info";
    }

    // Query roles owned by user based on user ID
    @GetMapping("/getRoles/{userId}")
    @ResponseBody
    public List<SysRole> getRoles(@PathVariable Integer userId) {
        List<SysRole> roles = userService.selectRolesByUserId(userId);

        return roles;
    }

    // Save user roles
    @OperLog(operModule = "User Management", operType = "Modify", operDesc = "Assign Roles")
    @PostMapping("saveRole")
    @ResponseBody
    public Result<String> saveRole(@RequestParam Integer userId, @RequestParam(value = "roleIds[]") Integer[] roleIds) {
        userService.saveRole(userId, Arrays.asList(roleIds));
        return ResultUtil.ok();
    }

}