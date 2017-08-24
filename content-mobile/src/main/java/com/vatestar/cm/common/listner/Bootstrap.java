package com.vatestar.cm.common.listner;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.vatestar.util.App;

public class Bootstrap implements ServletContextListener {

	public void contextInitialized(ServletContextEvent event) {
		String profiles = event.getServletContext().getInitParameter("spring.profiles.active");
		System.setProperty("spring.profiles.active", profiles);
		new App(profiles);
		System.out.println("appConfigVar--->" + profiles);
		System.out.println("App.Config.setGlobal_path--->" + App.getGlobalPath());
	}

	public void contextDestroyed(ServletContextEvent event) {
	}

}
