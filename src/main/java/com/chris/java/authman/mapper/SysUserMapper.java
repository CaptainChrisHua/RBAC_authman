package com.chris.java.authman.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chris.java.authman.model.SysRole;
import com.chris.java.authman.model.SysUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 用户表 Mapper 接口
 * </p>
 *
 * .
 * @since 2020-11-04
 */
public interface SysUserMapper extends BaseMapper<SysUser> {
    List<SysUser> selectUserList(Page page, @Param("name") String name, @Param("deptId") Integer deptId);
    SysUser selectUserRole(Map<String, Object> parameter);
    List<SysRole> selectRoleListByUserId(Integer userId);
}
