package com.vatestar.cm.entity;



import java.io.Serializable;

public class RoleMenu implements Serializable{
	/**
	 * hjr
	 * 2014-10-31
	 */
	
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer roleId;
	private Integer memuId;
	private int menutype;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	public Integer getMemuId() {
		return memuId;
	}
	public void setMemuId(Integer memuId) {
		this.memuId = memuId;
	}
	public int getMenutype() {
		return menutype;
	}
	public void setMenutype(int menutype) {
		this.menutype = menutype;
	}
	
	
}
