package com.qfedu.service;

import org.activiti.engine.repository.Deployment;
import org.activiti.engine.repository.ProcessDefinition;

import java.io.InputStream;
import java.util.List;

public interface ActivitiService {
    public int deploy(InputStream inputStream,String name);

    List<Deployment> getDeployment();

    List<ProcessDefinition> getProcessDefine();

    //删除流程
    int delete(String deploymentid);

    InputStream showPhoto(String deploymentId,String resourceName);
    void start(int leavebillId,String username);

    void recommit(String id);
}
