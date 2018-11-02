package com.qfedu.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Information;
import com.qfedu.mapper.InformationMapper;
import com.qfedu.service.InformationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class InformationServiceImpl implements InformationService {
    @Autowired
    private InformationMapper informationMapper;

    @Override
    public PageInfo getList(String informationname, String typeid, int pageindex, int size) {
        Map map = new HashMap();
        map.put("informationname", informationname);
        map.put("typeid", typeid);
        PageHelper.startPage(pageindex, size);
        List list = informationMapper.getList(map);

        PageInfo pi = new PageInfo(list);

        return pi;
    }

    @Override
    public int insertSelective(Information record) {
        return informationMapper.insertSelective(record);
    }
}
