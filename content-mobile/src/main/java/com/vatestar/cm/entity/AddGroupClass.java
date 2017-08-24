package com.vatestar.cm.entity;

import lombok.Data;

import java.io.Serializable;

@Data
public class AddGroupClass implements Serializable {
	/**
	 * hjr
	 * 2014-10-31
	 */
	private static final long serialVersionUID = 1L;

	private Integer id; //主键，自增
	private String groupName; //组名

	private int mediagroup;	//投放媒体
	private String tourl; //推广url
	private String adPositionId; //广告位
	private String startTime; //开始时间
	private String endTime; //结束时间
	private String settime;//时间段
	private String competingProducts;//cibn标签库
	private String excode;//代码
	private String sceneOrientation;//场景定向	1启用
	private String commodity;//竞品定向	 	1启用
	private String starOrientation;//明星定向		1启用
	private String pindaoOrientation;//频道定向		1启用
	private String lanmuOrientation;//栏目定向		1启用
	private String shipOrientation;//视频类别定向 	 1启用
	private String dianbOrientation; //点播类别定向 	 1启用
	private String voiceorientation;//语义定向		1启用
	private String voices;//自定义语义
	private String regionalOrientation;//地域定向		1启用
	private String city;//所选城市
	private String peopleOrientation;//人口属性定向		1启用
	private String orient; //人口属性
	private String addage;//自定义年龄段
	private String operatorOrientation;//运营商定向
	private String operace;//所选运营商
	private String deviceOrientation;//设备定向		1启用
	private String	device;//设备定向
	private String 	terminalOrientation;//终端定向 	 	1启用
	private String 	terminal;//终端
	private	String	chargeMode; //付费模式
	private String	price; //出价
	private String  medialabelone;//标签
	
	private String 	commodity_orientation;
	private String 	scene_orientation;
	private String 	facerecognition_orientation;
	private String 	emotion_orientation;
	private String 	music_orientation;
	private String 	equipment_orientation;

	private String 	facerecognition;
	private String 	emotion;
	private String 	filepath;//路径
	private String 	music;
	private String 	equipment;
	
