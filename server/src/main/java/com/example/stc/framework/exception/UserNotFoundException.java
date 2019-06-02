package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class UserNotFoundException extends EntityNotFoundException {
    public UserNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
