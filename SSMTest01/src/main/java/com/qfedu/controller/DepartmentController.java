package com.qfedu.controller;


import com.qfedu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @RequestMapping("all")  //  department/all
    public ModelAndView selectAll(ModelAndView modelAndView){
        modelAndView.setViewName("/Educational/class/add.jsp");
        modelAndView.addObject("list",departmentService.selectAll());
        return  modelAndView;
    }
}
