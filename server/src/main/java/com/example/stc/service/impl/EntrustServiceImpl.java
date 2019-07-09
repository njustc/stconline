package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessService;
import com.example.stc.activiti.ProcessState;
import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.controller.FileUploadController;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.framework.util.FileUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.EntrustService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;

import java.io.File;
import java.util.Date;
import java.util.List;

/**
 * 委托管理
 */
@Service
public class EntrustServiceImpl implements EntrustService {

    private final Logger logger = LoggerFactory.getLogger(EntrustServiceImpl.class);

    @Autowired
    private EntrustRepository entrustRepository;

    @Autowired
    private DateUtils dateUtils;

    @Autowired
    private AuthorityUtils authorityUtils;

    @Autowired
    private ProcessUtils processUtils;

    @Override
    public List<Entrust> findAllEntrusts() {
        return entrustRepository.findAll();
    }

    @Override
    public List<Entrust> findEntrustsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findEntrustsByAuthority: 当前登录者uid = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> !processUtils.isVisible(entrust, "Entrust"));
        return allEntrusts;
    }

    @Override
    public List<Entrust> findToDoEntrustsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findToDoEntrustsByAuthority: 当前登录者uid = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> !processUtils.isTodo(entrust, "Entrust"));
        return allEntrusts;
    }

    @Override
    public List<Entrust> findEntrustsByUser(String uid) {
        logger.info("findEntrustsByUser: 查看用户" + uid + "的全部委托");
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> !entrust.getUserId().equals(uid));
        return allEntrusts;
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        logger.info("findEntrustByPid: ");
        Entrust entrust = entrustRepository.findByPid(pid);
        if (entrust == null)
            throw new EntrustNotFoundException(pid);
        return entrust;
    }

    @Override
    public void deleteEntrustByPid(String pid) {
        logger.info("deleteEntrustByPid: ");
        Entrust entrust = this.findEntrustByPid(pid); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
        // 删掉该委托的所有文件
        FileUtils.deleteAllFiles(pid);
        entrustRepository.deleteByPid(pid);
    }

    @Override
    public Entrust newEntrust(Entrust entrust) {
        logger.info("newEntrust: ");
        entrust.setUserId(authorityUtils.getLoginUser().getUserID());
        //根据某一个算法增加新的id
        String pid;
        do {
            pid = "p" + dateUtils.dateToStr(new Date(), "yyMMddHHmmssSSS");
            entrust.setPid(pid);
        } while (entrustRepository.findByPid(pid) != null);
        entrust.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        entrust.setProcessInstanceId("");
        return entrustRepository.save(entrust);
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        logger.info("updateEntrust: ");
        logger.info(record.getComment());
        Entrust entrust = entrustRepository.findByPid(pid); // 找到应修改的委托并检查，若为客户，只能访问本人的委托
        record.setId(entrust.getId());
        record.setPid(pid);
        record.setUserId(entrust.getUserId());
        logger.info("getProcessState: old = " + entrust.getProcessState());
        if (record.getProcessInstanceId() == null || record.getProcessInstanceId().equals("")) {
            // record.setProcessState(entrust.getProcessState());
            record.setProcessInstanceId(entrust.getProcessInstanceId());
            record.setProcessState(processUtils.getProcessState(entrust.getProcessInstanceId()));
        }
        logger.info("getProcessState: new = " + record.getProcessState());
        return entrustRepository.save(record);
    }
    
    @Override
    public Entrust updateProcessState(String pid, String processState, String comment) {
        Entrust entrust = this.findEntrustByPid(pid);
        entrust.setProcessState(processState);
        entrust.setComment(comment);
        return this.updateEntrust(pid, entrust);
    }
}
