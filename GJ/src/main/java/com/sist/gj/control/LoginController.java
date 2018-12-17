package com.sist.gj.control;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.gj.service.SignUpSvc;
import com.sist.gj.vo.UserVO;

@Controller
public class LoginController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
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
}
