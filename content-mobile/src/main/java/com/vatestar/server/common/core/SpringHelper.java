/**
 * spring bean工厂
 */
package com.vatestar.server.common.core;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class SpringHelper implements ApplicationContextAware {

	public static ApplicationContext context;

	public void setApplicationContext(ApplicationContext appcontext) throws BeansException {
		SpringHelper.context = appcontext;
	}

	/**
	 * 通过制定的名称获得Bean对象
	 * 
	 * @param name
	 */
	public synchronized static Object getBean(String name) {
		if (context == null) {
			initApplicationContext();
		}
		return context.getBean(name);
	}

	public synchronized static void initWeb(ServletContext sc) {
		context = WebApplicationContextUtils.getWebApplicationContext(sc);
	}

	/**
	 * 通过class类型获得Bean对象
	 * 
	 * @param clazz
	 */
	public static Object getBean(Class<?> clzz) {
		return getBean(clzz.getName());
	}

	/**
	 * 手动初始化spring方法
	 */
	public static void initApplicationContext() {
		if (context == null) {
			// context = new ClassPathXmlApplicationContext("classpath*:**//applicationContext*.xml");
			// context = new ClassPathXmlApplicationContext("classpath*:config/applicationContext.xml");
			context = new ClassPathXmlApplicationContext("classpath:config/application.xml");
			// context = new ClassPathXmlApplicationContext(new
			// String[]{"classpath:config/application.xml","classpath:config/application-config.xml"});

		}
	}

}