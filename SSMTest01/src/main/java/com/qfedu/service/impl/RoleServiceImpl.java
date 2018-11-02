package com.qfedu.service.impl;

import com.qfedu.domain.Role;
import com.qfedu.domain.RolePro;
import com.qfedu.mapper.RoleMapper;
import com.qfedu.service.RoleSerivce;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RoleServiceImpl implements RoleSerivce {

    @Autowired
    private RoleMapper roleMapper;
    @Override
    public List<Role> getAllRole() {
        return roleMapper.getAllRole();
    }

    @Transactional
    @Override
    public int addRole(int[] menuid, Role role) {
        roleMapper.insertGetId(role);
        Map map = new HashMap<>();
        map.put("roleid",role.getRoleid());
        map.put("menuid",menuid);
        roleMapper.insertMiddle(map);
        return 0;
    }

    @Override
    public RolePro selectRoleAndMenuByRoleId(int roleid) {
        return roleMapper.selectRoleAndMenuByRoleId(roleid);
    }

    @Transactional
    @Override
    public int updateRoleMessage(int[] menu, Role role) {
        roleMapper.updateByPrimaryKeySelective(role);
        roleMapper.deleteMiddleByRoleid(role.getRoleid());
        Map map = new HashMap<>();
        map.put("roleid",role.getRoleid());
        map.put("menuid",menu);
        roleMapper.insertMiddle(map);
        return 0;
    }

    @Override
    public int deleteRoleByRoleid(int roleid) {
        int i = roleMapper.selectUserCountByRoleid(roleid);
        if(i>0){
            return 0;
        }
        roleMapper.deleteMiddleByRoleid(roleid);
        roleMapper.deleteByPrimaryKey(roleid);
        return 1;
    }


}
