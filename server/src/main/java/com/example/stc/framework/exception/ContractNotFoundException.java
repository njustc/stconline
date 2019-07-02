package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class ContractNotFoundException extends EntityNotFoundException {
    public ContractNotFoundException(String pid) {
        super("Could not find contract with pid(String) = " + pid);
    }

    public ContractNotFoundException(long id) {
        super("Could not find contract with id(long) = " + id);
    }
}
