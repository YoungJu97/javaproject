package com.res.vo;

public class ReservVO {
	private int accNum=0;
	private String accid=null;
	public String getAccid() {
		return accid;
	}

	public void setAccid(String accid) {
		this.accid = accid;
	}



	private String accTitle=null;
	private String accWriter=null;
	private String accContents=null;
	private String accDate=null;
	private String[] files=null;
	

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public int getAccNum() {
		return accNum;
	}

	public void setAccNum(int accNum) {
		this.accNum = accNum;
	}

	public String getAccTitle() {
		return accTitle;
	}

	public void setAccTitle(String accTitle) {
		this.accTitle = accTitle;
	}

	public String getAccWriter() {
		return accWriter;
	}

	public void setAccWriter(String accWriter) {
		this.accWriter = accWriter;
	}

	public String getAccContents() {
		return accContents;
	}

	public void setAccContents(String accContents) {
		this.accContents = accContents;
	}

	public String getAccDate() {
		return accDate;
	}

	public void setAccDate(String accDate) {
		this.accDate = accDate;
	}

	
	
	public void prt() {
		System.out.println(accTitle+"/"+accContents);
	}
}
