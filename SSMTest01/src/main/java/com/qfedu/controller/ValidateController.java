package com.qfedu.controller;

import com.qfedu.commons.ValidateImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;

@Controller
@RequestMapping("validate")
public class ValidateController {
    @RequestMapping("img")
    public void getImageValidate(HttpServletResponse httpServletResponse, HttpServletRequest httpServletRequest){
        ValidateImageUtil.createCode();
        BufferedImage bufferedImage = ValidateImageUtil.drawValidate();
        try {
            httpServletRequest.getSession().setAttribute("validate",ValidateImageUtil.getCode());
            ValidateImageUtil.outImg(bufferedImage,"jpg",httpServletResponse.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
