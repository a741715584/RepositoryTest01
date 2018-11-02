package com.qfedu.service;

import com.qfedu.domain.User_tb;
import com.qfedu.domain.User_tbPro;

import java.util.List;
import java.util.Map;

public interface User_tbService {
    User_tbPro selectByUsername(String username);
    int updateCount(String username);
    int updateByPrimaryKeySelective(User_tb record);

    public int modifyPassword(User_tb user_tb);

    List<User_tb> selectClassTeacher(String department,String major);
}
