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
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		String reviewNo = req.getParameter("reviewNo");
		log.info("==========================");
		log.info("reviewNo :"+reviewNo);
		log.info("==========================");
		if(!(null==reviewNo)) {
			ReviewVO reviewVO = new ReviewVO();
			reviewVO.setReviewNo(reviewNo);
			reviewSvc.delete(reviewVO);
		}
		
		String reviewNo3 = req.getParameter("reviewNo3");
		String reviewNo4 = req.getParameter("reviewNo4");
		String reviewTitle = req.getParameter("reviewTitle");
		String reviewBody = req.getParameter("reviewBody");
		String reviewPoint = req.getParameter("star");
		String reviewComplain = req.getParameter("reviewComplain");
		
		ReviewVO reviewVO2 = new ReviewVO();
		reviewVO2.setReviewNo(reviewNo3);
		reviewVO2.setReviewTitle(reviewTitle);
		reviewVO2.setReviewBody(reviewBody);
		reviewVO2.setReviewPoint(reviewPoint);
		reviewVO2.setReviewComplain(reviewComplain);
		
		//수정
		if(!(null==reviewNo3)) {	
			reviewSvc.update(reviewVO2);
		}
		
		//저장 세션 받고 시퀀스 만들고 add실행
		
		
		
		String userId = req.getParameter("userId");
		log.info("userId : "+userId);
		
		if(invo.getPageSize() == 0) {
			invo.setPageSize(5);
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
		invo.setSearchDiv("");
		invo.setSearchWord(userId);
		List<ReviewVO> list = reviewSvc.doRetrieve(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();		
		}
		
		log.info("==========================");
		log.info("list.size()1111 :"+list.size());
		log.info("==========================");
		if(list.size()>0) {
		int star = 0;
		invo.setSearchDiv("10");
		List<ReviewVO> list2 = reviewSvc.doRetrieve(invo);
		for(Iterator<ReviewVO> it = list2.iterator(); it.hasNext();) {
			ReviewVO value = it.next();
			star += Integer.parseInt(value.getReviewPoint().substring(value.getReviewPoint().length()-1));
		}
		star = star / list2.size();
		log.info("==========================");
		log.info("star :"+star);
		log.info("==========================");
		
		model.addAttribute("star",star);
		}
		
		UserVO userVO = new UserVO();
		userVO.setUserId(userId);
		UserVO outVO = adminPageSvc.selectCompany(userVO);
		
		model.addAttribute("company",outVO);
		model.addAttribute("totalCnt",totalCnt);
		
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
			invo.setSearchDiv("40");
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
//		for(Iterator<UserVO> it = list.iterator(); it.hasNext();) {
//			UserVO value = it.next();
//			if(value.getUserLevel() == 3) {
//				totalCnt -= 1;
//				it.remove();
//			}
//		}
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

		String upsertDiv = req.getParameter("upsertDiv");
		log.info("=====================upsert=======================");
		log.info("upsertDiv : " + upsertDiv);
		log.info("=====================upsert=======================");
		if(upsertDiv=="doWrite") {
			
		}else if(upsertDiv.equals("doUpdate")) {
			String reviewNo = req.getParameter("reviewNo");
			invo.setReviewNo(reviewNo);
			invo = reviewSvc.select(invo);
		}
		
		String userId = req.getParameter("userId");		
		
		model.addAttribute("userId",userId);
		model.addAttribute("reviewVO",invo);
		
		return "review/reviewUpdate";
	}
	
	
	@RequestMapping(value="/review/complain.do",method=RequestMethod.POST
	        ,produces="application/json;charset=utf8"  
	)
	@ResponseBody
	public String update(@ModelAttribute ReviewVO invo,HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
		String reviewNo2 = req.getParameter("reviewNo2");
		
		log.info("2========================");
		log.info("invo="+invo);
		log.info("reviewNo2="+reviewNo2);
		
		log.info("2========================");	
		
		int flag = 0;
		//수정	
		invo.setReviewNo(reviewNo2);
		ReviewVO outvo = reviewSvc.select(invo);
		outvo.setReviewTitle(null);
		outvo.setReviewComplain(String.valueOf((Integer.parseInt(outvo.getReviewComplain())+1)));
		flag = reviewSvc.update(outvo);
		
		 
		JSONObject object=new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "신고 되었습니다.");
		}else {
			object.put("flag", flag);
			object.put("message", "신고 실패^^.");			
		}
		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");			
		return jsonData;
	}
	
}
