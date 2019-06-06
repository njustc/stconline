package com.example.stc.framework.exception;

/**
 * Http请求的参数有误
 */
public class ParamMissingException extends RuntimeException {
    public ParamMissingException() {
        super("request param not complete!");
    }
}
