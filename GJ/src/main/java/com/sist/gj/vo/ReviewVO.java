package com.sist.gj.vo;

public class ReviewVO {
	private String reviewNo      ; /*리뷰no 	*/ 
	private String userNick      ; /*기업명	*/
	private String reviewComplain; /*받은신고수	*/
	private String reviewTitle   ; /*작성제목	*/
	private String reviewBody    ; /*작성내용	*/
	private String reviewDate    ; /*날짜	*/
	private String reviewPoint   ; /*별점	*/
	private String regId         ; /*등록자	*/
	private String regDt         ; /*등록일	*/
	private String modId         ; /*수정자	*/
	private String modDt         ; /*수정일  	*/
	
	public ReviewVO(){}
	
	
	public ReviewVO(String reviewNo, String userNick, String reviewComplain, String reviewTitle, String reviewBody,
			String reviewDate, String reviewPoint, String regId, String regDt, String modId, String modDt) {
		super();
		this.reviewNo = reviewNo;
		this.userNick = userNick;
		this.reviewComplain = reviewComplain;
		this.reviewTitle = reviewTitle;
		this.reviewBody = reviewBody;
		this.reviewDate = reviewDate;
		this.reviewPoint = reviewPoint;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
	}






	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((modDt == null) ? 0 : modDt.hashCode());
		result = prime * result + ((modId == null) ? 0 : modId.hashCode());
		result = prime * result + ((regDt == null) ? 0 : regDt.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((reviewBody == null) ? 0 : reviewBody.hashCode());
		result = prime * result + ((reviewComplain == null) ? 0 : reviewComplain.hashCode());
		result = prime * result + ((reviewDate == null) ? 0 : reviewDate.hashCode());
		result = prime * result + ((reviewNo == null) ? 0 : reviewNo.hashCode());
		result = prime * result + ((reviewPoint == null) ? 0 : reviewPoint.hashCode());
		result = prime * result + ((reviewTitle == null) ? 0 : reviewTitle.hashCode());
		result = prime * result + ((userNick == null) ? 0 : userNick.hashCode());
		return result;
	}






	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewVO other = (ReviewVO) obj;
		if (modDt == null) {
			if (other.modDt != null)
				return false;
		} else if (!modDt.equals(other.modDt))
			return false;
		if (modId == null) {
			if (other.modId != null)
				return false;
		} else if (!modId.equals(other.modId))
			return false;
		if (regDt == null) {
			if (other.regDt != null)
				return false;
		} else if (!regDt.equals(other.regDt))
			return false;
		if (regId == null) {
			if (other.regId != null)
				return false;
		} else if (!regId.equals(other.regId))
			return false;
		if (reviewBody == null) {
			if (other.reviewBody != null)
				return false;
		} else if (!reviewBody.equals(other.reviewBody))
			return false;
		if (reviewComplain == null) {
			if (other.reviewComplain != null)
				return false;
		} else if (!reviewComplain.equals(other.reviewComplain))
			return false;
		if (reviewDate == null) {
			if (other.reviewDate != null)
				return false;
		} else if (!reviewDate.equals(other.reviewDate))
			return false;
		if (reviewNo == null) {
			if (other.reviewNo != null)
				return false;
		} else if (!reviewNo.equals(other.reviewNo))
			return false;
		if (reviewPoint == null) {
			if (other.reviewPoint != null)
				return false;
		} else if (!reviewPoint.equals(other.reviewPoint))
			return false;
		if (reviewTitle == null) {
			if (other.reviewTitle != null)
				return false;
		} else if (!reviewTitle.equals(other.reviewTitle))
			return false;
		if (userNick == null) {
			if (other.userNick != null)
				return false;
		} else if (!userNick.equals(other.userNick))
			return false;
		return true;
	}






	@Override
	public String toString() {
		return "ReviewVO [reviewNo=" + reviewNo + ", userNick=" + userNick + ", reviewComplain=" + reviewComplain
				+ ", reviewTitle=" + reviewTitle + ", reviewBody=" + reviewBody + ", reviewDate=" + reviewDate
				+ ", reviewPoint=" + reviewPoint + ", regId=" + regId + ", regDt=" + regDt + ", modId=" + modId
				+ ", modDt=" + modDt + "]";
	}




	public String getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(String reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserNick() {
		return userNick;
	}

	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}

	public String getReviewComplain() {
		return reviewComplain;
	}

	public void setReviewComplain(String reviewComplain) {
		this.reviewComplain = reviewComplain;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewBody() {
		return reviewBody;
	}

	public void setReviewBody(String reviewBody) {
		this.reviewBody = reviewBody;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(String reviewPoint) {
		this.reviewPoint = reviewPoint;
	}

	public String getRegId() {
		return regId;
	}

	public void setRegId(String regId) {
		this.regId = regId;
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
