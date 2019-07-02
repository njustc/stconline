package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class TestRecordNotFoundException extends EntityNotFoundException {

    public TestRecordNotFoundException(String testId) {
        super("Could not find testRecord with testId(String) = " + testId);
    }

    public TestRecordNotFoundException(long id) {
        super("Could not find testRecord with id(long) = " + id);
    }
}
