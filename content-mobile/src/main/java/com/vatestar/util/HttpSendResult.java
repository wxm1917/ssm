package com.vatestar.util;


public class HttpSendResult {
    private int statusCode;
    private String response;
    private Exception exception;

    public int getStatusCode() {
        return statusCode;
    }

    public void setStatusCode(int statusCode) {
        this.statusCode = statusCode;
    }

    public String getResponse() {
        return response;
    }

    public void setResponse(String response) {
        this.response = response;
    }

    public Exception getException() {
        return exception;
    }

    public void setException(Exception exception) {
        this.exception = exception;
    }

    public boolean isSuccess() {
        return statusCode == 200;
    }

    public String toString() {
        if (exception != null) {
            return "RZ:ERROR " + exception.getMessage();
        } else if (statusCode == 200) {
            return "RZ:200, response:" + response;
        } else {
            return "RZ:" + statusCode;
        }
    }
}
