package com.example.stc.framework.util;

import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * cookie处理工具类
 * 负责添加、删除、查找
 */
@Component
public class CookieUtils {
    //默认设置cookie寿命为1个月
    private static int age = 30 * 24 * 60 * 60;
    //默认的cookie的path
    private static String path = "/";
    //默认的cookie的domain
    private static String domain = "localhost";

    /**
     * 用于添加cookie
     *
     * @param key      : cookie名称
     * @param value    : cookie 的值
     * @param age      : cookie寿命
     * @param response :返回类
     */
    public void addCookie(HttpServletResponse response, String key, String value, int age) throws UnsupportedEncodingException {
        Cookie cookie = new Cookie(key, URLEncoder.encode(value, "UTF-8"));
        cookie.setMaxAge(age);
        cookie.setPath(path);
        response.addCookie(cookie);
    }

    /**
     * 用于查找添加的cookie,依据cookie的名称，如果找不到就返回为空null
     *
     * @param name:cookie名称
     * @throws UnsupportedEncodingException
     * @return: cookie的值
     */
    public String findCookie(HttpServletRequest request, String name) throws UnsupportedEncodingException {
        String value = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie c = cookies[i];
                if (name.equals(c.getName())) {
                    value = URLDecoder.decode(c.getValue(), "utf-8");
                }
            }
        }
        return value;
    }

    /**
     * 根据cookie的名字删除cookie
     *
     * @param name     :要删除的cookie的名字
     * @param response :响应对象
     */
    public void deleteCookie(String name, HttpServletResponse response) {
        Cookie c1 = new Cookie(name, "");
        c1.setMaxAge(0);        //设置寿命为0 , cookie瞬间消失
        c1.setPath(path);
        response.addCookie(c1);
    }
}
