package com.qfedu.controller;

import com.qfedu.domain.LeaveBill;
import com.qfedu.domain.User_tbPro;
import com.qfedu.service.LeaveBillService;
import com.qfedu.service.TaskWorkService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.history.HistoricProcessInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.activiti.engine.task.TaskQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("leavebill")
public class LeaveBillController {

    @Autowired
    private LeaveBillService leaveBillService;
    @Autowired
    private TaskService taskService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private HistoryService historyService;

    @RequestMapping("list")
    public String getList(ModelMap modelMap,HttpServletRequest request){
        User_tbPro user = (User_tbPro) request.getSession().getAttribute("user");
        List<LeaveBill> list = leaveBillService.getList(user.getUserId());
        modelMap.put("list",list);
//        System.out.println(list);
        return "/qingjia/list.jsp";
    }

    @RequestMapping("add")
    public String add(LeaveBill leaveBill, HttpServletRequest request){
        User_tbPro user = (User_tbPro) request.getSession().getAttribute("user");
        leaveBill.setUserid(user.getUserId());
        leaveBill.setState(0);
//        leaveBill.setUsername(user.getUserName());
        leaveBillService.add(leaveBill);
//        System.out.println("123");
        return "redirect:/leavebill/list";
    }

    @RequestMapping("commit")
    public String commit(Integer id,String username){
        //更新状态，然后需要业务跟流程关联，需要BusinessKey
        leaveBillService.commit(id,username);

        return "redirect:/leavebill/list";
    }

    //查询批注 查看的功能
    @RequestMapping("query")
    public String query(String id,ModelMap modelMap){
        HistoricProcessInstance historicProcessInstance =
                historyService.createHistoricProcessInstanceQuery()
                .processInstanceBusinessKey("LeaveBill." + id)
                .singleResult();

        List<Comment> processInstanceComments = taskService.getProcessInstanceComments(historicProcessInstance.getId());
        modelMap.put("comments",processInstanceComments);
        return "/qingjia/query.jsp";
    }

    @RequestMapping("recommit")
    public String recommit(String id){
        leaveBillService.recommit(id);

        return "redirect:/leavebill/list";
    }

    @RequestMapping("prepareToUpdate")
    public String prepareToUpdate(Integer leavebillid,ModelMap modelMap){
        //查询
        LeaveBill leaveBill = leaveBillService.selectById(leavebillid);
        modelMap.put("leaveBill",leaveBill);
        return "/qingjia/edit.jsp";
    }

    @RequestMapping("update")
    public String update(LeaveBill leaveBill){

        leaveBillService.update(leaveBill);
        return "redirect:/leavebill/list";
    }

}
