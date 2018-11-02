package com.qfedu.service;

import com.qfedu.domain.LeaveBill;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;

import java.util.List;

public interface TaskWorkService {

    List<Task> getList(String assignee);

   LeaveBill getLeaveBillMessageByTaskId(String taskId);

   //根据taskid 找到当前活动的选择路线
    List getTransitionByTaskId(String taskId);

    void handleTask(String taskid, String userName, String comment, String result,String leaveBillid);


    List<Comment> getComment(String taskId);
}
