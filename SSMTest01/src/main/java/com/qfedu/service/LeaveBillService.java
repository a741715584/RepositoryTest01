package com.qfedu.service;

import com.qfedu.domain.LeaveBill;

import java.util.List;

public interface LeaveBillService {

    public List<LeaveBill> getList(int userid);

    int add(LeaveBill leaveBill);

    int commit(Integer id,String username);

    LeaveBill selectById(Integer id);

    int update(LeaveBill leaveBill);

    void recommit(String id);
}
