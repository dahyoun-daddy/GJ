package com.sist.gj.control;

import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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

import com.google.gson.Gson;
import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.service.MypageSvc;
import com.sist.gj.service.SignUpSvc;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserMPViewVO;
import com.sist.gj.vo.UserVO;

@Controller
public class UserMypageCtrl {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_INFO_USER="mypageUser/UserMyInfo";
	private static final String VIEW_UPDATE_USER="mypageUser/UserInfoUpdate";
	private static final String VIEW_APPLY="mypageUser/UserApply";
	private static final String VIEW_SIGN_OUT="mypageUser/UserSignOut";
	private static final String VIEW_MYPAGE="mypageUser/UserMypage";
	private static final String VIEW_RESUME_VIEW="mypageUser/UserResumeView";
	private static final String VIEW_RESUME="mypageUser/UserResume";
	

	
	@Autowired
	private CodeSvc codeSvc;
	@Autowired
	private MypageSvc mypageSvc;
	@Autowired
	private SignUpSvc userSvc;
	@Autowired
	private JasoSvc jasoSvc;

	
	@RequestMapping(value="mypageUser/UserMypage.do")
	public String selectUserInfo(@ModelAttribute UserMPViewVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		invo.setUserId(loginId);
		
		UserMPViewVO outvo = mypageSvc.selectUserInfo(invo);
		
		UserVO picture = new UserVO();
		picture.setUserId(loginId);
		PictureVO pictureVO = mypageSvc.selectPic(picture);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		int openResume = 0;
		if(outvo != null) {
			openResume  = outvo.getCvCheck();
			model.addAttribute("userNick",outvo.getUserNick());
		}else {
			model.addAttribute("userNick",loginId);
		}
		
		if(openResume == 1) {
			model.addAttribute("cvCheck","있습니다");
		}else if(openResume ==0){
			model.addAttribute("cvCheck","없습니다");
		}
		
		
		
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		
		return VIEW_MYPAGE;
	}
	
	@RequestMapping(value="/mypageUser/UserSignOut.do")
	public String deletePage(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================delete=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		model.addAttribute("userId",invo.getUserId());
		
		return VIEW_SIGN_OUT;
	}
	
	@RequestMapping(value="/mypageUser/deleteUser.do",
					method=RequestMethod.POST,
			        produces="application/json;charset=utf8")
	@ResponseBody
	public String deleteUser(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================delete=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
	
		flag = mypageSvc.deleteUser(invo);
		
		if(flag > 0) {
			object.put("flag",flag);
			object.put("msg","탈퇴 완료되었습니다.");
		}else {
			object.put("flag",flag);
			object.put("msg","탈퇴 실패. 비밀번호를 확인하세요.");
		}
	
		String jsonData = object.toJSONString();
		
		return jsonData;
	}
	
