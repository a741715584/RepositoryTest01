package com.qfedu.service.impl;

import com.qfedu.domain.Department;
import com.qfedu.mapper.DepartmentMapper;
import com.qfedu.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DepartmentServiceImpl implements DepartmentService{
    @Autowired
    private DepartmentMapper departmentMapper;

   public List<Department> selectAll(){
        return departmentMapper.selectAll();
    }
}
