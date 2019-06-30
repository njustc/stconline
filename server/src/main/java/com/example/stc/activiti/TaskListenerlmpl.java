package com.example.stc.activiti;

import org.activiti.engine.delegate.DelegateTask;
import org.activiti.engine.delegate.TaskListener;

public class TaskListenerlmpl implements TaskListener {

    @Override
    public void notify(DelegateTask delegateTask) {
        String userId = "U1097"; // 暂定，以测试
        delegateTask.setAssignee(userId);
    }
}