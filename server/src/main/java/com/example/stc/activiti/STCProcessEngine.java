package com.example.stc.activiti;

import org.activiti.engine.FormService;
import org.activiti.engine.HistoryService;
import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.form.FormProperty;
import org.activiti.engine.form.TaskFormData;
import org.activiti.engine.history.HistoricActivityInstance;
import org.activiti.engine.history.HistoricTaskInstance;
import org.activiti.engine.history.HistoricVariableInstance;
import org.activiti.engine.runtime.ProcessInstance;
import org.activiti.engine.task.Task;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@Service
public class STCProcessEngine {
    @Autowired
    RuntimeService runtimeService;

    @Autowired
    TaskService taskService;

    @Autowired
    HistoryService historyService;

    @Autowired
    FormService formService;

    public String createProcess(String processId, Map<String, Object> variables){
        ProcessInstance pi = runtimeService.startProcessInstanceByKey(processId, variables);
        return pi.getProcessInstanceId();
    }

    /**
     * 根据具体流程实例的ID获取其在流程中的状态
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回流程实例的状态
     * // @throws Exception 获取流程实例状态失败
     */
    public String getProcessState(String processInstanceId) {
        ProcessInstance pi = runtimeService.createProcessInstanceQuery().processInstanceId(processInstanceId)
                .singleResult();
        List<HistoricActivityInstance> piHistory = historyService.createHistoricActivityInstanceQuery()
                .processInstanceId(processInstanceId).list();
        if (pi == null && !piHistory.isEmpty()) {
            return "Approve";
        } else if (pi != null) {
            List<Task> tasks = taskService.createTaskQuery().processInstanceId(processInstanceId).list();
            if (tasks.size() > 1) {
                return "ToReview";
            }
            else {
                return tasks.get(0).getName();
            }
        } else {
            return "NotExist";
        }
    }

    /**
     * 获取当前task的用户类型，若流程结束，返回nouser
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回用户任务的候选执行者
     * @throws Exception 获取当前task的用户类型为空
     */
    public String getTaskAssignee(String processInstanceId) throws Exception {
        Task task = taskService.createTaskQuery().processInstanceId(processInstanceId).singleResult();
        String S = this.getProcessState(processInstanceId);
        String user = "";
        if (S.equals("Finished")) {
            user = "NoUser";
            return user;
        }
        TaskFormData taskFormData = formService.getTaskFormData(task.getId());
        List<FormProperty> formProperties = taskFormData.getFormProperties();
        if (formProperties.isEmpty() == false) {
            for (FormProperty formProperty : formProperties) {
                if ("user".equals(formProperty.getId().toString()))
                    user = formProperty.getName();
            }
        } else
            throw new Exception("empty error");
        return user;
    }

    /**
     * 查询某个流程实例的历史活动的详细信息
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回历史任务的信息
     * @throws Exception 查询流程实例的历史活动为空
     */
    public List<String> queryHistoricTask(String processInstanceId) throws Exception {
        List<HistoricTaskInstance> hti = historyService.createHistoricTaskInstanceQuery()
                .processInstanceId(processInstanceId).orderByHistoricTaskInstanceStartTime().asc().list();
        List<String> htiList = new ArrayList<String>();
        if (hti.isEmpty() == false) {
            for (HistoricTaskInstance temp : hti) {
                htiList.add(temp.getId() + " " + temp.getAssignee() + " " + temp.getName() + " " + temp.getEndTime()
                        + '\n');
            }
            return htiList;
        } else
            throw new Exception("historicList is null");
    }

    /**
     * 获取用户意见
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回意见
     * @throws Exception 获取用户意见失败
     */
    public List<String> getComments(String processInstanceId) throws Exception {
        List<String> list = new ArrayList<String>();
        List<HistoricVariableInstance> hviList = historyService.createHistoricVariableInstanceQuery()
                .processInstanceId(processInstanceId).orderByVariableName().desc().list();
        for (HistoricVariableInstance hvi : hviList) {
            if (hvi.getVariableName().contains("comments"))
                list.add(hvi.getVariableName() + "   " + hvi.getValue());
        }
        return list;
    }

    /**
     * 获取历史任务
     * @param processInstanceId 流程实例ID
     * @return 以String形式返回历史任务的ID
     * @throws Exception 获取历史任务失败
     */
    public String getLastTask(String processInstanceId) throws Exception{
        List<HistoricTaskInstance> htiList = historyService.createHistoricTaskInstanceQuery().processInstanceId(processInstanceId)
                .orderByHistoricTaskInstanceStartTime().desc().list();
        return htiList.get(0).getName().toString();
    }

    public void deleteProcessInstance(String processInstanceId) {
        runtimeService.deleteProcessInstance(processInstanceId, "用户已取消");
    }

}
