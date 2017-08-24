package com.vatestar.util;

import java.io.IOException;
import java.util.Properties;

public class App {
	private static String global_path = "";
	public App(String globalPath) {
		global_path = globalPath;
	}

	public static class Config {
		private static Properties properties = new Properties();
		static {
			try {
				Config inner = new Config();
				properties.clear();
				properties.load(inner.getClass().getResourceAsStream("/config/" + global_path + "/global.properties"));
				properties.load(inner.getClass().getResourceAsStream("/config/" + global_path + "/redis.properties"));
				properties.load(inner.getClass().getResourceAsStream("/config/" + global_path + "/email.properties"));
				properties.load(inner.getClass().getResourceAsStream("/config/" + global_path + "/datasource.properties"));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		public static String getConfig(String key) {
			return properties.getProperty(key);
		}

	}

	public static String getGlobalPath() {
		return global_path;
	}
	
	public static String ID = "{id}";
	public static String DATE = "{date}";
	
	public static String SERVER_URL = "SERVER_URL";
	
	
	public static String PREFIX = "prefix";
	//公共 
	public static String POST_CMS_PUB_LOGIN = "post_cms_pub_login";
	public static String POST_CMS_PUB_LOGOUT = "post_cms_pub_logout";
	public static String POST_API_PUB_UP = "post_api_pub_up";
	// 个人相关
	public static String GET_CMS_ME = "get_cms_me";
	public static String POST_CMS_ME = "post_cms_me";
	public static String POST_CMS_ME_PASSWORD = "post_cms_me_password";
	//用户
	public static String GET_CMS_USER = "get_cms_user";
	public static String POST_CMS_USER = "post_cms_user";
	public static String GET_CMS_USER_ID = "get_cms_user_{id}";
	public static String POST_CMS_USER_ID = "post_cms_user_{id}";
	public static String POST_CMS_USER_ID_PASSWORD = "post_cms_user_{id}_password";
	public static String DELETE_CMS_USER_ID = "delete_cms_user_{id}";
	public static String POST_CMS_USER_ID_RECOVER = "post_cms_user_{id}_recover";
	public static String GET_CMS_USER_ID_NEWS = "get_cms_user_{id}_news";
	public static String GET_CMS_USER_ID_CMT = "get_cms_user_{id}_cmt";
	public static String GET_CMS_USER_ID_MSG = "get_cms_user_{id}_msg";
	public static String POST_CMS_USER_ID_MSG = "post_cms_user_{id}_msg";
	public static String POST_CMS_USER_ID_POINT = "post_cms_user_{id}_point";
	//评论
	public static String GET_CMS_CMT = "get_cms_cmt";
	public static String GET_CMS_CMT_ID = "get_cms_cmt_{id}";
	public static String POST_CMS_CMT_ID = "post_cms_cmt_{id}";
	public static String DELETE_CMS_CMT_ID = "delete_cms_cmt_{id}";
	public static String POST_CMS_CMT_ID_AUDIT = "post_cms_cmt_{id}_audit";
	//反馈  
	public static String GET_CMS_FEEDBACK = "get_cms_feedback";
	//爆料
	public static String GET_CMS_GOSSIP = "get_cms_gossip";
	public static String GET_CMS_GOSSIP_ID = "get_cms_gossip_{id}";
	public static String DELETE_CMS_GOSSIP_ID = "delete_cms_gossip_{id}";
	//关键词
	public static String GET_CMS_KEYWORD = "get_cms_keyword";
	public static String POST_CMS_KEYWORD = "post_cms_keyword";
	public static String GET_CMS_KEYWORD_ID = "get_cms_keyword_{id}";
	public static String POST_CMS_KEYWORD_ID = "post_cms_keyword_{id}";
	public static String DELETE_CMS_KEYWORD_ID = "delete_cms_keyword_{id}";
	public static String GET_CMS_KEYWORD_ID_NEWS = "get_cms_keyword_{id}_news";
	//敏感词
	public static String GET_CMS_SENSITIVE_WORD = "get_cms_sensitiveWord";
	public static String POST_CMS_SENSITIVEWORD = "post_cms_sensitiveWord";
	public static String GET_CMS_SENSITIVEWORD = "get_cms_sensitiveWord_{id}";
	public static String POST_CMS_SENSITIVEWORD_ID = "post_cms_sensitiveWord_{id}";
	public static String DELETE_CMS_SENSITIVEWORD_ID = "delete_cms_sensitiveWord_{id}";
	//报名招募
	public static String GET_CMS_RECRUITMENT = "get_cms_recruitment";
	public static String GET_CMS_RECRUITMENT_ID = "get_cms_recruitment_{id}";
	public static String DELETE_CMS_RECRUITMENT_ID = "delete_cms_recruitment_{id}";
	//新闻 
	public static String GET_CMS_NEWS = "get_cms_news";
	public static String GET_CMS_NEWS_ID = "get_cms_news_{id}";
	public static String POST_CMS_NEWS_ID_STATUS = "post_cms_news_{id}_status";
	
	public static String POST_CMS_NEWS = "post_cms_news";
	public static String POST_CMS_NEWS_ID = "post_cms_news_{id}";
	public static String DELETE_CMS_NEWS_ID = "delete_cms_news_{id}";
	public static String POST_CMS_NEWS_ID_RECOVER = "post_cms_news_{id}_recover";
	public static String POST_CMS_NEWS_ID_WEIGHT = "post_cms_news_{id}_weight";
	public static String POST_CMS_NEWS_ID_ATTR = "post_cms_news_{id}_attr";
	public static String POST_CMS_NEWS_ID_TOP = "post_cms_news_{id}_top";
	public static String POST_CMS_NEWS_ID_AUDIT = "post_cms_news_{id}_audit";
	public static String POST_CMS_NEWS_ID_SENSITIVEWORD = "post_cms_news_{id}_sensitiveWord";
	public static String GET_CMS_NEWS_ID_CMT = "get_cms_news_{id}_cmt";
	public static String POST_CMS_NEWS_ID_PUSH = "post_cms_news_{id}_push";
	public static String POST_CMS_NEWS_ID_TMPWEIGHT = "post_cms_news_{id}_tmpweight";
	public static String POST_CMS_NEWS_ID_POSITION = "post_cms_news_{id}_position";
	public static String DELETE_CMS_NEWS_ID_POSITION = "delete_cms_news_{id}_position";
	public static String POST_CMS_NEWS_HOME_SAVE = "post_cms_news_home_save";
	public static String GET_CMS_NEWS_HOME = "get_cms_news_home";
	public static String GET_CMS_NEWS_TOP = "get_cms_news_top";
    //权限
	public static String GET_CMS_PRIVILEGE = "get_cms_privilege";
	public static String GET_CMS_PRIVILEGE_ID = "get_cms_privilege_{id}";
	public static String POST_CMS_PRIVILEGE = "post_cms_privilege=";
	public static String POST_CMS_PRIVILEGE_ID = "post_cms_privilege_{id}";
	public static String DELETE_CMS_PRIVILEGE_ID = "delete_cms_privilege_{id}";
	//角色
	public static String GET_CMS_ROLE = "get_cms_role";
	public static String GET_CMS_ROLE_ID = "get_cms_role_{id}";
	public static String POST_CMS_ROLE = "post_cms_role";
	public static String POST_CMS_ROLE_ID = "post_cms_role_{id}";
	public static String DELETE_CMS_ROLE_ID = "delete_cms_role_{id}";
	public static String DELETE_CMS_ROLE_ID_PRIVILEGE = "delete_cms_role_{id}_privilege";
	//明星
	public static String GET_CMS_STAR = "get_cms_star";
	public static String GET_CMS_STAT_ID = "get_cms_star_{id}";
	public static String POST_CMS_STAR = "post_cms_star";
	public static String POST_CMS_STAT_ID = "post_cms_star_{id}";
	public static String DELETE_CMS_STAT_ID = "delete_cms_star_{id}";
	public static String DELETE_CMS_STAT_ID_RECOVER = "delete_cms_star_{id}_recover";
	//统计管理
	public static String GET_CMS_STAT_NEWS = "get_cms_stat_news";
	public static String GET_CMS_STAT_NEWS_DATE = "get_cms_stat_news_{date}";
	public static String GET_CMS_STAT_CMT = "get_cms_stat_cmt";
	//应用设置管理 
	public static String GET_CMS_SETTING_POINT = "get_cms_setting_point";
	public static String GET_CMS_SETTING_ABOUT = "get_cms_setting_about";
	public static String GET_CMS_SETTING_INVITATION = "get_cms_setting_invitation";
	public static String GET_CMS_SETTING_AD = "get_cms_setting_ad";
	public static String GET_CMS_SETTING_SHARE = "get_cms_setting_share";
	public static String GET_CMS_SETTING_VERSION = "get_cms_setting_version";
	public static String POST_CMS_SETTING = "post_cms_setting";
	public static String GET_CMS_DISCOVERY = "get_cms_discovery";
	public static String POST_CMS_DISCOVERY_AD = "post_cms_discovery_ad";
	public static String POST_CMS_DISCOVERY_SEARCH = "post_cms_discovery_search";
	//视频管理 
	public static String GET_CMS_RESOURCE = "get_cms_resource";
	public static String GET_VIDEO_RESOURCE = "get_video_resource";
	public static String GET_CMS_RESOURCE_ID = "get_cms_resource_{id}";
	public static String POST_CMS_RESOURCE = "post_cms_resource";
	public static String POST_CMS_RESOURCE_ID = "post_cms_resource_{id}";
	public static String DELETE_CMS_RESOURCE_ID = "delete_cms_resource_{id}";
	//推送消息管理 
	public static String GET_CMS_PUSH = "get_cms_push";
	public static String GET_CMS_PUSH_ID = "get_cms_push_{id}";
	public static String DELETE_CMS_PUSH_ID= "delete_cms_push_{id}";
	public static String GET_UP_TOCKEN = "get_up_token";
	public static String LOCAL_UP_FILE = "local_up_file";
	public static String TMP_STORE_FILE_PATH = "tmp_store_file_path";
	public static String COMMON_FILE_URL_PREFIX = "common_file_url_prefix";
	public static String NEWS_FILE_URL_PREFIX = "news_file_url_prefix";
	public static String PIC_FILE_URL_PREFIX = "pic_file_url_prefix";
	public static String VIDEO_FILE_URL_PREFIX = "video_file_url_prefix";
	public static String PIC_FILE_TYPE_PREFIX = "pic_file_type_prefix";
	public static String CUT_PIC = "cut_pic";
	//版本管理  
	public static String GET_CMS_VERSION = "get_cms_version";
	public static String POST_CMS_VERSION = "post_cms_version";
	public static String DELETE_CMS_VERSION_ID = "delete_cms_version_{id}";
	public static String GET_CMS_VERSION_ID = "get_cms_version_{id}";
	public static String POST_CMS_VERSION_ID= "post_cms_version_{id}";
	
	//频道管理
	public static String GET_CMS_CHANNELS = "get_cms_channels";
	public static String DELETE_CMS_CHANNELS_ID = "delete_cms_channels_{id}";
	public static String GET_CMS_CHANNELS_ID = "get_cms_channels_{id}";
	public static String POST_CMS_CHANNELS_ID = "post_cms_channels_{id}";
	
	
	public static String LIVE_CMS_CHANNELS_ID = "live_cms_channels_{id}";
	
}
