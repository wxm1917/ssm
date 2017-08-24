package com.vatestar.server.common;

public interface DataConstants {

	// ---------------所有类型--------------------------

	/**
	 * 用户状态
	 */
	public static final String USER_STATUS = "USER_STATUS";
	/**
	 * 用户类型
	 */
	public static final String USER_TYPE = "USER_TYPE";
	/**
	 * 用户处理状态
	 */
	public static final String USER_OPERATOR = "USER_OPERATOR";
	/**
	 * 视频处理状态状态
	 */
	public static final String VIDEO_OPERATOR_TYPE = "VIDEO_OPERATOR_TYPE";
	/**
	 * App版本当前、历史标志
	 */
	public static final String APP_VERSION_FLAG = "APP_VERSION_FLAG";
	/**
	 * App是否必须更新标志
	 */
	public static final String APP_UPDATE_TRUEORFALSE = "APP_UPDATE_TRUEORFALSE";
	/**
	 * App平台类型
	 */
	public static final String APP_TYPE = "APP_TYPE";
	/**
	 * 话题状态
	 */
	public static final String TOPIC_STATUS = "TOPIC_STATUS";
	/**
	 * 标签状态
	 */
	public static final String TAG_STATUS = "TAG_STATUS";
	/**
	 * 渠道性质
	 */
	public static final String CHANNELS_NATURE = "CHANNELS_NATURE";
	/**
	 * 渠道平台类型
	 */
	public static final String CHANNELS_TYPE = "CHANNELS_TYPE";
	/**
	 * 消息盒子数据值
	 */
	public static final String MESSAGE_BOX_FLAG = "MESSAGE_BOX_FLAG";

	// ---------------每个类型列表项--------------------------

	/**
	 * 用户状态列表
	 */
	interface USER_STATUS_D {
		/**
		 * 正常
		 */
		public static final Integer USER_STATUS_NORMAL = 0;
		/**
		 * 封号
		 */
		public static final Integer USER_STATUS_FROZEN = 1;
		/**
		 * 封串号
		 */
		public static final Integer USER_STATUS_FROZEN_SER = 2;
		/**
		 * 警告
		 */
		public static final Integer USER_STATUS_ALARM = 3;
		/**
		 * 其它
		 */
		public static final Integer USER_STATUS_OTHER = 4;
	}

	/**
	 * 用户类型
	 */
	interface USER_TYPE_D {
		/**
		 * 普通用户
		 */
		public static final Integer USER_TYPE_NORMAL = 0;
		/**
		 * 官方账号
		 */
		public static final Integer USER_TYPE_OFFICIAL = 1;
		/**
		 * 拍客
		 */
		public static final Integer USER_TYPE_PAIKE = 2;
	}

	/**
	 * 用户处理状态
	 */
	interface USER_OPERATOR_D {
		/**
		 * 未处理
		 */
		public static final Integer OPERATOR_TYPE_NORMAL = 0;
		/**
		 * 已处理
		 */
		public static final Integer OPERATOR_TYPE_FEED = 1;
	}

	/**
	 * 视频处理状态
	 */
	interface VIDEO_OPERATOR_TYPE_D {
		/**
		 * 正常
		 */
		public static final Integer OPERATOR_TYPE_NORMAL = 0;
		/**
		 * 通过
		 */
		public static final Integer OPERATOR_TYPE_PASS = 1;
		/**
		 * 删除
		 */
		public static final Integer OPERATOR_TYPE_DEL = 2;
	}

	/**
	 * App版本当前、历史标志
	 */
	interface APP_VERSION_FLAG_D {
		/**
		 * 当前版本
		 */
		public static final Integer APP_VERSION_FLAG = 0;
		/**
		 * 历史版本
		 */
		public static final Integer APP_VERSION_HISTORY_FLAG = 1;
	}

	/**
	 * App是否必须更新标志
	 */
	interface APP_UPDATE_TRUEORFALSE_D {
		/**
		 * 必须更新
		 */
		public static final Integer APP_UPDATE_TRUE = 1;
		/**
		 * 非必须更新
		 */
		public static final Integer APP_UPDATE_FALSE = 0;
	}

	/**
	 * App平台类型
	 */
	interface APP_TYPE_D {
		/**
		 * Android
		 */
		public static final Integer APP_ANDROID_TYPE = 1;
		/**
		 * IOS
		 */
		public static final Integer APP_IOS_TYPE = 3;
	}

	/**
	 * 话题状态
	 */
	interface TOPIC_STATUS_D {
		/**
		 * 话题未启用
		 */
		public static final Integer STAT_NORMAL = 0;
		/**
		 * 话题已启用
		 */
		public static final Integer STAT_USED = 1;
		/**
		 * 话题已删除
		 */
		public static final Integer STAT_DEL = 2;
	}

	/**
	 * 标签状态
	 */
	interface TAG_STATUS_D {
		/**
		 * 标签未启用
		 */
		public static final Integer STAT_NORMAL = 0;
		/**
		 * 标签已启用
		 */
		public static final Integer STAT_USED = 1;
		/**
		 * 标签已删除
		 */
		public static final Integer STAT_DEL = 2;
	}

	/**
	 * 渠道性质
	 */
	interface CHANNELS_NATURE_D {
		/**
		 * 普通渠道
		 */
		public static final Integer CHANNELS_NATURE_NORMAL = 1;
		/**
		 * QQ
		 */
		public static final Integer CHANNELS_NATURE_QQ = 2;
		/**
		 * Email
		 */
		public static final Integer CHANNELS_NATURE_EMAIL = 3;
		/**
		 * 其他
		 */
		public static final Integer CHANNELS_NATURE_OTHER = 4;
	}

	/**
	 * 渠道平台类型
	 */
	interface CHANNELS_TYPE_D {
		/**
		 * 苹果越狱
		 */
		public static final Integer CHANNELS_TYPE_IPHONE_OPEN = 1;
		/**
		 * 苹果
		 */
		public static final Integer CHANNELS_TYPE_IPHONE = 2;
		/**
		 * 安卓
		 */
		public static final Integer CHANNELS_TYPE_ANDROID = 3;
	}

	/**
	 * 消息盒子数据值
	 */
	interface MESSAGE_BOX_FLAG_D {
		/**
		 * 未回复
		 */
		public static final Integer MESSAGE_NOREPLY = 0;
		/**
		 * 已回复
		 */
		public static final Integer MESSAGE_REPLY = 1;
		/**
		 * 已忽略
		 */
		public static final Integer MESSAGE_IGNORE = 2;
	}

	/**
	 * 身份类型
	 */
	interface USER_IDENTITY_D {
		/**
		 * 真实用户
		 */
		public static final Integer USER_IDENTITY_TRUE = 0;
		/**
		 * 拍客
		 */
		public static final Integer USER_IDENTITY_PAI = 1;
		/**
		 * 抓取用户
		 */
		public static final Integer USER_IDENTITY_GET = 2;
	}

	/**
	 * 处罚入口
	 */
	interface DEAL_ENTER_D {
		/**
		 * 删除视频
		 */
		public static final Integer DEAL_ENTER_VIDEO = 0;
		/**
		 * 删除头像
		 */
		public static final Integer DEAL_ENTER_HEAD = 1;
		/**
		 * 其他入口
		 */
		public static final Integer DEAL_ENTER_OTHER = 2;
	}

	/**
	 * 处罚选项
	 */
	interface DEAL_OR_D {
		/**
		 * 处罚
		 */
		public static final Integer DEAL_OR_YES = 0;
		/**
		 * 不处罚
		 */
		public static final Integer DEAL_OR_NO = 1;
	}

}
