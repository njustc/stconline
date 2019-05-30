package com.example.stc.service;

import com.example.stc.domain.Function;
import java.util.List;

public interface FunctionService extends BaseService<Function>{
    /**
     * 获取所有权限列表
     * @return
     */
    public List<Function> findAllFunctions();
}
