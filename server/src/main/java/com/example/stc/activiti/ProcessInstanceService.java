package com.example.stc.activiti;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


/**
 * 流程实例类
 * 包含流程操作的各种接口
 */

@Service
public class ProcessInstanceService {
    @Autowired
    private TCProcessEngine TCProcessEngine;
}
