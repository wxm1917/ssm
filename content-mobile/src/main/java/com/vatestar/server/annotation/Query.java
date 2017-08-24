package com.vatestar.server.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface Query {
	/**
	 * 查询的sql语句
	 * 
	 * @return
	 */
	String value();

	/**
	 * 是否是更新
	 * 
	 * @return
	 */
	boolean modifying() default false;

	/**
	 * 是否是批量更新.
	 * 
	 * @return
	 */
	boolean batchModifying() default false;

}
