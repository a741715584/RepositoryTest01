package com.qfedu.service.impl;

import com.qfedu.service.ActivitiService;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.impl.persistence.entity.ProcessDefinitionEntity;
import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.imageio.ImageIO;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipInputStream;

@Service
public class ActivitiServiceImpl implements ActivitiService {

    @Autowired
    private RepositoryService repositoryService;
    @Autowired
    private RuntimeService runtimeService;
    @Autowired
    private TaskService taskService;

    @Override
    public int deploy(InputStream inputStream, String name) {
        ZipInputStream zipInputStream = new ZipInputStream(inputStream);
        repositoryService.createDeployment()
                .addZipInputStream(zipInputStream)
                .name(name)
                .deploy();

        return 1;
    }

    @Override
    public List<Deployment> getDeployment() {

        List<Deployment> list = repositoryService.createDeploymentQuery().list();
        return list;
    }

    @Override
    public List<ProcessDefinition> getProcessDefine() {

        List<ProcessDefinition> list = repositoryService.createProcessDefinitionQuery().list();
        return list;
    }

    @Override
    public int delete(String deploymentid) {

        repositoryService.deleteDeployment(deploymentid);
        return 0;
    }

    public InputStream showPhoto(String deploymentId,String resourceName){
       return repositoryService.getResourceAsStream(deploymentId,resourceName);
    }

    //开启流程实例
    public void start(int leavebillId,String username){
        String business = "LeaveBill."+leavebillId;
        Map map = new HashMap();
        map.put("uname",username);
//        map.put("busid",business);
        ProcessInstance leaveBill = runtimeService.startProcessInstanceByKey("LeaveBill", business, map);
        //提交审核 继续执行
        Task task = taskService.createTaskQuery().executionId(leaveBill.getId()).singleResult();
        taskService.complete(task.getId());
    }


    //在请假中被驳回后再次提交的功能
    @Override
    public void recommit(String id) {
        //首先要更新接着执行
        String businessKey = "LeaveBill."+id;
        ProcessInstance processInstance = runtimeService.createProcessInstanceQuery()
                .processInstanceBusinessKey(businessKey)
                .singleResult();
        Task task =  taskService.createTaskQuery()
                .processInstanceId(processInstance.getId()).singleResult();
        System.out.println("流程实例的id："+processInstance.getId());
        taskService.complete(task.getId());
    }
}
