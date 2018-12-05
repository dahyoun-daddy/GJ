package com.sist.gj.vo;

public class CvFormVO extends DTO {
	
	//Table UserCv 이용
	private String regId; //등록자ID(Email)
	private String cvDate; //날짜 
	private String cvGrade; //최종학력 
	private int cvCheck; //공개여부(공개 시 기업 사용자에게 이력서 보여짐)
	private String regDt; //등록일
	private String modId; //수정자
	private String modDt; //수정일
	
	public CvFormVO() {}

	public CvFormVO(String regId, String cvDate, String cvGrade, int cvCheck, String regDt,
			String modId, String modDt) {
		super();
		this.regId = regId;
		this.cvDate = cvDate;
		this.cvGrade = cvGrade;
		this.cvCheck = cvCheck;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
	}

	@Override
	public String toString() {
		return "CvFormVO [regId=" + regId + ", cvDate=" + cvDate + ", cvGrade=" + cvGrade + ", cvCheck=" + cvCheck
				+ ", regDt=" + regDt + ", modId=" + modId + ", modDt=" + modDt + "]";
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
	}

	public String getCvDate() {
		return cvDate;
	}

	public void setCvDate(String cvDate) {
		this.cvDate = cvDate;
	}

	public String getCvGrade() {
		return cvGrade;
	}

	public void setCvGrade(String cvGrade) {
		this.cvGrade = cvGrade;
	}

	public int getCvCheck() {
		return cvCheck;
	}

	public void setCvCheck(int cvCheck) {
		this.cvCheck = cvCheck;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getModId() {
		return modId;
	}

	public void setModId(String modId) {
		this.modId = modId;
	}

	public String getModDt() {
		return modDt;
	}

	public void setModDt(String modDt) {
		this.modDt = modDt;
	}
	
	
	
	

}
