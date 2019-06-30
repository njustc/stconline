package com.example.stc.framework.exception;

import javax.persistence.EntityNotFoundException;

public class TestPlanNotFoundException extends EntityNotFoundException {

    public TestPlanNotFoundException(String pid) {
        super("Could not find testPlan with pid(String) = " + pid);
    }

    public TestPlanNotFoundException(long id) {
        super("Could not find testPlan with id(long) = " + id);
    }
}
