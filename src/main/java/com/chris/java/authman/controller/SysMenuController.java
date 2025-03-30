package com.chris.java.authman.controller;


import com.feilong.core.bean.ConvertUtil;
import com.chris.java.authman.annotation.OperLog;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.chris.java.authman.common.Select2Entity;
import com.chris.java.authman.model.SysMenu;
import com.chris.java.authman.service.SysMenuService;
import com.chris.java.authman.util.TreeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * Permission table front-end controller
 * </p>
 * <p>
 * .
 *
 * @since 2020-11-04
 */
@Controller
@RequestMapping("/sysMenu")
public class SysMenuController {
    @Autowired
    private SysMenuService menuService;

    @GetMapping("listUI")
    public String listUI(Map<String, Object> map) {
        List<SysMenu> list = menuService.list(null);

        List<Select2Entity> select2List = new TreeUtil().getSelectTree(list, 0);
        map.put("menus", select2List);

        return "menu/list";
    }

    @GetMapping("list")
    @ResponseBody
    public Result<List<SysMenu>> list() {
        List<SysMenu> list = menuService.list(null);

        return ResultUtil.ok(list);
    }

    @OperLog(operModule = "Permission Management", operType = "Modify", operDesc = "Modify Permission")
    @PostMapping("save")
    @ResponseBody
    public Result<String> add(@RequestBody SysMenu entity) {
        if (entity.getId() == null) {
            entity.setCreateTime(new Date(System.currentTimeMillis()));
            entity.setUpdateTime(new Date(System.currentTimeMillis()));
        } else {
            entity.setUpdateTime(new Date(System.currentTimeMillis()));
        }

        if (!menuService.saveOrUpdate(entity)) {
            return ResultUtil.fail("Save failed!");
        }
        return ResultUtil.ok();
    }

    @OperLog(operModule = "Permission Management", operType = "Delete", operDesc = "Delete Permission")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id) {
        List<SysMenu> childrens = (List<SysMenu>) menuService.listByMap(ConvertUtil.toMap("pid", (Object) id));
        if (childrens != null && childrens.size() > 0) {
            return ResultUtil.fail("Permission contains sub-permissions!");
        } else {
            menuService.removeById(id);
        }
        return ResultUtil.ok();
    }

    @GetMapping(value = "{id}/select")
    public String select(Map<String, Object> map, @PathVariable(required = true) Integer id) {
        SysMenu sysMenu = menuService.getById(id);
        List<SysMenu> list = (List<SysMenu>) menuService.listByMap(null);
        List<Select2Entity> select2List = new TreeUtil().getSelectTree(list, 0);
        map.put("sysMenus", select2List);
        map.put("sysMenu", sysMenu);
        return "sysMenu/edit";
    }

    @GetMapping("icon")
    public String icon() {
        return "menu/icon";
    }

}