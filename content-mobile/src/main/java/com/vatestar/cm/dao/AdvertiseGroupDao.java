package com.vatestar.cm.dao;


import com.vatestar.cm.entity.AdGroup;

import java.util.List;
import java.util.Map;

public interface AdvertiseGroupDao {
  
	/**
	 * @desc 得到广告组数据列表(分页)
	 * @author hjr
	 * @date 2014-10-31
	 */
	public List<Map<String,Object>> getDataList(Map<String, Integer> paraMap);
	/**
	 * @得到广告组记录条数
	 * @author hjr
	 * @date 2014-11-02
	 */
	public Integer countData(Integer userId);
	/**
	 * @desc 得到广告组数据列表(不分页)
	 * @author hjr
	 * @date 2014-10-31
	 */
	public List<AdGroup> getAllGroup(Integer userId);
	/**
	 * 添加广告组
	 */
	public Integer save(AdGroup group);
	/**
	 * 广告组详细
	 */
	public AdGroup getGroupById(Integer id);
	/**
	 * 更新广告组
	 */
	public Integer update(AdGroup group);
	/**
	 * 开启选中广告组
	 */
	public Integer startCheckGroup(List<Integer> paraList);
	/**
	 * 暂停选中广告组
	 */
	public Integer pauseCheckGroup(List<Integer> paraList);
	/**
	 * 删除选中广告组
	 */
	public Integer delCheckGroup(List<Integer> paraList);
	
	public List<Map<String,Object>> statistics(Map map);
	public Integer gettatisticsCount(Integer id);
	public Map<String, Object> statisticsAll(Integer id);

	public AdGroup queryByUserId(Integer userId);
}
