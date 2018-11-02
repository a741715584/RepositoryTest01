package com.qfedu.service.impl;

import com.qfedu.domain.LeaveBill;
import com.qfedu.mapper.LeaveBillMapper;
import com.qfedu.service.ActivitiService;
import com.qfedu.service.LeaveBillService;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class LeaveBillServiceImpl implements LeaveBillService{

    @Autowired
    private LeaveBillMapper leaveBillMapper;
    @Autowired
    private ActivitiService activitiService;
    @Override
    public List<LeaveBill> getList(int userid) {

        return leaveBillMapper.getList(userid);
    }

    @Override
    public int add(LeaveBill leaveBill) {
        leaveBillMapper.insertSelective(leaveBill);
        return 0;
    }

    public int commit(Integer id,String username){
        //进行更新操作,根据id进行更新 将状态变为1
        Map map = new HashMap();
        map.put("state",1);
        map.put("id",id);
        leaveBillMapper.updateState(map);
        //要开启流程
        activitiService.start(id,username);
        return 1;
    }

    @Override
    public LeaveBill selectById(Integer id) {
        LeaveBill leaveBill = leaveBillMapper.selectByPrimaryKey(id);
        return leaveBill;
    }

    @Override
    public int update(LeaveBill leaveBill) {
        try {
            leaveBillMapper.updateByPrimaryKeySelective(leaveBill);
            return 1;
        }catch (Exception e){

        }
        return 0;
    }

    @Override
    public void recommit(String id) {
        Map map = new HashMap();
        map.put("state",1);
        map.put("id",id);
        leaveBillMapper.updateState(map);
        activitiService.recommit(id);

    }

}
