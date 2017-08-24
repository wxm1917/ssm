package com.vatestar.cm.dao;

import java.util.List;

import com.vatestar.cm.entity.Admedia;
/**
 * 
 * @author rock
 *
 */
public interface AdmediaDao {
	/**
	 *  插入一条数据
	 * @param media
	 * @return
	 */
	public int insertvalue(Admedia media);
	/**
	 * 根据id得到Admedia
	 * @param id
	 * @return
	 */
	public Admedia quarymedia(String id);
	/**
	 * 删除一条数据
	 * @param media
	 */
	public void remedia(Admedia media);
	/**
	 * 查询所有媒体
	 * @return
	 */
	public List<Admedia> queryMedias();
}
