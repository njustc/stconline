package com.example.stc.service.impl;

import com.example.stc.domain.Entrust;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.ProjectRepository;
import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 委托管理
 */
@Service
public class EntrustServiceImpl implements EntrustService {
    @Autowired
    private EntrustRepository entrustRepository;

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private DateUtils dateUtils;

    @Override
    public List<Entrust> findAllEntrusts() {
        return entrustRepository.findAll();
    }

    @Override
    public Entrust findEntrustById(String id) {
        return entrustRepository.findById(id)
                .orElseThrow(() -> new EntrustNotFoundException(id));
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        return entrustRepository.findByPid(pid);
    }

    @Override
    public void deleteEntrustById(String id) {
        entrustRepository.deleteById(id);
    }

    @Override
    public void deleteEntrustByPid(String pid) { entrustRepository.deleteByPid(pid); }

    @Override
    public Entrust newEntrust(Entrust entrust) {
        //根据某一个算法增加新的id
        entrust.setPid(dateUtils.dateToStr(new Date(),"yyyyMMddHHmmss"));
        return entrustRepository.save(entrust);
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        return entrustRepository.findById(pid).orElseThrow(() -> new EntrustNotFoundException(pid));
    }
}
