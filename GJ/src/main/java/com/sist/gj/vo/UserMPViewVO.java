package com.sist.gj.vo;

public class UserMPViewVO extends DTO {
	
	//Mypage 에 사용되는 vo
	private String userId; //userID
	private String userNick; //userNick
	private int cvCheck; //resume open or not
	private int hireCount; //company's own hireApply count
	
	public UserMPViewVO() {}

	
	
	public UserMPViewVO(String userId, String userNick, int cvCheck, int hireCount) {
		super();
		this.userId = userId;
		this.userNick = userNick;
		this.cvCheck = cvCheck;
		this.hireCount = hireCount;
	}



	@Override
	public String toString() {
		return "UserMPViewVO [userId=" + userId + ", userNick=" + userNick + ", cvCheck=" + cvCheck + ", hireCount="
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
