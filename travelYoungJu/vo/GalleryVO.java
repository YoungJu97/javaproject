package com.res.vo;

public class GalleryVO {
	private String gallery_num = null;
	private String userid = null;
	private String gallery_title = null;
	private String gallery_text = null;
	private String gallery_region = null;
	private int gallery_cnt = 0;
	private int gallery_good = 0;
	private String gallery_date = null;
	private String[] files =null;
	
	public String[] getFiles() {
		return files;
	}
	public void setFiles(String[] files) {
		this.files = files;
	}
	public String getGallery_num() {
		return gallery_num;
	}
	public void setGallery_num(String gallery_num) {
		this.gallery_num = gallery_num;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getGallery_title() {
		return gallery_title;
	}
	public void setGallery_title(String gallery_title) {
		this.gallery_title = gallery_title;
	}
	public String getGallery_text() {
		return gallery_text;
	}
	public void setGallery_text(String gallery_text) {
		this.gallery_text = gallery_text;
	}
	public String getGallery_region() {
		return gallery_region;
	}
	public void setGallery_region(String gallery_region) {
		this.gallery_region = gallery_region;
	}
	public int getGallery_cnt() {
		return gallery_cnt;
	}
	public void setGallery_cnt(int gallery_cnt) {
		this.gallery_cnt = gallery_cnt;
	}
	public int getGallery_good() {
		return gallery_good;
	}
	public void setGallery_good(int gallery_good) {
		this.gallery_good = gallery_good;
	}
	public String getGallery_date() {
		return gallery_date;
	}
	public void setGallery_date(String gallery_date) {
		this.gallery_date = gallery_date;
	}
	
}
