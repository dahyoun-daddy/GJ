package com.sist.gj.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.ParserConfigurationException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xml.sax.SAXException;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.sist.gj.common.apitPasing;
import com.sist.gj.vo.ApiVO;

@Controller
public class ChartController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	apitPasing api = new apitPasing();
	
	private static final String VIEW_LINE="/chart/salary";
	  
	
	@RequestMapping(value="/chart/salaryview.do")	
	public String dopieChart() throws ClassNotFoundException, SQLException {	
		log.info("-----------salary-------------");
		return VIEW_LINE;
	}	
	
	@RequestMapping(value="/chart/salary.do",method=RequestMethod.GET
			,consumes= {"text/plain", "application/*"}
			,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String selectUserInfo(HttpServletRequest req ,Model model) throws ClassNotFoundException, SQLException, IOException, ParserConfigurationException, SAXException {
		List<ApiVO> list = api.apiList();
		
		List<String> list2 = new ArrayList<String>();
		for(int i=0;i<list.size();i++) {
			String sal = list.get(i).getSalary();
			list2.add(sal);
			//System.out.println(sal);
		}
		
		Map<String,Integer> map = api.check(list2);
		Gson gson=new Gson();
		JsonArray jArray = new JsonArray();//배열이 필요할때
		
		for(String key : map.keySet()) {
			JsonArray sArray = new JsonArray();//배열 내에 들어갈 j
			sArray.add(key);
			sArray.add(map.get(key));
			jArray.add(sArray);
		}
		  
		log.debug("=result="+jArray.toString());
		  
		return jArray.toString();
	}
	
}
