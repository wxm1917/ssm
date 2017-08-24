package com.vatestar.cm.service.impl;

import com.vatestar.cm.dao.AdvertiseDataDao;
import com.vatestar.cm.dao.AdvertiseGroupDao;
import com.vatestar.cm.entity.AdGroup;
import com.vatestar.cm.entity.CreativeData;
import com.vatestar.cm.service.AdvertiseDataService;
import com.vatestar.util.POIUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class AdvertiseDataServiceImpl implements AdvertiseDataService {

	@Autowired
	private AdvertiseDataDao advertiseDataMapper;

	@Autowired
	private AdvertiseGroupDao advertiseGroupDao;

	/**
	 * @desc tb_adtive_data表数据汇总
	 * @author hjr
	 * @date 2014-10-31
	 */
	@Override
	public Map<String, Object> countAData(Integer userId) {
		Map<String,Object> map = advertiseDataMapper.countAData(userId);
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
		}else{
			map=new HashMap<String, Object>();
			map.put("adv", 0);
			map.put("ck", 0);
			map.put("charge", 0.0f);
			map.put("ckrate", 100f);
			map.put("onceCkMoney", 0.0f);
			map.put("tausendmalMoney", 0.0f);
		}
		return map;
	}
	/**
	 * @desc tb_adtive_data表数据里列表(按天)
	 * @author hjr
	 * @date 2014-10-31
	 */
	
	@Override
	public List<Map<String, Object>> countADataListDay(Integer page, Integer pageSize, Integer userId) {
		Map<String,Integer> paraMap = new HashMap<String,Integer>();
		paraMap.put("page", (page-1)*10);
		paraMap.put("pageSize", pageSize);
		paraMap.put("userId", userId);
		List<Map<String, Object>> list = advertiseDataMapper.countADataListDay(paraMap);
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
	 * @desc tb_adtive_data表数据里列表(按月)
	 * @author hjr
	 * @date 2014-10-31
	 */
	
	@Override
	public List<Map<String, Object>> countADataListMonth(Integer userId) {
		return advertiseDataMapper.countADataListMonth(userId);
	}
	/**
	 * @desc tb_adtive_data表数据里列表(按季度)
	 * @author hjr
	 * @date 2014-10-31
	 */
	
	@Override
	public List<Map<String, Object>> countADataListQuarter(Integer userId) {
		return advertiseDataMapper.countADataListQuarter(userId);
	}
	@Override
	public Integer countData(Integer userId) {
		return advertiseDataMapper.queryall(userId);
	}


		


	@Override
	public Integer saveData(CreativeData creativeData) {
		int count = advertiseDataMapper.queryByDate(creativeData.getcTime());
		if(count==0){
			creativeData.setUserId(creativeData.getCreativeId());
			AdGroup adGroup = advertiseGroupDao.queryByUserId(creativeData.getUserId());
			if(adGroup!=null){
				creativeData.setGroupId(adGroup.getId());
			}
			return advertiseDataMapper.saveData(creativeData);
		}
		return 0;
	}
	@Override
	public String exceldownload(String fdate, String sdate,String filepath) {
		
		List<Map<String, Object>> headInfoList = new ArrayList<Map<String,Object>>();
		Map<String, Object> itemMap = new HashMap<String, Object>(); 
		itemMap.put("title", "日期"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "ctime"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "消费"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "cpsum"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "展示"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "adv"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "点击"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "ck"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "点击率"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "ckrate"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "展现费用/千次"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "cpm"); 
        headInfoList.add(itemMap);
        itemMap = new HashMap<String, Object>(); 
        itemMap.put("title", "点击费用"); 
        itemMap.put("columnWidth", 25); 
        itemMap.put("dataKey", "cpc"); 
        headInfoList.add(itemMap);
        
        List<Map<String, Object>> dataList  = advertiseDataMapper.queryexcel(fdate, sdate); 
      
		try {
			POIUtil.exportExcel2FilePath("textexcl", filepath, headInfoList, dataList);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "ok";
		
	}
	
}
