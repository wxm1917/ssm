/**
 * Author:zhengQiang 2013-6-19
 */
package com.vatestar.server.common.core;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class ReflectionUtil {

	public static Object getFieldValue(Field f,Object obj) throws IllegalArgumentException, IllegalAccessException{
		f.setAccessible(true);
		return f.get(obj);
	}
	
	public static void setFieldValue(Field f,Object obj,Object value) throws IllegalArgumentException, IllegalAccessException{
		f.setAccessible(true);
		f.set(obj, value);
	}
	
	public static Object getMethodFieldValue(Field f,Object o) throws SecurityException, NoSuchMethodException, IllegalArgumentException, IllegalAccessException, InvocationTargetException{
		String stringLetter=f.getName().substring(0, 1).toUpperCase();    
		String getName="get"+stringLetter+f.getName().substring(1); 
		Method getMethod=o.getClass().getMethod(getName, new Class[]{});    
		return getMethod.invoke(o, new Object[]{});   
	}
	
}
