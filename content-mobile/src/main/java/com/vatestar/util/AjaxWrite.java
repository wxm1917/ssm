package com.vatestar.util;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author zhengQiang
 * @version 1.0 创建时间：2012-6-2 Ajax回写数据
 */
public abstract class AjaxWrite {

//	public static void writeServerError(HttpServletResponse response, int errorCode) {
//		Protocol.ServerError.Builder serverError = Protocol.ServerError.newBuilder();
//		serverError.setErrorCode(errorCode);
//		serverError.setErrorDesc(App.Config.getConfig(String.valueOf(errorCode)));
//		AjaxWrite.writeOutPutStream(response, serverError.build().toByteArray());
//	}
//
//	public static void writeServerError(HttpServletResponse response, String errorCode) {
//		com.bj9iju.ydt.proto.Protocol.ServerError.Builder serverError = Protocol.ServerError.newBuilder();
//		serverError.setErrorCode(Integer.valueOf(errorCode));
//		serverError.setErrorDesc(App.Config.getConfig(String.valueOf(errorCode)));
//		AjaxWrite.writeOutPutStream(response, serverError.build().toByteArray());
//	}

	public static void writeOutPutStream(HttpServletResponse response, byte[] arg) {
		OutputStream outputStream;
		try {
			outputStream = response.getOutputStream();
			outputStream.write(arg);
			outputStream.flush();
			outputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void writeText(HttpServletResponse response, String... msg) {
		try {
			write(response, "text/html", msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void writeJson(HttpServletResponse response, String... msg) throws IOException {
		write(response, "application/json", msg);
	}

	public static void writeXml(HttpServletResponse response, String... msg) throws IOException {
		write(response, "text/xml", msg);
	}

	public static void write(HttpServletResponse response, String type, String... msg) throws IOException {
		response.setContentType(type + ";charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		for (String m : msg) {
			response.getWriter().write(m);
		}
		response.getWriter().flush();
		response.getWriter().close();
	}

	public static HttpSession getSession(HttpServletRequest request) {
		return request.getSession(true);
	}

}