	//수정되기 전에 회원정보 불러와서 뿌려주는 컨트롤
	@RequestMapping(value="/mypageUser/UserInfoUpdate.do")
	public String UserInfoUpdate(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================update=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO picture = new UserVO();
		picture.setUserId(loginId);
		PictureVO pictureVO = mypageSvc.selectPic(picture);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			String pictureId = pictureVO.getUserId();
			model.addAttribute("pictureUrl",pictureUrl);
			model.addAttribute("pictureId",pictureId);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		
		UserVO outvo = userSvc.select(invo);
		log.info(outvo.toString());
		
		model.addAttribute("userId",outvo.getUserId());
		model.addAttribute("userPasswd",outvo.getUserPasswd());
		model.addAttribute("userNick",outvo.getUserNick());
		model.addAttribute("userName",outvo.getUserName());
		model.addAttribute("userPhone",outvo.getUserPhone());
		model.addAttribute("userAdd",outvo.getUserAdd());
		model.addAttribute("userPassQu",outvo.getuserPassQu());
		model.addAttribute("userPassAn",outvo.getuserPassAn());
		
		return VIEW_UPDATE_USER;
	}
	
	
	//수정 버튼 눌렀을 때 동작되는 컨트롤
	@RequestMapping(value="/mypageUser/infoUpdate.do",
			        method=RequestMethod.POST,
	                produces="application/json;charset=utf8"  
	)
	@ResponseBody
	public String updateInfo(@ModelAttribute UserVO invo,HttpSession ses, HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
		String upsert_div = req.getParameter("upsert_div");
//		String pictureId = req.getParameter("usId");
		
		PictureVO profileVO = (PictureVO)ses.getAttribute("pictureVO");
		
		log.info("2========================");
		log.info("invo="+invo);
		log.info("upsert_div="+upsert_div);
		log.info("2========================");	
		
		int flag = 0;
		
		//정보 수정		
		flag = mypageSvc.updateUser(invo);

		
		//프로필 수정데이터 존재
		if(null != profileVO && !profileVO.getUserId().equals("")) {
			PictureVO outvo = mypageSvc.selectPic(invo);
			
			//select값 존재
			if(null!= outvo && !outvo.getUserId().equals("")) {
				mypageSvc.deletePic(outvo);
				mypageSvc.addPic(profileVO);
			}else {
				mypageSvc.addPic(profileVO);
			}
		}
		
		
		
		 
		JSONObject object=new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "수정 성공!");
		}else {
			object.put("flag", flag);
			object.put("message", "수정 실패...");			
		}
		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");	
		
		return jsonData;
	}
	
	@RequestMapping(value="/mypageUser/updateResume.do",
			        method=RequestMethod.POST,
	                produces="application/json;charset=utf8"  
	)
	@ResponseBody
	public String resumeUpdate(HttpServletRequest req, HttpSession ses, Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
		log.info("=====================resumeUpdate=======================");
		
		LicenseVO invo = new LicenseVO();
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invo.setRegId(loginId);
		
		List<LicenseVO> list = mypageSvc.retrieveLic(invo);
		
		String noList = req.getParameter("jsonNoList");
		String nameList = req.getParameter("jsonNameList");
		String dateList = req.getParameter("jsonDateList");
		String scoreList = req.getParameter("jsonScoreList");
		log.info("licNo_list: "+noList);
		
		Gson gson=new Gson();
		List<String>  NO = gson.fromJson(noList, List.class);
		List<String>  NAME = gson.fromJson(nameList, List.class);
		List<String>  DATE = gson.fromJson(dateList, List.class);
		List<String>  SCORE = gson.fromJson(scoreList, List.class);
//		log.info("NO: "+NO);
//		log.info("NAME: "+NAME);
//		log.info("DATE: "+DATE);
//		log.info("SCORE: "+SCORE);
		
		List<String> orgNoList = new ArrayList<String>();
		
		int flag = 0;
		
//자격증 시작----------------------------------------------------------------------	
		
		for(int i=0;i<NO.size();i++) { //수정된 새로운 데이터
			String newNo = NO.get(i);
			String newName = NAME.get(i);
			String newDate = DATE.get(i);
			String newScore = SCORE.get(i);
			
			log.info("바뀐정보의 넘버: "+newNo.toString());
			
			for(int n=0; n<list.size(); n++) { //기존 디비에 있는 데이터
				String orgNo = list.get(n).getLicNo();
				LicenseVO vo = new LicenseVO();
				orgNoList.add(orgNo);
				
				log.info("디비정보의 넘버: "+orgNoList.toString());
				
				if(NO.contains(orgNo)==true && orgNoList.contains(orgNo)==true && newDate.equals("") && newName.equals("") && orgNo.equals(newNo)) {//삭제
					log.info("삭제만하는조건입니다");
					
					vo.setLicNo(orgNo);
					vo.setRegId(loginId);
					flag = mypageSvc.deleteLic(vo);
					
				}else if(!newDate.equals("") && !newName.equals("") && orgNo.equals(newNo)) {//수정
					log.info("삭제 후 추가하는 조건입니다.");
					
					vo.setLicNo(orgNo);
					vo.setRegId(loginId);
					mypageSvc.deleteLic(vo);
					
					vo.setLicNo("");
					vo.setLicName(newName);
					vo.setLicDate(newDate);
					vo.setLicScore(newScore);
					flag = mypageSvc.addLic(vo);
				}
			}
		}
		
		try {
			
			int listDiff = NO.size()-list.size();
			log.info("길이차이: "+listDiff);
			if(listDiff>0) {
				for(int q=0; q<listDiff; q++) {
					if(null!=NAME.get(q+list.size())){
						LicenseVO vo = new LicenseVO();
						vo.setRegId(loginId);
						vo.setLicName( NAME.get(q+list.size()) );
						vo.setLicDate( DATE.get(q+list.size()) );
						vo.setLicScore( SCORE.get(q+list.size()) );
						flag = mypageSvc.addLic(vo);
					}else{
						break;
					}
				}
			}
		}catch(Exception e) {
			log.debug(e.toString());
		}
		
//자격증 끝----------------------------------------------------------------------
//학력 시작-------------------------------------------------------------------------
		
		String regId = req.getParameter("regId");
		String cvGrade = req.getParameter("cvGrade");
		String cvCheck = req.getParameter("cvCheck");
		
		CvFormVO cvcv = new CvFormVO();
		cvcv.setRegId(regId);
		cvcv.setCvCheck(Integer.parseInt(cvCheck));
		cvcv.setCvGrade(cvGrade);
		
		flag = mypageSvc.deleteCv(cvcv);
		flag = mypageSvc.addCv(cvcv);
		
//학력 끝-------------------------------------------------------------------------		
//이력서 시작-------------------------------------------------------------------------	
		
		String clNo = req.getParameter("clNo");
		String clTitle = req.getParameter("clTitle");
		String clSungjang = req.getParameter("clSungjang");
		String clSang = req.getParameter("clSang");
		String clJangdan = req.getParameter("clJangdan");
		String clJiwon = req.getParameter("clJiwon");
		
		JasoVO jaso = new JasoVO();
		jaso.setClNo(clNo);
		jaso.setClTitle(clTitle);
		jaso.setClSungjang(clSungjang);
		jaso.setClSang(clSang);
		jaso.setClJangdan(clJangdan);
		jaso.setClJiwon(clJiwon);
		jaso.setRegId(regId);
		jaso.setClCheck(0);
		
		flag = jasoSvc.merge(jaso);
		
		
//이력서 끝-------------------------------------------------------------------------	
		 
		JSONObject object=new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "저장 성공!");
		}else {
			object.put("flag", flag);
			object.put("message", "저장 실패...");			
		}
		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");	
		
		return jsonData;
	}
	
	//UserResume에 값 뿌려주기
	@RequestMapping(value="/mypageUser/UserResume.do")
	public String resume(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================Resume update prepare=======================");
		CvFormVO invoResume = new CvFormVO();
		JasoVO invoJaso = new JasoVO();
		LicenseVO inLic = new LicenseVO();
		UserVO inUser = new UserVO();
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invoResume.setRegId(loginId);
		invoJaso.setRegId(loginId);
		inLic.setRegId(loginId);
		inUser.setUserId(loginId);
		
		CvFormVO outResume = mypageSvc.selectCv(invoResume);
		JasoVO outJaso = mypageSvc.selectCl(invoJaso);
		List<LicenseVO> list = mypageSvc.retrieveLic(inLic);
		
		for(int i=0; i<list.size(); i++) {
			String LDate = list.get(i).getLicDate();
			SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = transeFormat.parse(LDate);
			
			SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
			LDate = notIncludeTime.format(date);
			list.get(i).setLicDate(LDate);
		}
		
		LicenseVO lic1 = new LicenseVO();
		LicenseVO lic2 = new LicenseVO();
		LicenseVO lic3 = new LicenseVO();
		LicenseVO lic4 = new LicenseVO();
		LicenseVO lic5 = new LicenseVO();
		
		try {
			lic1 = list.get(0);
			lic2 = list.get(1);
			lic3 = list.get(2);
			lic4 = list.get(3);
			lic5 = list.get(4);
		}catch(IndexOutOfBoundsException e) {
			log.info(e.toString());
		}

		UserVO picture = new UserVO();
		picture.setUserId(loginId);
		PictureVO pictureVO = mypageSvc.selectPic(picture);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		UserVO outUser = userSvc.select(inUser);
		try {
			model.addAttribute("regId",outResume.getRegId());
			model.addAttribute("cvDate",outResume.getCvDate());
			model.addAttribute("cvGrade",outResume.getCvGrade());
			model.addAttribute("cvCheck",outResume.getCvCheck()); //기업에게 오픈된 이력서 할지 말지,
			//0이면 오픈하지 않음, 1이면 오픈함
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {
			model.addAttribute("clTitle",outJaso.getClTitle());
			model.addAttribute("clSungjang",outJaso.getClSungjang());
			model.addAttribute("clSang",outJaso.getClSang());
			model.addAttribute("clJangdan",outJaso.getClJangdan());
			model.addAttribute("clJiwon",outJaso.getClJiwon());
			model.addAttribute("clCheck",outJaso.getClCheck());//자소서 게시판에 게시 여부
			model.addAttribute("clNo",outJaso.getClNo());
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {
			model.addAttribute("list",list);
			model.addAttribute("lic1", lic1);
			model.addAttribute("lic2", lic2);
			model.addAttribute("lic3", lic3);
			model.addAttribute("lic4", lic4);
			model.addAttribute("lic5", lic5);
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {	
			model.addAttribute("userName",outUser.getUserName());
			model.addAttribute("userPhone",outUser.getUserPhone());
			model.addAttribute("userId",outUser.getUserId());
	
		}catch(Exception e) {
			log.info(e.toString());;
		}
			
		return VIEW_RESUME;
	}
	
	@RequestMapping(value="/mypageUser/UserResumeView.do")
	public String resumeView(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================select Resume=======================");
		CvFormVO invoResume = new CvFormVO();
		JasoVO invoJaso = new JasoVO();
		LicenseVO inLic = new LicenseVO();
		UserVO inUser = new UserVO();
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invoResume.setRegId(loginId);
		invoJaso.setRegId(loginId);
		inLic.setRegId(loginId);
		inUser.setUserId(loginId);
		
		CvFormVO outResume = mypageSvc.selectCv(invoResume);
		JasoVO outJaso = mypageSvc.selectCl(invoJaso);
		List<LicenseVO> list = mypageSvc.retrieveLic(inLic);
		for(int i=0; i<list.size(); i++) {
			String licDate = list.get(i).getLicDate();
			SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date date = transeFormat.parse(licDate);
			
			SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
			licDate = notIncludeTime.format(date);
			list.get(i).setLicDate(licDate);
		}
		UserVO outUser = userSvc.select(inUser);
		
		try {
			model.addAttribute("regId",outResume.getRegId());
			model.addAttribute("cvDate",outResume.getCvDate());
			model.addAttribute("cvGrade",outResume.getCvGrade());
			model.addAttribute("cvCheck",outResume.getCvCheck()); //기업에게 오픈된 이력서 할지 말지,
			//0이면 오픈하지 않음, 1이면 오픈함
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {	
			model.addAttribute("clTitle",outJaso.getClTitle());
			model.addAttribute("clSungjang",outJaso.getClSungjang());
			model.addAttribute("clSang",outJaso.getClSang());
			model.addAttribute("clJangdan",outJaso.getClJangdan());
			model.addAttribute("clJiwon",outJaso.getClJiwon());
			model.addAttribute("clCheck",outJaso.getClCheck());//자소서 게시판에 게시 여부
			model.addAttribute("clNo",outJaso.getClNo());
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {
			model.addAttribute("list",list);
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		try {	
			model.addAttribute("userName",outUser.getUserName());
			model.addAttribute("userPhone",outUser.getUserPhone());
			model.addAttribute("userId",outUser.getUserId());
		}catch(Exception e) {
			log.info(e.toString());;
		}
		
		UserVO picture = new UserVO();
		picture.setUserId(loginId);
		PictureVO pictureVO = mypageSvc.selectPic(picture);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
	
		return VIEW_RESUME_VIEW;
	}
	
	
	@RequestMapping(value="/mypageUser/UserMyInfo.do")
	public String UserInfo(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================select=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		
		UserVO outvo = userSvc.select(invo);
		
		UserVO picture = new UserVO();
		picture.setUserId(loginId);
		PictureVO pictureVO = mypageSvc.selectPic(picture);
		if(null != pictureVO) {
			String pictureUrl ="/resources/images/"+pictureVO.getpFlPt().substring(pictureVO.getpFlPt().length()-7)+"/"+pictureVO.getpSvNm()+pictureVO.getpFlTp();
			model.addAttribute("pictureUrl",pictureUrl);
			log.info("==========================");
			log.info("pictureUrl :"+pictureUrl);
			log.info("==========================");
		}
		
		model.addAttribute("userId",outvo.getUserId());
		model.addAttribute("userNick",outvo.getUserNick());
		model.addAttribute("userName",outvo.getUserName());
		model.addAttribute("userPhone",outvo.getUserPhone());
		model.addAttribute("userAdd",outvo.getUserAdd());
		
		return VIEW_INFO_USER;
	}

	
	@RequestMapping(value="mypageUser/UserApply.do")
	public String retrieveApply(@ModelAttribute SearchVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
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
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		CodeVO codeSearch = new CodeVO();
		codeSearch.setCmId("MY_USER_APPLY");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		invo.setUserId(loginId);
		
		List<ApplyVO> list = mypageSvc.retrieveApplyUser(invo);
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
		}
		
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
		model.addAttribute("totalCnt",totalCnt);
		return VIEW_APPLY;
	}
	
	
	@RequestMapping(value="mypageUser/cancelApply.do",
			        produces="application/json;charset=utf8",
			        method=RequestMethod.POST)
	@ResponseBody
	public String deleteApply(HttpServletRequest req, Model model) throws RuntimeException, SQLException{
		log.info("=====================deleteApply=======================");

		String noList = req.getParameter("applyNo_list");
		log.info("noList: "+noList);
		
		Gson gson=new Gson();
		List<String>  listParam = gson.fromJson(noList, List.class);
		log.info("noList: "+listParam);
		
		List<ApplyVO> paramList = new ArrayList<ApplyVO>();
		for(int i=0;i<listParam.size();i++) {
			ApplyVO vo =new ApplyVO();
			vo.setApplyNo(listParam.get(i));
			
			paramList.add(vo);
		}
		log.info("paramList: "+paramList);
		
		int flag = this.mypageSvc.deleteMultiApply(paramList);
		
		JSONObject object = new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "지원 취소되었습니다.\n("+flag+"건 취소 완료.)");
		}else {
			object.put("flag", flag);
			object.put("message", "삭제에 실패했습니다. 다시 시도해 주세요. ^^");			
		}		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");		
		
		return jsonData;
	}
	
	
	
	
}
