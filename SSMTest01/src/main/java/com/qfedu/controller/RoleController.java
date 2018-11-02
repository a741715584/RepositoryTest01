package com.qfedu.controller;


import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Menu;
import com.qfedu.domain.Role;
import com.qfedu.domain.RolePro;
import com.qfedu.service.MenuService;
import com.qfedu.service.RoleSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("role")
public class RoleController {

    @Autowired
    private RoleSerivce roleSerivce;
    @Autowired
    private MenuService menuService;

    @RequestMapping("all") //  role/all
    public String getAll(@RequestParam(defaultValue = "1") int pageIndex,
                         @RequestParam(defaultValue = "5") int pageSize,
                         ModelMap modelMap){
        List<Role> allRole = roleSerivce.getAllRole();
        PageHelper.startPage(pageIndex,pageSize);
        PageInfo pageInfo = new PageInfo(allRole);
        modelMap.put("pi",pageInfo);
        modelMap.put("pageIndex",pageIndex);
        modelMap.put("pageSize",pageSize);
        return "/power/role/list.jsp";
    }

    @RequestMapping("prepareToAdd")  //  role/prepareToAdd
    public String prepareToAdd(ModelMap modelMap){
        List<Menu> allMenu = menuService.getAllMenu();
        modelMap.put("menu", allMenu);

        return "/power/role/add.jsp";
    }


    @RequestMapping("add") //  role/add
    public String addRole(Role role,int[] menu){
        System.out.println("添加。。。。。。。。。。。。。");
        roleSerivce.addRole(menu,role);
        return "redirect:/role/all";
    }

     @RequestMapping("getone") //  role/getone
        public String getOneById(int roleid,
                                 ModelMap modelMap){
         RolePro rolePro = roleSerivce.selectRoleAndMenuByRoleId(roleid);
        modelMap.put("role",rolePro);
         return  "/power/role/info.jsp";
     }


     @RequestMapping("prepareToUpdate")  // role/prepareToUpdate
    public String prepareToUpdate(int roleid,
                                  ModelMap modelMap){
            //查询操作 要把所有的信息查询出来 并且把 所有的菜单查询出来
         RolePro rolePro = roleSerivce.selectRoleAndMenuByRoleId(roleid);
         List<Menu> allMenu = menuService.getAllMenu();
         modelMap.put("role",rolePro);
         modelMap.put("menu",allMenu);
         return  "/power/role/edit.jsp";
     }

     @RequestMapping("update")
    public String updateByRoleId(Role role,int[] menu){
        //一个更新role 表 还有就是 middle表  middle表的操作 就是先根据roleid删除 然后在添加
         System.out.println(role+"........");
        roleSerivce.updateRoleMessage(menu,role);
        return  "all";
     }

     @ResponseBody
     @RequestMapping("delete") // role/delete
    public Integer deleteByRoleid(Integer roleid){
         System.out.println(roleid+"==================");
        //首先已经赋予用户的角色不能删除，所有要先判断当前要删除的角色是否已经有用户使用
         //有，则不删除，没有则删除 还要把middle表里的数据删除，先删除middle表的数据再删除角色
         int i = roleSerivce.deleteRoleByRoleid(roleid);
         return  i;
     }
}
