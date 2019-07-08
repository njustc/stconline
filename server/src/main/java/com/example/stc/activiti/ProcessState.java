package com.example.stc.activiti;

public enum ProcessState {

    Submit("Submit"),     //提交
    Review("Review"),     //审核
    Approve("Approve"),     //同意
    NotExist("NotExist"),
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

    public String getName(int index) {
        return (ProcessState.values()[index]).getName();
    }
}
