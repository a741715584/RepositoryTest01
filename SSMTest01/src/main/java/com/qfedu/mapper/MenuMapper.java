package com.qfedu.mapper;

import com.qfedu.domain.Menu;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MenuMapper {
    int deleteByPrimaryKey(Integer menuid);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Integer menuid);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    @Select("select *from menu")
    List<Menu> getAllMenu();

    @Select("select count(*) from menu where upmenuid=#{upmenuid}")
    int selectCountMenuByUpid(int upmenuid);

    @Select("select menuid from menu where upmenuid=-1 ")
    List<Integer> selectMenuByUpmenuid();

    int  deleteMany(List list);
}