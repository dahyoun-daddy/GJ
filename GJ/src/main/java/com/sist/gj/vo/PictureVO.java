package com.sist.gj.vo;

public class PictureVO extends DTO {
	
	//Table Profile 이용
	private String userId; //아이디 
	private String pFlNm; //원본이름 
	private String pSvNm; //저장이름 
	private String pFlPt; //경로 
	private String pFlTp; //확장자 (.jped, .jpg, .gif) 
	private String pFlSz; //사이즈 (5*1024*1024)
	private String regId; //등록자
	private String regDt; //등록일
	private String modId; //수정자
	private String modDt; //수정일
	
	public PictureVO() {}

	public PictureVO(String userId, String pFlNm, String pSvNm, String pFlPt, String pFlTp,
			String pFlSz, String regId, String regDt, String modId, String modDt) {
		super();
		this.userId = userId;
		this.pFlNm = pFlNm;
		this.pSvNm = pSvNm;
		this.pFlPt = pFlPt;
		this.pFlTp = pFlTp;
		this.pFlSz = pFlSz;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "PictureVO [userId=" + userId + ", pFlNm=" + pFlNm + ", pSvNm=" + pSvNm + ", pFlPt=" + pFlPt + ", pFlTp="
				+ pFlTp + ", pFlSz=" + pFlSz + ", regId=" + regId + ", regDt=" + regDt + ", modId=" + modId + ", modDt="
				+ modDt + "]";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getpFlNm() {
		return pFlNm;
	}

	public void setpFlNm(String pFlNm) {
		this.pFlNm = pFlNm;
	}

	public String getpSvNm() {
		return pSvNm;
	}

	public void setpSvNm(String pSvNm) {
		this.pSvNm = pSvNm;
	}

	public String getpFlPt() {
		return pFlPt;
	}

	public void setpFlPt(String pFlPt) {
		this.pFlPt = pFlPt;
	}

	public String getpFlTp() {
		return pFlTp;
	}

	public void setpFlTp(String pFlTp) {
		this.pFlTp = pFlTp;
	}

	public String getpFlSz() {
		return pFlSz;
	}

	public void setpFlSz(String pFlSz) {
		this.pFlSz = pFlSz;
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
