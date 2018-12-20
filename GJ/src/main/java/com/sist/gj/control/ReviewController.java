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
import com.sist.gj.service.MypageSvc;
import com.sist.gj.service.ReviewCpSvc;
import com.sist.gj.service.ReviewSvc;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.ReviewCpVO;
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
	
	@Autowired
	private ReviewCpSvc reviewCpSvc;
	
	@Autowired
	private MypageSvc mypageSvc;
	
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
		
		String upsertDiv2 = req.getParameter("upsertDiv");
		if(null==upsertDiv2) {
			upsertDiv2 = "";
		}
		String reviewNo3 = req.getParameter("reviewNo3");
		String reviewTitle = req.getParameter("reviewTitle");
		String reviewBody = req.getParameter("reviewBody");
		String reviewPoint = req.getParameter("star");
		String reviewComplain = req.getParameter("reviewComplain");
		String userNick = req.getParameter("userNick");
		
		ReviewVO reviewVO2 = new ReviewVO();
		reviewVO2.setReviewNo(reviewNo3);
		reviewVO2.setReviewTitle(reviewTitle);
		reviewVO2.setReviewBody(reviewBody);
		reviewVO2.setReviewPoint(reviewPoint);
		reviewVO2.setReviewComplain(reviewComplain);
		reviewVO2.setUserNick(userNick);
		
		//수정 및 저장
		if(upsertDiv2.equals("doWrite")) {
			reviewVO2.setReviewComplain("0");
			reviewVO2.setRegId(req.getParameter("regId"));
			reviewSvc.add(reviewVO2);
		}else if(upsertDiv2.equals("doUpdate")) {
			reviewSvc.update(reviewVO2);
		}else {
			
		}

		
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
		PictureVO pictureVO = mypageSvc.selectPic(userVO);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		
		// /jsp 위에 경로/resources/images/날짜도넣어야/P_SV_NM+P_FL_TP
		
		
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
		if(upsertDiv.equals("doWrite")) {
			
		}else if(upsertDiv.equals("doUpdate")) {
			String reviewNo = req.getParameter("reviewNo");
			invo.setReviewNo(reviewNo);
			invo = reviewSvc.select(invo);
		}
		
		String userId = req.getParameter("userId");
		
		model.addAttribute("upsertDiv",upsertDiv);
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
		String user = req.getParameter("user");
		log.info("2========================");
		log.info("invo="+invo);
		log.info("reviewNo2="+reviewNo2);
		log.info("user="+req.getParameter("user"));
		log.info("2========================");	
		
		ReviewCpVO reviewCpVO = new ReviewCpVO();
		reviewCpVO.setReviewcpNo(reviewNo2);
		reviewCpVO.setReviewcpId(user);
		ReviewCpVO outvo2 = reviewCpSvc.select(reviewCpVO);
		
		//신고하기
		int flag = 0;
		if(null == outvo2) {			
			invo.setReviewNo(reviewNo2);
			ReviewVO outvo = reviewSvc.select(invo);
			outvo.setReviewTitle(null);
			outvo.setReviewComplain(String.valueOf((Integer.parseInt(outvo.getReviewComplain())+1)));
			flag = reviewSvc.update(outvo);
			reviewCpSvc.add(reviewCpVO);
		}
		 
		JSONObject object=new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "신고 되었습니다.");
		}else {
			object.put("flag", flag);
			object.put("message", "이미 신고하셨습니다.");			
		}
		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");			
		return jsonData;
	}
	
}
