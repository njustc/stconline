package com.example.stc.framework.enums;

public enum ResponseType {
    SUCCESS(200, "success"), //成功
    BAD_REQUEST(400, "bad request"), //错误的语法
    RESOURCE_NOT_EXIST(404, "resource not found"), //资源不存在
    UNKNOWN_ERROR(500, "unknown error");


    private int status;
    private String message;

    ResponseType(int status, String message) {
        this.status = status;
        this.message = message;
    }

    public int getStatus() {
        return status;
    }

    public String getMessage() {
        return message;
    }
}
