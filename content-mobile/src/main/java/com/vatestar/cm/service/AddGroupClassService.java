package com.vatestar.cm.service;


import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vatestar.cm.entity.AddGroupClass;

@Service
public interface AddGroupClassService {
	
	public void inseraddGroupClass(AddGroupClass agc);
	
	public List<AddGroupClass> queryaddGroupClass(Integer groupid);
	
	public AddGroupClass queryaddGroupClassById(Integer id);
	
	public void updateddGroupClass(AddGroupClass agc);
	/**
	 * 开启选中广告组
	 * @param names 
	 * @param username 
	 */
	public Integer startCheckGroup(List<Integer> paraList);
	/**
	 * 暂停选中广告组
	 * @param names 
	 * @param string 
	 */
	@Transactional
	public Integer pauseCheckGroup(List<Integer> paraList);
}
