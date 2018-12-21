package com.sist.gj.common;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.ParserConfigurationException;


import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.sist.gj.vo.ApiVO;

public class apitPasing {
	private static String getTagValue(String tag, Element eElement) {
	    NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
	    Node nValue = (Node) nlList.item(0);
	    if(nValue == null) 
	        return null;
	    return nValue.getNodeValue();
	}

	
	public List<ApiVO> apiList() throws IOException, ParserConfigurationException, SAXException {
		int start = 0;
		List<ApiVO> list = new ArrayList<ApiVO>();
		while(true){
			String url = "http://api.saramin.co.kr/job-search?keywords=it&start="+start;
			
			DocumentBuilderFactory dbFactoty = DocumentBuilderFactory.newInstance();
			DocumentBuilder dBuilder = dbFactoty.newDocumentBuilder();
			Document doc = dBuilder.parse(url);

			// root tag 
			doc.getDocumentElement().normalize();
			//System.out.println("Root element: " + doc.getDocumentElement().getNodeName()); // Root element: result
			
			NodeList nList = doc.getElementsByTagName("job");
			//System.out.println("파싱할 리스트 수 : "+ nList.getLength());
			
			for(int temp = 0; temp < nList.getLength(); temp++){
				Node nNode = nList.item(temp);
				if(nNode.getNodeType() == Node.ELEMENT_NODE){
					Element eElement = (Element) nNode;
					
					ApiVO outVO = new ApiVO();
					outVO.setName(getTagValue("name", eElement));
					outVO.setJobType(getTagValue("job-type", eElement));
					outVO.setExperienceLevel(getTagValue("experience-level", eElement));
					outVO.setJobCategory(getTagValue("job-category", eElement));
					outVO.setRequiredEducationLevel(getTagValue("required-education-level", eElement));
					outVO.setSalary(getTagValue("salary", eElement));
					
					list.add(outVO);
				}	// for end
			}	// if end
			
			start += 10;
			
			if(nList.getLength() == 0) {
				break;
			}
		}
		
		return list;
	}
	
	public Map<String, Integer> check(List<String> data) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		for(int i=0;i<data.size();i++) {
			
			//키가 들어가있다면
			if(map.containsKey(data.get(i))) {
				int num = map.get(data.get(i));
				num = num+1;
				map.put(data.get(i), num);
			//안들어가 있다면(처음이면)
			}else {
				map.put(data.get(i), 1);
			}
			
		}
		
		//System.out.println(map.toString());
		return map;
	}
}
