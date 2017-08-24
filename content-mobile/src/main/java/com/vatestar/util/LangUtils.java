package com.vatestar.util;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang.StringUtils;

import com.google.common.base.CaseFormat;
import com.google.common.collect.Lists;

/**
 * 一些基础功能.
 */
public class LangUtils {
    /**
     * 将驼峰命名的字符串变为下划线分割的形式.
     * <p>
     * e.g., "userName" ==> "user_name"
     * 
     * @param text 驼峰命名的字符串
     * @return 下划线分割的字符串.如果参数为null或者空白字符串将返回""
     */
    public static String camelToUnderscore(String text) {
        if (StringUtils.isBlank(text)) {
            return StringUtils.EMPTY;
        }
        return CaseFormat.LOWER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, text.trim());
    }

    /**
     * 将下划线分割的字符串变为驼峰命名的形式.
     * <p>
     * e.g., "user_name" ==> "userName"
     * 
     * @param text 下划线分割的字符串
     * @return 驼峰命名的字符串.如果参数为null或者空白字符串将返回""
     */
    public static String underscoreToCamel(String text) {
        if (StringUtils.isBlank(text)) {
            return StringUtils.EMPTY;
        }
        return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, text.trim());
    }

    /**
     * 获取非空字符串.
     * <p>
     * eg. null ==> "", ""==>"" ", text " ==>"text"
     * 
     * @param text
     * @return
     */
    public static String get(String text) {
        if (StringUtils.isBlank(text)) {
            return StringUtils.EMPTY;
        } else {
            return text.trim();
        }
    }

    /**
     * 获取long.
     *
     * @param lon the lon
     * @return the long
     */
    public static long get(Long lon) {
        if (lon == null) {
            return 0l;
        } else {
            return lon;
        }
    }

    /**
     * 获取int .
     *
     * @param lon the lon
     * @return the long
     */
    public static int get(Integer in) {
        if (in == null) {
            return 0;
        } else {
            return in;
        }
    }

    /**
     * 加密字符串.
     *
     * @param pwd 要加密的字符串
     * @param salt 加密使用的盐
     * @return 加密后的字符串
     */
    public static String encrypt(String pwd, String salt) {
        String pwdSha = DigestUtils.sha512Hex(pwd);
        String saltSha = DigestUtils.sha256Hex(salt);
        StringBuilder sb = new StringBuilder(salt).append(pwdSha).append(saltSha).append(pwd);
        return DigestUtils.md5Hex(DigestUtils.sha512Hex(sb.toString()));
    }

    /**
     * 加密参数.
     *
     * @param parameter 要加密的参数
     * @param encryptKey 加密的key
     * @param encryptSecret 加密的签名
     * @return the string 加密后生成的签名
     */
    public static String encryptParameter(Map<String, Object> parameter, String encryptKey, String encryptSecret) {
        List<String> keys = Lists.newArrayList(parameter.keySet());
        Collections.sort(keys);
        
        StringBuilder sb = new StringBuilder();
        int size = keys.size();
        for (int index = size - 1; index >= 0; index--) {
            String key = keys.get(index);
            sb.append(key).append("=").append(parameter.get(key));
        }
        sb.append(encryptSecret);
        return encrypt(sb.toString(), encryptKey);
    }
}
