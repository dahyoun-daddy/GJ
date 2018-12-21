package com.sist.gj.control;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.gj.service.CodeSvc;
import com.sist.gj.service.HireSvc;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.HireVO;
import com.sist.gj.vo.SearchVO;

@Controller
public class MainController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="hirelist/HireList";
	
	@Autowired
	private HireSvc hireSvc;
	@Autowired
	private CodeSvc codeSvc;
	
	//메인페이지 띄우기
	@RequestMapping(value="hirelist/Start.do")
	public String view(@ModelAttribute SearchVO invo, Model model) throws Exception {
		log.debug("search : "+invo);
		
		CodeVO codeSearch = new CodeVO();
		codeSearch.setCmId("HIRE_SEARCH");
		
		model.addAttribute("codeSearch",codeSvc.doRetrieve(codeSearch));
		model.addAttribute("param",invo);
		
		return "hirelist/Main";
	}
	
	//검색
	@RequestMapping(value="hirelist/Main.do")
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
		
		log.info("=======================");
//		log.info("totalCnt"+list.get(0).getTotalCnt());
		log.info("=======================");
		
		return VIEW_NAME;
	}
	
}
