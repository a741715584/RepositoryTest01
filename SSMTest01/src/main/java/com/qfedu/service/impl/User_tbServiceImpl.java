package com.qfedu.service.impl;

import com.qfedu.domain.User_tb;
import com.qfedu.domain.User_tbPro;
import com.qfedu.mapper.User_tbMapper;
import com.qfedu.service.User_tbService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class User_tbServiceImpl implements User_tbService{
    @Autowired
    private User_tbMapper user_tbMapper;


    @Override
    public User_tbPro selectByUsername(String username) {
//        return user_tbMapper.selectByUsername(username);
        //权限管理登录
        return user_tbMapper.selectByGrand(username);
    }


    @Override
    public int updateCount(String username) {
        return user_tbMapper.updateCount(username);
    }

    @Override
    public int updateByPrimaryKeySelective(User_tb record) {
        return  user_tbMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int modifyPassword(User_tb user_tb) {
        return user_tbMapper.modifyPassword(user_tb);
    }

    @Override
    public List<User_tb> selectClassTeacher(String department,String major) {
        Map<String, String> map = new HashMap<>();
        map.put("rolename","班主任");
        map.put("departid",department);
        map.put("majorid",major);
        return user_tbMapper.selectClassTeacher(map);
    }
}
