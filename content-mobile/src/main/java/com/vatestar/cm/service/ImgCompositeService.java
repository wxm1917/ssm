package com.vatestar.cm.service;

/**
 * Created by dyl on 16/8/29.
 */
public interface ImgCompositeService {
    /**
     * 打水印
     * @param orgFile  原图地址
     * @param markFile 广告图地址
     * @param wmWidth 广告图宽度
     * @param wmHeight 广告图高度
     * @param x  坐标
     * @param y
     * @return
     */
    public String watermark(String orgFile,String markFile,int wmWidth,int wmHeight,int x,int y,float opacity);

}
