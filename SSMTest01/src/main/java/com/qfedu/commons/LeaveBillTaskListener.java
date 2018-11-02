package com.qfedu.commons;

import com.qfedu.domain.User_tb;
import com.qfedu.domain.User_tbPro;
import com.qfedu.mapper.User_tbMapper;
import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpSession;

public class LeaveBillTaskListener implements TaskListener {
    @Override
    public void notify(DelegateTask delegateTask) {
        HttpSession session = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes())
                .getRequest().getSession();
        User_tbPro user = (User_tbPro) session.getAttribute("user");
        String managername = user.getManagername();
//        System.out.println(managername);
        delegateTask.setAssignee(managername);


    }
}
