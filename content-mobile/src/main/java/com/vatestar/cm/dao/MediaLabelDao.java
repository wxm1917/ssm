package com.vatestar.cm.dao;

import com.vatestar.cm.entity.MediaLabel;

import java.util.List;

/**
 * Created by rock on 2016/12/19.
 */
public interface MediaLabelDao {
	/**
	 * 根据父ID 查询子类
	 * @param id
	 * @return
	 */
    public List<MediaLabel> quarylabel(int id);
    /**
     * 标签名模糊查询得到标签ID
     * @param labelname
     * @return
     */
    public int quarylabelid(String labelname);
    /**
     * 获取CIBN 的标签
     * @param parid
     * @return
     */
    public List<MediaLabel> queryCIBNlabel(String parid);
}
