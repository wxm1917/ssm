package com.vatestar.server.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 请求映射注解。
 */
@Target({ ElementType.METHOD, ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface RequestMapping {
	String DEFAULT_VERSION = "1.0";

	/**
	 * 请求url
	 * 
	 * @return
	 */
	String value();

	/**
	 * 请求 method
	 * 
	 * @return
	 */
	RequestMethod method() default RequestMethod.POST;

	/**
	 * 支持的服务版本
	 * 
	 * @return
	 */
	String version() default DEFAULT_VERSION;
}
