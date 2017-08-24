package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.RoleDao;
import com.vatestar.cm.entity.Role;
import com.vatestar.cm.entity.RoleMenu;
import com.vatestar.cm.service.RoleService;
import com.vatestar.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * Created by dyl on 16/8/19.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDao roleDao;

    @Override
    public int count() {
        return roleDao.count();
    }

    @Override
    public List<Role> list(Integer page, Integer pageSize) {
        page = page == null ? 1 : page;
        pageSize = pageSize == null ? new PageUtil().getRowSize() : pageSize;
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("currentRow", (page-1)*pageSize);
        map.put("pageSize", pageSize);
        System.err.println(map);
        List<Role> list = roleDao.list(map);
        return list;
    }

    /**
     * 根据角色id查询角色
     * @param id
     * @return
     */
    @Override
    public Role queryById(int id) {

        return roleDao.queryRole(id);
    }

    /**
     * 查询全部角色列表
     * @return
     */
    @Override
    public List<Role> queryRoleList() {
        return roleDao.queryAll();
    }

    /**
     * 添加角色
     * @param role
     * @return
     */
    @Override
    public Integer addRole(Role role) {

        return roleDao.insertRole(role);
    }

    /**
     * 更新角色
     * @param role
     */
    @Override
    public Integer updateRole(Role role) {
        return roleDao.updateRole(role);
    }

    /**
     * 删除角色
     * @param id
     */
    @Override
    public Integer deleteRole(int id) {
        return roleDao.deleteRole(id);
    }

    @Override
    public Integer deleteRoleMenuByRoleId(Integer roleId) {
        return roleDao.deleteRoleMenuByRoleId(roleId);
    }

    @Override
    public List<Integer> getMenuIdsByRoleId(Integer roleId) {
        return roleDao.getMenuIdsByRoleId(roleId);
    }

    @Override
    public Integer addRoleMenu(List<RoleMenu> rmList) {
        return roleDao.addRoleMenu(rmList);
    }

    @Override
    public Integer deleteRoleMenu(RoleMenu rm) {
        return roleDao.deleteRoleMenu(rm);
    }
}
