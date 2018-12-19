package com.sist.gj.vo;

public class ReviewCpVO {
	private String reviewcpNo;
	private String reviewcpId;
	
	public ReviewCpVO() {}
	
	public ReviewCpVO(String reviewcpNo, String reviewcpId) {
		super();
		this.reviewcpNo = reviewcpNo;
		this.reviewcpId = reviewcpId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((reviewcpId == null) ? 0 : reviewcpId.hashCode());
		result = prime * result + ((reviewcpNo == null) ? 0 : reviewcpNo.hashCode());
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
		ReviewCpVO other = (ReviewCpVO) obj;
		if (reviewcpId == null) {
			if (other.reviewcpId != null)
				return false;
		} else if (!reviewcpId.equals(other.reviewcpId))
			return false;
		if (reviewcpNo == null) {
			if (other.reviewcpNo != null)
				return false;
		} else if (!reviewcpNo.equals(other.reviewcpNo))
			return false;
		return true;
	}




	@Override
	public String toString() {
		return "ReviewCpVO [reviewcpNo=" + reviewcpNo + ", reviewcpId=" + reviewcpId + "]";
	}



	public String getReviewcpNo() {
		return reviewcpNo;
	}

	public void setReviewcpNo(String reviewcpNo) {
		this.reviewcpNo = reviewcpNo;
	}

	public String getReviewcpId() {
		return reviewcpId;
	}

	public void setReviewcpId(String reviewcpId) {
		this.reviewcpId = reviewcpId;
	}
	
	

}
