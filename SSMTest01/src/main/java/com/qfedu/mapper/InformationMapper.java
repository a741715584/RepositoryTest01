package com.qfedu.mapper;

import com.qfedu.domain.Information;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface InformationMapper {
    int deleteByPrimaryKey(Integer informationid);

    int insert(Information record);

    int insertSelective(Information record);

    Information selectByPrimaryKey(Integer informationid);

    int updateByPrimaryKeySelective(Information record);

    int updateByPrimaryKey(Information record);



    List getList(Map map);
}