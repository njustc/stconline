package com.example.stc.activiti;

public enum  ProcessState {

    TOSUBMIT("ToSubmit"),
    TOREVIEW("ToReview"),
    /**
     * TODO: 添加更多状态
     */
    ;

    private String state;

    ProcessState(String state) {
        this.state = state;
    }

    public String getState() {
        return state;
    }
}
