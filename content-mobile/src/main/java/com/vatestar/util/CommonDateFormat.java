package com.vatestar.util;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.NumberFormat;
import java.util.Date;
import java.util.TimeZone;

import org.codehaus.jackson.map.util.StdDateFormat;

/**
 * 时间格式化类
 */
public class CommonDateFormat extends StdDateFormat {
	/**
     * 
     */
	private static final long serialVersionUID = 1L;
	static {
		TimeZone zone = TimeZone.getDefault();
		DATE_FORMAT_RFC1123.setTimeZone(zone);
		DATE_FORMAT_ISO8601.setTimeZone(zone);
		DATE_FORMAT_ISO8601_Z.setTimeZone(zone);
		DATE_FORMAT_PLAIN.setTimeZone(zone);
	}

	public CommonDateFormat() {
		_formatRFC1123 = (DateFormat) DATE_FORMAT_RFC1123.clone();
		_formatISO8601 = (DateFormat) DATE_FORMAT_ISO8601.clone();
		_formatISO8601_z = (DateFormat) DATE_FORMAT_ISO8601_Z.clone();
		_formatPlain = (DateFormat) DATE_FORMAT_PLAIN.clone();
		setNumberFormat(NumberFormat.getInstance());
	}

	@Override
	public void setTimeZone(TimeZone zone) {
		_formatRFC1123.setTimeZone(zone);
		_formatISO8601.setTimeZone(zone);
		_formatISO8601_z.setTimeZone(zone);
		_formatPlain.setTimeZone(zone);
	}

	@Override
	public StringBuffer format(Date date, StringBuffer toAppendTo, FieldPosition fieldPosition) {
		return _formatISO8601_z.format(date, toAppendTo, fieldPosition);
	}

	@Override
	public StdDateFormat clone() {
		return this;
	}

}
