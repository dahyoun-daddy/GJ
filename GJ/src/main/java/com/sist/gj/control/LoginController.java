package com.sist.gj.control;

import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.omg.CORBA.Request;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.SignUpSvc;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.UserVO;

@Controller
public class LoginController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CodeSvc codeSvc;
	
	private static final String VIEW_NAME="login/login";
	
	@Autowired
	private SignUpSvc signUpSvc;
	
	@RequestMapping(value="/login/login.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String select(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================INSERT=======================");
		log.info("invo" + invo);
		
		
		//-----------------------------------
		JSONObject object = new JSONObject();
		
		UserVO outVO = signUpSvc.select(invo);
		String result = "";
		
		if(null == outVO) {
			result = "";
		}else {
			result = outVO.getUserId();
		}
		
		object.put("result", result);
		
		String jsonData = object.toJSONString();
		
		return jsonData;
	}
	
	@RequestMapping(value="/login/Main.do")
	public String moveMain(HttpSession ses,HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================INSERT=======================");
		String id = req.getParameter("id");
		UserVO inVO = new UserVO();
		inVO.setUserId(id);
		
		UserVO outVO = signUpSvc.select(inVO);
		
		ses.setAttribute("loginVo", outVO);
		
		return "common/Main";
	}
	

		@RequestMapping(value = "/login/findIdPass.do")
		public String findIdPass(@ModelAttribute UserVO invo,HttpSession ses,HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
			log.info("=====================SELECT=======================");
						
			UserVO outVO = signUpSvc.findIdPass(invo);
			
			CodeVO codeSearch = new CodeVO();
			codeSearch.setCmId("SIGNUP_Q");
			ses.setAttribute("UserVo", outVO);
			model.addAttribute("SIGNUP_Q",codeSvc.doRetrieve(codeSearch));
			
			return "login/findIdPass";
		}
		
		@RequestMapping(value="/login/findId.do",produces="application/json;charset=utf8")
		@ResponseBody
		public String findId(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
			log.info("=====================INSERT=======================");
			log.info("invo" + invo);
			
			
			//-----------------------------------
			JSONObject object = new JSONObject();
			
			UserVO outVO = signUpSvc.findIdPass(invo);
			String result = "";
			
			if(null == outVO) {
				result = "";
			}else {
				result = outVO.getUserId();
			}
			
			object.put("result", result);
			
			String jsonData = object.toJSONString();
			
			return jsonData;
		}
		
		@RequestMapping(value="/login/findPass.do",produces="application/json;charset=utf8")
		@ResponseBody
		public String findPass(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
			log.info("=====================findPass=======================");
			log.info("invo" + invo);
			
			
			//-----------------------------------
			JSONObject object = new JSONObject();
			
			UserVO outVO = signUpSvc.findIdPass2(invo);
			String result = "";
			
			if(null == outVO) {
				result = "";
			}else {
				result = outVO.getUserPasswd();
			}
			
			object.put("result", result);
			
			String jsonData = object.toJSONString();
			
			return jsonData;
		}
		
		//////////////////////////////////////////////////////////signup
		
		@RequestMapping(value="/login/checkId.do",produces="application/json;charset=utf8")
		@ResponseBody
		public String checkId(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
			log.info("=====================checkid=======================");
			log.info("invo" + invo);
			
			
			//-----------------------------------
			JSONObject object = new JSONObject();
			
			UserVO outVO = signUpSvc.checkId(invo);
			String result = "";
			
			if(null == outVO) {
				result = "";
			}else {
				result = outVO.getUserId();
			}
			
			object.put("result", result);
			
			String jsonData = object.toJSONString();
			
			return jsonData;
		}
	
		
		///////////////////////구직자
		@RequestMapping(value="/login/insertId.do",produces="application/json;charset=utf8")
		@ResponseBody
		public String insertId(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
			log.info("=====================insertId=======================");
			log.info("invo" + invo);
			
			invo.setUserLevel(1);
			//-----------------------------------
			JSONObject object = new JSONObject();
			
			int flag = signUpSvc.insert(invo);
						
			if(flag > 0) {
				object.put("flag", flag);
			}else {
				object.put("flag", flag);
			}
						
			String jsonData = object.toJSONString();
			
			return jsonData;
		}
		
		
			///////////////////////기업
			@RequestMapping(value="/login/insertId2.do",produces="application/json;charset=utf8")
			@ResponseBody
			public String insertId2(@ModelAttribute UserVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException, ParseException{
			log.info("=====================insertId=======================");
			log.info("invo" + invo);
			
			String hireDate = invo.getEnterHiredate();
			SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date date = transeFormat.parse(hireDate);
			
			SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy-MM-dd");
			hireDate = notIncludeTime.format(date);
			
			invo.setEnterHiredate(hireDate);
			invo.setUserLevel(2);
			//-----------------------------------
			JSONObject object = new JSONObject();
			
			int flag = signUpSvc.insert(invo);
						
			if(flag > 0) {
				object.put("flag", flag);
			}else {
				object.put("flag", flag);
			}
						
			String jsonData = object.toJSONString();
			
			return jsonData;
			}
			
			@RequestMapping(value="/login/logout.do",produces="application/json;charset=utf8")
			public String logout(@ModelAttribute UserVO invo, HttpServletRequest req, Model model,HttpSession session) throws ClassNotFoundException, SQLException, ParseException{
			
				session.invalidate();
			   JSONObject object = new JSONObject();
		   	  String jsonData = object.toJSONString();
					  return "login/login";
		}

			
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
}
