package com.example.stc.activiti;

public enum ProcessState {

    NotExist("NotExist"),
    Submit("ToSubmit"),
    Review("ToReview"),
    Approve("Approve"),
    /**
     * TODO: 添加更多状态
     */
    ;

    private String name;
    ProcessState(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
