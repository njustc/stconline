package com.example.stc.service.impl;

import com.example.stc.repository.BaseRepository;
import com.example.stc.service.BaseService;
import org.springframework.beans.factory.annotation.Autowired;

public class BaseServiceImpl implements BaseService {

    @Autowired
    public BaseRepository baseRepository;

}
