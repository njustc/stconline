package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class UserNotFoundException extends EntityNotFoundException {

    public UserNotFoundException(long id) {
        super("Could not find user with id(long) = " + id);
    }

    public UserNotFoundException(String uid) {
        super("Could not find user with userid = " + uid);
    }
}
