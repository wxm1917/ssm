package com.vatestar.server.common;

public interface Constants {
	public static final String LOGON_USER_CONTEXT = "current_logon_user";

	public static final String LOGON_USER_PERMISSION = "current_user_permission";

	// 官方账号
	public static final Long TEMP_ADMIN_ID = 1L;

	public static final String FOREVER_DATE_START = "2015-01-01 00:00:00";
	public static final String FOREVER_DATE = "2099-12-30 23:59:59";

	public static final Integer RECOMMEND_USER_COUNT = 100; // 默认推荐用户数量

	// 类型1图片2约拍3活动
	public static final Integer OBJ_CATEGORY_PIC = 1;
	public static final Integer OBJ_CATEGORY_DES = 2;
	public static final Integer OBJ_CATEGORY_ACT = 3;

	interface PageSize {
		public static final Integer pageSize = 10;
		public static final Integer pageSize_8 = 8;
		public static final Integer pageSize_5 = 5;
		public static final Integer pageSize_36 = 36;
		public static final Integer pageSize_50 = 50;
		public static final Integer pageSize_20 = 20;
	}

	// 图片处理状态 0：未审核 1：审核通过 2：删除
	interface USER_PHOTO {
		public static final Integer UNCHECKED = 0;
		public static final Integer PASS = 1;
		public static final Integer DEL = 2;
		public static final Integer RECOMMEND = 3;
		public static final Integer CATEGORY_U = 0; // 用户图片
		public static final Integer CATEGORY_A = 1; // 活动图片
		
		public static final Integer HEAD_MIN = 56; 
		public static final Integer HEAD_MID = 100; // 88
		public static final Integer HEAD_MAX = 300; // 160
		
		public static final Integer PIC_MIN = 300; // 242
		public static final Integer PIC_MID_W = 850; // 710
		public static final Integer PIC_MID_H = 1040; // 870
		
		public static final Integer A_T_PIC_MID_W = 670; // 670
		public static final Integer A_T_PIC_MID_H = 206; // 670
		public static final Integer A_C_PIC_MID = 500; // 332
		
	}

	interface USER {
		public static final Integer USER_RECOMMEND_0 = 0;
		public static final Integer USER_RECOMMEND_1 = 1;
	}

	interface DISCUSS {
		public static final Integer DISCUSS_0 = 0; // 评论
		public static final Integer DISCUSS_1 = 1; // 回复
		public static final Integer DISCUSS_STATE_0 = 0; // 正常
		public static final Integer DISCUSS_STATE_1 = 1; // 删除
	}

	interface LIKE {
		public static final Integer LIKE_STATE_0 = 0; // 正常
		public static final Integer LIKE_STATE_1 = 1; // 删除
	}

	interface ACTIVITY {
		public static final Integer UNCHECKED = 0;
		public static final Integer PASS = 1;
		public static final Integer NO_PASS = 2;
		public static final Integer DEL = 3;
		public static final Integer CATEGORY_2 = 2; // 约拍
		public static final Integer CATEGORY_3 = 3; // 活动
	}

}
