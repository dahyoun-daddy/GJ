package com.sist.gj.control;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.JasoSvc;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;

@Controller
public class JasoController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME="jaso/jasoList";
	
	@Autowired
	private JasoSvc jasoSvc;
	@Autowired
	private JasoCommentSvc jasoCSvc;
	
	@RequestMapping(value="/jaso/jaso.do")
	public String doRetrieve(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
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
		
		List<JasoVO> list = jasoSvc.doRetrieve(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		return VIEW_NAME;
	}
}
