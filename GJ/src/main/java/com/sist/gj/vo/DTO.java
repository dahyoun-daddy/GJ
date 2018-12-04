package com.sist.gj.vo;

public class DTO {
	private int no;
	private int totalCnt;
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public DTO(int no, int totalCnt) {
		super();
		this.no = no;
		this.totalCnt = totalCnt;
	}
	@Override
	public String toString() {
		return "DTO [no=" + no + ", totalCnt=" + totalCnt + "]";
	}
	
	public DTO() {}
}
