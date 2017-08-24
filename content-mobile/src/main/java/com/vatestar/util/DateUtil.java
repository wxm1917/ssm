package com.vatestar.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;

public class DateUtil {
	/**
	 * 得到系统当前年，格式 yyyy
	 * @author hanchanghong
	 * @date 2014年10月17日 下午6:26:44
	 */
	public static String getYear() {
		String strYear = "";
		Date currentDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		strYear = formatter.format(currentDate);
		return strYear;
	}

	/**
	 * 得到系统当前年月，格式 yyyy-MM
	 * @author hanchanghong
	 * @date 2014年10月17日 下午6:26:55
	 */
	public static String getYearMonth() {
		String strYearMonth = "";
		Date currentDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		strYearMonth = formatter.format(currentDate);
		return strYearMonth;
	}

	/**
	 * 得到系统当前年月日，格式 yyyy-MM-dd
	 * @author hanchanghong
	 * @date 2014年10月17日 下午6:27:03
	 */
	public static String getDate() {
		String strCurrentDate = "";
		Date currentDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strCurrentDate = formatter.format(currentDate);
		return strCurrentDate;
	}


	/**
	 * 得到系统当前年月日小时分秒，格式 yyyy-MM-dd HH:mm:ss
	 * @author hanchanghong
	 * @date 2014年10月17日 下午6:27:30
	 */
	public static String getDateTime() {
		String strCurrentDateTime = "";
		Date currentDateTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		strCurrentDateTime = formatter.format(currentDateTime);
		return strCurrentDateTime;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前年月日，格式 yyyyMMdd
	public static String getYMD() {
		String strYMD = "";
		Date currentDateTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		strYMD = formatter.format(currentDateTime);
		return strYMD;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前年月日小时分秒，格式 yyyyMMddHHmmss
	public static String getYMDHMS() {
		String strYMDHMS = "";
		Date currentDateTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		strYMDHMS = formatter.format(currentDateTime);
		return strYMDHMS;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前年月日小时分秒毫秒，格式 yyyyMMddHHmmssSSS
	public static String getYMDHMSS() {
		String strYMDHMSS = "";
		Date currentDateTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		strYMDHMSS = formatter.format(currentDateTime);
		return strYMDHMSS;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统昨天年月日，格式 yyyyMMdd
	public static String getAgoYMD() {
		String strYYMD = "";
		String strYesterdayDateTime = getDateChange(getDate(), -1);
		String strYear = strYesterdayDateTime.substring(0, 4);
		String strMonth = strYesterdayDateTime.substring(5, 7);
		String strDay = strYesterdayDateTime.substring(8, 10);
		strYYMD = strYear + strMonth + strDay;
		return strYYMD;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统昨天年月日，格式 yyyy-MM-dd
	public static String getAgoDate() {
		String strYDate = "";
		strYDate = getDateChange(getDate(), -1);
		return strYDate;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统上个月的年月数据，格式 yyyyMM
	public static String getAgoYM() {
		String strYYM = "";
		String strYearMonth = getYearMonth();
		strYYM = getMonthChange(strYearMonth, -1);
		strYYM = strYYM.substring(0, 4) + strYYM.substring(5, 7);
		return strYYM;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统上个月的年月数据，格式 yyyy-MM
	public static String getAgoYearMonth() {
		String strYYearMonth = "";
		String strYearMonth = getYearMonth();
		strYYearMonth = getMonthChange(strYearMonth, -1);
		return strYYearMonth;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前日期是星期几，格式 "星期一"
	public static String getWeek() {
		String strCurrentWeek = "";
		Date currentWeek = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("E");
		strCurrentWeek = formatter.format(currentWeek);
		return strCurrentWeek;
	}

	// -----------------------------------------------------------------------------------
	// 得到任意输入的一个日期的星期数，格式 "星期一"
	public static String getDateToWeek(String strDate) {
		String strWeek = "";
		int iYear = Integer.parseInt(strDate.substring(0, 4));
		int iMonth = Integer.parseInt(strDate.substring(5, 7));
		int iDay = Integer.parseInt(strDate.substring(8, 10));

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, iYear);
		cal.set(Calendar.MONTH, iMonth - 1);
		cal.set(Calendar.DAY_OF_MONTH, iDay);
		Date currentDate = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("E");
		strWeek = formatter.format(currentDate);
		return strWeek;
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前日期是一年中的第几个星期
	public static String getWeekInYear() {
		String strCurrentWeekInYear = "";
		Date currentDate = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("w");
		strCurrentWeekInYear = formatter.format(currentDate);
		return strCurrentWeekInYear;
	}

	// -----------------------------------------------------------------------------------
	// 得到当前星期日的日期
	public static Calendar getWeekStar() {
		Calendar begin = Calendar.getInstance();
		int iCurrentWeek = begin.get(Calendar.DAY_OF_WEEK);
		switch (iCurrentWeek) {
		case 1:
			return begin;
		case 2:
			begin.add(Calendar.DATE, -1);
			return begin;
		case 3:
			begin.add(Calendar.DATE, -2);
			return begin;
		case 4:
			begin.add(Calendar.DATE, -3);
			return begin;
		case 5:
			begin.add(Calendar.DATE, -4);
			return begin;
		case 6:
			begin.add(Calendar.DATE, -5);
			return begin;
		case 7:
			begin.add(Calendar.DATE, -6);
			return begin;
		default:
			return begin;
		}
	}

	// -----------------------------------------------------------------------------------
	// 得到当前星期六的日期
	public static Calendar getWeekEnd() {
		Calendar end = Calendar.getInstance();
		int iCurrentWeek = end.get(Calendar.DAY_OF_WEEK);
		switch (iCurrentWeek) {
		case 1:
			end.add(Calendar.DATE, 6);
			return end;
		case 2:
			end.add(Calendar.DATE, 5);
			return end;
		case 3:
			end.add(Calendar.DATE, 4);
			return end;
		case 4:
			end.add(Calendar.DATE, 3);
			return end;
		case 5:
			end.add(Calendar.DATE, 2);
			return end;
		case 6:
			end.add(Calendar.DATE, 1);
			return end;
		case 7:
			return end;
		default:
			return end;
		}
	}

	// -----------------------------------------------------------------------------------
	// 得到系统当前星期周日到今天的日期数据
	public static LinkedList getSundayToToday() {
		String strBeginDate = "";
		String strEndDate = "";
		Calendar begin = getWeekStar();
		Date beginDate = begin.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strBeginDate = formatter.format(beginDate);

		Date currentDate = new Date();
		strEndDate = formatter.format(currentDate);
		LinkedList datelist = dateToDate(strBeginDate, strEndDate);
		return datelist;
	}

	// -----------------------------------------------------------------------------------
	// 得到当前星期的日期区间，格式 "2003-11-23 to 2003-11-29"
	public static String getWeekArea() {
		String strTargetData = "";
		String strBeginDate = "";
		String strEndDate = "";

		Calendar begin = getWeekStar();
		Calendar end = getWeekEnd();

		Date beginDate = begin.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strBeginDate = formatter.format(beginDate);
		Date endDate = end.getTime();
		strEndDate = formatter.format(endDate);
		strTargetData = strBeginDate + " to " + strEndDate;

		return strTargetData;
	}

	// -----------------------------------------------------------------------------------
	// 得到一年中的某个星期的日期区间，格式 "2003-11-23 to 2003-11-29"
	public static String getWeekArea(int iYear, String strWeekInYear) {
		String strTargetData = "";
		HashMap hashm = getAllWeekArea(iYear);
		strTargetData = (String) hashm.get(strWeekInYear);
		return strTargetData;
	}

	// -----------------------------------------------------------------------------------
	// 得到一年中从开始到当前以星期为间隔的日期区间,格式 1 "2000-01-01 to 2003-01-04"
	public static HashMap getAllWeekArea(int iYear) {
		HashMap hashm = new HashMap();
		String strTargetData = "";
		String strBeginDate = "";
		String strEndDate = "";
		String strWeekNum = "1";
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, iYear);
		cal.set(Calendar.MONTH, 0);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		Date currentDate = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strBeginDate = formatter.format(currentDate);
		int iOne = cal.get(Calendar.DAY_OF_WEEK);
		switch (iOne) {
		case 1:
			cal.add(Calendar.DATE, 6);
			break;
		case 2:
			cal.add(Calendar.DATE, 5);
			break;
		case 3:
			cal.add(Calendar.DATE, 4);
			break;
		case 4:
			cal.add(Calendar.DATE, 3);
			break;
		case 5:
			cal.add(Calendar.DATE, 2);
			break;
		case 6:
			cal.add(Calendar.DATE, 1);
			break;
		}

		currentDate = cal.getTime();
		strEndDate = formatter.format(currentDate);
		strTargetData = strBeginDate + " to " + strEndDate;
		hashm.put(strWeekNum, strTargetData);
		for (int i = 2; i <= 52; i++) {
			cal.add(Calendar.DATE, 1);
			currentDate = cal.getTime();
			strBeginDate = formatter.format(currentDate);
			cal.add(Calendar.DATE, 6);
			currentDate = cal.getTime();
			strEndDate = formatter.format(currentDate);
			strTargetData = strBeginDate + " to " + strEndDate;
			strWeekNum = String.valueOf(i);
			hashm.put(strWeekNum, strTargetData);
		}
		return hashm;
	}


	// -----------------------------------------------------------------------------------
	/**
	 * 返回两段日期之间的所有日期数据 用法举例： DateTime dateTime=new DateTime(); LinkedList
	 * datelist= dateTime.dateToDate("2001-12-12","2002-03-20");
	 * while(!datelist.isEmpty()) { datelist.getFirst();
	 * System.out.println(datelist.removeLast()); } 或 while(!datelist.isEmpty())
	 * { datelist.getFirst(); System.out.println(datelist.removeFirst()); }
	 */
	public static LinkedList dateToDate(String strBeginDate, String strEndDate) {
		if (strEndDate.compareTo(strBeginDate) < 0) {
			return null;
		}
		LinkedList datelist = new LinkedList();

		int iBeginYear = Integer.parseInt(strBeginDate.substring(0, 4));
		int iBeginMonth = Integer.parseInt(strBeginDate.substring(5, 7));
		int iBeginDay = Integer.parseInt(strBeginDate.substring(8, 10));
		int iEndYear = Integer.parseInt(strEndDate.substring(0, 4));
		int iEndMonth = Integer.parseInt(strEndDate.substring(5, 7));
		int iEndDay = Integer.parseInt(strEndDate.substring(8, 10));
		String strYear = "";
		String strMonth = "";
		String strDay = "";
		String strDate = "";
		int iMonthBeginNumber = 0;
		int iMonthEndNumber = 0;
		int iDayBeginNumber = 0;
		int iDayEndNumber = 0;
		for (int i = iBeginYear; i <= iEndYear; i++) {

			if (i == iBeginYear) {
				iMonthBeginNumber = iBeginMonth;
			}
			if (i > iBeginYear) {
				iMonthBeginNumber = 1;
			}
			if (i < iEndYear) {
				iMonthEndNumber = 12;
			}
			if (i == iEndYear) {
				iMonthEndNumber = iEndMonth;
			}

			// 统一年份内日期数据的输出开始
			if (iBeginYear == iEndYear) {
				strYear = String.valueOf(i);
				for (int j = iMonthBeginNumber; j <= iMonthEndNumber; j++) {
					if (j == iMonthBeginNumber) {
						iDayBeginNumber = iBeginDay;
					}
					if (j > iMonthBeginNumber) {
						iDayBeginNumber = 1;
					}
					// 统一年份内尾月以前的日期数据的输出开始
					if (j < iMonthEndNumber) {
						switch (j) {
						case 1:
						case 3:
						case 5:
						case 7:
						case 8:
						case 10:
						case 12:
							for (int k = iDayBeginNumber; k <= 31; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);

							}
							break;

						case 2:
							int iFebNumber = (i % 4 == 0 && i % 100 != 0)
									|| (i % 400 == 0) ? 29 : 28;
							for (int k = iDayBeginNumber; k <= iFebNumber; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);
							}
							break;

						case 4:
						case 6:
						case 9:
						case 11:
							for (int k = iDayBeginNumber; k <= 30; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);
							}
							break;
						}// switch end
					}
					// 统一年份内尾月以前的日期数据的输出结束

					// 统一年份内尾月日期数据的输出开始
					if (j == iMonthEndNumber) {
						for (int k = iDayBeginNumber; k <= iEndDay; k++) {
							if (j < 10) {
								strMonth = "0" + j;
							} else {
								strMonth = String.valueOf(j);
							}
							if (k < 10) {
								strDay = "0" + k;
							} else {
								strDay = String.valueOf(k);
							}
							strDate = strYear + "-" + strMonth + "-" + strDay;
							datelist.add(strDate);
						}
					}
					// 统一年份内尾月日期数据的输出结束

				}// for end
					// 统一年份内日期数据的输出结束
			} else {
				// 不同年份内日期数据的输出开始
				// 最后年份以前的日期数据的输出开始
				if (i < iEndYear) {
					strYear = String.valueOf(i);
					for (int j = iMonthBeginNumber; j <= iMonthEndNumber; j++) {
						if (j == iMonthBeginNumber) {
							iDayBeginNumber = iBeginDay;
						}
						if (j > iMonthBeginNumber) {
							iDayBeginNumber = 1;
						}

						switch (j) {
						case 1:
						case 3:
						case 5:
						case 7:
						case 8:
						case 10:
						case 12:
							for (int k = iDayBeginNumber; k <= 31; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);

							}
							break;

						case 2:
							int iFebNumber = (i % 4 == 0 && i % 100 != 0)
									|| (i % 400 == 0) ? 29 : 28;
							for (int k = iDayBeginNumber; k <= iFebNumber; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);

							}
							break;

						case 4:
						case 6:
						case 9:
						case 11:
							for (int k = iDayBeginNumber; k <= 30; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);

							}
							break;
						}// switch end

					}// for end

				}// if(i<iEndYear) end

				if (i == iEndYear) {
					strYear = String.valueOf(i);
					for (int j = 1; j <= iEndMonth; j++) {
						if (j < iEndMonth) {
							switch (j) {
							case 1:
							case 3:
							case 5:
							case 7:
							case 8:
							case 10:
							case 12:
								for (int k = 1; k <= 31; k++) {
									if (j < 10) {
										strMonth = "0" + j;
									} else {
										strMonth = String.valueOf(j);
									}
									if (k < 10) {
										strDay = "0" + k;
									} else {
										strDay = String.valueOf(k);
									}
									strDate = strYear + "-" + strMonth + "-"
											+ strDay;
									datelist.add(strDate);

								}
								break;

							case 2:
								int iFebNumber = (i % 4 == 0 && i % 100 != 0)
										|| (i % 400 == 0) ? 29 : 28;
								for (int k = 1; k <= iFebNumber; k++) {
									if (j < 10) {
										strMonth = "0" + j;
									} else {
										strMonth = String.valueOf(j);
									}
									if (k < 10) {
										strDay = "0" + k;
									} else {
										strDay = String.valueOf(k);
									}
									strDate = strYear + "-" + strMonth + "-"
											+ strDay;
									datelist.add(strDate);

								}
								break;

							case 4:
							case 6:
							case 9:
							case 11:
								for (int k = 1; k <= 30; k++) {
									if (j < 10) {
										strMonth = "0" + j;
									} else {
										strMonth = String.valueOf(j);
									}
									if (k < 10) {
										strDay = "0" + k;
									} else {
										strDay = String.valueOf(k);
									}
									strDate = strYear + "-" + strMonth + "-"
											+ strDay;
									datelist.add(strDate);

								}
								break;
							}// switch end
						}

						if (j == iEndMonth) {

							for (int k = 1; k <= iEndDay; k++) {
								if (j < 10) {
									strMonth = "0" + j;
								} else {
									strMonth = String.valueOf(j);
								}
								if (k < 10) {
									strDay = "0" + k;
								} else {
									strDay = String.valueOf(k);
								}
								strDate = strYear + "-" + strMonth + "-"
										+ strDay;
								datelist.add(strDate);

							}
						}

					}// for end

				}// if end
					// 不同年份内日期数据的输出结束
			}

		}// for(int i=iBeginYear;i<=iEndYear;i++) end

		return datelist;
	}// dateToDate end
		// -----------------------------------------------------------------------------------

	// 得到对比日期变化的目标日期
	// getDateChange("2003-10-15",1)="2003-10-16";
	// getDateChange("2003-10-15",-2)="2003-10-13";

	public static String getDateChange(String strCurrentDate, int iQuantity) {
		String strTarget = "";
		int iYear = Integer.parseInt(strCurrentDate.substring(0, 4));
		int iMonth = Integer.parseInt(strCurrentDate.substring(5, 7));
		int iDay = Integer.parseInt(strCurrentDate.substring(8, 10));

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, iYear);
		cal.set(Calendar.MONTH, iMonth - 1);
		cal.set(Calendar.DAY_OF_MONTH, iDay);
		cal.add(Calendar.DATE, iQuantity);
		Date currentDate = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strTarget = formatter.format(currentDate);
		return strTarget;
	}

