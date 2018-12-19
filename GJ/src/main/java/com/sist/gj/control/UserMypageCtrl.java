package com.sist.gj.control;

import java.sql.SQLException;
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
	public String selectUserInfo(@ModelAttribute UserMPViewVO invo, Model model) throws ClassNotFoundException, SQLException {
		
//		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		invo.setUserId("boondll@hanmail.net");
//		String loginId = sessionVO.getUserId();
//		invo.setUserId(loginId);
		
		UserMPViewVO outvo = mypageSvc.selectUserInfo(invo);
		
		int openResume = outvo.getCvCheck();
		
		if(openResume == 1) {
			model.addAttribute("cvCheck","있습니다");
		}else {
			model.addAttribute("cvCheck","없습니다");
		}
		
		model.addAttribute("userNick",outvo.getUserNick());
		
		return VIEW_MYPAGE;
	}
	
	@RequestMapping(value="/mypageUser/UserSignOut.do")
	public String deletePage(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================delete=======================");
		
//		String userId = req.getParameter("selectUserId");
		UserVO invo = new UserVO();
		invo.setUserId("signout1");
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
	public String UserInfoUpdate(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================update=======================");
		
//		String userId = req.getParameter("selectUserId");
		
		UserVO invo = new UserVO();
		invo.setUserId("boondll@hanmail.net");
		
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
	public String updateInfo(@ModelAttribute UserVO invo, HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
		String upsert_div = req.getParameter("upsert_div");
		
		log.info("2========================");
		log.info("invo="+invo);
		log.info("upsert_div="+upsert_div);
		log.info("2========================");	
		
		int flag = 0;
		
		//수정		
		flag = mypageSvc.updateUser(invo);
		 
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
	
	@RequestMapping(value="/mypageUser/updateLic.do",
			        method=RequestMethod.POST,
	                produces="application/json;charset=utf8"  
	)
	@ResponseBody
	public String resumeLicense(HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
		log.info("=====================resumeLicense=======================");
		
		LicenseVO invo = new LicenseVO();
		invo.setRegId("boondll@hanmail.net");
		
		List<LicenseVO> list = mypageSvc.retrieveLic(invo);
//		int updateCnt = 0;
//		int deleteCnt = 0;
//		int addCnt =0;
		
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
		log.info("NO: "+NO);
		log.info("NAME: "+NAME);
		log.info("DATE: "+DATE);
		log.info("SCORE: "+SCORE);
		
		List<String> orgNoList = new ArrayList<String>();
		
		int flag = 0;
		
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
					vo.setRegId("boondll@hanmail.net");
					flag = mypageSvc.deleteLic(vo);
					
				}else if(!newDate.equals("") && !newName.equals("") && orgNo.equals(newNo)) {//수정
					log.info("삭제 후 추가하는 조건입니다.");
					
					vo.setLicNo(orgNo);
					vo.setRegId("boondll@hanmail.net");
					mypageSvc.deleteLic(vo);
					
					vo.setLicNo("");
					vo.setLicName(newName);
					vo.setLicDate(newDate);
					vo.setLicScore(newScore);
					flag = mypageSvc.addLic(vo);
				}else if(!newDate.equals("") && !newName.equals("") ) {
					log.info("추가만 하는 조건입니다.");
					vo.setRegId("boondll@hanmail.net");
					vo.setLicName(newName);
					vo.setLicDate(newDate);
					vo.setLicScore(newScore);
					flag = mypageSvc.addLic(vo);
				}
			}
//			if(flag>0) break;
		}
		 
		JSONObject object=new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "자격증 수정 성공!");
		}else {
			object.put("flag", flag);
			object.put("message", "자격증 수정 실패...");			
		}
		
		String jsonData = object.toJSONString();
		
		log.info("3========================");
		log.info("jsonData="+jsonData);
		log.info("3========================");	
		
		return jsonData;
	}
	
	//UserResumeView에 값 뿌려주기
	@RequestMapping(value="/mypageUser/UserResume.do")
	public String resume(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================Resume update prepare=======================");
		CvFormVO invoResume = new CvFormVO();
		JasoVO invoJaso = new JasoVO();
		LicenseVO inLic = new LicenseVO();
		UserVO inUser = new UserVO();
		
		invoResume.setRegId("boondll@hanmail.net");
		invoJaso.setRegId("boondll@hanmail.net");
		inLic.setRegId("boondll@hanmail.net");
		inUser.setUserId("boondll@hanmail.net");
		
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

		
		UserVO outUser = userSvc.select(inUser);
		CodeVO codeSearch = new CodeVO();
		codeSearch.setCmId("HIRE_SEARCH_EDU");
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		
		model.addAttribute("regId",outResume.getRegId());
		model.addAttribute("cvDate",outResume.getCvDate());
		model.addAttribute("cvGrade",outResume.getCvGrade());
		model.addAttribute("cvCheck",outResume.getCvCheck()); //기업에게 오픈된 이력서 할지 말지,
		//0이면 오픈하지 않음, 1이면 오픈함
		
		model.addAttribute("clTitle",outJaso.getClTitle());
		model.addAttribute("clSungjang",outJaso.getClSungjang());
		model.addAttribute("clSang",outJaso.getClSang());
		model.addAttribute("clJangdan",outJaso.getClJangdan());
		model.addAttribute("clJiwon",outJaso.getClJiwon());
		model.addAttribute("clCheck",outJaso.getClCheck());//자소서 게시판에 게시 여부
		model.addAttribute("clNo",outJaso.getClNo());
		
		model.addAttribute("list",list);
		model.addAttribute("lic1", lic1);
		model.addAttribute("lic2", lic2);
		model.addAttribute("lic3", lic3);
		model.addAttribute("lic4", lic4);
		model.addAttribute("lic5", lic5);
		
		model.addAttribute("userName",outUser.getUserName());
		model.addAttribute("userPhone",outUser.getUserPhone());
		model.addAttribute("userId",outUser.getUserId());
	
		return VIEW_RESUME;
	}
	
	@RequestMapping(value="/mypageUser/UserResumeView.do")
	public String resumeView(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================select Resume=======================");
		CvFormVO invoResume = new CvFormVO();
		JasoVO invoJaso = new JasoVO();
		LicenseVO inLic = new LicenseVO();
		UserVO inUser = new UserVO();
		
		invoResume.setRegId("boondll@hanmail.net");
		invoJaso.setRegId("boondll@hanmail.net");
		inLic.setRegId("boondll@hanmail.net");
		inUser.setUserId("boondll@hanmail.net");
		
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
		CodeVO codeSearch = new CodeVO();
		codeSearch.setCmId("HIRE_SEARCH_EDU");
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		
		model.addAttribute("regId",outResume.getRegId());
		model.addAttribute("cvDate",outResume.getCvDate());
		model.addAttribute("cvGrade",outResume.getCvGrade());
		model.addAttribute("cvCheck",outResume.getCvCheck()); //기업에게 오픈된 이력서 할지 말지,
		//0이면 오픈하지 않음, 1이면 오픈함
		
		model.addAttribute("clTitle",outJaso.getClTitle());
		model.addAttribute("clSungjang",outJaso.getClSungjang());
		model.addAttribute("clSang",outJaso.getClSang());
		model.addAttribute("clJangdan",outJaso.getClJangdan());
		model.addAttribute("clJiwon",outJaso.getClJiwon());
		model.addAttribute("clCheck",outJaso.getClCheck()); //자소서 게시판에 게시 여부
		
		model.addAttribute("list",list);
		
		model.addAttribute("userName",outUser.getUserName());
		model.addAttribute("userPhone",outUser.getUserPhone());
		model.addAttribute("userId",outUser.getUserId());
	
		return VIEW_RESUME_VIEW;
	}
	
	
	@RequestMapping(value="/mypageUser/UserMyInfo.do")
	public String UserInfo(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================select=======================");
		
		UserVO invo = new UserVO();
		invo.setUserId("boondll@hanmail.net");
		
		UserVO outvo = userSvc.select(invo);
		
		model.addAttribute("userId",outvo.getUserId());
		model.addAttribute("userNick",outvo.getUserNick());
		model.addAttribute("userName",outvo.getUserName());
		model.addAttribute("userPhone",outvo.getUserPhone());
		model.addAttribute("userAdd",outvo.getUserAdd());
		
		return VIEW_INFO_USER;
	}

	
	@RequestMapping(value="mypageUser/UserApply.do")
	public String retrieveApply(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
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
		
		CodeVO codeSearch = new CodeVO();
		codeSearch.setCmId("MY_USER_APPLY");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		invo.setUserId("boondll@hanmail.net");
		
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
