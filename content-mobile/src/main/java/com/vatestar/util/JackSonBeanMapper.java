package com.vatestar.util;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

/**
 * 基于JackSon的Json与Java Object转换工具
 * 
 * @author zhengQiang
 */
public class JackSonBeanMapper {

	private static ObjectMapper m = new ObjectMapper();
	private static JsonFactory jf = new JsonFactory();

	/**
	 * 从json串转换到指定类型的Object
	 * 
	 * @param <T>
	 * @param jsonAsString
	 * @param pojoClass
	 * @return
	 * @throws JsonMappingException
	 * @throws JsonParseException
	 * @throws IOException
	 */
	public static <T> Object fromJson(String jsonAsString, Class<T> pojoClass) {
		try {
			return m.readValue(jsonAsString, pojoClass);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 从指定的文件读取Json串，并转换到指定类型的Object
	 * 
	 * @param <T>
	 * @param fr
	 * @param pojoClass
	 * @return
	 * @throws JsonParseException
	 * @throws IOException
	 */
	public static <T> Object fromJson(FileReader fr, Class<T> pojoClass) {
		try {
			return m.readValue(fr, pojoClass);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 将Object转换成Json串
	 * 
	 * @param pojo
	 * @param prettyPrint
	 *            是否使用默认打印输出格式
	 * @return
	 * @throws IOException
	 * @throws JsonMappingException
	 * @throws JsonGenerationException
	 * @throws IOException
	 */
	public static String toJson(Object pojo, boolean prettyPrint) {
		try {
			StringWriter sw = new StringWriter();
			JsonGenerator jg = jf.createJsonGenerator(sw);
			if (prettyPrint) {
				jg.useDefaultPrettyPrinter();
			}
			m.writeValue(jg, pojo);
			return sw.toString();
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 将Object转换成Json串
	 * 
	 * @param pojo
	 * @return
	 * @throws IOException
	 */
	public static String toJson(Object pojo) {
		return toJson(pojo, false);
	}

	/**
	 * 将Object转换成Json串
	 * 
	 * @param pojo
	 * @param map
	 *            在json串中加入map中的内容
	 * @return
	 * @throws IOException
	 */
	public static String toJson(Object pojo, Map<String, Object> map) {
		return toJson(pojo, map, false);
	}

	/**
	 * 将Object转换成Json串
	 * 
	 * @param pojo
	 * @param map
	 *            在json串中加入map中的内容
	 * @param prettyPrint
	 *            是否使用默认打印输出格式
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static String toJson(Object pojo, Map<String, Object> map,
			boolean prettyPrint) {
		StringWriter sw = new StringWriter();
		JsonGenerator jg;
		try {
			jg = jf.createJsonGenerator(sw);
			m.writeValue(jg, pojo);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
		String str = sw.toString();
		Map<String, Object> jsonMap = jsonToMap(str);
		Iterator<String> iter = map.keySet().iterator();
		while (iter.hasNext()) {
			String key = iter.next();
			if (key.indexOf(".") == -1) {
				jsonMap.put(key, map.get(key));
			} else {
				String[] keys = (String[]) key.split("\\.");
				Map<String, Object> tempMap = jsonMap;
				for (int i = 0; i < keys.length; i++) {
					if (i == keys.length - 1) {
						tempMap.put(keys[i], map.get(key));
					} else {
						tempMap = (Map<String, Object>) tempMap.get(keys[i]);
					}
				}
			}

		}
		if (prettyPrint) {
			jg.useDefaultPrettyPrinter();
		}
		return mapToJson(jsonMap);
	}

	/**
	 * 将json转换成Map
	 * 
	 * @param str
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, Object> jsonToMap(String str) {
		try {
			return (Map<String, Object>) m.readValue(str, Map.class);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}
	
	/**
	 * 将json转换成Map
	 * 
	 * @param str
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> jsonToStringMap(String str) {
		try {
			return (Map<String, String>) m.readValue(str, Map.class);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 将map转换成json
	 * 
	 * @param map
	 * @return
	 */
	public static String mapToJson(Map<String, Object> map) {
		try {
			return m.writeValueAsString(map);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}
	
	/**
	 * 将map转换成json
	 * 
	 * @param map
	 * @return
	 */
	public static String stringMapToJson(Map<String, String> map) {
		try {
			return m.writeValueAsString(map);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 将Object转换成Json并写入指定的文件
	 * 
	 * @param pojo
	 * @param fw
	 * @param prettyPrint
	 *            是否使用默认打印输出格式
	 */
	public static void toJson(Object pojo, FileWriter fw, boolean prettyPrint) {
		try {
			JsonGenerator jg = jf.createJsonGenerator(fw);
			if (prettyPrint) {
				jg.useDefaultPrettyPrinter();
			}
			m.writeValue(jg, pojo);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

	/**
	 * 将List转换成json
	 * 
	 * @param list
	 * @return
	 */
	public static String listToJson(List<?> list) {
		try {
			return m.writeValueAsString(list);
		} catch (IOException e) {
			throw new JackSonBeanMapperRuntimeException(e.getMessage(), e);
		}
	}

}
