package com.example.stc.service.impl;

import com.example.stc.activiti.ProcessService;
import com.example.stc.activiti.ProcessState;
import com.example.stc.activiti.STCProcessEngine;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.framework.util.ProcessUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.EntrustService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Service;

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

    @Autowired
    private ProcessService processService;

    @Override
    public List<Entrust> findAllEntrusts() {
        return setState(entrustRepository.findAll());
    }

    @Override
    public List<Entrust> findEntrustsByAuthority() {
        User curUser = authorityUtils.getLoginUser();
        logger.info("findEntrustsByAuthority: 当前登录者uid = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
//        // 若为用户，返回该用户全部委托
//        if (authorityUtils.hasAuthority(Role.Customer)) {
//            return findEntrustsByUser(curUser.getUserID());
//        }
//        // 若为工作人员，返回待审核的全部委托
//        if (authorityUtils.hasAuthority(Role.STAFF)) {
//            return findReviewEntrusts();
//        }
//        return findAllEntrusts();
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> !processUtils.isVisible(entrust, "Entrust"));
        return allEntrusts;
    }

    @Override
    public List<Entrust> findReviewEntrusts() {
        logger.info("findSubmitEntrusts: 仅查看待审核和已审核通过的所有委托");
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> (entrust.getProcessState() != ProcessState.Review &&
                entrust.getProcessState() != ProcessState.Approve));
        return setState(allEntrusts);
    }

    @Override
    public List<Entrust> findEntrustsByUser(String uid) {
        logger.info("findEntrustsByUser: 查看用户" + uid + "的全部委托");
        List<Entrust> allEntrusts = this.findAllEntrusts();
        allEntrusts.removeIf(entrust -> !entrust.getUserId().equals(uid));
        return allEntrusts;
    }

    /**
     * 对于客户，检查访问的是否是本人的委托；若不是则权限异常
     */
    private void customerAccessCheck(Entrust entrust) {
        if (authorityUtils.hasAuthority(Role.Customer)) {
            User curUser = authorityUtils.getLoginUser();
            if (!entrust.getUserId().equals(curUser.getUserID())) {
                logger.info("customerAccessCheck: 没有查看权限，客户只能查看自己的委托");
                throw new AccessDeniedException("没有查看权限，客户只能查看自己的委托");
            }
        }
    }

    @Override
    public Entrust findEntrustById(Long id) {
        Entrust entrust = entrustRepository.findById(id)
                .orElseThrow(() -> new EntrustNotFoundException(id));
        logger.info("findEntrustById: ");

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return entrust;
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        Entrust entrust = entrustRepository.findByPid(pid);
        if (entrust == null)
            throw new EntrustNotFoundException(pid);
        logger.info("findEntrustByPid: ");

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return setState(entrust);
    }

    @Override
    public void deleteEntrustById(Long id) {
        logger.info("deleteEntrustById: ");
        Entrust entrust = this.findEntrustById(id); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
        entrustRepository.deleteById(id);           // 如果找不到就会报错
    }

    @Override
    public void deleteEntrustByPid(String pid) {
        logger.info("deleteEntrustByPid: ");
        Entrust entrust = this.findEntrustByPid(pid); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
        entrustRepository.deleteByPid(pid);
    }

    @Override
    public Entrust newEntrust(Entrust entrust) {
        logger.info("newEntrust: ");
        entrust.setUserId(authorityUtils.getLoginUser().getUserID());
        //根据某一个算法增加新的id
        entrust.setPid("p" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        entrust.setProcessState(ProcessState.Submit); // 待提交（未进入流程）
        return setState(entrustRepository.save(entrust));
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
        if (record.getProcessInstanceId().equals("")) {
            // record.setProcessState(entrust.getProcessState());
            record.setProcessInstanceId(entrust.getProcessInstanceId());
            record.setProcessState(processUtils.getProcessState(entrust.getProcessInstanceId()));
        }
        logger.info("getProcessState: new = " + record.getProcessState());
        return setState(entrustRepository.save(record));
    }

    @Override
    public void saveComment(String pid, String comment) {
        Entrust entrust = this.findEntrustByPid(pid);
        entrust.setComment(comment);
        this.updateEntrust(entrust.getPid(), entrust);
    }

    private List<Entrust> setState(List<Entrust> entrusts) {
        for (Entrust entrust: entrusts) {
            String processInstanceId = entrust.getProcessInstanceId();
            entrust.setProcessState(processUtils.getProcessState(processInstanceId));
            if (!processInstanceId.equals("")) {
                entrust.setComment(processService.getProcessComment(processInstanceId));
            }
        }
        return entrusts;
    }

    private Entrust setState(Entrust entrust) {
        String processInstanceId = entrust.getProcessInstanceId();
        entrust.setProcessState(processUtils.getProcessState(processInstanceId));
        if (!processInstanceId.equals("")) {
            entrust.setComment(processService.getProcessComment(processInstanceId));
        }
        return entrust;
    }
}
