package com.sist.gj.control;

import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sist.gj.service.CodeSvc;
import com.sist.gj.vo.CodeVO;


@Controller
public class CodeController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CodeSvc codeSvc;
	
	@RequestMapping(value="/code/select_one.do",method=RequestMethod.GET)
	public String do_retrieve(CodeVO dto,Model model) throws ClassNotFoundException, SQLException {
		log.debug("do_select param : "+dto);
		model.addAttribute("list",codeSvc.doRetrieve(dto));
		return "code/code";
	}
}
