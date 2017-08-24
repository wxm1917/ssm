package com.vatestar.util;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * JsonUtil
 */ 
public class JsonUtil {
    public static final ObjectMapper mapper;

    static {
        mapper = new ObjectMapper();
        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);     //反序列化是忽略未知属性
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);                 //序列化是忽略null属性
    }
}
