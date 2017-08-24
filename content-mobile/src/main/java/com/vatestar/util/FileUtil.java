package com.vatestar.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.Set;


/**
 * FileUtil
 */
public class FileUtil {
    protected static final Logger logger = LoggerFactory.getLogger(FileUtil.class);

    private static final Set<String> FILE_TYPE_PIC;
    private static final Set<String> FILE_TYPE_VIDEO;


    static {
        FILE_TYPE_PIC = new HashSet<>();
        FILE_TYPE_PIC.add("jpg");
        FILE_TYPE_PIC.add("jpeg");
        FILE_TYPE_PIC.add("png");
        FILE_TYPE_PIC.add("gif");
        FILE_TYPE_PIC.add("bmp");
        FILE_TYPE_PIC.add("webp");

        FILE_TYPE_VIDEO = new HashSet<>();
        FILE_TYPE_PIC.add("mp4");
        FILE_TYPE_PIC.add("wav");
        FILE_TYPE_PIC.add("avi");
        FILE_TYPE_PIC.add("rm");
        FILE_TYPE_PIC.add("mpg");
        FILE_TYPE_PIC.add("mov");
    }


    public static boolean isPic(String filename) {
        String fileType = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
        return FILE_TYPE_PIC.contains(fileType);
    }

    public static boolean isVideo(String filename) {
        String fileType = filename.substring(filename.lastIndexOf(".") + 1).toLowerCase();
        return FILE_TYPE_VIDEO.contains(fileType);
    }

    public static void main(String[] args) {
        System.out.println(isPic("a.png"));
    }
    
    /**
	 * 删除指定路径的文件
	 * 
	 * @param targetFile
	 */
	public static boolean delFile(String targetFile) throws Exception {
		return new File(targetFile).delete();
	}
	
	
	public static byte[] File2byte(String filePath)  
    {  
        byte[] buffer = null;  
        try  
        {  
            File file = new File(filePath);  
            FileInputStream fis = new FileInputStream(file);  
            ByteArrayOutputStream bos = new ByteArrayOutputStream();  
            byte[] b = new byte[1024];  
            int n;  
            while ((n = fis.read(b)) != -1)  
            {  
                bos.write(b, 0, n);  
            }  
            fis.close();  
            bos.close();  
            buffer = bos.toByteArray();  
        }  
        catch (FileNotFoundException e)  
        {  
            e.printStackTrace();  
        }  
        catch (IOException e)  
        {  
            e.printStackTrace();  
        } 
        return buffer;  
    }  
  
    public static void byte2File(byte[] buf, String filePath, String fileName)  
    {  
        BufferedOutputStream bos = null;  
        FileOutputStream fos = null;  
        File file = null;  
        try  
        {  
            File dir = new File(filePath);  
            if (!dir.exists() && dir.isDirectory())  
            {  
                dir.mkdirs();  
            }  
            file = new File(filePath + File.separator + fileName);  
            fos = new FileOutputStream(file);  
            bos = new BufferedOutputStream(fos);  
            bos.write(buf);  
        }  
        catch (Exception e)  
        {  
            e.printStackTrace();  
        }  
        finally  
        {  
            if (bos != null)  
            {  
                try  
                {  
                    bos.close();  
                }  
                catch (IOException e)  
                {  
                    e.printStackTrace();  
                }  
            }  
            if (fos != null)  
            {  
                try  
                {  
                    fos.close();  
                }  
                catch (IOException e)  
                {  
                    e.printStackTrace();  
                }  
            }  
        }  
    }  
    
 
}
