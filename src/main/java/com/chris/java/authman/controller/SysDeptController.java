package com.chris.java.authman.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chris.java.authman.annotation.OperLog;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.chris.java.authman.model.SysDept;
import com.chris.java.authman.service.SysDeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * Department table front-end controller
 * </p>
 * <p>
 * .
 *
 * @since 2020-11-04
 */
@Controller
@RequestMapping("/sysDept/")
public class SysDeptController {
    @Autowired
    private SysDeptService sysDeptService;

    @GetMapping("listUI")
    public String listUI() {
        return "dept/list";
    }

    @RequestMapping("form")
    public String form(Map<String, Object> map) {
        return "dept/form";
    }

    @GetMapping("toSelectTree")
    public String toSelectTree() {
        return "dept/selectTree";
    }

    @PostMapping("list")
    @ResponseBody
    public Result<IPage<SysDept>> list(@RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
        // Construct pagination query conditions
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();


        Page<SysDept> page = new Page<>(pageNo, pageSize);

        IPage<SysDept> result = sysDeptService.selectDeptList(page, null);
        // Set total records
        result.setTotal(sysDeptService.count(queryWrapper));

        sysDeptService.count(queryWrapper);
        return ResultUtil.ok(result);
    }

    @GetMapping("listTree")
    @ResponseBody
    public Object listTree() {
        // User user = getUserEntity();
        // Build query conditions, search from root
        QueryWrapper<SysDept> queryWrapper = new QueryWrapper<>();
        // queryWrapper.like("pids", user.getDept().getPids()+user.getDeptId()).or().eq("id",user.getDeptId());
        queryWrapper.like("pids", 0);
        List<SysDept> list = sysDeptService.list(queryWrapper);
        return list;
    }

    @OperLog(operModule = "Department Management", operType = "Modify", operDesc = "Modify Department")
    @PostMapping("save")
    @ResponseBody
    public Result<String> add(@RequestBody SysDept dept) {
        // Add new
        if (dept.getId() == null) {
            dept.setCreateTime(new Date());
            dept.setCreateUser("TODO");
        }
        // Set parent department ID
        if (dept.getPid() != 0) {
            // Get the parent department's ids then append the parent department id
            SysDept parentDept = sysDeptService.getById(dept.getPid());
            dept.setPids(parentDept.getPids() + dept.getPid() + ",");
        }
        if (!sysDeptService.saveOrUpdate(dept)) {
            return ResultUtil.fail("Add failed");
        }
        return ResultUtil.ok("Add successful");
    }

    @OperLog(operModule = "Department Management", operType = "Delete", operDesc = "Delete Department")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id) {
        sysDeptService.removeById(id);

        return ResultUtil.ok("Delete successful!");
    }

    @RequestMapping(value = "{id}/select", method = RequestMethod.GET)
    public String select(Map<String, Object> map, @PathVariable Integer id) {
        SysDept sysDept = sysDeptService.getById(id);
        map.put("record", sysDept);
        return "sysDept/edit";
    }

}