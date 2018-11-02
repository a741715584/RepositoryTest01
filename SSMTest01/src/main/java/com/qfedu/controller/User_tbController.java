package com.qfedu.controller;

import com.qfedu.domain.User_tb;
import com.qfedu.domain.User_tbPro;
import com.qfedu.service.User_tbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("User_tb")
public class User_tbController {
    @Autowired
    private User_tbService user_tbService;

    @RequestMapping("login")
    public ModelAndView login(@RequestParam("TxtUserName")String username,
                              @RequestParam("TxtPassword")String password,
                              @RequestParam("DropExpiration") String cookieDay,
                              String validate,
                              ModelAndView modelAndView,
                              HttpServletRequest request,
                              HttpServletResponse response){
        String v = (String) request.getSession().getAttribute("validate");
        if(!(v.equalsIgnoreCase(validate))){
            modelAndView.setViewName("/login.jsp");
            modelAndView.addObject("msg","验证码错误");
            return modelAndView;
        }
        User_tbPro user_tb = user_tbService.selectByUsername(username);
//        System.out.println("User_tbPro======"+user_tb);
        if(user_tb!=null){
            if(user_tb.getUserPs().equals(password)){
                user_tbService.updateCount(username);
                //登录成功跳转界面
                modelAndView.setViewName("/index.jsp");
                request.getSession().setAttribute("user",user_tb);
                request.getSession().setAttribute("date",new Date());
                Cookie cookie  = new Cookie("up",username+"_"+password);

                    if(cookieDay.equals("1")){
                        cookie.setMaxAge(-1);
                      }else if(cookieDay.equals("2")) {
                        cookie.setMaxAge(60 * 60 * 24);
                    }else if(cookieDay.equals("3")){
                        cookie.setMaxAge(60 * 60 * 30);
                    }else{
                        cookie.setMaxAge(60*60*24*365);
                    }
                response.addCookie(cookie);

            }else{
                modelAndView.setViewName("/login.jsp");
                modelAndView.addObject("msg","用户名或密码错误");
            }
        }else{
            //返回到登录界面,提示错误
            modelAndView.setViewName("/login.jsp");
            modelAndView.addObject("msg","用户名不存在");
        }
        return modelAndView;
    }
    //进行用户的更新操作
    @RequestMapping("update")  // User_tb/update
    public ModelAndView updateUser(User_tb user_tb,
                                   ModelAndView modelAndView,
                                   HttpServletRequest request){
        if(user_tb.getUserSex().equals("0")){
             user_tb.setUserSex("女");
        }else{
            user_tb.setUserSex("男");
        }
        user_tbService.updateByPrimaryKeySelective(user_tb);
        User_tbPro user_tb1 = user_tbService.selectByUsername(user_tb.getUserName());
        request.getSession().setAttribute("user",user_tb1);
        modelAndView.setViewName("/right.jsp");
        return modelAndView;
    }



    @ResponseBody
    @RequestMapping("password")  // User_tb/password
    public int modifyPassword(User_tb user_tb,HttpServletRequest request){
        int  i = user_tbService.modifyPassword(user_tb);
        if(i>0){
            request.getSession().invalidate();
        }
//        System.out.println(i);
        return  i;
    }



    @ResponseBody
    @RequestMapping("classteacher")  // User_tb/classteacher
    public List<User_tb> selectClassTeacher(String department,String major){
        return user_tbService.selectClassTeacher(department,major);
    }

}
