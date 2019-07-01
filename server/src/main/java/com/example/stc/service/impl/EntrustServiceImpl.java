package com.example.stc.service.impl;

import com.example.stc.activiti.EntrustAction;
import com.example.stc.domain.Entrust;
import com.example.stc.domain.Role;
import com.example.stc.domain.User;
import com.example.stc.framework.exception.EntrustNotFoundException;
import com.example.stc.framework.util.AuthorityUtils;
import com.example.stc.framework.util.DateUtils;
import com.example.stc.repository.EntrustRepository;
import com.example.stc.repository.ProjectRepository;
import com.example.stc.repository.UserRepository;
import com.example.stc.service.EntrustService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    Logger logger = LoggerFactory.getLogger(EntrustServiceImpl.class);

    @Autowired
    private EntrustRepository entrustRepository;

    @Autowired
    private UserRepository userRepository;

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
        User curUser = authorityUtils.getLoginUser();
        logger.info("findEntrustsByAuthority: 当前登录者id = " + curUser.getUserID() +
                ", name = " + curUser.getUsername() + ", roles = " + curUser.getRoles());
        if (authorityUtils.hasAuthority(Role.Customer)) {
            logger.info("findEntrustsByAuthority: 仅查看当前客户委托");
            Iterator<Entrust> it = allEntrusts.iterator();
            while (it.hasNext()) {
                Entrust entrust = it.next();
                if (!entrust.getUser().getUsername().equals(curUser.getUsername())) {
//                    logger.info("findEntrustsByAuthority: 不可见（name = " + entrust.getUser().getUsername() + "）");
                    it.remove(); // 不是当前客户的委托不可见
                }
            }
        }
        else logger.info("findEntrustsByAuthority: 查看全部委托");
//        logger.info("findEntrustsByAuthority: 最终查询委托数：" + allEntrusts.size());
        return allEntrusts;
    }

    @Override
    public List<Entrust> findEntrustsByUser(String uid) {
        logger.info("findEntrustsByUser: 查看用户" + uid + "的全部委托");
        List<Entrust> allEntrusts =  this.findAllEntrusts();
        Iterator<Entrust> it = allEntrusts.iterator();
        while (it.hasNext()) {
            Entrust entrust = it.next();
            if (!entrust.getUser().getUserID().equals(uid))
                it.remove();
        }
        return allEntrusts;
    }

    /**
     * 对于客户，检查访问的是否是本人的委托；若不是则权限异常
     */
    private void customerAccessCheck(Entrust entrust) {
        if (authorityUtils.hasAuthority(Role.Customer)) {
            User curUser = authorityUtils.getLoginUser();
            if (!entrust.getUser().getUsername().equals(curUser.getUsername())) {
                logger.info("customerAccessCheck: 没有查看权限，客户只能查看自己的委托");
                throw new AccessDeniedException("没有查看权限，客户只能查看自己的委托");
            }
        }
    }

    @Override
    public Entrust findEntrustById(Long id) {
        // 获取委托
        Entrust entrust = entrustRepository.findById(id)
                .orElseThrow(() -> new EntrustNotFoundException(id));
        logger.info("findEntrustById: ");

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return entrust;
    }

    @Override
    public Entrust findEntrustByPid(String pid) {
        // 获取委托
        Entrust entrust = entrustRepository.findByPid(pid);
        if (entrust == null)
            throw new EntrustNotFoundException(pid);
        logger.info("findEntrustByPid: ");

        this.customerAccessCheck(entrust); // 若为客户，只能访问本人的委托

        return entrust;
    }

    @Override
    public void deleteEntrustById(Long id) {
        logger.info("deleteEntrustById: ");
        Entrust entrust = this.findEntrustById(id); // 找到应删除的委托并检查，若为客户，只能访问本人的委托
        entrustRepository.deleteById(id);
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
        entrust.setUser(authorityUtils.getLoginUser());
        //根据某一个算法增加新的id
        entrust.setPid("p" + dateUtils.dateToStr(new Date(), "yyyyMMddHHmmss"));
        entrust.setProcessState("ToSubmit");
        return entrustRepository.save(entrust);
    }

    @Override
    public Entrust updateEntrust(String pid, Entrust record) {
        logger.info("updateEntrust: ");
        /**
         * TODO: 增加更新逻辑
         */
        Entrust entrust = entrustRepository.findByPid(pid); // 找到应修改的委托并检查，若为客户，只能访问本人的委托
        record.setId(entrust.getId());
        record.setPid(pid);
        record.setUser(entrust.getUser());
        record.setProcessState(entrust.getProcessState());
        record.setProcessInstanceID(entrust.getProcessInstanceID());
        return entrustRepository.save(record);
        // return entrustRepository.findByPid(pid); // .orElseThrow(() -> new EntrustNotFoundException(pid));
    }
}
