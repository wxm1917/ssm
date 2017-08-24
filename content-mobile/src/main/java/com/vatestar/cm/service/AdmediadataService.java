package com.vatestar.cm.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.vatestar.cm.entity.Admedia;
import com.vatestar.cm.entity.Admediadata;
import com.vatestar.cm.entity.MediaLabel;

/**
 * Created by rock on 2016/12/19.
 */
public interface AdmediadataService {

	/**
	 * 插入一条Admediadata
	 * @param mediadata
	 */
    public void addMediadata(Admediadata mediadata);
    /**
     * 插入一条Admedia
     * @param media
     * @return
     */
    public int addMedia(Admedia media);
    /**
     * 删除一条Admedia
     * @param media
     */
    public void remedia(Admedia media);
    /**
     * 获取用户所有媒体数据
     * @param id
     * @return
     */
    public List<Admediadata> getMediadata(Integer current, Integer rowSize,int userid);
    /**
     * 媒体数据条数
     * @param id
     * @return
     */
    public int countData(int id);
    /**
     * 根据优化目标和标签获得媒体数据
     * @param optimal
     * @param antistop
     * @return
     */
    public List<Admediadata>  getMedias(String optimal,String antistop );
    /**
     * 根据父id查询子标签
     * @param id
     * @return
     */
    public List<MediaLabel> quarylabel(int id);
     /**
      * 获取媒体所对应的资源
      * @param mediaid
      * @return
      */
    public List<Admedia> getMedias(int mediaid,int userid);
    /**
     * 获取CIBN的标签
     * @param mediaid
     * @param userid
     * @return
     */
    public List<MediaLabel> getCIBNlabel(String parid);
    /**
     * 获取媒体所对应的标签
     * @param mediaid
     * @param userid
     * @return
     */
    public List<String> getMediaLabel(int mediaid,int userid);
    /**
     * 获得所有媒体
     * @return
     */
    public List<Admedia> getQueryMedias();
   
}
