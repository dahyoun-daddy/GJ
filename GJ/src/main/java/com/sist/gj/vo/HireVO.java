package com.sist.gj.vo;

public class HireVO {

	private int hireNo;						// 채용순번		
	private String hireTitle;				// 채용제목
	private String hireBody;       		// 채용내용
	private String userId;             // 기업아이디
	private String hireDate;           // 등록날짜
	private String hireDeadline;       // 마감날짜
	private String hireAdd;            // 지역
	private String hireSalary;         // 연봉
	private String hireEdu;            // 학력
	private String redId;              // 등록자
	private String redDt;              // 등록일
	private String modId;              // 수정자
	private String modDt;              // 수정일
	
	public HireVO() {}

	public HireVO(int hireNo, String hireTitle, String hireBody, String userId, String hireDate, String hireDeadline,
			String hireAdd, String hireSalary, String hireEdu, String redId, String redDt, String modId, String modDt) {
		super();
		this.hireNo = hireNo;
		this.hireTitle = hireTitle;
		this.hireBody = hireBody;
		this.userId = userId;
		this.hireDate = hireDate;
		this.hireDeadline = hireDeadline;
		this.hireAdd = hireAdd;
		this.hireSalary = hireSalary;
		this.hireEdu = hireEdu;
		this.redId = redId;
		this.redDt = redDt;
		this.modId = modId;
		this.modDt = modDt;
	}

	
	@Override
	public String toString() {
		return "HireVO [hireNo=" + hireNo + ", hireTitle=" + hireTitle + ", hireBody=" + hireBody + ", userId=" + userId
				+ ", hireDate=" + hireDate + ", hireDeadline=" + hireDeadline + ", hireAdd=" + hireAdd + ", hireSalary="
				+ hireSalary + ", hireEdu=" + hireEdu + ", redId=" + redId + ", redDt=" + redDt + ", modId=" + modId
				+ ", modDt=" + modDt + "]";
	}

	
	public int getHireNo() {
		return hireNo;
	}

	public void setHireNo(int hireNo) {
		this.hireNo = hireNo;
	}

	public String getHireTitle() {
		return hireTitle;
	}

	public void setHireTitle(String hireTitle) {
		this.hireTitle = hireTitle;
	}

	public String getHireBody() {
		return hireBody;
	}

	public void setHireBody(String hireBody) {
		this.hireBody = hireBody;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getHireDate() {
		return hireDate;
	}

	public void setHireDate(String hireDate) {
		this.hireDate = hireDate;
	}

	public String getHireDeadline() {
		return hireDeadline;
	}

	public void setHireDeadline(String hireDeadline) {
		this.hireDeadline = hireDeadline;
	}

	public String getHireAdd() {
		return hireAdd;
	}

	public void setHireAdd(String hireAdd) {
		this.hireAdd = hireAdd;
	}

	public String getHireSalary() {
		return hireSalary;
	}

	public void setHireSalary(String hireSalary) {
		this.hireSalary = hireSalary;
	}

	public String getHireEdu() {
		return hireEdu;
	}

	public void setHireEdu(String hireEdu) {
		this.hireEdu = hireEdu;
	}

	public String getRedId() {
		return redId;
	}

	public void setRedId(String redId) {
		this.redId = redId;
	}

	public String getRedDt() {
		return redDt;
	}

	public void setRedDt(String redDt) {
		this.redDt = redDt;
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

	public int getTotalCnt() {
		return 0;
	}
 
}
