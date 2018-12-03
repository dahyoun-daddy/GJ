package com.sist.gj.vo;

public class SearchVO {
	private int pageSize;
	private int pageNum;
	private String searchWord;
	private String searchDiv;
	
	public SearchVO() {}
	
	public SearchVO(int pageSize, int pageNum, String searchWord, String searchDiv) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.searchWord = searchWord;
		this.searchDiv = searchDiv;
	}
	@Override
	public String toString() {
		return "SearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", searchWord=" + searchWord + ", searchDiv="
				+ searchDiv + "]";
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getSearchDiv() {
		return searchDiv;
	}
	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}
	
	
}
