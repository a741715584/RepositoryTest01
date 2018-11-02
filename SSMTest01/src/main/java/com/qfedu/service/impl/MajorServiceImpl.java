package com.qfedu.service.impl;

import com.qfedu.domain.Major;
import com.qfedu.mapper.MajorMapper;
import com.qfedu.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorMapper majorMapper;

    @Override
    public List<Major> selectByDepartId(String departId) {
        return majorMapper.selectByDepartId(departId);
    }
}
