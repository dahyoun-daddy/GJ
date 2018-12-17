package com.sist.gj.vo;

public class LicenseVO extends DTO {
	
	//Table UserLicense 이용
	private String licNo; //자격no
	private String licName; //자격증 이름
	private String licDate; //취득일
	private String licScore; //성적
	private String regId; //채용no
	
	public LicenseVO() {}

	public LicenseVO(String licNo, String licName, String licDate, String licScore,
			String regId) {
		super();
		this.licNo = licNo;
		this.licName = licName;
		this.licDate = licDate;
		this.licScore = licScore;
		this.regId = regId;
	}

	@Override
	public String toString() {
		return "LicenseVO [licNo=" + licNo + ", licName=" + licName + ", licDate=" + licDate + ", licScore=" + licScore
				+ ", regId=" + regId + "]";
	}

	public String getLicNo() {
		return licNo;
	}

	public void setLicNo(String licNo) {
		this.licNo = licNo;
	}

	public String getLicName() {
		return licName;
	}

	public void setLicName(String licName) {
		this.licName = licName;
	}

	public String getLicDate() {
		return licDate;
	}

	public void setLicDate(String licDate) {
		this.licDate = licDate;
	}

	public String getLicScore() {
		return licScore;
	}

	public void setLicScore(String licScore) {
		this.licScore = licScore;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}
	
	
	
	

}
