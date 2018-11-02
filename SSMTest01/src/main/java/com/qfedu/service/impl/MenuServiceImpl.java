package com.qfedu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Menu;
import com.qfedu.mapper.MenuMapper;
import com.qfedu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class MenuServiceImpl implements MenuService {


    @Autowired
    private MenuMapper menuMapper;
    @Override
    public PageInfo getAllMenu(int pageindex, int size) {
        PageHelper.startPage(pageindex, size);
        List<Menu> allMenu = menuMapper.getAllMenu();
        PageInfo pageInfo = new PageInfo(allMenu);
        return pageInfo;
    }

    @Override
    public List<Menu> getAllMenu() {
        return  menuMapper.getAllMenu();
    }

    @Override
    public Menu selectByPrimaryKey(Integer menuid) {
        return menuMapper.selectByPrimaryKey(menuid);
    }

    @Override
    public int updateByPrimaryKey(Menu record) {
        return menuMapper.updateByPrimaryKey(record);
    }

    @Override
    public int insertSelective(Menu record) {
        return menuMapper.insertSelective(record);
    }

    @Override
    public int deleteByPrimaryKey(Integer menuid) {
        //首先要判断当前删除的对象是否有子菜单
        //有的话则返回0表示不能删除，没有的话就删除返回任意大于0的数字
        int i = menuMapper.selectCountMenuByUpid(menuid);
        if(i>0){
            return 0;
        }

        return  menuMapper.deleteByPrimaryKey(menuid);
    }

    @Transactional
    @Override
    public void deleteMany(int[] menuid) {
        //查询所有为-1的ID
        List<Integer> integers = menuMapper.selectMenuByUpmenuid();
        List<Integer> upmenu = new ArrayList<>(); //一级菜单
        List<Integer> menu  = new ArrayList<>(); //二级菜单
          for(int i=0;i<menuid.length;i++){
            if(integers.contains(menuid[i])){
                upmenu.add(menuid[i]);
            }else{
                menu.add(menuid[i]);
            }
        }
        // 删除所有menu集合中的id的menu
        if(menu.size()>0){
            menuMapper.deleteMany(menu);
        }
        //判断upmenu中是否有存在子菜单的，存在的不删 不存在的删除
        for(Integer i : upmenu){
            //查询
            int count = menuMapper.selectCountMenuByUpid(i);
            if(count==0){
                menuMapper.deleteByPrimaryKey(i);
            }
        }

    }
}
