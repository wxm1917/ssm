package com.vatestar.cm.entity;

import lombok.Data;

@Data
public class User {
	private Integer id;//
	private String username;// 用户名
	private String password;// 密码
	private Integer role;// 角色
	private Double residualMoney=0D;// 剩余金额
	private Double consumeMoney=0D;// 消费金额
	private Double residualRresentMoney=0D; //剩余返点金额   剩余金额=消费金额*返点基数
	private Double consumeRresentMoney=0D; //消费返点金额
	private Double cardinality; //返点基数
	private String phone;// 联系方式
	private String indexUrl;//客户主页
	private String qq;
	private Integer parentId;// 父id
	private String remark;// 备注
	private Integer state;// 状态 1待审核2审核通过3审核驳回
	private String available;// 是否有效
	private String createTime;// 创建时间
	private Long dateTotle;//注册天数
	private Double averageConsume;//日均消费
	private Integer pageOffset=0;//当前页数
	private Integer pageSize=10;//每页条数
	/**
	 * 营业执照
	 */
	private String businessLicense="";


	public User() {
		super();
	}

	public User(String username) {
		super();
		this.username = username;
	}

	public User(Integer parentId, Integer pageOffset, Integer pageSize) {
		super();
		this.parentId = parentId;
		this.pageOffset = pageOffset;
		this.pageSize = pageSize;
	}


	public User(Integer id, String available) {
		super();
		this.id = id;
		this.available = available;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getRole() {
		return role;
	}

	public void setRole(Integer role) {
		this.role = role;
	}

	public Double getResidualMoney() {
		return residualMoney;
	}

	public void setResidualMoney(Double residualMoney) {
		this.residualMoney = residualMoney;
	}

	public Double getConsumeMoney() {
		return consumeMoney;
	}

	public void setConsumeMoney(Double consumeMoney) {
		this.consumeMoney = consumeMoney;
	}

	public Double getResidualRresentMoney() {
		return residualRresentMoney;
	}

	public void setResidualRresentMoney(Double residualRresentMoney) {
		this.residualRresentMoney = residualRresentMoney;
	}

	public Double getConsumeRresentMoney() {
		return consumeRresentMoney;
	}

	public void setConsumeRresentMoney(Double consumeRresentMoney) {
		this.consumeRresentMoney = consumeRresentMoney;
	}

	public Double getCardinality() {
		return cardinality;
	}

	public void setCardinality(Double cardinality) {
		this.cardinality = cardinality;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIndexUrl() {
		return indexUrl;
	}

	public void setIndexUrl(String indexUrl) {
		this.indexUrl = indexUrl;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public String getAvailable() {
		return available;
	}

	public void setAvailable(String available) {
		this.available = available;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Long getDateTotle() {
		return dateTotle;
	}

	public void setDateTotle(Long dateTotle) {
		this.dateTotle = dateTotle;
	}

	public Double getAverageConsume() {
		return averageConsume;
	}

	public void setAverageConsume(Double averageConsume) {
		this.averageConsume = averageConsume;
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

	public String getBusinessLicense() {
		return businessLicense;
	}

	public void setBusinessLicense(String businessLicense) {
		this.businessLicense = businessLicense;
	}


}
