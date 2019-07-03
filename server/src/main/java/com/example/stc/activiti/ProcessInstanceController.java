package com.example.stc.activiti;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.BaseController;
import com.example.stc.domain.ProcessEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
public class ProcessInstanceController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ProcessInstanceController.class);

    /**
     * 获取Process状态
     * @param object
     * @return
     */
    @GetMapping(path = "/process/state")
    public JSONObject queryProcessState(@RequestBody ProcessEntity object) {
        return null;
    }

    /**
     * 更新Process状态
     * @param object
     * @return
     */
    @PostMapping(path = "/process/update")
    public @ResponseBody
    ResponseEntity<?> updateProcessState(@RequestBody ProcessEntity object) {
        return null;
    }

}
