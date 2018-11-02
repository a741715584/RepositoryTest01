package com.qfedu.service.impl;

import com.qfedu.domain.Classes;
import com.qfedu.domain.ClassesPro;
import com.qfedu.domain.PageUtil;
import com.qfedu.mapper.ClassesMapper;
import com.qfedu.service.ClassesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class ClassesServiceImpl implements ClassesService {

    @Autowired
    private ClassesMapper classesMapper;
    @Override
    public List<ClassesPro> selectAllByNameLimit(Map<String,String> map) {
        Integer offset = (Integer.parseInt(map.get("pageNum"))-1)*(Integer.parseInt(map.get("pageSize")));
        map.put("offset",offset.toString());
        List<ClassesPro> classesPros = classesMapper.selectAllByNameLimit(map);
//        PageUtil pageUtil = new PageUtil(Integer.parseInt(map.get("pageNum")),Integer.parseInt(map.get("pageSize")),0);
//        pageUtil.setList(classesPros);
        return classesPros;
    }

    @Override
    @Transactional
    public int insert(Classes record) {
        return classesMapper.insert(record);
    }

    @Override
    public int classesCount(String classname) {
        return classesMapper.classesCount(classname);
    }

    @Override
    public List<ClassesPro> selectByArrays(List<Integer> cid) {
        return classesMapper.selectByArrays(cid);
    }

    @Override
    public int updateState(String id) {
        return classesMapper.updateState(id);
    }

    @Override
    public int updateState(Map<String, String> map) {
        return classesMapper.updateStatePro(map);
    }

    @Override
    public ClassesPro selectById(Integer id) {
        return classesMapper.selectById(id);
    }

    @Override
    public int classesCountByState(Map<String, String> map) {
        return classesMapper.classesCountByState(map);
    }
}
