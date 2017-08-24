package com.vatestar.util;

import java.lang.reflect.Field;

/**
 * 属性值获取/设置类.
 * 
 * @param <T>
 */
public class FieldGetterAndSetter<T, V> {

	private Field field;

	/**
	 * Instantiates a new field getter and setter.
	 * 
	 * @param clazz
	 *            the clazz
	 * @param fieldName
	 *            the field name
	 */
	public FieldGetterAndSetter(Class<T> clazz, String fieldName) {
		try {
			field = clazz.getDeclaredField(fieldName);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

	public FieldGetterAndSetter(Field field) {
		this.field = field;
	}

	/**
	 * Sets the value.
	 * 
	 * @param obj
	 *            the obj
	 * @param value
	 *            the value
	 */
	public void setValue(T obj, V value) {
		boolean isAccessible = field.isAccessible();
		field.setAccessible(true);
		try {
			field.set(obj, value);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			field.setAccessible(isAccessible);
		}
	}

	/**
	 * Gets the value.
	 * 
	 * @param obj
	 *            the obj
	 * @return the value
	 */
	@SuppressWarnings("unchecked")
	public V getValue(T obj) {
		boolean isAccessible = field.isAccessible();
		field.setAccessible(true);
		try {
			return (V) field.get(obj);
		} catch (Exception e) {
			throw new RuntimeException(e);
		} finally {
			field.setAccessible(isAccessible);
		}
	}

	/**
	 * Creates the FieldGetterAndSetter.
	 * 
	 * @param <D>
	 *            the generic type
	 * @param <V>
	 *            the value type
	 * @param clazz
	 *            the clazz
	 * @param fieldName
	 *            the field name
	 * @return the field getter and setter
	 */
	public static <D, V> FieldGetterAndSetter<D, V> create(Class<D> clazz, String fieldName) {
		return new FieldGetterAndSetter<D, V>(clazz, fieldName);
	}

	/**
	 * Creates the FieldGetterAndSetter.
	 * 
	 * @param <D>
	 *            the generic type
	 * @param <V>
	 *            the value type
	 * @param field
	 *            the field
	 * @return the field getter and setter
	 */
	public static <D, V> FieldGetterAndSetter<D, V> create(Field field) {
		return new FieldGetterAndSetter<D, V>(field);
	}
}
