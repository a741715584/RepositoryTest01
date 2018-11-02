package com.qfedu.service;

import com.github.pagehelper.PageInfo;
import com.qfedu.domain.Information;

import java.util.List;

public interface InformationService {

     PageInfo getList(String informationname, String typeid, int pageindex, int size);
     int insertSelective(Information record);
}
