package com.vatestar.cm.entity;


import lombok.Data;

/**
 * 充值日志
 * @author hanchanghong
 * @date 2014年12月8日 下午4:24:52
 */
@Data
public class MoneyLog {

	private Integer id;
	private Integer operateUserId;//操作人
	private Integer fromUserId; //只能是代理商  role=3
	private Integer toUserId; //可以是广告组，也可以是 expai
	private Double money;
	private String username;
	private String createTime;
	
	/**
	 * 1：续费 0：退费
	 */
	private Integer type;
	
	private String creatTime;
	/**
	 * 当前页数
	 */
	private Integer pageOffset;
	/**
	 * 每页条数
	 */
	private Integer pageSize=10;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getOperateUserId() {
		return operateUserId;
	}
	public void setOperateUserId(Integer operateUserId) {
		this.operateUserId = operateUserId;
	}
	public Integer getFromUserId() {
		return fromUserId;
	}
	public void setFromUserId(Integer fromUserId) {
		this.fromUserId = fromUserId;
	}
	public Integer getToUserId() {
		return toUserId;
	}
	public void setToUserId(Integer toUserId) {
		this.toUserId = toUserId;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getCreatTime() {
		return creatTime;
	}
	public void setCreatTime(String creatTime) {
		this.creatTime = creatTime;
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
