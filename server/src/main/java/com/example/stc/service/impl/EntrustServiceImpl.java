package com.example.stc.service.impl;

import com.example.stc.domain.Entrust;
import com.example.stc.exception.EntrustNotFoundException;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 委托管理
 */
@Service
public class EntrustServiceImpl implements EntrustService {
    @Autowired
    private EntrustRepository entrustRepository;

    @Override
    public List<Entrust> findAllEntrusts() {
        return entrustRepository.findAll();
    }

    @Override
    public Entrust findEntrustById(String pid) {
        return entrustRepository.findById(pid)
                .orElseThrow(() -> new EntrustNotFoundException(pid));
    }

    @Override
    public void deleteEntrustById(String pid) {
        entrustRepository.deleteById(pid);
    }

    @Override
    public Entrust insertEntrust(Entrust entrust) {
        //根据某一个算法增加新的id
        entrust.setPid("new id");
        entrustRepository.save(entrust);
        return entrust;
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        entrustRepository.findById(pid).orElseThrow(() -> new EntrustNotFoundException(pid));
        return entrustRepository.save(record);
    }
}
