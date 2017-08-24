package com.vatestar.cm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class CreativeData implements Serializable {
	/**
	 * hjr
	 * 2014-10-31
	 */
	private static final long serialVersionUID = 1L;

	private Integer id;
	private Integer creativeId;
	private Integer groupId;
	private Integer userId;	
	private Integer adv;
	private Integer ck;
	private String cTime;
	private float cpmCharge;
	private float cpcCharge;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getAdv() {
		return adv;
	}
	public Integer getCreativeId() {
		return creativeId;
	}
	public void setCreativeId(Integer creativeId) {
		this.creativeId = creativeId;
	}
	public void setAdv(Integer adv) {
		this.adv = adv;
	}
	public Integer getCk() {
		return ck;
	}
	public void setCk(Integer ck) {
		this.ck = ck;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
	public float getCpmCharge() {
		return cpmCharge;
	}
	public void setCpmCharge(float cpmCharge) {
		this.cpmCharge = cpmCharge;
	}
	public float getCpcCharge() {
		return cpcCharge;
	}
	public void setCpcCharge(float cpcCharge) {
		this.cpcCharge = cpcCharge;
	}
	public Integer getGroupId() {
		return groupId;
	}
	public void setGroupId(Integer groupId) {
		this.groupId = groupId;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
}
