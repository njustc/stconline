package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Contract;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ContractAction {

    private static final String REVIEW = "reviewContractResult";
    private static final String COMMENT = "reviewContractComment";

    @Autowired
    private STCProcessEngine stcProcessEngine;

    @Autowired
    private TaskService taskService;

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 根据JSON数据创建Process
     * @param param
     * @param user
     */
    public void createContractProcess(JSONObject param, User user) {
        Contract contract = JSONObject.toJavaObject(param, Contract.class);
        createContractProcess(contract, user);
    }

    /**
     * 根据Contract实体创建Process
     * @param contract
     * @param user
     */
    public String createContractProcess(Contract contract, User user) {
        Map<String, Object> variable = new HashMap<String, Object>();
        variable.put("ContractID", contract.getPid());
        variable.put("ClientID", user.getUserID());

        contract.setProcessInstanceId(stcProcessEngine.createProcess("Contract", variable));
        // contract.setProcessState(ProcessState.ToReview);
        return contract.getProcessInstanceId();
    }

    /**
     * 提交Contract流程
     * @param contract
     */
    public void submitContractProcess(Contract contract) {
        if (!authorityUtils.hasAuthority(Role.SalesStaff)) {
            return;
        }

        String processInstanceId = contract.getProcessInstanceId();
        Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
        taskService.setAssignee(task.getId(), authorityUtils.getLoginUser().getUserID());
        taskService.complete(task.getId());
    }

    /**
     * 评审Contract流程
     * @param contract
     * @param operation
     * @param comment
     */
    public void reviewContractProcess(Contract contract, String operation, String comment) {
        String processInstanceId = contract.getProcessInstanceId();
        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        for (Task task: tasks) {
            Role role;
            switch (task.getName()) {
                case "MMReviewContract": role = Role.SalesManager; break;
                case "QMReviewContract": role = Role.QualityManager; break;
                case "CusReviewContract": role = Role.Customer; break;
                default: return;
            }
            if (!authorityUtils.hasAuthority(role)) {
                continue;
            }

            Map<String, Object> value = new HashMap<>();
            value.put(REVIEW, operation);
            if (!comment.equals("")) {
                value.put(COMMENT, comment);
                contract.setComment(comment);
            }

            if (operation.equals("ReviewDisprove")) {
                /** 异常处理 */
                System.out.println("异常处理");
                for (Task task1: tasks) {
                    if (task1 != task) {
                        taskService.complete(task1.getId(), value);
                    }
                }
            }

            User currentUser = authorityUtils.getLoginUser();
            taskService.setAssignee(task.getId(), currentUser.getUserID());
            taskService.complete(task.getId(), value);
        }
    }

    /**
     * 删除合同流程
     * @param contract
     */
    public void deleteContractProcess(Contract contract) {
        String processInstanceId = contract.getProcessInstanceId();
        if (!processInstanceId.equals(""))
            stcProcessEngine.deleteProcessInstance(processInstanceId);
    }

}
