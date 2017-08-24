package com.vatestar.cm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vatestar.cm.dao.AddGroupClassDao;
import com.vatestar.cm.entity.AddGroupClass;
import com.vatestar.cm.entity.Creative;
import com.vatestar.cm.service.AddGroupClassService;

@Service
public class AddGroupClassServiceImpl implements AddGroupClassService {

	@Autowired
	private AddGroupClassDao agcdao;
	
	@Override
	public void inseraddGroupClass(AddGroupClass agc) {
		agcdao.insetGroupClass(agc);
	}

	@Override
	public List<AddGroupClass> queryaddGroupClass(Integer group_id) {
		List<AddGroupClass>  agcs = agcdao.queryGroupClass(group_id);
		return agcs;
	}

	@Override
	public AddGroupClass queryaddGroupClassById(Integer id) {
		AddGroupClass agc =agcdao.queryGroupClassById(id);
		return agc;
	}

	@Override
	public void updateddGroupClass(AddGroupClass agc) {
		agcdao.updateGroupClass(agc);
	}
	/**
	 * 开启广告组
	 */
	public Integer startCheckGroup(List<Integer> paraList) {
		
		return agcdao.startCheckGroup(paraList);
	}
	/**
	 * 暂停广告组 同是暂停 创意，发送邮件
	 */
	@Transactional
	public Integer pauseCheckGroup(List<Integer> paraList) {
		
		return agcdao.pauseCheckGroup(paraList);
	}
}
