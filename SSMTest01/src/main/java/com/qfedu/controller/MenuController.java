package com.qfedu.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Menu;
import com.qfedu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("menu")
public class MenuController {

    @Autowired
    private MenuService menuService;

    @RequestMapping("list") // menu/list
    public String getList(ModelMap modelMap,
                          @RequestParam(value="index",defaultValue="1") int pageindex,
                          @RequestParam(value="size",defaultValue="10") int size){
        PageInfo pageInfo = menuService.getAllMenu(pageindex,size);
        modelMap.put("pi",pageInfo);
        return "/power/menu/list.jsp";
    }

    @ResponseBody
    @RequestMapping("ml") // menu/ml
    public List<Menu> ml(){
        List<Menu> allMenu = menuService.getAllMenu();
        List<Menu> menus = new ArrayList<>();
        for(Menu menu : allMenu){
            if(menu.getUpmenuid()==-1){
                menus.add(menu);
            }
        }
        return menus;
    }

    @RequestMapping("getOne")
    public String getOneByMenuid(int menuid,ModelMap modelMap){
        Menu menu = menuService.selectByPrimaryKey(menuid);
        Menu menu1 = menuService.selectByPrimaryKey(menu.getUpmenuid());
        modelMap.put("menu",menu);
        modelMap.put("upMenu",menu1);
        return "/power/menu/info.jsp";
    }

    @RequestMapping("prepareToUpdate")
    public String prepareToUpdate(int menuid,ModelMap modelMap){
        //修改
        Menu menu = menuService.selectByPrimaryKey(menuid);
        modelMap.put("menu",menu);

        return "/power/menu/edit.jsp";
    }
    @RequestMapping("update")
    public String updateByid(Menu menu){
//        System.out.println(menu+"======================");
        menuService.updateByPrimaryKey(menu);
        return  "redirect:/menu/list";
    }


    @RequestMapping("add")
    public String addMenu(Menu menu){
        menuService.insertSelective(menu);
        return   "redirect:/menu/list";
    }

    @ResponseBody
    @RequestMapping("delete")
    public Integer deleteMenu(int menuid){
        int i = menuService.deleteByPrimaryKey(menuid);
        return i;
    }

    @RequestMapping("deleteMany")
    public String deleteMany(int[] menuid){
        //先查出所有upmenuid为-1的ID
        //根据判断筛选 删除剩下的menu
        //再根据数据库判断是否有子菜单，没有删除有，保留

        menuService.deleteMany(menuid);
        return   "redirect:/menu/list";
    }
}
