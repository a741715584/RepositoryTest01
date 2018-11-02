package com.qfedu.mapper;

import com.qfedu.domain.User_tb;
import com.qfedu.domain.User_tbPro;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface User_tbMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(User_tb record);

    int insertSelective(User_tb record);

    User_tb selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(User_tb record);

    int updateByPrimaryKey(User_tb record);

    User_tb selectByUsername(String username);
    //管理权限
    User_tbPro selectByGrand(String username);


    //更新次數

    int updateCount(String username);
    @Update("update user_tb set user_ps=#{userPs} where user_id=#{userId}")
    public int modifyPassword(User_tb user_tb);

    List<User_tb> selectClassTeacher(Map<String,String> map);
}