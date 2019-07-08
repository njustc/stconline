package com.example.stc.activiti;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.controller.BaseController;
import com.example.stc.domain.ProcessEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.net.URI;

@RestController
public class ProcessInstanceController extends BaseController {

    Logger logger = LoggerFactory.getLogger(ProcessInstanceController.class);

    @Autowired
    private ProcessService processService;

    @PostMapping(path = "/process/create")
    public @ResponseBody
    ResponseEntity<?> createProcessInstance(@RequestParam(value = "pid")String pid,
                                            @RequestParam(value = "type")String type) {
        processService.createProcessInstance(pid, type);
        return ResponseEntity.noContent().build();
    }

    /**
     * 获取Process状态
     * @param object
     * @return
     */
    @PostMapping(path = "/process/query")
    public @ResponseBody
    JSONObject queryProcessState(@RequestBody JSONObject object) {
        JSONObject obj = new JSONObject();
        obj.put("state", processService.queryProcessState(object));
        return obj;
    }

    /**
     * 更新Process状态
     * @param object
     * @return
     */
    @PostMapping(path = "/process/update")
    public @ResponseBody
    ResponseEntity<?> updateProcessState(@RequestBody JSONObject object,
                                         @RequestParam(value = "type")String type) {
        processService.updateProcessInstance(object, type);
        return ResponseEntity.noContent().build();
    }

    @PostMapping(path = "/process")
    public JSONObject queryProjectState(@RequestParam(value = "pid")String pid) {
        JSONObject object = new JSONObject();
        object.put("state", processService.queryProjectState(pid));
        return object;
    }


}
