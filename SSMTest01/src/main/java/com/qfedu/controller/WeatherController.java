package com.qfedu.controller;


import cn.com.webxml.ArrayOfString;
import cn.com.webxml.MobileCodeWSSoap;
import cn.com.webxml.WeatherWSSoap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

@Controller
@RequestMapping("weather")
public class WeatherController {

//    @Autowired
//    private WeatherWSSoap weatherWSSoap;
    @Autowired
    private MobileCodeWSSoap mobileCodeWSSoap;

    @ResponseBody
    @RequestMapping("city")
    public void  getWeatherByCity(String mobile, HttpServletResponse response) {
//        ArrayOfString weather = weatherWSSoap.getWeather("上海", null);
//        List<String> string = weather.getString();
//        String s = string.get(4);
//        System.out.println(s);
//        return  s;
//        ArrayOfString databaseInfo = mobileCodeWSSoap.getDatabaseInfo();
        String mobileCodeInfo = mobileCodeWSSoap.getMobileCodeInfo(mobile, null);

        response.setContentType("text/html;charset=utf-8");
        try {
            System.out.println(mobileCodeInfo);
            String[] split = mobileCodeInfo.split("：");
            String substring = split[1];
            response.getWriter().write(substring);
            System.out.println(substring);
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}
