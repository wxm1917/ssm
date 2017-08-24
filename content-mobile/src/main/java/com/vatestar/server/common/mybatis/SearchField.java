/**
 * Author:zhengQiang 2013-6-19
 * @Description: 查询条件注释类
 */
package com.vatestar.server.common.mybatis;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.vatestar.server.common.mybatis.Connector;
import com.vatestar.server.common.mybatis.DateFormat;



// 限定此annotation运行期可用
@Retention(RetentionPolicy.RUNTIME)
// 限定此annotation只能标示属性
@Target(ElementType.FIELD)
public @interface SearchField {

	/**
	 * 查询条件，数据库中字段名
	 * @return
	 */
	String column() default "";

	/**
	 * 连接符，查询条件的连接符号，取值范围Connector类
	 * @return
	 */
	Connector connector() default Connector.EQUAL;

	/**
	 * 日期格式，针对日期类型查询条件的格式化，取值范围DateFormat类
	 * @return
	 */
	DateFormat format() default DateFormat.DATE;
}