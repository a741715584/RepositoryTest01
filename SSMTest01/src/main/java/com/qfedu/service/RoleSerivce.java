package com.qfedu.service;

import com.qfedu.domain.Role;
import com.qfedu.domain.RolePro;

import java.util.List;

public interface RoleSerivce {
    List<Role> getAllRole();

    int addRole(int[] menuid,Role role);

    RolePro selectRoleAndMenuByRoleId(int roleid);

    int updateRoleMessage(int[] menu,Role role);

    int deleteRoleByRoleid(int roleid);
}
