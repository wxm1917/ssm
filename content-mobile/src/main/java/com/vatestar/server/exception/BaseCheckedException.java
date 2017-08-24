/**
 * 所有checked异常的基类
 */
package com.vatestar.server.exception;

import org.springframework.core.NestedCheckedException;

@SuppressWarnings("serial")
public class BaseCheckedException extends NestedCheckedException {

	public BaseCheckedException(String msg) {
		super(msg);
	}

	public BaseCheckedException(String msg, Throwable ex) {
		super(msg, ex);
	}
}
