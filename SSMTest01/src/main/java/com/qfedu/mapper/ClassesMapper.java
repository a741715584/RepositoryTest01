package com.qfedu.mapper;

import com.qfedu.domain.Classes;
import com.qfedu.domain.ClassesPro;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface ClassesMapper {
    int deleteByPrimaryKey(Integer classid);

    int insert(Classes record);

    int insertSelective(Classes record);

    Classes selectByPrimaryKey(Integer classid);

    int updateByPrimaryKeySelective(Classes record);

    int updateByPrimaryKey(Classes record);

    List<ClassesPro> selectAllByNameLimit(Map map);
    @Select("SELECT count(classid) FROM classes WHERE classname LIKE '%${_parameter}%'")
    int classesCount(String classname);

    List<ClassesPro> selectByArrays(List<Integer> cid);
    @Update("update classes set classstate='审核中',statecount=statecount+1 where classid=#{id}")
    int updateState(String id);

    @Update("update classes set classstate=#{classstate}  where classid=#{classid}")
    int  updateStatePro(Map<String,String> map);

   @Select("select c.*,d.departname as name,m.majorname as name1 from classes c left JOIN department d ON c.deptid = d.departid LEFT JOIN major m ON c.majorid = m.majorid  where c.classid=#{_param}")
    ClassesPro selectById(Integer _param);


    @Select("SELECT count(classid) FROM classes WHERE classname LIKE '%${classname}%'  and  classstate=#{classstate} ")
    int classesCountByState(Map<String,String> map);
}