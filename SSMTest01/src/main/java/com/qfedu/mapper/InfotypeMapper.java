package com.qfedu.mapper;

import com.qfedu.domain.Infotype;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface InfotypeMapper {
    int deleteByPrimaryKey(Integer infoid);

    int insert(Infotype record);

    int insertSelective(Infotype record);

    Infotype selectByPrimaryKey(Integer infoid);

    int updateByPrimaryKeySelective(Infotype record);

    int updateByPrimaryKey(Infotype record);

    @Select("select *from infotype")
    List<Infotype> getList();
}