package com.qfedu.service;

import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Menu;

import java.util.List;

public interface MenuService {
    PageInfo getAllMenu(int pageindex, int size);

    List<Menu> getAllMenu();

    Menu selectByPrimaryKey(Integer menuid);

    int updateByPrimaryKey(Menu record);

    int insertSelective(Menu record);

    int deleteByPrimaryKey(Integer menuid);

    void deleteMany(int[] menuid);
}

