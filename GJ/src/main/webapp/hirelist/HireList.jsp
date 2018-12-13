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
%>
<head>

</head>

<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 채용정보 목록 -->
		<div class="row" style="float: right;">&nbsp;&nbsp;&nbsp;
		<br><br><br>
			<form class="form-inline" >
				<input type="hidden" name="pageNum" id="pageNum">
				<%=StringUtill.makeSelectBox(codeSearch, searchDiv, "searchDiv", false) %>
				&nbsp;&nbsp;
			  <div class="form-group">
			    <input type="text" name="searchWord" id="searchWord" value="${param.searchWord}" class="form-control input-sm" placeholder="검색어"/>
			  	&nbsp;&nbsp;
			  </div>
			  <button type="submit" class="btn btn-default">검색</button>
			</form>
		</div>
		<br>
		<table class="table table-striped">
              <thead>
                <tr>
                  <th class="text-center">기업명</th>
                  <th class="text-center">채용제목</th>
                  <th class="text-center">시작일자</th>
                  <th class="text-center">마감일자</th>
                  <th class="text-center">근무지</th>
                  <th class="text-center">학력</th>
                </tr>
              </thead>
              <tbody>
              	<!-- JSTL사용 반복문-->
              	<c:choose>
  						<c:when test="${list.size()>0}">
  							<c:forEach var="hireVO" items="${list}">
  								<tr id="${HireVO.hireNo}">
  									<td class="text-center"><c:out  value="${hireVO.userId}"/></td>
  									<td class="text-center"><c:out  value="${hireVO.hireTitle}"/></td>
  									<td class="text-center"><c:out  value="${hireVO.hireDate}"/></td>
  									<td class="text-center"><c:out  value="${hireVO.hireDeadline}"/></td>	
  									<td class="text-center"><c:out  value="${hireVO.hireAdd}"/></td>	
  									<td class="text-center"><c:out  value="${hireVO.hireEdu}"/></td>
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
            <br><br>
            <div class="dorm-inline text-center">
			  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "jasoList.do", "searchPage") %>
			  </div>
	<!--// 채용정보 목록 -->
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="../resources/js/animate.js"></script>
    <script src="../resources/js/custom.js"></script>
</body>
</html>