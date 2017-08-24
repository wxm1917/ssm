package com.vatestar.util;

import java.util.Random;

public class RandomUtil {
	private static Random r = new Random();
	/**
	 * 获取指定长度的随机小写字符串
	 *
	 * @param len
	 * @return
	 */
	public static String randLowerStr(int len) {
		StringBuffer randStr = new StringBuffer();
		if (len > 0) {
			for (int i = 0; i < len; i++) {
				randStr.append((char) (nextInt('a','z')));
			}
		}
		return randStr.toString();
	}

	/**
	 * 获取指定长度的随机数字字符串
	 *
	 * @param len
	 * @return
	 */
	public static String randNumberStr(int len) {
		if (len <= 0) {
			return "";
		}

		StringBuffer randStr = new StringBuffer();
		randStr.append(nextInt(1, 10));
		while (randStr.length() < len) {
			randStr.append(nextInt(0, 10));
		}

		return randStr.toString();
	}
	
	public static float nextFloat(float minFloat, float maxFloat) {
		if (minFloat >= maxFloat) {
			return minFloat;
		}
		float result = 0;
		result = minFloat + (maxFloat - minFloat) * r.nextFloat();

		return result;

	}


	public static int nextInt(int minInt, int maxInt) {
		if (minInt >= maxInt) {
			return minInt;
		}
		int result = 0;
		result = minInt + r.nextInt(maxInt - minInt);

		return result;
	}
	
	 public static void main( String[] args ){
	        Random ra =new Random();
	     
	            //System.out.println((int)(1+Math.random()*5));
	            int[] array = randomCommon( 1 , 15 , 14 );
	            for( int i = 0 ; i < array.length;i++ ){
	                System.out.println( array[ i ] );
	            }
	    }
	    /** 
	     * 随机指定范围内N个不重复的数 
	     * 最简单最基本的方法 
	     * @param min 指定范围最小值 
	     * @param max 指定范围最大值 
	     * @param n 随机数个数 
	     */ 
	    public static int[] randomCommon(int min, int max, int n){  
	        min = 0;
	        if (n > (max - min + 1) || max < min) {  
	               return null;  
	           }  
	        int[] result = new int[n];  
	        int count = 0;  
	        while(count < n) {  
	            int num = (int) (Math.random() * (max - min)) + min;  
	            boolean flag = true;  
	            for (int j = 0; j < n; j++) {  
	                if(num == result[j]){  
	                    flag = false;  
	                    break;  
	                }  
	            }  
	            if(flag){  
	                result[count] = num;  
	                count++;  
	            }  
	        }  
	        return result;  
	    } 
	
}
