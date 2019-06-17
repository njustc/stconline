package com.example.stc.service.impl;

import com.example.stc.repository.FunctionRepository;
import com.example.stc.service.FunctionService;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.stc.domain.*;

import java.util.List;

public class FunctionServiceImpl implements FunctionService {
    @Autowired
    private FunctionRepository functionRepository;

    @Override
    public List<Function> findAllFunctions(){
        return functionRepository.findAll();
    }
}
