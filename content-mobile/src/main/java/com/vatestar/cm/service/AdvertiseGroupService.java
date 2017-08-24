package com.vatestar.cm.service;

import com.vatestar.cm.entity.AdGroup;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public interface AdvertiseGroupService {
	
	/**
	 * @desc 得到广告组数据列表(分页)
	 * @author hjr
	 * @date 2014-10-31
	 */
	public List<Map<String,Object>> getDataList(Integer page, Integer pageSize, Integer userId);
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
	 * @param names 
	 * @param username 
	 */
	public Integer startCheckGroup(List<Integer> paraList, String username, String names);
	/**
	 * 暂停选中广告组
	 * @param names 
	 * @param string 
	 */
	@Transactional
	public Integer pauseCheckGroup(List<Integer> paraList, String username, String names);
	/**
	 * 删除选中广告组
	 */
	public Integer delCheckGroup(List<Integer> paraList);
	public List<Map<String,Object>> statistics(Integer id, int offset, int pageSize, StringBuffer total);
	public Map<String, Object> statisticsAll(Integer id);
}
