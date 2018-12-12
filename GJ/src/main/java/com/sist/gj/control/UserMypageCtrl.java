package com.sist.gj.control;

import java.sql.SQLException;
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
import com.sist.gj.service.MypageSvc;
import com.sist.gj.vo.ApplyVO;
import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.JasoVO;
import com.sist.gj.vo.SearchVO;
import com.sist.gj.vo.UserVO;

@Controller
public class UserMypageCtrl {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	private static final String VIEW_NAME_INFO="mypageUser/UserMyInfo";
	private static final String VIEW_APPLY="mypageUser/UserApply";
	
	@Autowired
	private CodeSvc codeSvc;
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
		
		CodeVO codePage = new CodeVO();
		codePage.setCmId("MY_USER_APPLY");
		
		List<ApplyVO> list = mypageSvc.retrieveApply(invo);
		log.info("list size : "+list.size());
		
		int totalCnt = 0;
		if(null != list  &&  list.size()>0) {
			totalCnt = list.get(0).getTotalCnt();
			
		}
		
		model.addAttribute("code_Page",codeSvc.doRetrieve(codePage));
		model.addAttribute("list",list);
		model.addAttribute("total_cnt",totalCnt);
		
		return VIEW_APPLY;
	}
	
	@RequestMapping(value="mypageUser/cancelApply.do",produces="application/json;charset=utf8",
			        method=RequestMethod.POST)
	@ResponseBody
	public String deleteApply(@ModelAttribute ApplyVO invo, HttpServletRequest req, Model model) throws ClassNotFoundException, SQLException{
		log.info("=====================deleteApply=======================");
		log.info("invo" + invo);
		
		int flag = 0;
		
		JSONObject object = new JSONObject();
		
		flag = mypageSvc.deleteApply(invo);
		
		if(flag > 0) {
			object.put("flag",flag);
			object.put("msg","지원 취소되었습니다.");
		}else {
			object.put("flag",flag);
			object.put("msg","지원 취소 실패.");
		}
		
		String jsonData = object.toJSONString();
		
		return jsonData;
	}
	
	
	
	
	
	
	
	
	
	
}
