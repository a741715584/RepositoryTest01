package com.qfedu.service;

import com.qfedu.domain.Classes;
import com.qfedu.domain.ClassesPro;
import com.qfedu.domain.PageUtil;

import java.util.List;
import java.util.Map;

public interface ClassesService {
    List<ClassesPro> selectAllByNameLimit(Map<String,String> map);

    int insert(Classes record);

    int classesCount(String classname);

    List<ClassesPro> selectByArrays(List<Integer> cid);

    int updateState(String id);

    int  updateState(Map<String,String> map);


    ClassesPro selectById(Integer id);

    int classesCountByState(Map<String,String> map);
}
