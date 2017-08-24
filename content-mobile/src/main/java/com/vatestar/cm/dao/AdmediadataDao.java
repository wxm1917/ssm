package com.vatestar.cm.dao;


import java.util.List;

import com.vatestar.cm.entity.Admediadata;

public interface AdmediadataDao {
	/**
	 * 插入数据 
	 * @param admediadata
	 */
	public void insertvalue(Admediadata admediadata);
	/**
	 * 查询用户所有的数据 
	 * @param id
	 * @return
	 */
	public List<Admediadata> quarymediadata(int id);
	 /**
     * 媒体数据条数
     * @param id
     * @return
     */
    public int countData(int id);
	/**
	 * 通过优化目标和标签查询媒体
	 * @param amAdmediadata
	 * @return
	 */
	public List<Admediadata> quaryMedias(Admediadata amAdmediadata);
	/**
	 * 根据id 获取user的数据
	 * @param id
	 * @param userid
	 * @return
	 */
	public Admediadata quarymedialist(int id,int userid);	
}
