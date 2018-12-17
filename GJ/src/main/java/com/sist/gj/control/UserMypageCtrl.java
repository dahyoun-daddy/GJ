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
	private static final String VIEW_RESUME="mypageUser/UserResumeView";
	

	
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
		
		model.addAttribute("list",list);//자격증 list
		model.addAttribute("param",inLic);
		
		model.addAttribute("userName",outUser.getUserName());
		model.addAttribute("userPhone",outUser.getUserPhone());
		model.addAttribute("userId",outUser.getUserId());
	
		return VIEW_RESUME;
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
