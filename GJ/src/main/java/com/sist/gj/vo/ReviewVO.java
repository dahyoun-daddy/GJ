package com.sist.gj.vo;

public class ReviewVO {
	private String review_no      ; /*리뷰no 	*/ 
	private String user_nick      ; /*기업명	*/
	private String review_complain; /*받은신고수	*/
	private String review_title   ; /*작성제목	*/
	private String review_body    ; /*작성내용	*/
	private String review_date    ; /*날짜	*/
	private String review_point   ; /*별점	*/
	private String reg_id         ; /*등록자	*/
	private String reg_dt         ; /*등록일	*/
	private String mod_id         ; /*수정자	*/
	private String mod_dt         ; /*수정일  	*/
	
	public ReviewVO(){}
	
	
	
	public ReviewVO(String review_no, String user_nick, String review_complain, String review_title, String review_body,
			String review_date, String review_point, String reg_id, String reg_dt, String mod_id, String mod_dt) {
		super();
		this.review_no = review_no;
		this.user_nick = user_nick;
		this.review_complain = review_complain;
		this.review_title = review_title;
		this.review_body = review_body;
		this.review_date = review_date;
		this.review_point = review_point;
		this.reg_id = reg_id;
		this.reg_dt = reg_dt;
		this.mod_id = mod_id;
		this.mod_dt = mod_dt;
	}


	@Override
	public String toString() {
		return "ReviewVO [review_no=" + review_no + ", user_nick=" + user_nick + ", review_complain=" + review_complain
				+ ", review_title=" + review_title + ", review_body=" + review_body + ", review_date=" + review_date
				+ ", review_point=" + review_point + ", reg_id=" + reg_id + ", reg_dt=" + reg_dt + ", mod_id=" + mod_id
				+ ", mod_dt=" + mod_dt + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mod_dt == null) ? 0 : mod_dt.hashCode());
		result = prime * result + ((mod_id == null) ? 0 : mod_id.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((reg_id == null) ? 0 : reg_id.hashCode());
		result = prime * result + ((review_body == null) ? 0 : review_body.hashCode());
		result = prime * result + ((review_complain == null) ? 0 : review_complain.hashCode());
		result = prime * result + ((review_date == null) ? 0 : review_date.hashCode());
		result = prime * result + ((review_no == null) ? 0 : review_no.hashCode());
		result = prime * result + ((review_point == null) ? 0 : review_point.hashCode());
		result = prime * result + ((review_title == null) ? 0 : review_title.hashCode());
		result = prime * result + ((user_nick == null) ? 0 : user_nick.hashCode());
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
		if (mod_dt == null) {
			if (other.mod_dt != null)
				return false;
		} else if (!mod_dt.equals(other.mod_dt))
			return false;
		if (mod_id == null) {
			if (other.mod_id != null)
				return false;
		} else if (!mod_id.equals(other.mod_id))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (reg_id == null) {
			if (other.reg_id != null)
				return false;
		} else if (!reg_id.equals(other.reg_id))
			return false;
		if (review_body == null) {
			if (other.review_body != null)
				return false;
		} else if (!review_body.equals(other.review_body))
			return false;
		if (review_complain == null) {
			if (other.review_complain != null)
				return false;
		} else if (!review_complain.equals(other.review_complain))
			return false;
		if (review_date == null) {
			if (other.review_date != null)
				return false;
		} else if (!review_date.equals(other.review_date))
			return false;
		if (review_no == null) {
			if (other.review_no != null)
				return false;
		} else if (!review_no.equals(other.review_no))
			return false;
		if (review_point == null) {
			if (other.review_point != null)
				return false;
		} else if (!review_point.equals(other.review_point))
			return false;
		if (review_title == null) {
			if (other.review_title != null)
				return false;
		} else if (!review_title.equals(other.review_title))
			return false;
		if (user_nick == null) {
			if (other.user_nick != null)
				return false;
		} else if (!user_nick.equals(other.user_nick))
			return false;
		return true;
	}

	public String getReview_no() {
		return review_no;
	}

	public void setReview_no(String review_no) {
		this.review_no = review_no;
	}

	public String getUser_nick() {
		return user_nick;
	}

	public void setUser_nick(String user_nick) {
		this.user_nick = user_nick;
	}

	public String getReview_complain() {
		return review_complain;
	}

	public void setReview_complain(String review_complain) {
		this.review_complain = review_complain;
	}

	public String getReview_title() {
		return review_title;
	}

	public void setReview_title(String review_title) {
		this.review_title = review_title;
	}

	public String getReview_body() {
		return review_body;
	}

	public void setReview_body(String review_body) {
		this.review_body = review_body;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public String getReview_point() {
		return review_point;
	}

	public void setReview_point(String review_point) {
		this.review_point = review_point;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public String getMod_id() {
		return mod_id;
	}

	public void setMod_id(String mod_id) {
		this.mod_id = mod_id;
	}

	public String getMod_dt() {
		return mod_dt;
	}

	public void setMod_dt(String mod_dt) {
		this.mod_dt = mod_dt;
	}
	
	
	
}
