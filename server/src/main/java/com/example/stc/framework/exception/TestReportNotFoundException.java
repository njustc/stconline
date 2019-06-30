package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class TestReportNotFoundException extends EntityNotFoundException {

    public TestReportNotFoundException(String pid) {
        super("Could not find testReport with pid(String) = " + pid);
    }

    public TestReportNotFoundException(long id) {
        super("Could not find testReport with id(long) = " + id);
    }
}
