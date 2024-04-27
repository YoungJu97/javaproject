package com.epl.vo;


public class PageVO {
	private int startNo; 
	private int endNo; 
	private int perPageNum=10;
	private Integer page; 
	private int totalCount; 
	private int endPage;
	private int startPage;
	private boolean prev;
	private boolean next;
	
	private String searchType;
	private String searchKeyword;
	

	public void prt() {
		System.out.println("StartNo : "+startNo);
		System.out.println("endNo : "+endNo);
		System.out.println("startPage : "+startPage);
		System.out.println("endPage : "+endPage);
	}	
	
	public int getEndNo() {
		return endNo;
	}

	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}

	private void calcPage() {
	    // 시작 번호 계산
	    startNo = (this.page - 1) * perPageNum + 1;
	    
	    // 임시 끝 페이지 계산
	    int tempEnd = (int) (Math.ceil(page / (double) this.perPageNum) * this.perPageNum);
	    
	    // 시작 페이지 계산
	    this.startPage = (tempEnd - this.perPageNum) + 1;
	    
	    // 페이지의 끝이 총 항목 수를 넘어가는지 확인하여 끝 페이지 및 끝 번호 계산
	    if (tempEnd * this.perPageNum > this.totalCount) {
	        // 페이지의 끝이 총 항목 수를 넘어갈 때
	        this.endPage = (int) Math.ceil(this.totalCount / (double) this.perPageNum);
	        if (endPage != page) {
	            // 현재 페이지가 끝 페이지가 아닐 때
	            this.endNo = startNo + this.perPageNum - 1;  
	        } else {
	            // 현재 페이지가 끝 페이지일 때
	            this.endNo = this.totalCount;
	        }
	    } else {
	        // 페이지의 끝이 총 항목 수를 넘어가지 않을 때
	        this.endPage = tempEnd;
	        this.endNo = startNo + this.perPageNum - 1;
	    }
	    
	    // 이전 페이지 및 다음 페이지의 존재 여부 설정
	    this.prev = this.startPage != 1;
	    this.next = this.endPage * this.perPageNum < this.totalCount;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcPage();
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public int getStartNo() {

		return startNo;
	}

	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
}
