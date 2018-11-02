package com.qfedu.controller;

import com.qfedu.commons.POIUtil;
import com.qfedu.domain.Classes;
import com.qfedu.domain.ClassesPro;
import com.qfedu.domain.PageUtil;
import com.qfedu.service.ClassesService;
import com.qfedu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.util.*;

@RequestMapping("classes")
@Controller
public class ClassesController {
    @Autowired
    private ClassesService classesService;
    @Autowired
    private DepartmentService departmentService;

    //班级详细
    @RequestMapping("idInfo") //  classes/id
    public ModelAndView selectByIdFromInfo(Integer id , ModelAndView modelAndView){
        modelAndView.addObject("classMessage",classesService.selectById(id));
        modelAndView.setViewName("/Educational/class/info.jsp");
        return modelAndView;
    }


    @RequestMapping("idEdit") //  classes/id
    public ModelAndView selectByIdFromEdit(Integer id , ModelAndView modelAndView){
        modelAndView.addObject("classMessage",classesService.selectById(id));
        modelAndView.addObject("list",departmentService.selectAll());
        modelAndView.setViewName("/Educational/class/edit.jsp");
        return modelAndView;
    }

    @ResponseBody
    @RequestMapping("list")  //  classes/list
    public PageUtil selectAll(@RequestParam(value = "pageNum",defaultValue = "1")String pageNum,
                              @RequestParam(value = "pageSize",defaultValue = "4")String pageSize,
                              @RequestParam(required = false) String classname){
       Map<String, String> map = new HashMap<>();
        map.put("pageNum",pageNum);
        map.put("pageSize",pageSize);
        if(classname==null||"".equals(classname.trim())){
            map.put("classname","");
        }else{
            map.put("classname",classname.trim());
        }
        int i = classesService.classesCount(map.get("classname"));
        PageUtil pageUtil = new PageUtil(Integer.parseInt(pageNum),Integer.parseInt(pageSize),i);
        List<ClassesPro> classesPros = classesService.selectAllByNameLimit(map);
        pageUtil.setList(classesPros);
        return pageUtil;
    }


    //班级审核界面数据
    @RequestMapping("listPro")  //  classes/listPro
    public String selectByState(@RequestParam(value = "pageNum",defaultValue = "1")String pageNum,
                                @RequestParam(value = "pageSize",defaultValue = "4")String pageSize,
                                @RequestParam(required = false) String classname,
                                ModelMap modelMap){
        System.out.println("已访问。。。。");
        Map<String, String> map = new HashMap<>();
        map.put("pageNum",pageNum);
        map.put("pageSize",pageSize);
        if(classname==null||"".equals(classname.trim())){
            map.put("classname","");
        }else{
            map.put("classname",classname.trim());
        }
        map.put("classstate","未审核");
        int i = classesService.classesCountByState(map);
        PageUtil pageUtil = new PageUtil(Integer.parseInt(pageNum),Integer.parseInt(pageSize),i);
        List<ClassesPro> classesPros = classesService.selectAllByNameLimit(map);
        pageUtil.setList(classesPros);
        modelMap.addAttribute("pageUtil",pageUtil);
        System.out.println(pageUtil);
        return "/Educational/Auditing.jsp";
    }



    @RequestMapping("add")  //  classes/add
    public String addClass(Classes classes){
        System.out.println(classes);
        if(classes.getDeptid().equals(-1)){
            classes.setDeptid(1);
        }
        if(classes.getMajorid().equals(-1)){
            classes.setMajorid(1);
        }
        classes.setClassstate("未审核");
       int i =  classesService.insert(classes);
        System.out.println("结果："+i);
        return "/Educational/class/list.jsp";
    }


    @RequestMapping("daochu") // classes/daochu
    public String daochu(Integer[] ckc){
        for (int i=0;i<ckc.length;i++){
            System.out.println(ckc[i]);
        }
        String[] head = {"学院","班级编号","班级名称","班主任姓名","班级人数","班级状态"};
        List<Integer> integers = Arrays.asList(ckc);
        List<ClassesPro> classesPros = classesService.selectByArrays(integers);
        try {
            POIUtil.createExl();
            POIUtil.setPath("C:\\Users\\mac-\\Desktop\\"+UUID.randomUUID()+"test.xls");
            POIUtil.createSheet("班级表");
            POIUtil.addHead(head);
            POIUtil.addBody(classesPros);
            POIUtil.grow();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "/Educational/class/list.jsp";
    }

    //更改班级信息
    @RequestMapping("updateMessage")
    public String updateClass(){
        return null;
    }


    // 更改班级状态
    @RequestMapping("update")
    public  String updateState(String classid){
        classesService.updateState(classid);
        return "/Educational/class/list.jsp";
    }

    //更改审核状态
    @RequestMapping("updateState")
    public  String updateState(String classid,String classstate){
        System.out.println(classid);
        System.out.println(classstate);
        Map<String, String> map = new HashMap<>();
        map.put("classid",classid);
        map.put("classstate",classstate);
        classesService.updateState(map);
        return "/Educational/class/list.jsp";
    }
}
