package com.vatestar.cm.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by rock on 2016/12/19.
 */
public class MediaLabel  implements Serializable {
    private int id;
    private String labelname;
    private int parentid;
    private List<MediaLabel> labelList;

    public MediaLabel() {
    }

    public MediaLabel(int id, String labelname, int parentid, List<MediaLabel> labelList) {
        this.id = id;
        this.labelname = labelname;
        this.parentid = parentid;
        this.labelList = labelList;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLabelname() {
        return labelname;
    }

    public void setLabelname(String labelname) {
        this.labelname = labelname;
    }

    public int getParentid() {
        return parentid;
    }

    public void setParentid(int parentid) {
        this.parentid = parentid;
    }

    public List<MediaLabel> getLabelList() {
        return labelList;
    }

    public void setLabelList(List<MediaLabel> labelList) {
        this.labelList = labelList;
    }
}
