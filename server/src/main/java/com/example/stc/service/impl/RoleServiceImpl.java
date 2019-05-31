package com.example.stc.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.example.stc.repository.RoleRepository;
import com.example.stc.repository.FunctionRepository;
import com.example.stc.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import com.example.stc.domain.*;
import com.example.stc.framework.exception.*;

import java.util.ArrayList;
import java.util.List;

public class RoleServiceImpl implements RoleService {
    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private FunctionRepository functionRepository;

    @Override
    public List<Role> findAllRoles(){
        return roleRepository.findAll();
    }

    @Override
    public void deleteRoleById(Long roleId){
        Role role = roleRepository.findById(roleId)
                .orElseThrow(() -> new RoleNotFoundException(roleId));
        roleRepository.deleteById(roleId);
    }
}
