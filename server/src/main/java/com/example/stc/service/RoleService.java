package com.example.stc.service;

import com.alibaba.fastjson.JSONObject;
import com.example.stc.domain.Role;
import java.util.List;

public interface RoleService extends BaseService<Role> {
    /**
     * 查询role
     */
    List<Role> findAllRoles();

    /**
     * 删除role
     * @param roleId
     */
    public void deleteRoleById(Long roleId);
}
