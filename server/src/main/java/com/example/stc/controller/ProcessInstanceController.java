package com.example.stc.controller;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.activiti.EntrustAction;
import com.example.stc.domain.Entrust;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.hateoas.Resource;
import org.springframework.hateoas.Resources;
import org.springframework.web.bind.annotation.*;

/**
 * 流程管理相关接口
 */
@RestController
@RequestMapping(path = "/process")
public class ProcessInstanceController extends BaseController{

    @Autowired
    private EntrustController entrustController;

    @Autowired
    private EntrustAction entrustAction;

    /**
     * 更新委托流程状态
     * @param param
     * @return
     */
    @GetMapping(path = "/entrust")
    public @ResponseBody
    Resources<Resource<Entrust>> updateEntrustProcess(@RequestBody JSONObject param) {
        String operation = param.getString("operation");
        String comment = param.getString("comment");
        Entrust entrust = JSONObject.toJavaObject(param.getJSONObject("param"), Entrust.class);
        try {
            entrustAction.updateEntrustProcess(entrust, operation, comment);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return entrustController.getAllEntrust();
    }

}
