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
	<br><br>
	<!-- 메인화면 -->
	<form class="form-horizontal">
	  <div class="form-group">
	    <label for="hireTitle" class="col-sm-2 control-label">채용제목</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireTitle" placeholder="제목을 입력하세요">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="hireContens" class="col-sm-2 control-label">채용내용</label>
	    <div class="col-sm-10">
		    <textarea class="form-control" id="hireContens" rows="10" placeholder="채용 관련 상세정보를 입력하세요"></textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">근무지</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="location" placeholder="사무실 위치를 입력하세요">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="salary" class="col-sm-2 control-label">연봉</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="salary" placeholder="연봉을 입력하세요">
	    </div>
	  </div>  
	  <div class="form-group">
	    <label for="degree" class="col-sm-2 control-label">최종학력</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="degree" placeholder="학력기준을 입력하세요">
	    </div>
	  </div>
	  <br>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="submit" class="btn btn-default">등록하기</button>
	    </div>
	  </div>
	</form>
	
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