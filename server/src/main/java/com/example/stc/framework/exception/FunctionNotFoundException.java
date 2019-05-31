package com.example.stc.framework.exception;

public class FunctionNotFoundException extends RuntimeException {
    public FunctionNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
