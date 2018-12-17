package com.sist.gj.control;

import java.sql.SQLException;
import java.util.Calendar;
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
import com.sist.gj.service.AdminPageSvcImple;
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
	
	@Autowired
	private CodeSvc codeSvc;
	
	
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
		codeSearch.setCmId("SIGNUP_Q");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		CodeVO userSearch = new CodeVO();
		userSearch.setCmId("MY_AD_USER");
		
		
		List<UserVO> list = adminSvc.doRetrieveUser(invo);
		log.info("list size : "+list.size());
		 
		
	
		
		model.addAttribute("list",list);
		model.addAttribute("SIGNUP_Q",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("userSearch",codeSvc.doRetrieve(userSearch));
		model.addAttribute("param",invo);
	
		return VIEW_NAME;
	}
	
	@RequestMapping(value="/mypageAdmin/userSelect.do",method=RequestMethod.POST
	        ,produces="application/json;charset=utf8"  
	)
@ResponseBody
public String get(HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
	String userId = req.getParameter("userId");
	log.info("2========================");
	log.info("get=");
	log.info("2========================");	
	UserVO userVO=new UserVO();
	userVO.setUserId(userId);
	
	//JSON Convertor
	UserVO outVO = adminSvc.selectUser(userVO);
	JSONObject object=new JSONObject();   
	object.put("userId", outVO.getUserId());
	object.put("userPasswd", outVO.getUserPasswd());
	object.put("userNick", outVO.getUserNick());
	object.put("userName", outVO.getUserName());   
	object.put("userPhone", outVO.getUserPhone());
	object.put("userAdd", outVO.getUserAdd());
	object.put("userPassQu", outVO.getuserPassQu());
	object.put("userPassAn", outVO.getuserPassAn());	
	 
	String jsonData = object.toJSONString();
	
	log.info("3========================");
	log.info("jsonData="+jsonData);
	log.info("3========================");			
	model.addAttribute("vo", adminSvc.selectUser(userVO));
	return jsonData;
	}
	
	@RequestMapping(value="/mypageAdmin/userUpdate.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String doUpdate(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================update=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		//String loginId = req.getParameter("userId");
		
		//----------------------------------------------------------------
		//<-- 세션값으로 아이디값 받기 -->
		String loginId = "boondll@hanmail.net";
		invo.setRegId(loginId);
				
		
		flag = adminSvc.updateUser(invo);	 		
		
		if(flag > 0) {
			object.put("flag",flag);
			object.put("msg","등록 되었습니다.");
		}else {
			object.put("flag",flag);
			object.put("msg","등록 실패.");
		}
		
		String jsonData = object.toJSONString();
		
		return jsonData;
	}
	
	@RequestMapping(value="/mypageAdmin/userDelete.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String doDelete(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================update=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		flag = adminSvc.deleteUser(invo);
		
		if(flag > 0) {
			object.put("flag",flag);
			object.put("msg","삭제 되었습니다.");
		}else {
			object.put("flag",flag);
			object.put("msg","삭제 실패.");
		}
		
		String jsonData = object.toJSONString();
		
		return jsonData;
	}
	
	
	
	
	
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	
	
	
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
		codeSearch.setCmId("SIGNUP_Q");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		CodeVO userSearch = new CodeVO();
		userSearch.setCmId("MY_AD_COM");
		
		List<UserVO> list = adminSvc.doRetrieveCompany(invo);
		log.info("list size : "+list.size());
		 
		
	
		model.addAttribute("list",list);
		model.addAttribute("SIGNUP_Q",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("codePage",codeSvc.doRetrieve(codePage));
		model.addAttribute("companySearch",codeSvc.doRetrieve(userSearch));
		model.addAttribute("param",invo);
	
		return VIEW2_NAME;
	}
	
		
	
			@RequestMapping(value="/mypageAdmin/companySelect.do",method=RequestMethod.POST
			        ,produces="application/json;charset=utf8"  
			)
		@ResponseBody
		public String get2(HttpServletRequest req,Model model) throws EmptyResultDataAccessException, ClassNotFoundException, SQLException {
			String userId = req.getParameter("userId");
			log.info("2========================");
			log.info("get=");
			log.info("2========================");	
			UserVO userVO=new UserVO();
			userVO.setUserId(userId);
			
			//JSON Convertor
			UserVO outVO = adminSvc.selectCompany(userVO);
			JSONObject object=new JSONObject();    
			object.put("userId", outVO.getUserId());
			object.put("userPasswd", outVO.getUserPasswd());
			object.put("userNick", outVO.getUserNick());
			object.put("userName", outVO.getUserName());   
			object.put("userPhone", outVO.getUserPhone());
			object.put("userAdd", outVO.getUserAdd());
			object.put("enterSalay", outVO.getEnterSalay());
			object.put("enterCnt", outVO.getEnterCnt());
			object.put("enterHiredate", outVO.getEnterHiredate());
			object.put("UserLevel", outVO.getUserLevel());
			object.put("userPassQu", outVO.getuserPassQu());
			object.put("userPassAn", outVO.getuserPassAn());
			 
			String jsonData = object.toJSONString();
			
			log.info("3========================");
			log.info("jsonData="+jsonData);
			log.info("3========================");			
			model.addAttribute("vo", adminSvc.selectUser(userVO));
			return jsonData;
			}
	
			
			@RequestMapping(value="/mypageAdmin/companyUpdate.do",produces="application/json;charset=utf8")
			@ResponseBody
			public String doUpdate2(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
				log.info("=====================update=======================");
				log.info("invo" + invo);
				
				int flag = 0;
				
				JSONObject object = new JSONObject();
				
				//String loginId = req.getParameter("userId");
				
				//----------------------------------------------------------------
				//<-- 세션값으로 아이디값 받기 -->
				String loginId = "boondll@hanmail.net";
				invo.setRegId(loginId);
				
				
				
				flag = adminSvc.updateCompany(invo);
				
				if(flag > 0) {
					object.put("flag",flag);
					object.put("msg","등록 되었습니다.");
				}else {
					object.put("flag",flag);
					object.put("msg","등록 실패.");
				}
				
				String jsonData = object.toJSONString();
				
				return jsonData;
			}
				
			@RequestMapping(value="/mypageAdmin/companyDelete.do",produces="application/json;charset=utf8")
			@ResponseBody
			public String doDelete2(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
				log.info("=====================update=======================");
				log.info("invo" + invo);
				
				int flag = 0;
				
				JSONObject object = new JSONObject();
				
				flag = adminSvc.deleteUser(invo);
				
				if(flag > 0) {
					object.put("flag",flag);
					object.put("msg","삭제 되었습니다.");
				}else {
					object.put("flag",flag);
					object.put("msg","삭제 실패.");
				}
				
				String jsonData = object.toJSONString();
				
				return jsonData;
			}
			

}
