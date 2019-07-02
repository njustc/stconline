package com.example.stc.framework.util;

import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * session处理工具类
 * 负责添加、删除、查找
 * 还包括处理httpRequest内容的修改工作
 */
@Component
public class SessionUtils {
    /**
     * 获取request
     *
     * @return : 当前请求实体
     */
    public HttpServletRequest getRequest() {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        return requestAttributes == null ? null : requestAttributes.getRequest();
    }

    /**
     * 获取session
     *
     * @return : 当前请求对应的线程上的session
     */
    public HttpSession getSession() {
        return getRequest().getSession(false);
    }

    /**
     * 获取真实路径
     *
     * @return : 请求url
     */
    public String getRealRootPath() {
        return getRequest().getServletContext().getRealPath("/");
    }

    /**
     * 获取ip
     *
     * @return : 请求方 ip
     */
    public String getIp() {
        ServletRequestAttributes servletRequestAttributes = (ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes();
        if (servletRequestAttributes != null) {
            HttpServletRequest request = servletRequestAttributes.getRequest();
            return request.getRemoteAddr();
        }
        return null;
    }

    /**
     * 获取session中的Attribute
     *
     * @param name: session 名称, 作为键值对中的key
     * @return : value of key
     */
    public Object getSessionAttribute(String name) {
        HttpServletRequest request = getRequest();
        return request == null ? null : request.getSession().getAttribute(name);
    }

    /**
     * 设置session的Attribute
     *
     * @param name
     * @param value
     */
    public void setSessionAttribute(String name, Object value) {
        HttpServletRequest request = getRequest();
        if (request != null) {
            request.getSession().setAttribute(name, value);
        }
    }

    /**
     * 获取request中的Attribute
     *
     * @param name
     * @return
     */
    public Object getRequestAttribute(String name) {
        HttpServletRequest request = getRequest();
        return request == null ? null : request.getAttribute(name);
    }

    /**
     * 设置request的Attribute
     *
     * @param name
     * @param value
     */
    public void setRequestAttribute(String name, Object value) {
        HttpServletRequest request = getRequest();
        if (request != null) {
            request.setAttribute(name, value);
        }
    }

    /**
     * 获取上下文path
     *
     * @return
     */
    public String getContextPath() {
        return getRequest().getContextPath();
    }

    /**
     * 删除session中的Attribute
     *
     * @param name
     */
    public void removeSessionAttribute(String name) {
        getRequest().getSession().removeAttribute(name);
    }

}
