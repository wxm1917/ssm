package com.vatestar.cm.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by rock on 2016/12/19.
 */
public class Admediadata   implements Serializable {
    private int  id ;
    private String medianame;
    private String  filepath;
    private String mediatype;
    private String optimal;
    private String medialabelone;
    private String medialabeltwo;
    private String medialabelthree;
    private String mediapid;
    private int userid;
    private String ctime;
    private List<Admedia> admedias;

    public Admediadata() {
    }

 
    public Admediadata(int id, String medianame, String filepath, String mediatype, String optimal,
			String medialabelone, String medialabeltwo, String mediapid, int userid, String ctime,
			List<Admedia> admedias) {
		super();
		this.id = id;
		this.medianame = medianame;
		this.filepath = filepath;
		this.mediatype = mediatype;
		this.optimal = optimal;
		this.medialabelone = medialabelone;
		this.medialabeltwo = medialabeltwo;
		this.setMediapid(mediapid);
		this.userid = userid;
		this.ctime = ctime;
		this.admedias = admedias;
	}



	public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMedianame() {
        return medianame;
    }

    public void setMedianame(String medianame) {
        this.medianame = medianame;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public String getMediatype() {
        return mediatype;
    }

    public void setMediatype(String mediatype) {
        this.mediatype = mediatype;
    }

    public String getOptimal() {
        return optimal;
    }

    public void setOptimal(String optimal) {
        this.optimal = optimal;
    }

    public String getMedialabelone() {
        return medialabelone;
    }

    public void setMedialabelone(String medialabelone) {
        this.medialabelone = medialabelone;
    }

    public String getMedialabeltwo() {
        return medialabeltwo;
    }

    public void setMedialabeltwo(String medialabeltwo) {
        this.medialabeltwo = medialabeltwo;
    }



    public List<Admedia> getAdmedias() {
        return admedias;
    }

    public void setAdmedias(List<Admedia> admedias) {
        this.admedias = admedias;
    }

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public String getCtime() {
		return ctime;
	}

	public void setCtime(String ctime) {
		this.ctime = ctime;
	}


	public String getMediapid() {
		return mediapid;
	}


	public void setMediapid(String mediapid) {
		this.mediapid = mediapid;
	}


	public String getMedialabelthree() {
		return medialabelthree;
	}


	public void setMedialabelthree(String medialabelthree) {
		this.medialabelthree = medialabelthree;
	}
}
