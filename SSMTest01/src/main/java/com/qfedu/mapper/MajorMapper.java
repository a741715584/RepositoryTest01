package com.qfedu.mapper;

import com.qfedu.domain.Major;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface MajorMapper {
    int deleteByPrimaryKey(Integer majorid);

    int insert(Major record);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer majorid);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);
    @Select("select *from major where departId=#{departId}")
    List<Major> selectByDepartId(String departId);
}