	// -----------------------------------------------------------------------------------
	// 得到对比日期变化的目标日期
	// getDateTimeChange("2003-10-15 15:23:12",1)="2003-10-16 15:23:12";
	// getDateTimeChange("2003-10-15 15:23:12",-2)="2003-10-13 15:23:12";
	public static String getDateTimeChange(String strCurrentTime, int iQuantity) {
		String strTarget = "";
		String strHHMMSS = strCurrentTime.substring(10, 19);
		int iYear = Integer.parseInt(strCurrentTime.substring(0, 4));
		int iMonth = Integer.parseInt(strCurrentTime.substring(5, 7));
		int iDay = Integer.parseInt(strCurrentTime.substring(8, 10));

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, iYear);
		cal.set(Calendar.MONTH, iMonth - 1);
		cal.set(Calendar.DAY_OF_MONTH, iDay);
		cal.add(Calendar.DATE, iQuantity);
		Date currentDate = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		strTarget = formatter.format(currentDate);
		strTarget = strTarget + strHHMMSS;
		return strTarget;
	}

	// -----------------------------------------------------------------------------------
	// 得到对比月变化的目标年月
	// getMonthChange("2003-10",1)="2003-11";
	// getMonthChange("2003-10",-2)="2003-08";
	public static String getMonthChange(String strCurrentTime, int iQuantity) {
		String strTarget = "";
		int iYear = Integer.parseInt(strCurrentTime.substring(0, 4));
		int iMonth = Integer.parseInt(strCurrentTime.substring(5, 7));

		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, iYear);
		cal.set(Calendar.MONTH, iMonth - 1);
		cal.add(Calendar.MONTH, iQuantity);
		Date currentDate = cal.getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM");
		strTarget = formatter.format(currentDate);
		return strTarget;
	}

	// -----------------------------------------------------------------------------------
	// 得到某一月最后一天的年月日数据
	// getMonthEndDay("2003-10")="2003-10-31";
	public static String getMonthEndDay(String strYearMonth) {
		String strDay = "31";
		int iYear = Integer.parseInt(strYearMonth.substring(0, 4));
		int iMonth = Integer.parseInt(strYearMonth.substring(5, 7));

		switch (iMonth) {
		case 1:
		case 3:
		case 5:
		case 7:
		case 8:
		case 10:
		case 12:
			strDay = "31";
			break;
		case 2:
			strDay = (iYear % 4 == 0 && iYear % 100 != 0) || (iYear % 400 == 0) ? "29"
					: "28";
			break;
		case 4:
		case 6:
		case 9:
		case 11:
			strDay = "30";
			break;
		}

		String strMonthEndDay = strYearMonth + "-" + strDay;
		return strMonthEndDay;
	}

	// -----------------------------------------------------------------------------------
	/**
	 * 返回两段年月之间的所有年月数据 用法举例： DateTime dateTime=new DateTime(); LinkedList
	 * datelist= dateTime.monthToMonth("2001-12","2002-03");
	 * while(!datelist.isEmpty()) { datelist.getFirst();
	 * System.out.println(datelist.removeLast()); } 或 while(!datelist.isEmpty())
	 * { datelist.getFirst(); System.out.println(datelist.removeFirst()); }
	 */
	public static LinkedList monthToMonth(String strBeginMonth, String strEndMonth) {
		if (strEndMonth.compareTo(strBeginMonth) < 0) {
			return null;
		}
		LinkedList datelist = new LinkedList();

		int iBeginYear = Integer.parseInt(strBeginMonth.substring(0, 4));
		int iBeginMonth = Integer.parseInt(strBeginMonth.substring(5, 7));

		int iEndYear = Integer.parseInt(strEndMonth.substring(0, 4));
		int iEndMonth = Integer.parseInt(strEndMonth.substring(5, 7));

		String strYear = "";
		String strMonth = "";
		String strYearMonth = "";
		int iMonthBeginNumber = 0;
		int iMonthEndNumber = 0;

		for (int i = iBeginYear; i <= iEndYear; i++) {

			if (i == iBeginYear) {
				iMonthBeginNumber = iBeginMonth;
			}
			if (i > iBeginYear) {
				iMonthBeginNumber = 1;
			}
			if (i < iEndYear) {
				iMonthEndNumber = 12;
			}
			if (i == iEndYear) {
				iMonthEndNumber = iEndMonth;
			}

			// 统一年份内年月数据的输出开始
			if (iBeginYear == iEndYear) {
				strYear = String.valueOf(i);
				for (int j = iMonthBeginNumber; j <= iMonthEndNumber; j++) {

					if (j < 10) {
						strMonth = "0" + j;
					} else {
						strMonth = String.valueOf(j);
					}

					strYearMonth = strYear + "-" + strMonth;
					datelist.add(strYearMonth);

				}

				// 统一年份内年月数据的输出结束
			} else {
				// 不同年份内年月数据的输出开始
				if (i < iEndYear) {
					strYear = String.valueOf(i);
					for (int j = iMonthBeginNumber; j <= iMonthEndNumber; j++) {
						if (j < 10) {
							strMonth = "0" + j;
						} else {
							strMonth = String.valueOf(j);
						}
						strYearMonth = strYear + "-" + strMonth;
						datelist.add(strYearMonth);
					}

				}// if(i<iEndYear) end

				if (i == iEndYear) {
					strYear = String.valueOf(i);
					for (int j = 1; j <= iEndMonth; j++) {
						if (j < 10) {
							strMonth = "0" + j;
						} else {
							strMonth = String.valueOf(j);
						}

						strYearMonth = strYear + "-" + strMonth;
						datelist.add(strYearMonth);
					}
				}

				// 不同年份内年月数据的输出结束
			}// if end

		}// for(int i=iBeginYear;i<=iEndYear;i++) end

		return datelist;
	}
	
	/**
	 * 获取时间间隔天数
	 * @param startDate
	 * @param endDate
	 * @return
	 * @author hanchanghong
	 * @date 2014年12月5日 上午11:44:43
	 */
	public static Long getDaysBetween(String startDate, String endDate) {
        Calendar fromCalendar = Calendar.getInstance();
        fromCalendar.setTime(stringToDate(startDate));  
        fromCalendar.set(Calendar.HOUR_OF_DAY, 0);
        fromCalendar.set(Calendar.MINUTE, 0);
        fromCalendar.set(Calendar.SECOND, 0);
        fromCalendar.set(Calendar.MILLISECOND, 0);
  
        Calendar toCalendar = Calendar.getInstance();
        toCalendar.setTime(stringToDate(endDate));  
        toCalendar.set(Calendar.HOUR_OF_DAY, 0);
        toCalendar.set(Calendar.MINUTE, 0);
        toCalendar.set(Calendar.SECOND, 0);
        toCalendar.set(Calendar.MILLISECOND, 0);
  
        return (toCalendar.getTime().getTime() - fromCalendar.getTime().getTime()) / (1000 * 60 * 60 * 24);  
    }  
	/**
	 * 字符串专日期
	 * @param dateStr
	 * @return
	 * @author hanchanghong
	 * @date 2014年12月5日 上午11:45:09
	 */
	public static Date stringToDate(String dateStr){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date=null;
	    try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			e.printStackTrace();
		}  
	    return date;
	}
	public static void main(String[] args) {
		Long datelist = DateUtil.getDaysBetween("2002-12-12", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		System.out.println(datelist);
		
	}
}
