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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.gj.service.MypageSvc;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Controller
public class UserMypageCtrl {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME_INFO="mypageUser/UserMyInfo";
	private static final String VIEW_APPLY="mypageUser/UserApply";
	
	@Autowired
	private MypageSvc mypageSvc;
	
/*	UserSvc 나와야지 수행 가능함
 *  @Autowired
	private UserSvc userSvc;
	
	@RequestMapping(value="/mypageUser/UserMyInfo.do")
	public String select(@ModelAttribute UserVO invo, Model model) {
		log.info("UserVO: "+invo);
		
		model.addAttribute("param",invo);
		
		
		return VIEW_NAME_INFO;
	}*/
	
	@RequestMapping(value="mypageUser/UserApply.do")
	public String retrieveApply(@ModelAttribute SearchVO invo, Model model) throws ClassNotFoundException, SQLException {
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
		
		List<ApplyVO> list = mypageSvc.retrieveApply(invo);
		log.info("list size : "+list.size());
		model.addAttribute("list",list);
		
		return VIEW_APPLY;
	}
	
	
	
	
	
	
	
	
	
	
}
