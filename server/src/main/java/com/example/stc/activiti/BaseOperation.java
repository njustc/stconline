package com.example.stc.activiti;

import org.activiti.engine.FormService;
import org.activiti.engine.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 定义了流程中的两类状态：noGate和Gate(对应该状态是否需要进行一次判定操作再继续，如待审核状态)
 * 针对于上述两种状态，定义了在该状态下的基本操作方法
 */
@Service
public class BaseOperation {
    @Autowired
    TaskService taskService;
    @Autowired
    FormService formService;

    //TODO:添加用户组，使得在操作方法下可以根据用户所在用户组的职能来判定该状态如何变化(如确认一个用户是否为工作人员，如果是可以对待审核委托作出哪些操作)

    enum noGateState {
        TobeSubmit, TobeWrite, TobeImplement, TobeSend, TobeDone, TobeFiling, Satisfaction
    }
    enum GateState {
        TobeReview, TobeConfirm, TobeApprove
    }

    //TODO:添加对应两类状态的操作方法
}
