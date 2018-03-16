package com.shengjia.bean;

import java.io.Serializable;

public class CaseImg implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String casename;
	private String img;
	private int id;
	private String detail;

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCasename() {
		return casename;
	}

	public void setCasename(String casename) {
		this.casename = casename;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}
