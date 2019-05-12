package com.example.stc.framework.enums;

public enum ResponseType {
    SUCCESS(200, "success"),
    RESOURCE_NOT_EXIST(404, "resource not found");

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
