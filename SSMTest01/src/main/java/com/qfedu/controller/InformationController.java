package com.qfedu.controller;

import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Information;
import com.qfedu.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

@RequestMapping("information")
@Controller
public class InformationController {
    @Autowired
    private InformationService informationService;

    @RequestMapping("list")
    public String getList(@RequestParam(defaultValue = "") String informationname,
                          @RequestParam(defaultValue = "") String typeid,
                          @RequestParam(value="index",defaultValue = "1") int pageindex,
                          ModelMap map,
                          @RequestParam(value="size",defaultValue = "5") int size){
        PageInfo pi = informationService.getList(informationname,typeid,pageindex,size);
        System.out.println(pi.getList());
        map.put("pi",pi);
        map.put("informationname",informationname);
        map.put("typeid",typeid);
//        map.put("cname",classname);
//        map.put("cnum",classnum);
        return "/book/list-ziliao.jsp";

    }

    @RequestMapping("upload")
    public String upload(Information information,
                         @RequestParam("file") MultipartFile file){

        try {
            if (!(file.isEmpty())){
                //调用插入语句
                informationService.insertSelective(information);
                file.transferTo(new File("E:/save/"+file.getOriginalFilename()));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("经过upload。。。。。。。。。。。。");
        return "redirect:/information/list";
    }

}
