package com.example.stc.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.repository.RoleRepository;
import com.example.stc.repository.FunctionRepository;
import com.example.stc.service.FunctionService;
import com.example.stc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.stc.domain.*;
import com.example.stc.framework.exception.*;

import java.util.ArrayList;
import java.util.List;

public class FunctionServiceImpl implements FunctionService {
    @Autowired
    private FunctionRepository functionRepository;

    @Override
    public List<Function> findAllFunctions(){
        return functionRepository.findAll();
    }
}
