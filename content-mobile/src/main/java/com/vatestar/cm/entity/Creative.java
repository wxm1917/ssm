package com.vatestar.cm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class Creative implements Serializable {
	/**
	 * hjr
	 * 2014-10-31
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private int userId;//用于查询，数据库中没有
	private String username;//用于查询，数据库中没有
	private Integer groupId;
	private String adName;
	private String adImage;
	private Integer adWidth;
	private Integer adHeight;
	private Integer adType;
	private Integer status;
	private String url;
	private String cTime;
	private Integer pageOffset;//当前页数
	private Integer pageSize=10;//每页条数
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public String getAdName() {
		return adName;
	}
	public void setAdName(String adName) {
		this.adName = adName;
	}
	public String getAdImage() {
		return adImage;
	}
	public void setAdImage(String adImage) {
		this.adImage = adImage;
	}
	public Integer getAdWidth() {
		return adWidth;
	}
	public void setAdWidth(Integer adWidth) {
		this.adWidth = adWidth;
	}
	public Integer getAdHeight() {
		return adHeight;
	}
	public void setAdHeight(Integer adHeight) {
		this.adHeight = adHeight;
	}
	public Integer getAdType() {
		return adType;
	}
	public void setAdType(Integer adType) {
		this.adType = adType;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
}
