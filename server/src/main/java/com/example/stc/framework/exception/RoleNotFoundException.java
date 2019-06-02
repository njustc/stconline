package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class RoleNotFoundException extends EntityNotFoundException {
    public RoleNotFoundException(long id) {
        super("Could not find entrust with id(long) = " + id);
    }
}
