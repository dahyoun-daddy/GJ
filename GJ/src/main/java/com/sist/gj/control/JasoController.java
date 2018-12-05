package com.sist.gj.control;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.sist.gj.service.JasoCommentSvc;
import com.sist.gj.service.JasoSvc;

@Controller
public class JasoController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private JasoSvc jasoSvc;
	@Autowired
	private JasoCommentSvc jasoCSvc;
	
}
