package com.sist.gj.vo;

public class JasoCommentVO extends DTO {
	private String commentNo; //댓글 넘버
	private String userId; //댓글 작성자 아이디
	private String commentBody; //댓글내용
	private String commentDate; //댓글단 날짜
	private String regId; //등록자
	private String regDt; //등록일
	private String modId; //수정자
	private String modDt; //수정일
	private String clNo; //자소서 넘버
	
	public JasoCommentVO() {}
	
	public JasoCommentVO( String commentNo, String userId, String commentBody, String commentDate,
			String regId, String regDt, String modId, String modDt, String clNo) {
		this.commentNo = commentNo;
		this.userId = userId;
		this.commentBody = commentBody;
		this.commentDate = commentDate;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
		this.clNo = clNo;
	}

	@Override
	public String toString() {
		return "JasoCommentVO [commentNo=" + commentNo + ", userId=" + userId + ", commentBody=" + commentBody
				+ ", commentDate=" + commentDate + ", regId=" + regId + ", regDt=" + regDt + ", modId=" + modId
				+ ", modDt=" + modDt + ", clNo=" + clNo + "]";
	}



	public String getClNo() {
		return clNo;
	}

	public void setClNo(String clNo) {
		this.clNo = clNo;
	}

	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCommentBody() {
		return commentBody;
	}
	public void setCommentBody(String commentBody) {
		this.commentBody = commentBody;
	}
	public String getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(String commentDate) {
		this.commentDate = commentDate;
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
