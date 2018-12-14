package com.sist.gj.control;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.Iterator;
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

import com.sist.gj.service.AdminPageSvc;
import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.ReviewSvc;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.ReviewVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Controller
public class ReviewController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="review/giupReview";
	
	@Autowired
	private ReviewSvc reviewSvc;
	
	@Autowired
	private AdminPageSvc adminPageSvc;
	
	@RequestMapping(value="/review/giupReview.do")
	public String doRetrieve(@ModelAttribute SearchVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException {
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
		if(null == invo.getSearchWord()) {
			invo.setSearchWord("");
		}
		
		List<ReviewVO> list = reviewSvc.doRetrieve(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		String userId = req.getParameter("userId");
		UserVO userVO = new UserVO();
		userVO.setUserNick(userId);
		UserVO outVO = adminPageSvc.selectCompany(userVO);
		model.addAttribute("company",outVO);
		
		return "review/giupReview";
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
			invo.setSearchDiv("20");
		}
		if(null == invo.getSearchWord()) {
			invo.setSearchWord("");
		}
		
		
		
		List<UserVO> list = adminPageSvc.doRetrieveCompany(invo);
		log.info("list size : "+list.size());
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();		
		}
		for(Iterator<UserVO> it = list.iterator(); it.hasNext();) {
			UserVO value = it.next();
			if(value.getUserLevel() == 3) {
				totalCnt -= 1;
				it.remove();
			}
		}
		log.info("=====================totalCnt=======================");
		log.info("totalCnt:" + totalCnt);
		log.info("=====================totalCnt=======================");
		
		
		model.addAttribute("list",list);
		model.addAttribute("totalCnt",totalCnt);
		return "review/giupList";
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
