package com.vatestar.cm.dao;


import java.util.List;

import com.vatestar.cm.entity.AddGroupClass;

public interface AddGroupClassDao {
	
	/**
	 * 添加
	 */
	public void insetGroupClass(AddGroupClass agc);
	/**
	 * 添加
	*/
	public List<AddGroupClass> queryGroupClass(Integer group_id);
	/**
	 * 查找
	*/
	public AddGroupClass queryGroupClassById(Integer id);		 
	/**
	 * 更新
	*/
	public void updateGroupClass(AddGroupClass agc);	 
	/**
	 * 开启选中广告组
	 */
	public Integer startCheckGroup(List<Integer> paraList);
	/**
	 * 暂停选中广告组
	 */
	public Integer pauseCheckGroup(List<Integer> paraList);
	
}
