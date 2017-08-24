package com.vatestar.util;
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.io.InputStream;  
import java.net.MalformedURLException;  
import java.net.URL;  
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;  
public class ImageUtil {
	
	  public static String WIDTH="width";
	  
	  public static String HEIGHT="height";
	
	 /** 
     * @param args 
     */  
    public static void main(String[] args) {  
  
          
        String imageUrl="http://i.quanminxingtan.com/577f559de7ec6b6eb54c18a5";  
        Map<String, Integer> map = getImageWidthAndHeight(imageUrl);
        System.out.println("图片高度1:"+map.get(HEIGHT));  
        System.out.println("图片宽度2:"+map.get(WIDTH));  
  
    }  
    
    
    
    public static  Map<String, Integer>  getImageWidthAndHeight(String imageUrl ){
    	
    	Map<String, Integer>  map = new HashMap<String, Integer>();
         BufferedImage image=getBufferedImage(imageUrl);  
         if (image!=null){  
             System.out.println("图片高度:"+image.getHeight());  
             System.out.println("图片宽度:"+image.getWidth());  
             map.put(WIDTH, image.getWidth());
             map.put(HEIGHT, image.getHeight());
         } else{
        	 map.put(WIDTH, 640);
             map.put(HEIGHT, 640);
         }
         return map;
    }
	
	  /** 
     *  
     * @param imgUrl 图片地址 
     * @return  
     */  
    public static BufferedImage getBufferedImage(String imgUrl) {  
        URL url = null;  
        InputStream is = null;  
        BufferedImage img = null;  
        try {  
            url = new URL(imgUrl);  
            is = url.openStream();  
            img = ImageIO.read(is);  
        } catch (MalformedURLException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        } finally {  
              
            try {  
                is.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return img;  
    }  
}
