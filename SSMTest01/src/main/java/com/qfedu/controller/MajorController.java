package com.qfedu.controller;


import com.qfedu.domain.Major;
import com.qfedu.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("major")
public class MajorController {
    @Autowired
    private MajorService majorService;

    @ResponseBody
    @RequestMapping("byId") // major/byId
     public List<Major> selectByDepartId(String departId){
        return majorService.selectByDepartId(departId);
    }

}
