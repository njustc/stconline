package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class TestCaseNotFoundException extends EntityNotFoundException {

    public TestCaseNotFoundException(String testId) {
        super("Could not find testCase with testId(String) = " + testId);
    }

    public TestCaseNotFoundException(long id) {
        super("Could not find testCase with id(long) = " + id);
    }
}
