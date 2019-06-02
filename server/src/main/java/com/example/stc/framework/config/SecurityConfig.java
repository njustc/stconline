package com.example.stc.framework.config;

import com.example.stc.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 自定义WebSecurityConfigurerAdapter统一拦截请求
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    // 配置PasswordEncoder; BCryptPasswordEncoder是security提供的PasswordEncorder的一个实现类
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /**
     * 1）HttpSecurity支持cors。
     * 2）默认会启用CRSF，此处因为没有使用thymeleaf模板（会自动注入_csrf参数），要先禁用csrf，否则登录时需要_csrf参数，而导致登录失败。
     * 3）antMatchers：匹配 "/api/register" ,"/api/login" 路径，不需要权限即可访问，匹配 "/api/projects" 及其以下所有路径，都需要 "USER" 权限
     *    其中/api/register和/api/login，Get注册/登录界面用于debug，Post注册/登录信息
     * 4）配置登录地址和退出地址
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .cors()
                .and()

                .formLogin() // 转到的登录界面信息(若注释掉下行，则使用Spring默认登录界面)
                //.loginPage("/login") // 自己的登录界面
                .defaultSuccessUrl("/api/projects")

                // 使用Spring默认登出URL: http://localhost:8080/logout(http://localhost:8080/login?logout)

                .and()
                .authorizeRequests() // 定义需要保护和不需要保护的URL
                .antMatchers("/register", "/api/register", "/login", "/api/login").permitAll()
                .antMatchers("/api/projects/**").hasRole("USER")
                .anyRequest().authenticated() // 任何请求,登录后可以访问

                .and().csrf().disable();
    }

}
