package com.vatestar.cm.entity;

import java.util.List;

import lombok.Data;

/**
 * 菜单实体
 * @author hanchanghong
 * @date 2014年12月3日 下午5:26:45
 */
@Data
public class Menu {
	private Integer id;//
	private String parentId;// 父菜单id
	private String menuName;// 菜单名称
	private String menuUrl;// 菜单连接
	private String createTime;// 创建时间
	private String orderNum;// 排序使用
	private List<Menu> model; //子属性
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getMenuUrl() {
		return menuUrl;
	}
	public void setMenuUrl(String menuUrl) {
		this.menuUrl = menuUrl;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(String orderNum) {
		this.orderNum = orderNum;
	}
	public List<Menu> getModel() {
		return model;
	}
	public void setModel(List<Menu> model) {
		this.model = model;
	}
	
}
