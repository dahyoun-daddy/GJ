<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="com.sist.gj.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.common.StringUtill"%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<%
String context = request.getContextPath();

String pageSize = "10";
String pageNum = "1";
String searchDiv = "";  //검색구분
String searchWord = ""; //검색어

searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "");
searchWord = StringUtill.nvl(request.getParameter("searchWord"), "");
pageSize = StringUtill.nvl(request.getParameter("pageSize"), "10");
pageNum = StringUtill.nvl(request.getParameter("pageNum"), "1");

int totalCnt = 0;
int bottomCount = 10;

int oPageSize = Integer.parseInt(pageSize);
int oPageNum = Integer.parseInt(pageNum);

String totalCnts = (null == request.getAttribute("totalCnt"))?"10":request.getAttribute("totalCnt").toString();
totalCnt = Integer.parseInt(totalCnts);

List<CodeVO> codeSearch = (null == request.getAttribute("codeSearch"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codeSearch");
List<CodeVO> codePage = (null == request.getAttribute("codePage"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codePage");

UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
String userId = "";

if(null != sessionVO){
	userId = sessionVO.getUserId();
}
%>
<head>
    
</head>
<body>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 메인화면 -->
	<div style=text-align:center>
		<img src="../resources/images/gj_logo_black.png" alt="nav-logo" style="float:center">
	</div>
		<br><br><br>
	<div style="border: 1px solid white; float: left; width: 30%; float: 30%">
	</div>
	<div class="btn-group btn-group-lg" role="group" aria-label="...">
		<form id="frm" name="frm" style="text-align:center;" class="form-inline" >
			<input type="hidden" name="hireNo" id="hireNo">
			<div class="input-group input-group-lg">
			<select class="form-control" id="searchDiv" name="searchDiv">
				  <option value="1">기업명</option>
				  <option value="2">채용제목</option>
				</select>
			</div>
			&nbsp;&nbsp;
		  <div class="input-group input-group-lg">
		    <input type="text" class="form-control" id="searchWord" name="searchWord" placeholder="검색어를 입력하세요">
		  	&nbsp;&nbsp;
		  </div>
		  <div class="btn-group btn-group-lg">
		  <input type="button" class="btn btn-default" onclick="doSearch()" value="검색">
		  </div>
		</form>
    </div>
    	<script type="text/javascript">
		function searchPage(url,pageNum){
			alert("url : "+url+" page_num : "+pageNum);
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}

		function doSearch(){
			var frm = document.frm;
			frm.action="Main.do";
			frm.submit();
		}
		
		$(document).ready(function(){
			//엔터치면 검색
			$("#searchWord").keydown(function(key) {
				if (key.keyCode == 13) {
					doSearch();
				}
			});
		});
</script>
</body>
</html>
