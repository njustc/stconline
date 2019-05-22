package com.example.stc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import com.example.stc.activiti.*;

@RestController
public class ProcessInstanceController extends BaseController{
    @Autowired
    private ProcessInstanceService processInstanceService;

    //TODO:添加url接口对应流程的可视化操作

}
