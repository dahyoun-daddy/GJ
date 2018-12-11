package com.sist.gj.control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sist.gj.service.CodeSvc;


@Controller
public class CodeController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CodeSvc codeSvc;

}
