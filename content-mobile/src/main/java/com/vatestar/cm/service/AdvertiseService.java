package com.vatestar.cm.service;


import com.vatestar.cm.entity.Creative;

import java.util.List;
import java.util.Map;

public interface AdvertiseService {
	
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
	 * 修改状态
	 * @param username 
	 * @param string 
	 */
	public Integer updateAvailable(List<Creative> creativeList, String names, String username);
	/**
	 * 删除选中广告组
	 */
	public Integer delCheckAd(List<Integer> paraList);
	/**
	 * 根据groupId删除advertise
	 */
	public Integer delAdvertiseByGroupId(Integer groupId);
	/**
	 * 根据groupid查找
	 * @param groupId
	 * @return
	 */
	public List<Creative> queryByGroupId(Integer groupId);
	
	public Map<String, Object> statisticsAll(Integer id);
	public List<Map<String, Object>> statistics(Integer id, int pageCoutn, int pageSize, StringBuffer total);
	public List<Creative> queryPage(Creative ct, StringBuffer total);
}
