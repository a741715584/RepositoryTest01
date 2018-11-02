package com.qfedu.service.impl;

import com.qfedu.domain.LeaveBill;
import com.qfedu.mapper.LeaveBillMapper;
import com.qfedu.service.LeaveBillService;
import com.qfedu.service.TaskWorkService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.identity.Authentication;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.impl.pvm.PvmTransition;
import org.activiti.engine.impl.pvm.process.ActivityImpl;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.runtime.ProcessInstanceQuery;
import org.activiti.engine.task.Comment;
import org.activiti.engine.task.Task;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class TaskWorkServiceImpl implements TaskWorkService {

    @Autowired
    private TaskService taskService;
    @Autowired
    private LeaveBillService leaveBillService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private LeaveBillMapper leaveBillMapper;

    @Override
    public List<Task> getList(String assignee) {
        List<Task> list = taskService.createTaskQuery().taskAssignee(assignee).list();
        return list;
    }

    @Override
    public LeaveBill getLeaveBillMessageByTaskId(String taskId) {
        //先通过taskid 查询到executionid 通过executionid 查找到businessid
        //通过截取得到leavebillid
        //通过 leavebillid找到leavebill对象
        Task task = taskService.createTaskQuery().taskId(taskId).singleResult();
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery().processInstanceId(task.getProcessInstanceId()).singleResult();
        String businessKey = processInstance.getBusinessKey();
        String leavebillid = businessKey.substring(businessKey.indexOf(".") + 1);
        LeaveBill leaveBill = leaveBillService.selectById(Integer.parseInt(leavebillid));

        return leaveBill;
    }

    @Override
    public List getTransitionByTaskId(String taskId) {
        //根据taskid 找到 processDefine id 和processinstace id
        // 通过processinstace id 找到 actid
        //通过actid 和processDefine对象找到activity对象
        //通过该对象得到transition
        String executionId = taskService.createTaskQuery().taskId(taskId).singleResult().getExecutionId();
        String processDefinitionId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessDefinitionId();
        String activityId = runtimeService.createProcessInstanceQuery().processInstanceId(executionId).singleResult().getActivityId();
        ProcessDefinitionEntity entity = (ProcessDefinitionEntity) repositoryService.getProcessDefinition(processDefinitionId);
        ActivityImpl activity = entity.findActivity(activityId);
        List<PvmTransition> outgoingTransitions = activity.getOutgoingTransitions();
        List list = new ArrayList();
        for (PvmTransition transition : outgoingTransitions) {
            String name = (String) transition.getProperty("name");
            list.add(name);
        }

        return list;
    }

    @Override
    public void handleTask(String taskid, String userName,
                           String comment, String result,String leaveBillid) {
        //1.添加批注
        Authentication.setAuthenticatedUserId(userName);
        Task task = taskService.createTaskQuery().taskId(taskid).singleResult();
        taskService.addComment(taskid,task.getProcessInstanceId(),comment);
        //提交,设置结果集
        Map map = new HashMap();
        map.put("re",result);
        taskService.complete(taskid,map);
        //进行判断来更新leavebill表，根据是否存在工作实例来判断，即查询是否有task.getProcessInstanceId()的数据
        ProcessInstance process = runtimeService.createProcessInstanceQuery()
                .processInstanceId(task.getProcessInstanceId()).singleResult();
        Map leave = new HashMap();
        Integer state=1;
        leave.put("id",leaveBillid);
        if ("驳回".equals(result)){
            state=3;
        }
        if(process==null){
            //表示已经完成了 修改leavebill表的状态为2
            state = 2;
        }
        leave.put("state",state);
        leaveBillMapper.updateState(leave);

    }

    //查询批注信息
    @Override
    public List<Comment> getComment(String taskId) {
        //需要根据实例id查询
        String processInstanceId = taskService.createTaskQuery().taskId(taskId).singleResult().getProcessInstanceId();
        List<Comment> comments = taskService.getProcessInstanceComments(processInstanceId);

        return comments;
    }
}
