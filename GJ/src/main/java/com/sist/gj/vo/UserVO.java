package com.sist.gj.vo;

public class UserVO {
	
	private String  userId		      ;//사용자 아이디
	private String  userPasswd        ;//사용자 비밀번호
	private String  userNick          ;//사용자 닉네임or기업명
	private String  userName          ;//사용자 이름or대표이름
	private String  userAdd  	      ;//사용자 주소
	private String  userPassQu	      ;//비밀번호찾기질문
	private String  userPassAn	      ;//비밀번호찾기답
	private String  userPhone	      ;//전화번호
	private int	  userLevel	      ;//계정구분
	private String  enterSalay	      ;//기업 연매출액 
	private String  enterCnt	      ;//기업 사원수
	private String  enterHiredate	  ;//기업 설립일
	private String  regId			  ;//등록자
	private String  regDt			  ;//등록일
	private String  modId			  ;//수정자
	private String  modDt			  ;//수정일
	
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPasswd() {
		return userPasswd;
	}
	public void setUserPasswd(String userPasswd) {
		this.userPasswd = userPasswd;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAdd() {
		return userAdd;
	}
	public void setUserAdd(String userAdd) {
		this.userAdd = userAdd;
	}
	public String getuserPassQu() {
		return userPassQu;
	}
	public void setuserPassQu(String userPassQu) {
		this.userPassQu = userPassQu;
	}
	public String getuserPassAn() {
		return userPassAn;
	}
	public void setuserPassAn(String userPassAn) {
		this.userPassAn = userPassAn;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public int getUserLevel() {
		return userLevel;
	}
	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}
	public String getEnterSalay() {
		return enterSalay;
	}
	public void setEnterSalay(String enterSalay) {
		this.enterSalay = enterSalay;
	}
	public String getEnterCnt() {
		return enterCnt;
	}
	public void setEnterCnt(String enterCnt) {
		this.enterCnt = enterCnt;
	}
	public String getEnterHiredate() {
		return enterHiredate;
	}
	public void setEnterHiredate(String enterHiredate) {
		this.enterHiredate = enterHiredate;
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
	public UserVO(String userId, String userPasswd, String userNick, String userName, String userAdd, String userPassQu,
			String userPassAn, String userPhone, int userLevel, String enterSalay, String enterCnt, String enterHiredate,
			String regId, String regDt, String modId, String modDt) {
		super();
		this.userId = userId;
		this.userPasswd = userPasswd;
		this.userNick = userNick;
		this.userName = userName;
		this.userAdd = userAdd;
		this.userPassQu = userPassQu;
		this.userPassAn = userPassAn;
		this.userPhone = userPhone;
		this.userLevel = userLevel;
		this.enterSalay = enterSalay;
		this.enterCnt = enterCnt;
		this.enterHiredate = enterHiredate;
		this.regId = regId;
		this.regDt = regDt;
		this.modId = modId;
		this.modDt = modDt;
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((enterCnt == null) ? 0 : enterCnt.hashCode());
		result = prime * result + ((enterHiredate == null) ? 0 : enterHiredate.hashCode());
		result = prime * result + ((enterSalay == null) ? 0 : enterSalay.hashCode());
		result = prime * result + ((modDt == null) ? 0 : modDt.hashCode());
		result = prime * result + ((modId == null) ? 0 : modId.hashCode());
		result = prime * result + ((regDt == null) ? 0 : regDt.hashCode());
		result = prime * result + ((regId == null) ? 0 : regId.hashCode());
		result = prime * result + ((userAdd == null) ? 0 : userAdd.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + userLevel;
		result = prime * result + ((userName == null) ? 0 : userName.hashCode());
		result = prime * result + ((userNick == null) ? 0 : userNick.hashCode());
		result = prime * result + ((userPassAn == null) ? 0 : userPassAn.hashCode());
		result = prime * result + ((userPassQu == null) ? 0 : userPassQu.hashCode());
		result = prime * result + ((userPasswd == null) ? 0 : userPasswd.hashCode());
		result = prime * result + ((userPhone == null) ? 0 : userPhone.hashCode());
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
		UserVO other = (UserVO) obj;
		if (enterCnt == null) {
			if (other.enterCnt != null)
				return false;
		} else if (!enterCnt.equals(other.enterCnt))
			return false;
		if (enterHiredate == null) {
			if (other.enterHiredate != null)
				return false;
		} else if (!enterHiredate.equals(other.enterHiredate))
			return false;
		if (enterSalay == null) {
			if (other.enterSalay != null)
				return false;
		} else if (!enterSalay.equals(other.enterSalay))
			return false;
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
		if (userAdd == null) {
			if (other.userAdd != null)
				return false;
		} else if (!userAdd.equals(other.userAdd))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (userLevel != other.userLevel)
			return false;
		if (userName == null) {
			if (other.userName != null)
				return false;
		} else if (!userName.equals(other.userName))
			return false;
		if (userNick == null) {
			if (other.userNick != null)
				return false;
		} else if (!userNick.equals(other.userNick))
			return false;
		if (userPassAn == null) {
			if (other.userPassAn != null)
				return false;
		} else if (!userPassAn.equals(other.userPassAn))
			return false;
		if (userPassQu == null) {
			if (other.userPassQu != null)
				return false;
		} else if (!userPassQu.equals(other.userPassQu))
			return false;
		if (userPasswd == null) {
			if (other.userPasswd != null)
				return false;
		} else if (!userPasswd.equals(other.userPasswd))
			return false;
		if (userPhone == null) {
			if (other.userPhone != null)
				return false;
		} else if (!userPhone.equals(other.userPhone))
			return false;
		return true;
	}
	
	
	
}
