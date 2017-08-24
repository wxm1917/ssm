/**
 * 所有runtime异常的基类
 */
package com.vatestar.server.exception;

public class AuthException extends Exception {

	private static final long serialVersionUID = 1376110424914382729L;

	public AuthException(String msg) {
		super(msg);
	}

	public AuthException(String msg, Throwable ex) {
		super(msg, ex);
	}
}
