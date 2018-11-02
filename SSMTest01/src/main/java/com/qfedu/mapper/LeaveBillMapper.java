package com.qfedu.mapper;

import com.qfedu.domain.LeaveBill;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface LeaveBillMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(LeaveBill record);

    int insertSelective(LeaveBill record);

    LeaveBill selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(LeaveBill record);

    int updateByPrimaryKey(LeaveBill record);

    @Select("select l.*,u.user_name as username from leavebill l,user_tb u where l.userid=u.user_id and l.userid=#{userid}")
    List<LeaveBill> getList(int userid);

    @Update("update leavebill set state=#{state} where id=#{id}")
    int updateState(Map map);
}