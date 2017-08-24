package com.vatestar.cm.service.impl;

import com.vatestar.cm.service.ImgCompositeService;
import com.vatestar.util.Im4JavaUtils;
import org.springframework.stereotype.Service;

import java.io.File;

/**
 * Created by dyl on 16/8/29.
 */
@Service
public class ImgCompositeServiceImpl implements ImgCompositeService {

    @Override
    public String watermark(String orgFile, String markFile, int wmWidth, int wmHeight, int x, int y,float opacity) {
        //读取广告图 缩放
        String mkFileType = markFile.substring(markFile.lastIndexOf("."));
        String newMkFile = markFile.substring(0,markFile.lastIndexOf("."))+"_zoom"+System.currentTimeMillis()+mkFileType;
        boolean isZoom = Im4JavaUtils.zoomImage(markFile,newMkFile,wmWidth,wmHeight);
        if(isZoom){
            String orgFileType = orgFile.substring(orgFile.lastIndexOf("."));
            String newOrgFile = orgFile.substring(0,orgFile.lastIndexOf("."))+"_rs"+System.currentTimeMillis()+orgFileType;
            try {
                opacity = (opacity*100);
                Im4JavaUtils.addWaterMark(orgFile,newMkFile,newOrgFile,(int)opacity,"northwest",x,y);
            } catch (Exception e) {
                e.printStackTrace();
            }
            File f = new File(newMkFile);
            if(f.exists())
                f.delete();
            return newOrgFile.substring(newOrgFile.indexOf("//"));
        }
        return null;
    }

    public static void main(String[] args) {
        String str = "123.jpg";
        System.out.println(str.substring(str.lastIndexOf(".")));
    }
}
