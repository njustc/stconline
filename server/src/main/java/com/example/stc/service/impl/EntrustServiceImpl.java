package com.example.stc.service.impl;

import com.example.stc.activiti.EntrustAction;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.ProjectRepository;
import com.example.stc.service.EntrustService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
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
    private AuthorityUtils authorityUtils;

    @Autowired
    private EntrustAction entrustAction;

    @Override
    public List<Entrust> findAllEntrusts() {
        return entrustRepository.findAll();
    }

    @Override
    public List<Entrust> findEntrustsByAuthority() {
        List<Entrust> allEntrusts = this.findAllEntrusts();
        if (authorityUtils.hasAuthority(Role.Customer)) {
            Iterator<Entrust> it = allEntrusts.iterator();
            while (it.hasNext()) {
                Entrust entrust = it.next();
                if (!entrust.getUser().getUsername().equals(authorityUtils.getLoginUser().getUsername()))
                    it.remove(); // 不是当前客户的委托不可见
            }
        }
        return allEntrusts;
    }

    /**
     * 对于客户，检查访问的是否是本人的委托；若不是则权限异常
     */
    private void customerAccessCheck(Entrust entrust) {
        if (authorityUtils.hasAuthority(Role.Customer)) {
            if (!entrust.getUser().getUsername().equals(authorityUtils.getLoginUser().getUsername()))
                throw new AccessDeniedException("没有查看权限，客户只能查看自己的委托");
        }
    }

    @Override
    public Entrust findEntrustById(Long id) {
        // 获取委托
        Entrust entrust = entrustRepository.findById(id)
                .orElseThrow(() -> new EntrustNotFoundException(id));

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return entrust;
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        // 获取委托
        Entrust entrust = entrustRepository.findByPid(pid);
        if (entrust == null)
            throw new EntrustNotFoundException(pid);

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return entrust;
    }

    @Override
    public void deleteEntrustById(Long id) {
        Entrust entrust = this.findEntrustById(id); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
        entrustRepository.deleteById(id);
    }

    @Override
    public void deleteEntrustByPid(String pid) {
        Entrust entrust = this.findEntrustByPid(pid); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
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
        entrust.setProcessState("Submit");
        return entrustRepository.save(entrust);
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        /**
         * TODO: 增加更新逻辑
         */
        Entrust entrust = entrustRepository.findByPid(pid);
        record.setId(entrust.getId());
        record.setPid(pid);
        record.setUser(entrust.getUser());
        record.setProcessState(entrust.getProcessState());
        record.setProcessInstanceID(entrust.getProcessInstanceID());
        return entrustRepository.save(record);
        // return entrustRepository.findByPid(pid); // .orElseThrow(() -> new EntrustNotFoundException(pid));
    }
}
