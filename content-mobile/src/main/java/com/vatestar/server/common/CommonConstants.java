package com.vatestar.server.common;

import java.util.concurrent.TimeUnit;


public final class CommonConstants {
    
    public static final long manager_no = 1L;
    public static final String LIKE_MESSAGE = "对您点了一个赞";
    public static final long TIMEOUT = 1;//缓存失效时间,分钟
    public static final long TIMEOUT_DAY = 1;//缓存失效时间,一天
    public static final TimeUnit UNIT_TIME = TimeUnit.MINUTES;//单位
    public static final TimeUnit UNIT_TIME_DAY = TimeUnit.DAYS;//单位
    public static final int SUGGEST_USER_NUM = 200;//附近的人推荐用户数量满足赞数200个规则
    public static final String Default_HeadPicture = "http://file.vcheese.com/vcheese-userimg/defaultHead.png";
    
    /**
     * 机器人消息池常量
     * @author zhengchao
     */
    public static final int MESSAGE_V_SEND = 1;
    public static final int MESSAGE_NV_SEND = 2;
    public static final int MESSAGE_V_REPLY = 3;
    public static final int MESSAGE_NV_REPLY = 4;
    
    public final static class findNum {
        /**
         * 发现列表查询的用户数量
         */
        public static final int find_user_discovery_num = 48;
        /**
         * 发现列表查询的用户数量
         */
        public static final int find_user = 12;
        public static final int status = 0;//状态正常
    }   
    /**
     * 消息盒子表message_box 对应的类型
     * @author dfn
     * @date: 2015年3月18日 下午2:30:37   
     * @version V1.0
     */
    public static enum userChatType {
        word(0, "文字"),
        short_video(1, "短视频"),
        video_talk(2, "视频聊天"),
        talk_room_news(3,"聊天室消息"),
        talk_video( 4,"关联视频消息")
        ;
        
        private int index;
        private String title;
        
        userChatType(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (userChatType s : userChatType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 
     * @author dfn
     * @date: 2015年3月18日 下午2:31:28   
     * @version V1.0
     */
    
    public static enum recommendBoxType {
        used(0, "正常"),
        deleted(1, "已删除") 
        ;
        
        private int index;
        private String title;
        
        recommendBoxType(int index, String title) {
            this.index = index;
            this.title = title;
        }
        
        public static String getTitle(int index) {
            for (recommendBoxType s : recommendBoxType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 用户状态
     * @author admin
     *
     */
    public static enum userStatus {
        user_status_normal(0, "正常"),
        user_status_frozen(1, "封号"),
        user_status_frozen_ser(2, "封串号"),
        user_status_alarm(3,"警告"),
        user_status_other( 4,"其他")
        ;
        
        private int index;
        private String title;
        
        userStatus(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (userStatus s : userStatus.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 用户类型
     * @author admin
     *
     */
    public static enum userType {
        user_type_normal(0, "普通用户"),
        user_type_official(1, "官方账号"),
        ;
        
        private int index;
        private String title;
        
        userType(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (userType s : userType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 用户处理状态
     * @author admin
     *
     */
    public static enum userOperator {
        operator_type_normal(0, "未处理"),
        operator_type_feed(1, "已处理"),
        ;
        
        private int index;
        private String title;
        
        userOperator(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (userOperator s : userOperator.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 视频处理状态
     * @author admin
     *
     */
    public static enum videoOperatorType {
        operator_type_normal(0, "正常"),
        operator_type_pass(1, "通过"),
        operator_type_del(2, "删除"),
        ;
        
        private int index;
        private String title;
        
        videoOperatorType(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (videoOperatorType s : videoOperatorType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * App版本当前、历史标志
     * @author admin
     *
     */
    public static enum appVersionFlag {
        app_version_flag(0, "当前版本"),
        app_version_history_flag(1, "历史版本"),
        ;
        
        private int index;
        private String title;
        
        appVersionFlag(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (appVersionFlag s : appVersionFlag.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * App是否必须更新标志
     * @author admin
     *
     */
    public static enum appUpdateTrueorfalse {
        app_update_false(0, "非必须更新"),
        app_update_true(1, "必须更新"),
        ;
        
        private int index;
        private String title;
        
        appUpdateTrueorfalse(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (appUpdateTrueorfalse s : appUpdateTrueorfalse.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * App平台类型
     * @author admin
     *
     */
    public static enum appType {
        app_android_type(1, "android"),
        app_ios_type(3, "IOS"),
        ;
        
        private int index;
        private String title;
        
        appType(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (appType s : appType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 话题状态
     * @author admin
     *
     */
    public static enum topicStatus {
        stat_normal(0, "话题未启用"),
        stat_used(1, "话题已启用"),
        stat_del(2, "话题已删除"),
        ;
        
        private int index;
        private String title;
        
        topicStatus(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (topicStatus s : topicStatus.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 标签状态
     * @author admin
     *
     */
    public static enum tagStatus {
        stat_normal(0, "标签未启用"),
        stat_used(1, "标签已启用"),
        stat_del(2, "标签已删除"),
        ;
        
        private int index;
        private String title;
        
        tagStatus(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (tagStatus s : tagStatus.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 渠道性质
     * @author admin
     *
     */
    public static enum channelsNature {
        channels_nature_normal(1, "普通渠道"),
        channels_nature_qq(2, "QQ"),
        channels_nature_email(3, "Email"),
        channels_nature_other(4, "其他"),
        ;
        
        private int index;
        private String title;
        
        channelsNature(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (channelsNature s : channelsNature.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 渠道平台类型
     * @author admin
     *
     */
    public static enum channelsType {
        CHANNELS_TYPE_IPHONE_OPEN(1, "苹果越狱"),
        CHANNELS_TYPE_IPHONE(2, "苹果"),
        CHANNELS_TYPE_ANDROID(3, "安卓"),
        ;
        
        private int index;
        private String title;
        
        channelsType(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (channelsType s : channelsType.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    /**
     * 消息盒子数据值
     * @author admin
     *
     */
    public static enum messageBoxFlag {
        MESSAGE_NOREPLY(0, "未回复"),
        MESSAGE_REPLY(1, "已回复"),
        MESSAGE_IGNORE(2, "已忽略"),
        ;
        
        private int index;
        private String title;
        
        messageBoxFlag(int index, String title) {
            this.index = index;
            this.title = title;
        }

        public static String getTitle(int index) {
            for (messageBoxFlag s : messageBoxFlag.values()) {
                if (s.getIndex() == index) {
                    return s.getTitle();
                }
            }
            return "";
        }
        
        public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
    
 
    /**
     * 消息池枚举
     * @author zhengchao
     */
    public enum messagePool{
    	MESSAGE_V_SEND(1, "有视频发送池"),
        MESSAGE_NV_SEND(2, "无视频发送池"),
        MESSAGE_V_REPLY(3, "有视频回复池"),
        MESSAGE_NV_REPLY(4, "无视频回复池");
    		
    	private int index;
    	private String title;
    	
    	messagePool(int index, String title) {
             this.index = index;
             this.title = title;
         }

         public static String getTitle(int index) {
             for (messagePool s : messagePool.values()) {
                 if (s.getIndex() == index) {
                     return s.getTitle();
                 }
             }
             return "";
         }
          
    	public final int getIndex() {
            return index;
        }
        public final String getTitle() {
            return title;
        }
    }
}
