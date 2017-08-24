package com.vatestar.util;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import java.util.HashMap;
import java.util.Map;

public class EmailUtil {
	public static void sendHtmlEmail(String msg, String subject, Map<String,String> to){
		HtmlEmail email = new HtmlEmail();
		email.setHostName("smtp.163.com");
		email.setAuthenticator(new DefaultAuthenticator("expaikeji@163.com","expai2014"));
		try {
			email.setCharset("UTF-8");
			email.setFrom("expaikeji@163.com", "广告后台");
			for (String key : to.keySet()) {
				email.addTo(key, to.get(key));
			}
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	
	}
	
	public static void main(String[] args) {
		String msg="网易鼓励企业用户在遵守互联网标准的前提下";
		String subject = "在linux上用apache james架设邮件服务器";
		Map<String,String> to = new HashMap<String, String>();
		to.put("yuanguangming@expai.com", "袁光明");
		to.put("ygm_java@126.com", "灵犀网");
		to.put("ygm_java@163.com", "无聊");
		HtmlEmail email = new HtmlEmail();
		email.setHostName("mail.lingximall.cn");
		email.setAuthenticator(new DefaultAuthenticator("server@lingximall.cn","lingxi_mail"));
		try {
			email.setCharset("UTF-8");
			email.setFrom("server@lingximall.cn", "灵犀网");
			for (String key : to.keySet()) {
				email.addTo(key, to.get(key));
			}
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
		}
	
	}
}
