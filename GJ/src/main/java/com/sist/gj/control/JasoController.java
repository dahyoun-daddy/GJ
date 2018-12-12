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

import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Controller
public class JasoController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="jaso/jasoList";
	
	@Autowired
	private JasoSvc jasoSvc;
	
	@Autowired
	private CodeSvc codeSvc;
	
	@Autowired
	private JasoCommentSvc jasoCSvc;
	
	@RequestMapping(value="/jaso/jasoList.do")
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
		codeSearch.setCmId("JASO_SEARCH");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		List<JasoVO> list = jasoSvc.doRetrieve(invo);
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
		return VIEW_NAME;
	}
	
	@RequestMapping(value="/jaso/jasoUpdate.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String doUpdate(@ModelAttribute JasoVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================update=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		//String loginId = req.getParameter("userId");
		
		//----------------------------------------------------------------
		//<-- 세션값으로 아이디값 받기 -->
		String loginId = "boondll@hanmail.net";
		invo.setRegId(loginId);
		
		
		flag = jasoSvc.merge(invo);
		
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
	
	@RequestMapping(value="/jaso/delete.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String dodelete(@ModelAttribute JasoVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================update=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		flag = jasoSvc.delete(invo);
		
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
	
	@RequestMapping(value="/jaso/jasoView.do")
	public String doSelect(HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================select=======================");
		String clNo = req.getParameter("selectClNo");
		
		JasoVO inVO = new JasoVO();
		inVO.setClNo(clNo);
		
		JasoVO outVO = jasoSvc.select(inVO);
		List<JasoCommentVO> cList = jasoCSvc.doRetrieve(inVO);
		
		model.addAttribute("cList",cList);
		model.addAttribute("clNo", outVO.getClNo());
		model.addAttribute("clTitle", outVO.getClTitle());
		model.addAttribute("clSungjang", outVO.getClSungjang());
		model.addAttribute("clSang", outVO.getClSang());
		model.addAttribute("clJangdan", outVO.getClJangdan());
		model.addAttribute("clJiwon", outVO.getClJiwon());
		model.addAttribute("userNick", outVO.getUserNick());
		model.addAttribute("regDt", outVO.getRegDt());
		
		
		return "jaso/jasoView";
	}
	
	@RequestMapping(value="/jaso/jasoUpdateMove.do")
	public String dojasoUpdateMove(@ModelAttribute JasoVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================move=======================");
		
		
		model.addAttribute("clNo", invo.getClNo());
		model.addAttribute("clTitle", invo.getClTitle());
		model.addAttribute("clSungjang", invo.getClSungjang());
		model.addAttribute("clSang", invo.getClSang());
		model.addAttribute("clJangdan", invo.getClJangdan());
		model.addAttribute("clJiwon", invo.getClJiwon());
		model.addAttribute("userNick", invo.getUserNick());
		model.addAttribute("regDt", invo.getRegDt());
		
		
		return "jaso/jasoUpdate";
	}
}
