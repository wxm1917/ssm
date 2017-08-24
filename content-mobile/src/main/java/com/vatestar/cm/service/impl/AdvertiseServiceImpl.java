package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.AdvertiseDao;
import com.vatestar.cm.dao.AdvertiseGroupDao;
import com.vatestar.cm.dao.EmailDao;
import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.Creative;
import com.vatestar.cm.entity.Email;
import com.vatestar.cm.service.AdvertiseService;
import com.vatestar.util.EmailUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdvertiseServiceImpl implements AdvertiseService {
	@Autowired
	private AdvertiseDao advertiseMapper;
	@Autowired
	private AdvertiseGroupDao advertiseGroutMapper;
	@Autowired
	private EmailDao emailMapper;
	
	/**
	 * 创意信息统计(汇总)
	 */
	public Map<String, Object> statisticsAll(Integer id) {
		Map<String, Object> map = advertiseMapper.statisticsAll(id);
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
	 * 创意信息统计(分页)
	 */
	public List<Map<String, Object>> statistics(Integer id, int offset,
                                                int pageSize, StringBuffer total) {
		
		total.append(advertiseMapper.gettatisticsCount(id));
		
		Map<String,Object> pam=new HashMap<String,Object>();
		pam.put("id", id);
		pam.put("offset", offset);
		pam.put("pageSize", pageSize);
		
		List<Map<String,Object>> list =advertiseMapper.statistics(pam);
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
	 * @desc 得到广告组数据列表
	 * @author hjr
	 * @date 2014-10-31
	 */
	@Override
	public List<Map<String,Object>> getDataList(Creative ct){
		Map<String,Integer> paraMap = new HashMap<String,Integer>();
//		paraMap.put("page", page);
//		paraMap.put("pageSize", pageSize);
//		paraMap.put("userId", userId);
		return advertiseMapper.getDataList(ct);
	}
	/**
	 * @得到广告组记录条数
	 * @author hjr
	 * @date 2014-11-02
	 */
	@Override
	public Integer countData(Creative ct){
		return advertiseMapper.countData(ct);
	}
	/**
	 * 保存创意
	 */
	public Integer save(Creative creative) {
	/*	List<Email> emailList = emailMapper.queryByGroup("group2");
		Map<String,String> to= new HashMap<String,String>();
		for (Email e : emailList) {
			to.put(e.getEmail(), e.getName());
		}
		StringBuffer emailMsg= new StringBuffer();
		emailMsg.append("操作 : 新增创意<br/><br/><br/>");
		emailMsg.append("客户名称:"+creative.getUsername()+"<br/><br/>");
		emailMsg.append("创意名称:"+creative.getAdName()+"<br/><br/>");
		emailMsg.append("新增时间:"+creative.getCTime()+"<br/><br/>");
		EmailUtil.sendHtmlEmail(emailMsg+"", creative.getUsername()+",新增创意", to);*/
		
		/**
		 * 创意的状态应该与其所在的广告组保持一致
		 */
		AdGroup group = advertiseGroutMapper.getGroupById(creative.getGroupId());
		if(group!=null){
			creative.setStatus(group.getStatus());
		}
		return advertiseMapper.save(creative);
	}
	@Override
	public Creative getAdvertiseById(Integer id) {
		return advertiseMapper.getAdvertiseById(id);
	}
	/**
	 * 开去创意时，会同时开启其所在的广告组
	 * List<Creative> creativeList
	 */
	public Integer updateAvailable(List<Creative> creativeList, String names, String username) {
		int status=creativeList.get(0).getStatus();
		String subject="";
		if(status==0){//开启
			subject="启用创意";
			List<Integer> groupIdList =advertiseMapper.queryGroupIdById(creativeList);
			advertiseGroutMapper.startCheckGroup(groupIdList);
		}else if(status==1){//暂停
			subject="暂停创意";
		}else if(status==2){//删除
			subject="删除创意";
		}
		/*List<Email> emailList = emailMapper.queryByGroup("group2");
		Map<String,String> to= new HashMap<String,String>();
		for (Email e : emailList) {
			to.put(e.getEmail(), e.getName());
		}
		StringBuffer emailMsg= new StringBuffer();
		emailMsg.append("操作 : "+subject+"<br/><br/><br/>");
		emailMsg.append("客户名称:"+username+"<br/><br/>");
		emailMsg.append("创意名称:"+names+",以及其所在广告组<br/><br/>");
		EmailUtil.sendHtmlEmail(emailMsg+"", username+","+subject, to);*/

		return advertiseMapper.batchUpdate(creativeList);
	}
	@Override
	public Integer delCheckAd(List<Integer> paraList) {
		return advertiseMapper.delCheckAd(paraList);
	}
	@Override
	public Integer delAdvertiseByGroupId(Integer groupId) {
		return advertiseMapper.delAdvertiseByGroupId(groupId);
	}
	@Override
	public List<Creative> queryPage(Creative ct, StringBuffer total) {
		total.append(advertiseMapper.queryPageCount(ct));
		return advertiseMapper.queryPage(ct);
	}
	@Override
	public List<Creative> queryByGroupId(Integer groupId) {
		
		return advertiseMapper.queryByGroupId(groupId);
	}

}
