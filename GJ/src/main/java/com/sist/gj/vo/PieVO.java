package com.sist.gj.vo;

public class PieVO {
	private String tagname;
	private int slices;
	public String getTagname() {
		return tagname;
	}
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
	public int getSlices() {
		return slices;
	}
	public void setSlices(int slices) {
		this.slices = slices;
	}
	@Override
	public String toString() {
		return "PieVO [tagname=" + tagname + ", slices=" + slices + "]";
	}
	public PieVO(String tagname, int slices) {
		super();
		this.tagname = tagname;
		this.slices = slices;
	}
	
	public PieVO() {}
}
