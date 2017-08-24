package com.vatestar.cm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class AdGroup implements Serializable {
	/**
	 * hjr
	 * 2014-10-31
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; //主键，自增
	private Integer userId;  //广告主id，关联tb_adtive_user
	private String username;  //用户名 db中不保存
	private String groupName; //广告主名
	private float generalBudget;//总预算     
	private float dailyBudget; //每日预算         
	private String startTime; //广告投放开始日期
	private String endTime; //广告投放结束日期，为空时，日期不限
	private Integer chargeModel; //计费方式：0-cpm，1-cpc
	private Integer timeOrientation; //投放时段定向：0-全时段，1-自定义
	private String time; //时段，time_orientation为1时使用
	private Integer regionalOrientation;//地域投向：0-全国，1-按地域选择
	private String city;  //城市，time_orientation为1时使用
	private Integer industryOrientation; //行业定向：0-不限人群，1-行业兴趣组选择
	private String industry; //行业，industry_orientation为1时有用
	private Integer peopleOrientation; //人群属性： 0-不限人群， 1-
	private String sex; //性别， people_orientation 为 1 时有效，
	private String age;//年龄， people_orientation 为 1 时有效
	private String education;  //学历， people_orientation 为 1 时有效
	private Integer mediaOrientation; //媒体定向： 0-不限人群， 1-
	private String media; //媒体， media_orientation 为 1 时有效
	private String adPosition; //广告投放位置定向:0-首屏， 1-非首屏
	private String adType;//广告类型:0-嵌入式， 1-浮窗口， 2-贴片
	
	private float price; //出价   
	private Integer status; //创建时间
	private String cTime;//创建时间
	private String updateDate;//修改时间
	
	private Integer newsclient;  // 新闻客户端  0为选择
	private float newsclientprice; //新闻客户端 出价
	private Integer daynews; // 天天快报 0为选择
	private float daynewstprice; // 天天快报出价	
	private Integer phonenews; //手机新闻 0为选择
	private float phonenewsprice;// 手机新闻 出价
	private String addage;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public float getGeneralBudget() {
		return generalBudget;
	}
	public void setGeneralBudget(float generalBudget) {
		this.generalBudget = generalBudget;
	}
	public float getDailyBudget() {
		return dailyBudget;
	}
	public void setDailyBudget(float dailyBudget) {
		this.dailyBudget = dailyBudget;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public Integer getChargeModel() {
		return chargeModel;
	}
	public void setChargeModel(Integer chargeModel) {
		this.chargeModel = chargeModel;
	}
	public Integer getTimeOrientation() {
		return timeOrientation;
	}
	public void setTimeOrientation(Integer timeOrientation) {
		this.timeOrientation = timeOrientation;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public Integer getRegionalOrientation() {
		return regionalOrientation;
	}
	public void setRegionalOrientation(Integer regionalOrientation) {
		this.regionalOrientation = regionalOrientation;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public Integer getIndustryOrientation() {
		return industryOrientation;
	}
	public void setIndustryOrientation(Integer industryOrientation) {
		this.industryOrientation = industryOrientation;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public Integer getPeopleOrientation() {
		return peopleOrientation;
	}
	public void setPeopleOrientation(Integer peopleOrientation) {
		this.peopleOrientation = peopleOrientation;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getEducation() {
		return education;
	}
	public void setEducation(String education) {
		this.education = education;
	}
	public Integer getMediaOrientation() {
		return mediaOrientation;
	}
	public void setMediaOrientation(Integer mediaOrientation) {
		this.mediaOrientation = mediaOrientation;
	}
	public String getMedia() {
		return media;
	}
	public void setMedia(String media) {
		this.media = media;
	}
	public String getAdPosition() {
		return adPosition;
	}
	public void setAdPosition(String adPosition) {
		this.adPosition = adPosition;
	}
	public String getAdType() {
		return adType;
	}
	public void setAdType(String adType) {
		this.adType = adType;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public Integer getNewsclient() {
		return newsclient;
	}
	public void setNewsclient(Integer newsclient) {
		this.newsclient = newsclient;
	}
	public float getNewsclientprice() {
		return newsclientprice;
	}
	public void setNewsclientprice(float newsclientprice) {
		this.newsclientprice = newsclientprice;
	}
	public Integer getDaynews() {
		return daynews;
	}
	public void setDaynews(Integer daynews) {
		this.daynews = daynews;
	}
	public float getDaynewstprice() {
		return daynewstprice;
	}
	public void setDaynewstprice(float daynewstprice) {
		this.daynewstprice = daynewstprice;
	}
	public Integer getPhonenews() {
		return phonenews;
	}
	public void setPhonenews(Integer phonenews) {
		this.phonenews = phonenews;
	}
	public float getPhonenewsprice() {
		return phonenewsprice;
	}
	public void setPhonenewsprice(float phonenewsprice) {
		this.phonenewsprice = phonenewsprice;
	}
	public String getAddage() {
		return addage;
	}
	public void setAddage(String addage) {
		this.addage = addage;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
