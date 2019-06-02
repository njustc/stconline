package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class FunctionNotFoundException extends EntityNotFoundException {
    public FunctionNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
