package com.example.stc.service.impl;

import com.example.stc.activiti.EntrustAction;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.ProjectRepository;
import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
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

    @Autowired
    private EntrustAction entrustAction;

    @Override
    public List<Entrust> findAllEntrusts() {
        return entrustRepository.findAll();
    }

    @Override
    public List<Entrust> findEntrustsByAuthority() {
        // 获得当前登陆用户对应的对象
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        // 获取权限集
        List<GrantedAuthority> authorList = new ArrayList<>(userDetails.getAuthorities());
        // 判断是否是客户
        boolean isCustomer = false;
        for (GrantedAuthority author: authorList) {
            if (author.getAuthority().equals("ROLE_" + Role.Customer.str()))
                isCustomer = true;
        }
        List<Entrust> allEntrusts = this.findAllEntrusts();
        if (isCustomer) {
            Iterator<Entrust> it = allEntrusts.iterator();
            while (it.hasNext()) {
                Entrust entrust = it.next();
                if (!entrust.getUser().getUsername().equals(userDetails.getUsername()))
                    it.remove(); // 不是当前客户的委托不可见
            }
        }
        return allEntrusts;
    }

    @Override
    public Entrust findEntrustById(Long id) {
        return entrustRepository.findById(id)
                .orElseThrow(() -> new EntrustNotFoundException(id));
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        return entrustRepository.findByPid(pid);
    }

    @Override
    public void deleteEntrustById(Long id) {
        entrustRepository.deleteById(id);
    }

    @Override
    public void deleteEntrustByPid(String pid) {
        Entrust entrust = entrustRepository.findByPid(pid);
        entrustAction.deleteEntrustProcess(entrust);

        int n = entrustRepository.deleteByPid(pid);
        if (0 == n) {
            throw new EntrustNotFoundException("record not found");
        }
    }

    @Override
    public Entrust newEntrust(Entrust entrust) {
        //根据某一个算法增加新的id
        entrust.setPid("p" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        entrustAction.createEntrustProcess(entrust, entrust.getUser());
        return entrustRepository.save(entrust);
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        /**
         * TODO: 增加更新逻辑
         */
        return entrustRepository.findByPid(pid); // .orElseThrow(() -> new EntrustNotFoundException(pid));
    }
}
