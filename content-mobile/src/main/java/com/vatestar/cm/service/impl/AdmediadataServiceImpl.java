package com.vatestar.cm.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;

import com.vatestar.cm.dao.AdmediaDao;
import com.vatestar.cm.dao.AdmediadataDao;
import com.vatestar.cm.dao.MediaLabelDao;
import com.vatestar.cm.entity.Admedia;
import com.vatestar.cm.entity.Admediadata;
import com.vatestar.cm.entity.MediaLabel;
import com.vatestar.cm.service.AdmediadataService;

/**
 * Created by rock on 2016/12/19.
 */
@Service
public class AdmediadataServiceImpl implements AdmediadataService {

    @Autowired
    private AdmediadataDao mediadataDao;
    @Autowired
    private AdmediaDao mediaDao;
    @Autowired
    private MediaLabelDao labelDao;
    
    @Override
    public List<MediaLabel> quarylabel(int id){
        List<MediaLabel> labels = labelDao.quarylabel(id);
        if(null!=labels){
        	for (MediaLabel label : labels ){
        		List<MediaLabel> labelsone = labelDao.quarylabel(label.getId());
        		label.setLabelList(labelsone);
        	}
        }
        return  labels;
    }

    @Override
    public void addMediadata(Admediadata mediadata) {
        mediadataDao.insertvalue(mediadata);
    }
    @Override
    public List<Admediadata> getMediadata(Integer current, Integer rowSize,int userid) {
    	List<Admediadata> mediadata = mediadataDao.quarymediadata(userid);
        return mediadata;
    }

	@Override
	public int addMedia(Admedia media) {
		int id  = mediaDao.insertvalue(media);
		return id;
	}

	@Override
	public void remedia(Admedia media) {
		mediaDao.remedia(media);
	}

	@Override
	public List<Admediadata> getMedias(String optimal, String antistop) {
		int  id = labelDao.quarylabelid("%"+antistop+"%");
		Admediadata admediadata = new Admediadata();
		admediadata.setOptimal(optimal);
		admediadata.setMedialabelone(String.valueOf(id));
		List<Admediadata>  medias= mediadataDao.quaryMedias(admediadata);
		return medias;
	}

	@Override
	public List<Admedia> getMedias(int mediaid,int userid) {
		
		Admediadata admedias = mediadataDao.quarymedialist(mediaid, userid);
		List<String> list = Arrays.asList(admedias.getMediapid().split(","));
		List<Admedia>  medias =new ArrayList<Admedia>();
		for(String id : list ){
			Admedia media =mediaDao.quarymedia(id);
			medias.add(media);
		}
		return medias;
	}

	@Override
	public List<MediaLabel> getCIBNlabel(String parid) {
		List<MediaLabel> label =  labelDao.queryCIBNlabel(parid);
		for(MediaLabel la : label){
			List<MediaLabel> labels =  labelDao.queryCIBNlabel(String.valueOf(la.getId()));
			la.setLabelList(labels);
		}
		return label;
	}

	@Override
	public List<String> getMediaLabel(int mediaid, int userid) {
		Admediadata admedias = mediadataDao.quarymedialist(mediaid, userid);
		List<String> list = Arrays.asList(admedias.getMedialabelone().split(","));
		return list;
	}

	@Override
	public List<Admedia> getQueryMedias() {
		List<Admedia> medias = mediaDao.queryMedias();
		return medias;
	}

	@Override
	public int countData(int id) {
		
		return mediadataDao.countData(id);
	}


}
