package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.stc.domain.*;
/**
 * 流程实例类
 * 包含流程操作的各种接口
 */

@Service
public class ProcessInstanceService {
    @Autowired
    private TCProcessEngine TCProcessEngine;

    /**
     * 开启一个委托实例
     * @param params json对象
     * @param user 创建实例的用户
     * @return 以String形式返回流程实例的ID
     * @throws Exception 创建委托实例失败
     */
    public String createEntrustProcess(JSONObject params, User user)throws Exception
    {
        Entrust entrust = JSONObject.toJavaObject(params, Entrust.class);
        return TCProcessEngine.createEntrustProcess(entrust.getId(), user.getId());
    }
}
