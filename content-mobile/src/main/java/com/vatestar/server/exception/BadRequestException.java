package com.vatestar.server.exception;

/**
 * 错误请求异常
 */
public class BadRequestException extends Exception {
    private static final long serialVersionUID = -2020680591781304391L;

    public BadRequestException(String msg) {
        super(msg);
    }

}
