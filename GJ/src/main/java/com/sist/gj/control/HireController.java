package com.sist.gj.control;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Date;
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

import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.HireSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.service.MypageSvc;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.JasoCommentVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Controller
public class HireController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="hirelist/HireList";

	@Autowired
	private HireSvc hireSvc;
	@Autowired
	private CodeSvc codeSvc;
	@Autowired
	private MypageSvc mypageSvc;
	
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
		String message = null;
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
 
	
	@RequestMapping(value="/hirelist/HireCreate.do",produces="application/json;charset=utf8")
	@ResponseBody
	public String create(@ModelAttribute HireVO invo, HttpSession ses, HttpServletRequest req, Model model) throws Exception {
		log.info("=====================INSERT=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		//세션 : 로그인 된 상태에서만 등록 가능
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		
		String loginId = sessionVO.getUserId();
		log.info("=================");
		log.info("==loginId=============="+loginId);
		invo.setRegId(loginId);
		invo.setUserId(loginId);
		//-------------------------------------
		
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
	
	//게시물목록 클릭했을때 조회화면
	@RequestMapping(value="/hirelist/HireView.do")
	public String read(HttpServletRequest req, Model model) throws Exception {
		log.info("=====================read=======================");
		String hireNo = req.getParameter("hireNo");
		
		int num = Integer.parseInt(hireNo);
		
		HireVO inVO = new HireVO();
		inVO.setHireNo(num);
		
		HireVO outVO = hireSvc.read(inVO);
		log.info("final outVO : "+outVO);
		
		String hireDate = outVO.getHireDate();
		String hireDeadline = outVO.getHireDeadline();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = transeFormat.parse(hireDate);
		Date date2 = transeFormat.parse(hireDeadline);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		hireDeadline = notIncludeTime.format(date2);
		
		model.addAttribute("hireTitle", outVO.getHireTitle());
		model.addAttribute("hireBody", outVO.getHireBody());
		model.addAttribute("hireDate", hireDate);
		model.addAttribute("hireDeadline", hireDeadline);
		model.addAttribute("userNick", outVO.getUserNick());
		model.addAttribute("hireAdd", outVO.getHireAdd());
		model.addAttribute("hireSalary", outVO.getHireSalary());
		model.addAttribute("hireEdu", outVO.getHireEdu());
		model.addAttribute("userId", outVO.getUserId());
		
		
		return "hirelist/HireView";
	}
	
	//수정할 정보 출력
	@RequestMapping(value="/hirelist/HireUpdate.do",method=RequestMethod.POST)
	public String update(@ModelAttribute HireVO invo, HttpSession ses, HttpServletRequest req, Model model) throws Exception {
		log.info("=====================UPDATE=======================");
		String hireNo = req.getParameter("hireNo");
		log.info("hireNo : "+hireNo);
		
		//세션 : 로그인 된 상태에서만 수정가능
		UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
		
		String loginId = sessionVO.getUserId();
		invo.setRegId(loginId);
		//-------------------------------------
		
		int num = Integer.parseInt(hireNo);
		
		HireVO inVO = new HireVO();
		inVO.setHireNo(num);
		
		HireVO outVO = hireSvc.read(inVO);
		log.info("final outVO : "+outVO);
		
		String hireDate = outVO.getHireDate();
		String hireDeadline = outVO.getHireDeadline();
		SimpleDateFormat transeFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = transeFormat.parse(hireDate);
		Date date2 = transeFormat.parse(hireDeadline);
		
		SimpleDateFormat notIncludeTime = new SimpleDateFormat("yyyy/MM/dd");
		hireDate = notIncludeTime.format(date);
		hireDeadline = notIncludeTime.format(date);
		
		model.addAttribute("hireNo", outVO.getHireNo());
		model.addAttribute("hireTitle", outVO.getHireTitle());
		model.addAttribute("hireBody", outVO.getHireBody());
		model.addAttribute("hireDate", hireDate);
		model.addAttribute("hireDeadline", hireDeadline);
		model.addAttribute("userId", outVO.getUserId());
		model.addAttribute("hireAdd", outVO.getHireAdd());
		model.addAttribute("hireSalary", outVO.getHireSalary());
		model.addAttribute("hireEdu", outVO.getHireEdu());
		
		return "hirelist/HireUpdate";
		}
		
		//수정기능 실행
		@RequestMapping(value="/hirelist/HireUpdate.do",
				 produces="application/json;charset=utf8",
				 method={RequestMethod.GET, RequestMethod.POST}
               )		
		@ResponseBody
		public String edit(@ModelAttribute HireVO invo, HttpServletRequest req,Model model) throws Exception {
			
			log.info("2========================");
			log.info("invo="+invo);
			log.info("2========================");	
			
			int flag = 0;
			log.info("flag");
		
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
			
			//수정		
			flag = hireSvc.update(invo);
			
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
		
		@RequestMapping(value="/hirelist/HireApply.do", produces="application/json;charset=utf8",
				 method={RequestMethod.GET, RequestMethod.POST}
	               )		
			@ResponseBody
		public String apply(@ModelAttribute ApplyVO invo, HttpSession ses, HttpServletRequest req, Model model) throws Exception {
			log.info("=====================APPLY=======================");
			log.info("invo" + invo);
			
			int flag = 0;
			
			//세션 : 로그인 된 상태에서만 수정가능
			UserVO sessionVO = (UserVO) ses.getAttribute("loginVo");
			
			String loginId = sessionVO.getUserId();
			invo.setUserId(loginId);
			//-------------------------------------
			
			JSONObject object = new JSONObject();
			
			flag = mypageSvc.addApply(invo);
			
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
		
}
