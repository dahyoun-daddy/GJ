<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
%>
<head>
    
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br/>
	<br/>
	<div class="container">
		<form name="frm" id="frm" method="get">
		<input type="hidden" name="pageNum" id="pageNum">
		<input type="hidden" name="selectClNo" id="selectClNo">
  		<!-- --검색영역 -->
  			<div class="row" style="float: right;">
  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
  					<div class="form-group" > 
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(codePage, pageSize, "pageSize", false) %>
  						</div>
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(codeSearch, searchDiv, "searchDiv", false) %>
  						</div>
  						<div style="float: left; width: 33%;">
  							<input type="text" name="searchWord" id="searchWord" value="${param.searchWord}" class="form-control input-sm" placeholder="검색어"/>
  						</div>
  					</div>
  		  		</div>
  		  		<div class="form-group">
  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
  					<button type="button" class="btn btn-default btn-sm" id="doSave" >등록</button>
  				</div>
  			</div>
		</form>
	</div>
	<div class="table-responsive" align="center">
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
		  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
		  		<colgroup>
		  			<col width="20%"/>
		  			<col width="60%"/>
		  			<col width="20%"/>
		  		</colgroup>
		  		<thead class="bg-primary">
		  		<tr>
		  			<th class="text-center">작성자</th>
		  			<th class="text-center">자기소개서 제목</th>
		  			<th class="text-center">작성일</th>
		  		</tr>
		  		</thead>
		  		<tbody>
		  			<c:choose>
  						<c:when test="${list.size()>0}">
  							<c:forEach var="jasoVO" items="${list}">
  								<tr id="${jasoVO.clNo}">
  									<td class="text-center"><c:out  value="${jasoVO.userNick}"/></td>
  									<td class="text-left"><c:out value="${jasoVO.clTitle}"/></td>
  									<td class="text-center"><c:out value="${jasoVO.regDt}"/></td>
  								</tr>
  							</c:forEach>
  						</c:when>
 	 					<c:otherwise>
 	 						<tr>
 	 							<td class="text-center" colspan="99">등록된 게시글이 없습니다.</td>
 	 						</tr>
  						</c:otherwise>
  					</c:choose>
		  		</tbody>
		  	</table>
	  	</div> 
	  	<div class="dorm-inline text-center">
	  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "jasoList.do", "searchPage") %>
	  	</div>
  	</div>
  	<!-- Grid영역종료 -->
	<script type="text/javascript">
		function searchPage(url,pageNum){
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}	
	
		function doSearch(){
    		var frm = document.frm;
    		frm.pageNum.value = 1;
    		frm.action="jasoList.do";
    		frm.submit();
    	}
		 
		function doSelect(clNo){
			var frm = document.frm;
    		frm.selectClNo.value = clNo;
    		frm.action="jasoView.do";
    		frm.submit();
		}
		
		$(document).ready(function(){
			//엔터키 처리
			$("#searchWord").keydown(function(key) {
				if (key.keyCode == 13) {
					doSearch();
				}
			});

			//등록페이지 이동
			$("#doSave").on("click",function(){
				//alert("ready");
				location.href = "jasoUpdate.jsp";
			});
			
			$("#listTable>tbody").on("click","tr",function(){
				//alert("ready");
				var clNo = $(this).attr('id');
    			//alert(clNo);
    			
    			if("" == clNo){
    				return;
    			}
    			
    			doSelect(clNo);
			});
		});
	</script>
</body>
</html>