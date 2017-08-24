package com.vatestar.cm.entity;

import lombok.Data;

/**
 * 视觉广告数据
 * tb_adtive_ebsimg_date
 * @author hanchanghong
 * @date 2015-2-2 下午02:29:04
 */
@Data
public class EbsImgDate {

	private Integer id;//
	private String imgId;// 图片id
	private String userId;// 用户id
	private Integer shootNum;// 拍摄次数
	private Float shootCharges;// 拍摄费用
	private String createDate;// 创建时间
	private Float totleConsume;// 消费总额  表中没有字段 只用于汇总显示
	private Integer pageOffset=0;//当前页数
	private Integer pageSize=10;//每页条数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getImgId() {
		return imgId;
	}
	public void setImgId(String imgId) {
		this.imgId = imgId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public Integer getShootNum() {
		return shootNum;
	}
	public void setShootNum(Integer shootNum) {
		this.shootNum = shootNum;
	}
	public Float getShootCharges() {
		return shootCharges;
	}
	public void setShootCharges(Float shootCharges) {
		this.shootCharges = shootCharges;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public Float getTotleConsume() {
		return totleConsume;
	}
	public void setTotleConsume(Float totleConsume) {
		this.totleConsume = totleConsume;
	}
	public Integer getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(Integer pageOffset) {
		this.pageOffset = pageOffset;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	
}
