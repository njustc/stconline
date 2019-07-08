package com.example.stc.activiti;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.ProcessEntity;
import com.example.stc.domain.User;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.service.EntrustService;
import org.activiti.engine.*;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class STCProcessEngine {

    private final Logger logger = LoggerFactory.getLogger(STCProcessEngine.class);

    private static final String REVIEW = "ReviewResult";
    private static final String COMMENT = "ReviewComment";

    @Autowired
    private RuntimeService runtimeService;

    @Autowired
    private TaskService taskService;

    @Autowired
    private HistoryService historyService;

    @Autowired
    private FormService formService;

    @Autowired
    private ProcessUtils processUtils;

    @Autowired
    private AuthorityUtils authorityUtils;

    /**
     * 创建流程实例
     * @param processId
     * @param variables
     * @return
     */
    public String createProcess(String processId, Map<String, Object> variables){
        ProcessInstance pi = runtimeService.startProcessInstanceByKey(processId, variables);
        return pi.getProcessInstanceId();
    }

    /**
     * 更新流程实例
     * @param entity
     */
    public void updateProcess(ProcessEntity entity) {
        User user = authorityUtils.getLoginUser();
        String processInstanceId = entity.getProcessInstanceId();
        String processState = processUtils.getProcessState(processInstanceId);
        List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
        boolean completeTask = false;
        for (Task task : tasks) {
            /** 检查用户权限是否对应，流程状态是否对应 */
            if (!(processUtils.checkUser(task, user.getUserID()) && processUtils.checkTask(processInstanceId, processState))) {
                continue;
            }

            if (task.getAssignee() != null) {
                /** 候选组，未指定执行者，在此处执行 */
                taskService.claim(task.getId(), user.getUserID());
            }

            if (processState.equals("Review")) {
                /** 评审流程，需要从数据中取出operation和comment */
                JSONObject object = (JSONObject) JSON.toJSON(entity);
                String operation = object.getString("operation");
                String comment = object.getString("comment");
                Map<String, Object> value = new HashMap<>();
                value.put(REVIEW, operation);
                value.put(COMMENT, comment);
                taskService.complete(task.getId(), value);

                /** 并行任务恢复 */
                if (operation.equals("ReviewDisprove") && (tasks.size() > 1)) {
                    for (Task task1 : tasks) {
                        if (task1 != task) {
                            /** 强行结束流程 */
                            taskService.complete(task1.getId(), value);
                        }
                    }
                }
            }
            else {
                /** 其他流程，直接完成即可 */
                taskService.complete(task.getId());
            }

            completeTask = true;
            break;
        }

        if (!completeTask) {
            throw new ActivitiException("流程调用错误，当前用户对当前流程没有任何合法操作。");
        }
    }

    /**
     * 根据具体流程实例的ID获取其在流程中的状态
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回流程实例的状态
     * // @throws Exception 获取流程实例状态失败
     */
    public String getProcessState(String processInstanceId) {
        return processUtils.getProcessState(processInstanceId);
    }

    /**
     * 删除流程实例
     * @param processInstanceId
     */
    public void deleteProcessInstance(String processInstanceId) {
        runtimeService.deleteProcessInstance(processInstanceId, "用户已取消");
    }

    /**
     * 获取评论意见
     * @param processInstanceId
     * @return
     */
    public String getComment(String processInstanceId) {
        String comment = "";
        List<HistoricVariableInstance> historicVariableInstances = historyService.createHistoricVariableInstanceQuery()
                .processInstanceId(processInstanceId).orderByVariableName().desc().list();
        for (HistoricVariableInstance historicVariableInstance: historicVariableInstances) {
            // logger.info("HistoryVariable: " + historicVariableInstance.getVariableName() + " " + historicVariableInstance.getValue());
            if (historicVariableInstance.getVariableName().contains("Comment")) {
                comment = (String)historicVariableInstance.getValue();
            }
        }
        return comment;
    }

}
