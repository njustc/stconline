package com.example.stc.activiti;

public enum ProcessState {

    Submit("Submit"),
    Review("Review"),
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
