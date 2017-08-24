package com.vatestar.cm.entity;

import java.io.Serializable;

/**
 * Created by rock on 2016/12/19.
 */
public class Admedia  implements Serializable {

    /**
	 * 
	 */
	private static final long serialVersionUID = -3579182090181128963L;
	private int id;
    private String mediasname;
    private String whight;
    private String hight;
    private String ptype;

    public Admedia() {
    }

    public Admedia(int id, String mediasname, String whight, String hight, String ptype) {
        this.id = id;
        this.mediasname = mediasname;
        this.whight = whight;
        this.hight = hight;
        this.ptype = ptype;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMediasname() {
        return mediasname;
    }

    public void setMediasname(String mediasname) {
        this.mediasname = mediasname;
    }

    public String getWhight() {
        return whight;
    }

    public void setWhight(String whight) {
        this.whight = whight;
    }

    public String getHight() {
        return hight;
    }

    public void setHight(String hight) {
        this.hight = hight;
    }

    public String getPtype() {
        return ptype;
    }

    public void setPtype(String ptype) {
        this.ptype = ptype;
    }
}
