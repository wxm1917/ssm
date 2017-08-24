package com.vatestar.cm.entity;

import lombok.Data;

import java.sql.Date;

/**
 * Created by dyl on 16/7/26.
 */
@Data
public class TbAccount {
    private int id;
    private String company;
    private String money;
    private Date rtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
    
}
