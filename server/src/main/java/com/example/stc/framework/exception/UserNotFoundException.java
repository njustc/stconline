package com.example.stc.framework.exception;

public class UserNotFoundException extends RuntimeException {
    public UserNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
