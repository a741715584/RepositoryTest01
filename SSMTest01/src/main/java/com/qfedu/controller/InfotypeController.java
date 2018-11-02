package com.qfedu.controller;


import com.qfedu.domain.Infotype;
import com.qfedu.service.InfotypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("infotype")
public class InfotypeController {

    @Autowired
    private InfotypeService infotypeService;

    @ResponseBody
    @RequestMapping("list")
    public  List<Infotype> getList(){

        List<Infotype> list = infotypeService.getList();
        return  list;
    }
}
