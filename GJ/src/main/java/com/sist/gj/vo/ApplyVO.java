package com.sist.gj.vo;

public class ApplyVO extends DTO {
	
	//Table HireApply 이용
	private String applyNo; //지원no
	private String userId; //채용지원자 아이디 
	private String applyDate; //지원일(날짜)
	private String hireNo; //채용no
	
	public ApplyVO() {}

	public ApplyVO(String applyNo, String userId, String applyDate, String hireNo) {
		super();
		this.applyNo = applyNo;
		this.userId = userId;
		this.applyDate = applyDate;
		this.hireNo = hireNo;
	}

	@Override
	public String toString() {
		return "ApplyVO [applyNo=" + applyNo + ", userId=" + userId + ", applyDate=" + applyDate + ", hireNo=" + hireNo
				+ "]";
	}

	public String getApplyNo() {
		return applyNo;
	}

	public void setApplyNo(String applyNo) {
		this.applyNo = applyNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(String applyDate) {
		this.applyDate = applyDate;
	}

	public String getHireNo() {
		return hireNo;
	}

	public void setHireNo(String hireNo) {
		this.hireNo = hireNo;
	}
	
	
	
	
	
	

}
