package com.qfedu.controller;

import com.qfedu.domain.LeaveBill;
import com.qfedu.domain.User_tbPro;
import com.qfedu.service.TaskWorkService;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.poi.util.Removal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("task")
public class TaskController {

    @Autowired
    private TaskWorkService taskWorkService;

    //获得任务的列表，批注存在与comment表中
    @RequestMapping("list") //  task/list
    public  String getList(HttpSession session,
                           ModelMap modelMap){
        //根据当前用户的用户名获得任务列表，因为我们已经设置了Assignee
        User_tbPro user = (User_tbPro) session.getAttribute("user");
        String userName = user.getUserName();
//        System.out.println("当前用户为：");
        List<Task> list = taskWorkService.getList(userName);
        modelMap.put("list",list);
        return  "/renwu/list.jsp";
    }
    //查看任务
    @RequestMapping("one")
    public String getOneByTaskId(String taskId,ModelMap modelMap){
       LeaveBill leaveBill =  taskWorkService.getLeaveBillMessageByTaskId(taskId);
        List list = taskWorkService.getTransitionByTaskId(taskId);
        //查询批注
        List<Comment> comments =  taskWorkService.getComment(taskId);
        modelMap.put("list",list);
        modelMap.put("leaveBill",leaveBill);
        modelMap.put("taskid",taskId);
        modelMap.put("comments",comments);

        return  "/renwu/banli.jsp";
    }



    @RequestMapping("handleTask")
    public String handleTask(String result,String taskid,
                             String comment,String leaveBillid,
                             HttpSession session){
        //需要做的就是两部
        //1.更新leavebill表状态
        //2.添加批注
        //3.执行任务
        User_tbPro user = (User_tbPro) session.getAttribute("user");
        String userName = user.getUserName();
        taskWorkService.handleTask(taskid,userName,comment,result,leaveBillid);
        return "redirect:/task/list";
    }


}
