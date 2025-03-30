package com.chris.java.authman.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chris.java.authman.common.JSTreeEntity;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.feilong.core.bean.ConvertUtil;
import com.chris.java.authman.annotation.OperLog;
import com.chris.java.authman.common.*;
import com.chris.java.authman.model.SysMenu;
import com.chris.java.authman.model.SysRole;
import com.chris.java.authman.model.SysRoleUser;
import com.chris.java.authman.service.SysMenuService;
import com.chris.java.authman.service.SysRoleService;
import com.chris.java.authman.service.SysRoleUserService;
import com.chris.java.authman.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.*;

/**
 * <p>
 * Role table front-end controller
 * </p>
 * <p>
 * .
 *
 * @since 2020-11-04
 */
@Controller
@RequestMapping("/sysRole")
public class SysRoleController {
    @Autowired
    private SysRoleService roleService;

    @Autowired
    private SysMenuService menuService;

    @Autowired
    private SysRoleUserService roleUserService;

    @GetMapping("listUI")
    public String listUI() {
        return "role/list";
    }

    @GetMapping("selectMenu/{id}")
    public String selectMenu(@PathVariable Integer id, Map<String, Object> map) {
        SysRole role = roleService.getById(id);
        map.put("role", role);
        return "role/selectMenu";
    }

    @PostMapping("list")
    @ResponseBody
    public Result<IPage<SysRole>> list(@RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
        QueryWrapper<SysRole> queryWrapper = new QueryWrapper<>();
        Page<SysRole> page = new Page<>(pageNo, pageSize);
        IPage<SysRole> result = roleService.selectRoleList(page, null);
        // Set total records
        result.setTotal(roleService.count(queryWrapper));

        /*Pager pager = JsonUtil.getObjectFromJson(gridPager, Pager.class);
        Map<String, Object> parameters = null;
        if(Validator.isNullOrEmpty(pager.getParameters())){
            parameters = new HashMap<>();
        }else{
            parameters = pager.getParameters();
        }
        Integer deptId = getUserEntity().getDeptId();
        if(Validator.isNotNullOrEmpty(parameters.get("deptId"))){
            deptId = Integer.parseInt(parameters.get("deptId").toString());
        }
        Page<SysRole> list = roleService.selectRoleList(new Page<SysRole>(pager.getNowPage(), pager.getPageSize()),deptId);
        makeGridResult(parameters, pager, list);*/
        return ResultUtil.ok(result);
    }

    @GetMapping("form")
    public String form(Map<String, Object> map) {
        return "role/form";
    }

    @OperLog(operModule = "User Management", operType = "Modify", operDesc = "Modify Role")
    @PostMapping("save")
    @ResponseBody
    public Result<String> add(@RequestBody SysRole role) {
        if (role.getId() == null) {
            role.setCreateTime(new Date(System.currentTimeMillis()));
            role.setUpdateTime(new Date(System.currentTimeMillis()));
        } else {
            role.setUpdateTime(new Date(System.currentTimeMillis()));
        }

        if (!roleService.saveOrUpdate(role)) {
            return ResultUtil.fail("Save failed!");
        }
        return ResultUtil.ok();
    }

    @OperLog(operModule = "Role Management", operType = "Delete", operDesc = "Delete Role")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id) {
        // Check if there are users under this role
        QueryWrapper<SysRoleUser> roleUserQuery = new QueryWrapper<>();
        roleUserQuery.eq("role_id", id);
        int roleUserCount = roleUserService.count(roleUserQuery);
        if (roleUserCount > 0) {
            return ResultUtil.fail("There are users under this role!");
        }

        // First delete the role and permission relationship records
        roleService.deleteRoleMenu(id);
        // Delete role record
        roleService.removeById(id);

        return ResultUtil.ok();
    }

    /**
     * Query role by role ID
     *
     * @param map
     * @param roleId
     * @return
     */
    @GetMapping("{roleId}/select")
    public String select(Map<String, Object> map, @PathVariable(required = true) Integer roleId) {
        SysRole role = roleService.getById(roleId);
        map.put("role", role);
        return "role/edit";
    }

    @GetMapping("{roleId}/menu")
    public String permission(Map<String, Object> map, @PathVariable(required = true) Integer roleId) {
        SysRole role = roleService.getById(roleId);
        List<SysMenu> resources = menuService.queryMenuList(ConvertUtil.toMap("roleId", (Object) roleId));
        List<JSTreeEntity> jstreeList = new TreeUtil().generateJSTree(resources);
        map.put("role", role);
        map.put("menus", jstreeList);
        return "role/menu";
    }

    /**
     * Query menu permissions owned by a role based on role ID
     *
     * @param roleId
     * @return
     */
    @GetMapping("/getMenu/{roleId}")
    @ResponseBody
    public List<SysMenu> getMenu(@PathVariable(required = true) Integer roleId) {
        List<SysMenu> menus = menuService.queryMenuList(ConvertUtil.toMap("roleId", (Object) roleId));
        return menus;
    }

    @OperLog(operModule = "Role Management", operType = "Modify", operDesc = "Assign Permissions")
    @PostMapping("saveMenu")
    @ResponseBody
    public Result<String> saveMenu(Integer roleId, @RequestParam(value = "menuIds[]") Integer[] menuIds) {
        roleService.saveMenu(roleId, Arrays.asList(menuIds));
        return ResultUtil.ok();
    }

    @GetMapping("listAll")
    @ResponseBody
    public List<SysRole> listAll() {
        List<SysRole> sysRoles = roleService.selectRoleList(null);
        /*List<SelectEntity> selectList = new ArrayList<>();
        SelectEntity entity = null;
        for (SysRole role: sysRoles
             ) {
            entity = new SelectEntity();
            entity.setId(role.getId());
            entity.setName(role.getRoleName());
            selectList.add(entity);
        }*/

        return sysRoles;
    }
}