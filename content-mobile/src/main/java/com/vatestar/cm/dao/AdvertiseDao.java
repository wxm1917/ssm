package com.vatestar.cm.dao;


import com.vatestar.cm.entity.Creative;

import java.util.List;
import java.util.Map;

public interface AdvertiseDao {
	/**
	 * @desc 得到广告组数据列表
	 * @author hjr
	 * @date 2014-10-31
	 */
	public List<Map<String,Object>> getDataList(Creative ct);
	/**
	 * @得到广告组记录条数
	 * @author hjr
	 * @date 2014-11-02
	 */
	public Integer countData(Creative ct);
	/**
	 * 添加广告
	 */
	public Integer save(Creative advertise);
	/**
	 * 广告详细
	 */
	public Creative getAdvertiseById(Integer id);
	/**
	 * 删除选中广告组
	 */
	public Integer delCheckAd(List<Integer> paraList);
	/**
	 * 根据groupId删除advertise
	 */
	public Integer delAdvertiseByGroupId(Integer groupId);
	public Map<String, Object> statisticsAll(Integer id);
	public Object gettatisticsCount(Integer id);
	public List<Map<String, Object>> statistics(Map<String, Object> pam);
	public int queryPageCount(Creative ct);
	public List<Creative> queryPage(Creative ct);
	
	public List<Creative> queryByGroupId(Integer groupId);
	public List<Integer> queryGroupIdById(List<Creative> paraList);
	public Integer batchUpdate(List<Creative> paraList);
	
	
}
