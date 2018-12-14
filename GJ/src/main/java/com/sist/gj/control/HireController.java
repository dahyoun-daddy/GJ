package com.sist.gj.control;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.HireSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Controller
public class HireController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="hirelist/HireList";

	@Autowired
	private HireSvc hireSvc;
	@Autowired
	private CodeSvc codeSvc;
	
	//리스트 출력 
	@RequestMapping(value="/hirelist/HireList.do")
	public String search(@ModelAttribute SearchVO invo, Model model) throws Exception {
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
		codeSearch.setCmId("HIRE_SEARCH");
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("PAGING");
		
		List<HireVO> list = hireSvc.search(invo);
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
 
	
	@RequestMapping(value="/hirelist/HireCreate.do")
	public String create(@ModelAttribute HireVO invo, HttpServletRequest req, Model model) throws Exception {
		log.info("=====================INSERT=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		//-----------------------------------
		//아이디 나중에 세션으로 받기
		invo.setUserId("boondll@hanmail.net");
		invo.setRegId("boondll@hanmail.net");
		//-----------------------------------
		
		JSONObject object = new JSONObject();
		
		flag = hireSvc.create(invo);
		
		//일자? 데이터파싱 
		String hireDate = invo.getHireDate();
		String hireDeadline = invo.getHireDeadline();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy/MM/dd");
		Date date = transeFormat.parse(hireDate);
		Date date2 = transeFormat.parse(hireDeadline);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		hireDeadline = notIncludeTime.format(date2);
		
		invo.setHireDate(hireDate);
		invo.setHireDate(hireDeadline);
	
		
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
	
	//게시물목록 클릭했을때 
	@RequestMapping(value="/hirelist/HireView.do")
	public String read(HttpServletRequest req, Model model) throws Exception {
		log.info("=====================read=======================");
		String hireNo = req.getParameter("hireNo");
		
		int num = Integer.parseInt(hireNo);
		
		HireVO inVO = new HireVO();
		inVO.setHireNo(num);
		
		HireVO outVO = hireSvc.read(inVO);
		log.info("final outVO : "+outVO);
		
		model.addAttribute("hireTitle", outVO.getHireTitle());
		model.addAttribute("hireBody", outVO.getHireBody());
		model.addAttribute("hireDate", outVO.getHireDate());
		model.addAttribute("hireDeadline", outVO.getHireDeadline());
		model.addAttribute("userId", outVO.getUserId());
		model.addAttribute("hireAdd", outVO.getHireAdd());
		model.addAttribute("hireSalary", outVO.getHireSalary());
		model.addAttribute("hireEdu", outVO.getHireEdu());
		
		return "hirelist/HireView";
	}
	
	
	@RequestMapping(value="/hirelist/HireUpdate.do")
	public String update(@ModelAttribute HireVO invo, HttpServletRequest req, Model model) throws Exception {
		log.info("=====================UPDATE=======================");
		String hireNo = req.getParameter("hireNo");
		
		int num = Integer.parseInt(hireNo);
		
		HireVO inVO = new HireVO();
		inVO.setHireNo(num);
		
		HireVO outVO = hireSvc.read(inVO);
		log.info("final outVO : "+outVO);
		
		model.addAttribute("hireTitle", outVO.getHireTitle());
		model.addAttribute("hireBody", outVO.getHireBody());
		model.addAttribute("hireDate", outVO.getHireDate());
		model.addAttribute("hireDeadline", outVO.getHireDeadline());
		model.addAttribute("userId", outVO.getUserId());
		model.addAttribute("hireAdd", outVO.getHireAdd());
		model.addAttribute("hireSalary", outVO.getHireSalary());
		model.addAttribute("hireEdu", outVO.getHireEdu());
		
		return "hirelist/HireUpdate";
	}
}
