package com.qfedu.service.impl;

import com.qfedu.domain.Infotype;
import com.qfedu.mapper.InfotypeMapper;
import com.qfedu.service.InfotypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class InfotypeServiceImpl implements InfotypeService {

    @Autowired
    private InfotypeMapper infotypeMapper;
    @Override
    public List<Infotype> getList() {
        return infotypeMapper.getList();
    }
}
