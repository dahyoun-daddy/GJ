package com.sist.gj.vo;

public class CodeVO {
	private String cmId;
	private String cdId;
	private String cdNm;
	private String cdUse;
	private String cdOrd;
	private String regId;
	private String regDt;
	private String modId;
	private String modDt;
	
	public CodeVO() {}
	
	public CodeVO(String cmId, String cdId, String cdNm, String cdUse, String cdOrd, String regId, String regDt,
			String modId, String modDt) {
		super();
		this.cmId = cmId;
		this.cdId = cdId;
		this.cdNm = cdNm;
		this.cdUse = cdUse;
		this.cdOrd = cdOrd;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
	}
	@Override
	public String toString() {
		return "CodeVO [cmId=" + cmId + ", cdId=" + cdId + ", cdNm=" + cdNm + ", cdUse=" + cdUse + ", cdOrd=" + cdOrd
				+ ", regId=" + regId + ", regDt=" + regDt + ", modId=" + modId + ", modDt=" + modDt + "]";
	}
	public String getCmId() {
		return cmId;
	}
	public void setCmId(String cmId) {
		this.cmId = cmId;
	}
	public String getCdId() {
		return cdId;
	}
	public void setCdId(String cdId) {
		this.cdId = cdId;
	}
	public String getCdNm() {
		return cdNm;
	}
	public void setCdNm(String cdNm) {
		this.cdNm = cdNm;
	}
	public String getCdUse() {
		return cdUse;
	}
	public void setCdUse(String cdUse) {
		this.cdUse = cdUse;
	}
	public String getCdOrd() {
		return cdOrd;
	}
	public void setCdOrd(String cdOrd) {
		this.cdOrd = cdOrd;
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
