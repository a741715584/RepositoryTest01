package com.qfedu.domain;

import java.util.List;

public class RolePro {
    private Integer roleid;

    private String rolename;

    private Integer rolestate;

    private List<Menu> list;

    public List<Menu> getList() {
        return list;
    }

    public void setList(List<Menu> list) {
        this.list = list;
    }

    public Integer getRoleid() {
        return roleid;
    }

    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename == null ? null : rolename.trim();
    }

    public Integer getRolestate() {
        return rolestate;
    }

    public void setRolestate(Integer rolestate) {
        this.rolestate = rolestate;
    }

    @Override
    public String toString() {
        return "RolePro{" +
                "roleid=" + roleid +
                ", rolename='" + rolename + '\'' +
                ", rolestate=" + rolestate +
                ", list=" + list +
                '}';
    }
}