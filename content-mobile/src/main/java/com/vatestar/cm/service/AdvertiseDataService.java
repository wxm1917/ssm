package com.vatestar.cm.service;


import java.util.List;
import java.util.Map;

import com.vatestar.cm.entity.CreativeData;

public interface AdvertiseDataService {
	
	/**
	 * @desc tb_adtive_data表数据汇总
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	public Map<String,Object> countAData(Integer userId);
	/**
	 * @desc tb_adtive_data表数据里列表(按天)
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	
	public List<Map<String, Object>> countADataListDay(Integer page, Integer pageSize, Integer userId);
	/**
	 * @desc tb_adtive_data表数据里列表(按月)
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	
	public List<Map<String, Object>> countADataListMonth(Integer userId);
	/**
	 * @desc tb_adtive_data表数据里列表(按季度)
	 * @author hjr
	 * @date 2014-10-31
	 * @param userName
	 * @param password
	 */
	
	public List<Map<String, Object>> countADataListQuarter(Integer userId);
	/**
	 * 得到记录条数
	 * @author hjr
	 * @date 2014-10-31
	 */
	public Integer countData(Integer userId);

	public Integer saveData(CreativeData creativeData);
	
	/**
	 * excel 下载
	 */
	public  String exceldownload(String fdate, String sdate,String filepath);
}
