package com.vatestar.util;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 * JsonHelper
 * <p/>
 * User: Administrator
 * Date: 2014-4-30
 * Time: 2:59 PM
 */
public class JsonHelper {
    public static GsonBuilder gsonBuilder;
    public static Gson gson;
    private static final String GSON_DATE_FORMAT = "yyyy-MM-dd HH:mm:ss";
    
    static {
        gsonBuilder = new GsonBuilder().setDateFormat(GSON_DATE_FORMAT);
        gsonBuilder.setDateFormat(GSON_DATE_FORMAT);
        gson = gsonBuilder.create();
    }

}
