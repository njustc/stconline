package com.example.stc.activiti;

public enum ProcessState {

    ToSubmit("ToSubmit"),
    ToReview("ToReview"),
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
