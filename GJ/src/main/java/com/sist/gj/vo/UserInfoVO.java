package com.sist.gj.vo;

public class UserInfoVO extends DTO{

	//Table Join 시 필요한 것들 (마이페이지에 이용)
	private String userId; //email
	private String userNick; //nickname
	private int cvCheck; //resume open chk
	private int hireCount; //count the company's hireInfo
	
	public UserInfoVO() {}

	@Override
	public String toString() {
		return "UserInfoVO [userId=" + userId + ", userNick=" + userNick + ", cvCheck=" + cvCheck + ", hireCount="
				+ hireCount + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public int getCvCheck() {
		return cvCheck;
	}

	public void setCvCheck(int cvCheck) {
		this.cvCheck = cvCheck;
	}

	public int getHireCount() {
		return hireCount;
	}

	public void setHireCount(int hireCount) {
		this.hireCount = hireCount;
	}

	
}
