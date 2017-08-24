package com.vatestar.cm.service;


import com.vatestar.cm.entity.EbsImgDate;

import java.util.List;

public interface EbsImgDateService {
	/**
	 * 分页查询
	 * @author hanchanghong
	 * @date 2015-2-2 下午02:32:34
	 */
	public List<EbsImgDate> queryPage(EbsImgDate ebs);
	
	/**
	 * 分页记录数查询
	 * @author hanchanghong
	 * @date 2015-2-2 下午02:32:34
	 */
	public int queryPageCount(EbsImgDate ebs);
	
	/**
	 * 分组统计分页查询
	 * @author hanchanghong
	 * @date 2015-2-2 下午02:32:34
	 */
	public List<EbsImgDate> queryGroupPage(EbsImgDate ebs);
	
	/**
	 * 分组统计分页记录数查询
	 * @author hanchanghong
	 * @date 2015-2-2 下午02:32:34
	 */
	public int queryGroupPageCount(EbsImgDate ebs);
}
