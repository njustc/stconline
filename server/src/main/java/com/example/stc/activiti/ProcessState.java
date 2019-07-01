package com.example.stc.activiti;

public enum ProcessState {

    Submit("ToSubmit"),     //提交
    Review("ToReview"),     //审核
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
}
