package com.vatestar.cm.service;

import com.vatestar.cm.entity.Role;
import com.vatestar.cm.entity.RoleMenu;

import java.util.List;

/**
 * Created by dyl on 16/8/19.
 */
public interface RoleService {
    public int count();

    public List<Role> list(Integer page, Integer pageSize);

    public Role queryById(int id);

    public List<Role> queryRoleList();

    public Integer addRole(Role role);

    public Integer updateRole(Role role);

    public Integer deleteRole(int id);

    public Integer deleteRoleMenuByRoleId(Integer roleId);

    /**
     * @根据roleId得到所属菜单id
     * @author hjr
     * @date 2014-10-17
     * @return
     */
    public List<Integer> getMenuIdsByRoleId(Integer roleId);


    public Integer addRoleMenu(List<RoleMenu> rmList);

    public Integer deleteRoleMenu(RoleMenu rm);
}
