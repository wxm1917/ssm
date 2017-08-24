package com.vatestar.cm.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.vatestar.cm.dao.AddGroupClassDao;
import com.vatestar.cm.dao.AdvertiseDao;
import com.vatestar.cm.dao.AdvertiseGroupDao;
import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.AddGroupClass;
import com.vatestar.cm.service.AdvertiseGroupService;

@Service
public class AdvertiseGroupServiceImpl implements AdvertiseGroupService {
	private Logger logger= LoggerFactory.getLogger(AdvertiseGroupServiceImpl.class);
	@Autowired
	private AdvertiseGroupDao advertiseGroupMapper;
	@Autowired
	private AddGroupClassDao agcdao;
	@Autowired
	private AdvertiseDao advertiseMapper;
	/**
	 * 广告组信息统计(汇总)
	 */
	public Map<String, Object> statisticsAll(Integer id) {
		Map<String, Object> map = advertiseGroupMapper.statisticsAll(id);
		if(null != map && 0 < map.size()){
			Integer adv = Integer.valueOf(map.get("adv").toString());                       //展示
			Integer ck = Integer.valueOf(map.get("ck").toString());                         //点击
			Float charge = Float.valueOf(String.format("%.2f", Float.valueOf(map.get("charge").toString())));   //费用
			Float ckrate = Float.valueOf(String.format("%.2f", (float)ck/adv*100));             //点击率
			Float onceCkMoney = Float.valueOf(String.format("%.2f", charge/ck));           //单次点击费用
			Float tausendmalMoney = Float.valueOf(String.format("%.2f", charge*1000/adv));  //千次展示的价格
			map.put("charge", charge);
			map.put("ckrate", ckrate);
			map.put("onceCkMoney", onceCkMoney);
			map.put("tausendmalMoney", tausendmalMoney);
		}
		return map;
	}
	
	/**
	 * 广告组信息统计(分页)
	 */
	public List<Map<String,Object>> statistics(Integer id, int offset, int pageSize, StringBuffer total) {
		
		total.append(advertiseGroupMapper.gettatisticsCount(id));
		
		Map<String,Object> pam=new HashMap<String,Object>();
		pam.put("id", id);
		pam.put("offset", offset);
		pam.put("pageSize", pageSize);
		
		List<Map<String,Object>> list =advertiseGroupMapper.statistics(pam);
		if(null != list && 0 < list.size()){
			for(int i =0, n = list.size(); i < n; i++){
				Map<String, Object> map = list.get(i);
				Object o_adv = map.get("adv");
				Object o_ck = map.get("ck");
				Integer adv = null == o_adv ? 0 : Integer.valueOf(o_adv.toString());                       //展示
				Integer ck = null == o_ck ? 0 : Integer.valueOf(o_ck.toString());                          //点击
				
				Float charge = Float.valueOf(String.format("%.2f", Float.valueOf(map.get("cpm_charge").toString())));   //费用
				Float ckrate = Float.valueOf(String.format("%.2f", adv == 0 ? 0 : (float)ck/adv*100));      //点击率
				Float onceCkMoney = Float.valueOf(String.format("%.2f", ck == 0 ? 0 : charge/ck));          //单次点击费用
				Float tausendmalMoney = Float.valueOf(String.format("%.2f", adv == 0 ? 0 : charge*1000/adv)); //千次展示的价格
				map.put("charge", charge);
				map.put("ckrate", ckrate);
				map.put("onceCkMoney", onceCkMoney);
				map.put("tausendmalMoney", tausendmalMoney);
			}
		}
		
		
		
		return list;
	}
	
