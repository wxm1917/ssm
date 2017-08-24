/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.dao;

import org.springframework.dao.DataAccessException;

@SuppressWarnings("serial")
public class DaoException extends DataAccessException {

	public DaoException(String msg) {
		super(msg);
	}

	public DaoException(String msg, Throwable cause) {
		super(msg, cause);
	}
}
