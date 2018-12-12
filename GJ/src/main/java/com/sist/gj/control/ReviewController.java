package com.sist.gj.control;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.ReviewSvc;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;

@Controller
public class ReviewController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="review/giupReview";
	
	@Autowired
	private ReviewSvc reviewSvc;
	
	@RequestMapping(value="/review/giupReview.do")
	public String doRetrieve(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
		log.debug("search : "+invo);
		
		if(invo.getPageSize() == 0) {
			invo.setPageSize(10);
		}
		if(invo.getPageNum() == 0){
			invo.setPageNum(1);
		}
		if(null == invo.getSearchDiv()) {
			invo.setSearchDiv("");
		}
		if(null == invo.getSearchDiv()) {
			invo.setSearchDiv("");
		}
		
		List<ReviewVO> list = reviewSvc.doRetrieve(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		return VIEW_NAME;
	}
	
	@RequestMapping(value="/review/giupList.do")
	public String doRetrieve2(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
		log.debug("search : "+invo);
		
		if(invo.getPageSize() == 0) {
			invo.setPageSize(10);
		}
		if(invo.getPageNum() == 0){
			invo.setPageNum(1);
		}
		if(null == invo.getSearchDiv()) {
			invo.setSearchDiv("10");
		}
		if(null == invo.getSearchDiv()) {
			invo.setSearchDiv("");
		}
		
		List<ReviewVO> list = reviewSvc.doRetrieve(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		return VIEW_NAME;
	}
	
	
	@RequestMapping(value="/review/reviewUpdate.do")
	public String doUpdate(@ModelAttribute ReviewVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================update=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		//String loginId = req.getParameter("userId");
		String loginId = "기업1";
		invo.setRegId(loginId);
		
		flag = reviewSvc.update(invo);
		
		if(flag > 0) {
			object.put("flag",flag);
			object.put("msg","등록 되었습니다.");
		}else {
			object.put("flag",flag);
			object.put("msg","등록 실패.");
		}
		return VIEW_NAME;
	}
}
