/**
 * Author:zhengQiang 2013-6-19
 * @Description: 查询表注释类
 */
package com.vatestar.server.common.mybatis;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface TableName {
	String name();
}