	private int group_id;	//组id
	private int user_id;	//组id
	private String ctime;		//创建时间
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public int getMediagroup() {
		return mediagroup;
	}
	public void setMediagroup(int mediagroup) {
		this.mediagroup = mediagroup;
	}
	public String getTourl() {
		return tourl;
	}
	public void setTourl(String tourl) {
		this.tourl = tourl;
	}
	public String getAdPositionId() {
		return adPositionId;
	}
	public void setAdPositionId(String adPositionId) {
		this.adPositionId = adPositionId;
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
	public String getSettime() {
		return settime;
	}
	public void setSettime(String settime) {
		this.settime = settime;
	}
	public String getCompetingProducts() {
		return competingProducts;
	}
	public void setCompetingProducts(String competingProducts) {
		this.competingProducts = competingProducts;
	}
	public String getExcode() {
		return excode;
	}
	public void setExcode(String excode) {
		this.excode = excode;
	}
	public String getSceneOrientation() {
		return sceneOrientation;
	}
	public void setSceneOrientation(String sceneOrientation) {
		this.sceneOrientation = sceneOrientation;
	}
	public String getCommodity() {
		return commodity;
	}
	public void setCommodity(String commodity) {
		this.commodity = commodity;
	}
	public String getStarOrientation() {
		return starOrientation;
	}
	public void setStarOrientation(String starOrientation) {
		this.starOrientation = starOrientation;
	}
	public String getPindaoOrientation() {
		return pindaoOrientation;
	}
	public void setPindaoOrientation(String pindaoOrientation) {
		this.pindaoOrientation = pindaoOrientation;
	}
	public String getLanmuOrientation() {
		return lanmuOrientation;
	}
	public void setLanmuOrientation(String lanmuOrientation) {
		this.lanmuOrientation = lanmuOrientation;
	}
	public String getShipOrientation() {
		return shipOrientation;
	}
	public void setShipOrientation(String shipOrientation) {
		this.shipOrientation = shipOrientation;
	}
	public String getDianbOrientation() {
		return dianbOrientation;
	}
	public void setDianbOrientation(String dianbOrientation) {
		this.dianbOrientation = dianbOrientation;
	}
	public String getVoiceorientation() {
		return voiceorientation;
	}
	public void setVoiceorientation(String voiceorientation) {
		this.voiceorientation = voiceorientation;
	}
	public String getVoices() {
		return voices;
	}
	public void setVoices(String voices) {
		this.voices = voices;
	}
	public String getRegionalOrientation() {
		return regionalOrientation;
	}
	public void setRegionalOrientation(String regionalOrientation) {
		this.regionalOrientation = regionalOrientation;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getPeopleOrientation() {
		return peopleOrientation;
	}
	public void setPeopleOrientation(String peopleOrientation) {
		this.peopleOrientation = peopleOrientation;
	}
	public String getOrient() {
		return orient;
	}
	public void setOrient(String orient) {
		this.orient = orient;
	}
	public String getAddage() {
		return addage;
	}
	public void setAddage(String addage) {
		this.addage = addage;
	}
	public String getOperatorOrientation() {
		return operatorOrientation;
	}
	public void setOperatorOrientation(String operatorOrientation) {
		this.operatorOrientation = operatorOrientation;
	}
	public String getOperace() {
		return operace;
	}
	public void setOperace(String operace) {
		this.operace = operace;
	}
	public String getDeviceOrientation() {
		return deviceOrientation;
	}
	public void setDeviceOrientation(String deviceOrientation) {
		this.deviceOrientation = deviceOrientation;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public String getTerminalOrientation() {
		return terminalOrientation;
	}
	public void setTerminalOrientation(String terminalOrientation) {
		this.terminalOrientation = terminalOrientation;
	}
	public String getTerminal() {
		return terminal;
	}
	public void setTerminal(String terminal) {
		this.terminal = terminal;
	}
	public String getChargeMode() {
		return chargeMode;
	}
	public void setChargeMode(String chargeMode) {
		this.chargeMode = chargeMode;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMedialabelone() {
		return medialabelone;
	}
	public void setMedialabelone(String medialabelone) {
		this.medialabelone = medialabelone;
	}
	public String getCommodity_orientation() {
		return commodity_orientation;
	}
	public void setCommodity_orientation(String commodity_orientation) {
		this.commodity_orientation = commodity_orientation;
	}
	public String getScene_orientation() {
		return scene_orientation;
	}
	public void setScene_orientation(String scene_orientation) {
		this.scene_orientation = scene_orientation;
	}
	public String getFacerecognition_orientation() {
		return facerecognition_orientation;
	}
	public void setFacerecognition_orientation(String facerecognition_orientation) {
		this.facerecognition_orientation = facerecognition_orientation;
	}
	public String getEmotion_orientation() {
		return emotion_orientation;
	}
	public void setEmotion_orientation(String emotion_orientation) {
		this.emotion_orientation = emotion_orientation;
	}
	public String getMusic_orientation() {
		return music_orientation;
	}
	public void setMusic_orientation(String music_orientation) {
		this.music_orientation = music_orientation;
	}
	public String getEquipment_orientation() {
		return equipment_orientation;
	}
	public void setEquipment_orientation(String equipment_orientation) {
		this.equipment_orientation = equipment_orientation;
	}
	public String getFacerecognition() {
		return facerecognition;
	}
	public void setFacerecognition(String facerecognition) {
		this.facerecognition = facerecognition;
	}
	public String getEmotion() {
		return emotion;
	}
	public void setEmotion(String emotion) {
		this.emotion = emotion;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getEquipment() {
		return equipment;
	}
	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}
	public int getGroup_id() {
		return group_id;
	}
	public void setGroup_id(int group_id) {
		this.group_id = group_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getCtime() {
		return ctime;
	}
	public void setCtime(String ctime) {
		this.ctime = ctime;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}
