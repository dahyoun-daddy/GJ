package com.sist.gj.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sist.gj.vo.CodeVO;
import com.sist.gj.vo.DTO;


public class StringUtill {
	private static final Logger log = LoggerFactory.getLogger(StringUtill.class);
	
	/**
	 * 난수생성
	 * @return
	 */
	public static String getUUID() {
		String uuid = "";
		uuid = UUID.randomUUID().toString().replaceAll("-","");
		log.debug("getUUID : "+uuid);
		return uuid;
	}
	
	public static String currDate(String format) {
		if(null == format  ||  format.equals("")) {
			format = "yyyyMMdd";
		}
		Date date = new Date();
		
		SimpleDateFormat sdf = new SimpleDateFormat(format);
		
		String dateStr = sdf.format(date);
		
		log.debug("format : "+format);
		log.debug("dateStr : "+dateStr);
		return dateStr;
	}
	
	/**
	   * Paging처리 
	   * @param maxNum_i
	   * @param currPageNoIn_i
	   * @param rowsPerPage_i
	   * @param bottomCount_i
	   * @param url_i
	   * @param scriptName_i
	   * @return
	   */
	public static String renderPaging(int maxNum_i, int currPageNoIn_i, int rowsPerPage_i, int bottomCount_i, String url_i, String scriptName_i) {
	   int maxNum = 0; // 총 갯수
	   int currPageNo = 1; // 현재 페이지 번호 : page_num
	   int rowPerPage = 10; // 한페이지에 보여질 행수 : page_size
	   int bottomCount = 10; // 바닥에 보여질 페이지 수: 10

	   maxNum = maxNum_i;
	   currPageNo = currPageNoIn_i;
	   rowPerPage = rowsPerPage_i;
	   bottomCount = bottomCount_i;

	   String url = url_i; // 호출 URL
	   String scriptName = scriptName_i; // 호출 자바스크립트

	   int maxPageNo = ((maxNum - 1) / rowPerPage) + 1;
	   int startPageNo = ((currPageNo - 1) / bottomCount) * bottomCount + 1;//
	   int endPageNo = ((currPageNo - 1) / bottomCount + 1) * bottomCount;
	   int nowBlockNo = ((currPageNo - 1) / bottomCount) + 1;
	   int maxBlockNo = ((maxNum - 1) / bottomCount) + 1;

	   int inx = 0;
	   StringBuilder html = new StringBuilder();
	   if (currPageNo > maxPageNo) {
		   return "";
	   }

	   html.append("<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">   \n");
	   html.append("<tr>                       \n");
	   html.append("<td align=\"center\">                                                                    \n");
	   //html.append("<ul class=\"pagination pagination-sm\">                                                  \n");
	   // <<
	   if (nowBlockNo > 1 && nowBlockNo <= maxBlockNo) {
		   html.append("<a href=\"javascript:" + scriptName + "( '" + url+ "', 1 );\">  \n");
		   html.append("&laquo;   \n");
		   html.append("</a>      \n");
	   }

	   // <
	   if (startPageNo > bottomCount) {
		   html.append("<a href=\"javascript:" + scriptName + "( '" + url + "'," + (startPageNo - 1)+ ");\"> \n");
		   html.append("<        \n");
		   html.append("</a>     \n");
	   }


	   // 1 2 3 ... 10 (숫자보여주기)
	   for (inx = startPageNo; inx <= maxPageNo && inx <= endPageNo; inx++) {
	    
		   if (inx == currPageNo) {
			   html.append("<b>" + inx + "</b> &nbsp;&nbsp; \n");
		   } else {
			   html.append("<a href=\"javascript:" + scriptName + "('" + url + "'," + inx+ ");\" >" + inx + "</a> &nbsp;&nbsp; \n");
		   }
	   }
	   
	   // >
	   if (maxPageNo >= inx) {
		   html.append("<a href=\"javascript:" + scriptName + "('" + url + "',"+ ((nowBlockNo * bottomCount) + 1) + ");\"> \n");
		   html.append(">                       \n");
		   html.append("</a>              \n");
	   }

	   // >>
	   if (maxPageNo >= inx) {
		   html.append("<a href=\"javascript:" + scriptName + "('" + url + "'," + maxPageNo+ ");\">      \n");
		   html.append("&raquo;     \n");
		   html.append("</a>    \n");
	   }

	   html.append("</td>   \n");
	   html.append("</tr>   \n");
	   html.append("</table>   \n");

	   return html.toString();
	  }
	
	public static String makeSelectBox(List<CodeVO> list,String selectCode,String selectNm,boolean allYN){
		StringBuilder sb=new StringBuilder();
		sb.append("<select name='"+selectNm+"' id='"+selectNm+"' class=\"form-control input-sm\">\n");		
		//전체
		if(true == allYN){
			sb.append("<option value=''>::전체::</option> \n");
		}
		//내용
		for(CodeVO in:list){
			CodeVO dto = (CodeVO) in;
			sb.append("<option value='"+dto.getCdId()+"'"   );
			//selected
			if(selectCode.equals(dto.getCdId())){
				sb.append(" selected='selected' ");
			}
			sb.append(">");
			sb.append(dto.getCdNm());
			sb.append("</option> \n");
				
		}
		
		sb.append("</select> \n");
		return sb.toString();
	}
	
	/**
	 * String을 nvl 처리해준다.
	 * @param str
	 * @param defval
	 * @return
	 */
	public static String nvl(Object str, String defval){
		String retStr = "";
		
		if(null == str){
			retStr = defval;
		}else{
			retStr = str.toString().trim();
		}
		
		return retStr;
	}
}
