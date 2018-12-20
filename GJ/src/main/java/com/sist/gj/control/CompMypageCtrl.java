package com.sist.gj.control;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.sist.gj.service.MypageSvc;
import com.sist.gj.service.SignUpSvc;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.CvFormVO;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.LicenseVO;
import com.sist.gj.vo.PictureVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserMPViewVO;
import com.sist.gj.vo.UserVO;

@Controller
public class CompMypageCtrl {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_INFO_COMP="mypageCompany/CompMyInfo";
	private static final String VIEW_UPDATE_COMP="mypageCompany/CompInfoUpdate";
	private static final String VIEW_APPLY_COMP="mypageCompany/CompHireStt";
	private static final String VIEW_MYPAGE="mypageCompany/CompMypage";
	private static final String VIEW_SIGN_OUT="mypageCompany/CompSignOut";
	private static final String VIEW_OPEN_RESUME="mypageCompany/CompResume";
	private static final String VIEW_HIRE_LIST="mypageCompany/CompMyHire";
	private static final String VIEW_RESUME_VIEW="mypageUser/UserResumeView";
	
	
	@Autowired
	private CodeSvc codeSvc;
	@Autowired
	private MypageSvc mypageSvc;
	@Autowired
	private SignUpSvc userSvc;
	
	@RequestMapping(value="mypageCompany/CompMypage.do")
	public String selectUserInfo(@ModelAttribute UserMPViewVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		invo.setUserId(loginId);
		
		UserMPViewVO outvo = mypageSvc.selectCompInfo(invo);
		
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
		
		model.addAttribute("userNick",outvo.getUserNick());
		model.addAttribute("hireCount",outvo.getHireCount());
		
		return VIEW_MYPAGE;
	}
	
	@RequestMapping(value="/mypageCompany/CompSignOut.do")
	public String deletePage(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================delete=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		model.addAttribute("userId",invo.getUserId());
		
		return VIEW_SIGN_OUT;
	}
	
	@RequestMapping(value="/mypageCompany/deleteUser.do",
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
	
	@RequestMapping(value="/mypageCompany/UserResumeView.do")
	public String resumeView(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================select Resume=======================");
		CvFormVO invoResume = new CvFormVO();
		JasoVO invoJaso = new JasoVO();
		LicenseVO inLic = new LicenseVO();
		UserVO inUser = new UserVO();
		
		String regId = req.getParameter("regId");
		
		invoResume.setRegId(regId);
		invoJaso.setRegId(regId);
		inLic.setRegId(regId);
		inUser.setUserId(regId);
		
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
		picture.setUserId(regId);
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
	
	@RequestMapping(value="/mypageCompany/CompMyHire.do")
	public String compMyHire(@ModelAttribute SearchVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================compMyHire=======================");
		
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
		codeSearch.setCmId("HIRE_SEARCH");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invo.setUserId(loginId);
		
		List<HireVO> list = mypageSvc.retrieveHire(invo);
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
		}	
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
		model.addAttribute("totalCnt",totalCnt);
		
		return VIEW_HIRE_LIST;
	}
	
	@RequestMapping(value="/mypageCompany/CompResume.do")
	public String searchOpenResume(@ModelAttribute SearchVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
		log.info("=====================searchOpenResume=======================");
		
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
		codeSearch.setCmId("MY_COM_CV");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invo.setUserId(loginId);
		
		List<CvFormVO> list = mypageSvc.retrieveCv(invo);
		log.info("list size : "+list.size());
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
			
		}
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
		
		return VIEW_OPEN_RESUME;
	}
	
	
	@RequestMapping(value="/mypageCompany/CompInfoUpdate.do")
	public String CompInfoUpdate(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================update=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		
		UserVO outvo = userSvc.select(invo);
		log.info(outvo.toString());
		
		String hireDate = outvo.getEnterHiredate();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = transeFormat.parse(hireDate);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		
		model.addAttribute("userId",outvo.getUserId());
		model.addAttribute("userPasswd",outvo.getUserPasswd());
		model.addAttribute("userNick",outvo.getUserNick());
		model.addAttribute("userName",outvo.getUserName());
		model.addAttribute("userPhone",outvo.getUserPhone());
		model.addAttribute("userAdd",outvo.getUserAdd());
		model.addAttribute("userPassQu",outvo.getuserPassQu());
		model.addAttribute("userPassAn",outvo.getuserPassAn());
		model.addAttribute("enterSalay",outvo.getEnterSalay());
		model.addAttribute("enterCnt",outvo.getEnterCnt());
		model.addAttribute("enterHiredate",hireDate);
		
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
		
		return VIEW_UPDATE_COMP;
	}
	
	
	@RequestMapping(value="/mypageCompany/infoUpdate.do",
	        method=RequestMethod.POST,
            produces="application/json;charset=utf8"  
	)
	@ResponseBody
	public String updateInfoComp(@ModelAttribute UserVO invo, HttpSession ses, HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException, ParseException {
		String upsert_div = req.getParameter("upsert_div");
		PictureVO profileVO = (PictureVO)ses.getAttribute("pictureVO");
		
		log.info("2========================");
		log.info("invo="+invo);
		log.info("upsert_div="+upsert_div);
		log.info("2========================");	
		
		int flag = 0;
		
		//수정		
		flag = mypageSvc.updateUser(invo);
		
		String hireDate = invo.getEnterHiredate();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = transeFormat.parse(hireDate);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		
		invo.setEnterHiredate(hireDate);
		
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
	
	
	@RequestMapping(value="/mypageCompany/CompMyInfo.do")
	public String CompInfo(HttpServletRequest req, HttpSession ses, Model model) throws ClassNotFoundException, SQLException, ParseException {
		log.info("=====================select=======================");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		UserVO invo = new UserVO();
		invo.setUserId(loginId);
		
		UserVO outvo = userSvc.select(invo);
		
		String hireDate = outvo.getEnterHiredate();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = transeFormat.parse(hireDate);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		
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
		model.addAttribute("enterSalay",outvo.getEnterSalay());
		model.addAttribute("enterHiredate",hireDate);
//		model.addAttribute("enterHiredate",outvo.getEnterHiredate());
		
		return VIEW_INFO_COMP;
	}
	
	
	@RequestMapping(value="mypageCompany/CompHireStt.do")
	public String retrieveApplyComp(@ModelAttribute SearchVO invo, HttpSession ses, Model model) throws ClassNotFoundException, SQLException {
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
		codeSearch.setCmId("MY_COMP_APPLY");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		String loginId = sessionVO.getUserId();
		
		invo.setUserId(loginId);
		
		List<ApplyVO> list = mypageSvc.retrieveApplyComp(invo);
		log.info("list size : "+list.size());
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
			
		}
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
		model.addAttribute("totalCnt",totalCnt);
		
		return VIEW_APPLY_COMP;
	}
	
	@RequestMapping(value="mypageCompany/deleteEmp.do",
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
		
		int flag = this.mypageSvc.updateMultiApply(paramList);
		
		JSONObject object = new JSONObject();
		
		if(flag>0) {
			object.put("flag", flag);
			object.put("message", "삭제되었습니다.\n("+flag+"명 삭제 완료.)");
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
