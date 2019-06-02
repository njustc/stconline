package com.example.stc.framework.util;
import org.apache.shiro.crypto.RandomNumberGenerator;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Component;

@Component
public class SignUpHelper {
    //随机数生成器
    private String algorithmName = "md5";
    private final int hashIteration = 1024; //哈希次数

    /**
     * 注册的时候，随机产生一个salt，将密码进行加密处理。
     * toHex将变量改为其他进制
     */
    public String encryptPassword(String psw) {
        return new SimpleHash(algorithmName, psw,
                null, hashIteration).toHex();
    }

}