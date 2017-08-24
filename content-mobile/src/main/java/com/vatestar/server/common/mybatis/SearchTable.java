/**
 * Author:zhengQiang 2013-6-19
 * @Description: 查询表注释类
 */
package com.vatestar.server.common.mybatis;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.vatestar.server.common.bo.DomainObject;


// 限定此annotation运行期可用
@Retention(RetentionPolicy.RUNTIME)
// 限定此annotation只能标示类型
@Target(ElementType.TYPE)
public @interface SearchTable {

	/**
	 * 数据库中表名称
	 * @return
	 */
	String tableName();

	/**
	 * 排序字段，数据库中字段名称
	 * @return
	 */
	String orderby() default "";

	/**
	 * 查询结果类型
	 * @return
	 */
	Class<? extends DomainObject> cls();
}
