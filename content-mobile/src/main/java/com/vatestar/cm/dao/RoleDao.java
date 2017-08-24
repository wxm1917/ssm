package com.vatestar.cm.dao;

import com.vatestar.cm.entity.Role;
import com.vatestar.cm.entity.RoleMenu;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dyl on 16/8/19.
 */
public interface RoleDao {
    public int count();

    public List<Role> list(HashMap<String, Object> map);

    public List<Role> queryAll();

    public Role queryRole(int id);

    public Integer insertRole(Role role);

    public Integer updateRole(Role role);

    public Integer deleteRole(int id);

    public Role queryByName(Role role);

    public Integer deleteRoleMenuByRoleId(int roleId);

    /**
     * @根据roleId得到所属菜单id
     * @author hjr
     * @date 2014-10-17
     * @return
     */
    public List<Integer> getMenuIdsByRoleId(Integer roleId);

    public Integer addRoleMenu(List<RoleMenu> list);

    public Integer deleteRoleMenu(RoleMenu roleMenu);
}
