package com.chris.java.authman.mapper;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.chris.java.authman.model.SysMenu;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * <p>
 * 资源表 Mapper 接口
 * </p>
 *
 * .
 * @since 2020-11-04
 */
public interface SysMenuMapper extends BaseMapper<SysMenu> {
    List<SysMenu> findAllByUserId(@Param(value = "userId") int userId);

    List<SysMenu> findMenusByUserId(@Param(value = "userId") int userId);

    List<SysMenu> queryMenuList(Map<String, Object> parameter);

    List<SysMenu> selectMenuPage(Page page, @Param("ew") Wrapper<SysMenu> wrapper);
}
