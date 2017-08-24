package com.vatestar.cm.common;

public interface Constants {
	public static final String LOGON_USER_CONTEXT = "current_logon_user";

	public static final String LOGON_USER_PERMISSION = "current_user_permission";

	public static final String FOREVER_DATE_START = "2015-01-01 00:00:00";
	public static final String FOREVER_DATE = "2099-12-30 23:59:59";

	interface PageSize {
		public static final Integer pageSize = 10;
		public static final Integer pageSize_8 = 8;
		public static final Integer pageSize_5 = 5;
		public static final Integer pageSize_36 = 36;
		public static final Integer pageSize_50 = 50;
		public static final Integer pageSize_20 = 20;
	}

}
