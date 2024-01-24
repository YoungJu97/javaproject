package com.res.vo;

public class TravelVO {
	private String contentid=null;
	public String getContentid() {
		return contentid;
	}
	public void setContentid(String contentid) {
		this.contentid = contentid;
	}
	public String getTravelimg() {
		return travelimg;
	}
	public void setTravelimg(String travelimg) {
		this.travelimg = travelimg;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	private String travelimg=null;
	private String title=null;
	private int cnt=0;
}