	/**
	 * @desc 得到广告组数据列表(分页)
	 * @author hjr
	 * @date 2014-10-31
	 */
	@Override
	public List<Map<String,Object>> getDataList(Integer page, Integer pageSize, Integer userId){
		Map<String,Integer> paraMap = new HashMap<String,Integer>();
		paraMap.put("page", page);
		paraMap.put("pageSize", pageSize);
		paraMap.put("userId", userId);
		return advertiseGroupMapper.getDataList(paraMap);
	}
	/**
	 * @得到广告组记录条数
	 * @author hjr
	 * @date 2014-11-02
	 */
	@Override
	public Integer countData(Integer userId){
		return advertiseGroupMapper.countData(userId);
	}
	/**
	 * @desc 得到广告组数据列表(不分页)
	 * @author hjr
	 * @date 2014-10-31
	 */
	@Override
	public List<AdGroup> getAllGroup(Integer userId) {
		return advertiseGroupMapper.getAllGroup(userId);
	}
	@Override
	public Integer save(AdGroup group) {
		/*List<Email> emailList = emailMapper.queryByGroup("group2");
		Map<String,String> to= new HashMap<String,String>();
		for (Email e : emailList) {
			to.put(e.getEmail(), e.getName());
		}
		StringBuffer emailMsg= new StringBuffer();
		emailMsg.append("操作 : 新增广告组<br/><br/><br/>");
		emailMsg.append("客户名称:"+group.getUsername()+"<br/><br/>");
		emailMsg.append("广告组名称:"+group.getGroupName()+"<br/><br/>");
		emailMsg.append("新增时间:"+group.getCTime()+"<br/><br/>");
		EmailUtil.sendHtmlEmail(emailMsg+"", group.getUsername()+",新增广告组", to);*/
		return advertiseGroupMapper.save(group);
	}
	@Override
	public AdGroup getGroupById(Integer id) {
		return advertiseGroupMapper.getGroupById(id);
	}
	/**
	 * 修改广告组
	 * 同时发送修改内容到运营邮箱
	 */
	public Integer update(AdGroup group) {
		/*AdGroup groupSource = advertiseGroupMapper.getGroupById(group.getId());
		StringBuffer emailMsg= new StringBuffer();
		emailMsg.append("操作 : 修改广告组<br/><br/><br/>");
		emailMsg.append("客户："+group.getUsername()+"<br/><br/>");
		emailMsg.append("广告组名称："+group.getGroupName()+"<br/><br/>");
		if(groupSource.getGeneralBudget()!=group.getGeneralBudget()){//总预算    
			emailMsg.append("总预算:"+groupSource.getGeneralBudget()+"修改为"+group.getGeneralBudget()+"<br/><br/>");
		}
		if(groupSource.getDailyBudget()!=group.getDailyBudget()){//每日预算   
			emailMsg.append("每日预算:"+groupSource.getDailyBudget()+"修改为"+group.getDailyBudget()+"<br/><br/>");
		}
		if(!groupSource.getStartTime().equals(group.getStartTime())){//广告投放开始日期  
			emailMsg.append("广告投放开始日期:"+groupSource.getStartTime()+"修改为"+group.getStartTime()+"<br/><br/>");
		}
		if(!groupSource.getEndTime().equals(group.getEndTime())){//广告投放结束日期
			emailMsg.append("广告投放结束日期:"+groupSource.getEndTime()+"修改为"+group.getEndTime()+"<br/><br/>");
		}
		if(!groupSource.getChargeModel().equals(group.getChargeModel())){//chargeModel; //计费方式：0-cpm，1-cpc      
			emailMsg.append("计费方式:"+(groupSource.getChargeModel()==0?"cpm":"cpc")+"修改为"+(group.getChargeModel()==0?"cpm":"cpc")+"<br/><br/>");
		}
		if(groupSource.getPrice()!=group.getPrice()){//price    
			emailMsg.append("出价:"+groupSource.getPrice()+"修改为"+group.getPrice()+"<br/><br/>");
		}
		emailMsg.append("修改时间:"+group.getUpdateDate()+"<br/>");
		List<Email> emailList = emailMapper.queryByGroup("group2");
		Map<String,String> to= new HashMap<String,String>();
		for (Email e : emailList) {
			to.put(e.getEmail(), e.getName());
		}
		EmailUtil.sendHtmlEmail(emailMsg+"", group.getUsername()+",修改广告组", to);*/
		
		return advertiseGroupMapper.update(group);
	}
	
	/**
	 * 开启广告组
	 */
	public Integer startCheckGroup(List<Integer> paraList, String username, String names) {
		
		for (Integer groupId :paraList) {
			List<AddGroupClass> ctIdList = agcdao.queryGroupClass(groupId);
			List<Integer> paraLists = new ArrayList<Integer>();
			if(ctIdList!=null&&ctIdList.size()>0){
				for(AddGroupClass cte:ctIdList){
					paraLists.add(cte.getId());
				}
				agcdao.startCheckGroup(paraLists);
			}
		}
		return advertiseGroupMapper.startCheckGroup(paraList);
	}
	/**
	 * 暂停广告组 同是暂停 创意，发送邮件
	 */
	@Transactional
	public Integer pauseCheckGroup(List<Integer> paraList, String username, String names) {
		
		for (Integer groupId :paraList) {
			List<AddGroupClass> ctIdList = agcdao.queryGroupClass(groupId);
			List<Integer> paraLists = new ArrayList<Integer>();
			if(ctIdList!=null&&ctIdList.size()>0){
				for(AddGroupClass cte:ctIdList){
					paraLists.add(cte.getId());
				}
				agcdao.pauseCheckGroup(paraLists);
				
			}
		}
		return advertiseGroupMapper.pauseCheckGroup(paraList);
	}
	@Override
	public Integer delCheckGroup(List<Integer> paraList) {
		return advertiseGroupMapper.delCheckGroup(paraList);
	}



}
