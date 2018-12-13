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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.gj.service.AdminPageSvc;
import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Controller
public class AdminController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="mypageAdmin/usercompany";
			
	@Autowired
	private AdminPageSvc adminSvc;
	
	@RequestMapping(value="/mypageAdmin/userList.do")
		
	public String doRetrieve(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
		log.info("search : "+invo);
		
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
		codeSearch.setCmId("USER_SEARCH");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		List<UserVO> list = adminSvc.doRetrieveUser(invo);
		log.info("list size : "+list.size());
		 
		
	
	
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
	
		return VIEW_NAME;
	}
	
	private static final String VIEW2_NAME="mypageAdmin/usercompany2";
	
	
	
	@RequestMapping(value="/mypageAdmin/companyList.do")
		
	public String doRetrieve2(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
		log.info("search : "+invo);
		
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
		codeSearch.setCmId("COMPANY_SEARCH");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		List<UserVO> list = adminSvc.doRetrieveUser(invo);
		log.info("list size : "+list.size());
		 
		
	
	
		model.addAttribute("list",list);
		model.addAttribute("param",invo);
	
		return VIEW2_NAME;
	}
	
//	@RequestMapping(value="/jaso/jasoUpdate.do",produces="application/json;charset=utf8")
//	@ResponseBody
//	public String doUpdate(@ModelAttribute JasoVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
//		log.info("=====================update=======================");
//		log.info("invo" + invo);
//		
//		int flag = 0;
//		
//		JSONObject object = new JSONObject();
//		
//		//String loginId = req.getParameter("userId");
//		
//		//----------------------------------------------------------------
//		//<-- 세션값으로 아이디값 받기 -->
//		String loginId = "boondll@hanmail.net";
//		invo.setRegId(loginId);
//		
//		
//		flag = jasoSvc.merge(invo);
//		
//		if(flag > 0) {
//			object.put("flag",flag);
//			object.put("msg","등록 되었습니다.");
//		}else {
//			object.put("flag",flag);
//			object.put("msg","등록 실패.");
//		}
//		
//		String jsonData = object.toJSONString();
//		
//		return jsonData;
//	}
}
