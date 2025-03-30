package com.chris.java.authman.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chris.java.authman.annotation.OperLog;
import com.chris.java.authman.common.Result;
import com.chris.java.authman.common.ResultUtil;
import com.chris.java.authman.model.SysOperLog;
import com.chris.java.authman.service.SysOperLogService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;

/**
 * <p>
 * Operation log table front-end controller
 * </p>
 *
 * @author test
 * @since 2021-02-16
 */
@Controller
@RequestMapping("/operlog")
public class OperLogController {
    @Autowired
    private SysOperLogService logService;

    @GetMapping("listUI")
    public String listUI() {
        return "operlog/list";
    }

    /**
     * Pagination query
     *
     * @param operDesc
     * @param pageNo
     * @param pageSize
     * @return
     */
    @PostMapping("/list")
    @ResponseBody
    public Result<IPage<SysOperLog>> list(@RequestParam(value = "operDesc", required = false) String operDesc, @RequestParam(defaultValue = "1") Integer pageNo, @RequestParam(defaultValue = "10") Integer pageSize) {
        // Construct query conditions
        QueryWrapper<SysOperLog> queryWrapper = new QueryWrapper<>();
        if (!StringUtils.isEmpty(operDesc)) {
            queryWrapper.like("oper_desc", operDesc);
        }
        queryWrapper.orderByDesc("create_time");

        Page<SysOperLog> page = new Page<>(pageNo, pageSize);

        IPage<SysOperLog> result = logService.page(page, queryWrapper);
        // Set total records
        result.setTotal(logService.count(queryWrapper));

        return ResultUtil.ok(result);
    }

    @RequiresRoles("admin")
    @PostMapping("/remove")
    @ResponseBody
    public Result<String> remove(@RequestParam Integer id) {
        logService.removeById(id);

        return ResultUtil.ok("Delete successful!");
    }

    @RequiresRoles("admin")
    @PostMapping("/removes")
    @ResponseBody
    public Result<String> removes(@RequestBody Integer[] ids) {
        logService.removeByIds(Arrays.asList(ids));

        return ResultUtil.ok("Delete successful!");
    }
}