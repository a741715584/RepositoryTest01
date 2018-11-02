package com.qfedu.mapper;

import com.qfedu.domain.Role;
import com.qfedu.domain.RolePro;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    @Select("select *from role")
    List<Role> getAllRole();

    int insertGetId(Role role);

    int insertMiddle(Map map);

    @Delete("delete from middle where roleid=#{roleid}")
    int deleteMiddleByRoleid(int roleid);

    //查询是否有用户
    @Select("select count(*) from user_tb where role_id=#{roleid}")
    int selectUserCountByRoleid(int roleid);

    RolePro selectRoleAndMenuByRoleId(int roleid);
}