package com.example.stc.framework.exception;

public class RoleNotFoundException extends RuntimeException {
    public RoleNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
