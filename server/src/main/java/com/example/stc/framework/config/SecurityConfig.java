package com.example.stc.framework.config;

import com.example.stc.domain.Role;
import com.example.stc.service.impl.UserDetailsServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

/**
 * 自定义WebSecurityConfigurerAdapter统一拦截请求
 */
@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Bean("authenticationManager")
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Autowired
    private CustomAuthenticationProvider authProvider;

    // 配置PasswordEncoder; BCryptPasswordEncoder是security提供的PasswordEncorder的一个实现类
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    /**
     * 1）HttpSecurity支持cors。
     * 2）默认会启用CRSF，此处因为没有使用thymeleaf模板（会自动注入_csrf参数），要先禁用csrf，否则登录时需要_csrf参数，而导致登录失败。
     * 3）antMatchers：匹配 "/api/register" ,"/api/login" 路径，不需要权限即可访问，匹配 "/api/projects" 及其以下所有路径，都需要 "USER" 权限;
     * 不同的权限可以访问不同的api也通过此控制
     * 4）配置登录成功自动跳转地址
     */
    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http
                .exceptionHandling().authenticationEntryPoint(new RestAuthenticationEntryPoint())
                .and()
                .cors()
                .and()
                .formLogin() // 转到的登录界面信息(若注释掉下行，则使用Spring默认登录界面)
                .defaultSuccessUrl("/api/project/entrust")
                .and()
                .authorizeRequests() // 定义需要保护和不需要保护的URL
                .antMatchers("/*", "*", "/").permitAll()
                .antMatchers("/api/register/**", "/api/login").permitAll()
                .antMatchers("/api/project/**").hasRole(Role.USER.str())
                // TODO: 其他针对角色拦截的URL
                .anyRequest().authenticated() // 任何请求,登录后可以访问
                .and().csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authProvider);
    }
}
