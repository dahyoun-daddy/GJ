<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String context = request.getContextPath();
	String pageSize = "10";
	String pageNum = "1";
	String searchDiv = "";  //검색구분
	String searchWord = ""; //검색어
	
	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "40");
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

<!DOCTYPE html>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<meta name="viewport"
			content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>Good Job</title>
		<!-- Bootstrap CSS -->
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
			integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
			crossorigin="anonymous">
		<link
			href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900"
			rel="stylesheet">
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
			rel="stylesheet">
		<link rel="stylesheet"
			href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
		<link rel="stylesheet" href="../resources/css/animate.css">
		<link rel="stylesheet" href="../resources/css/main.css">
	</head>
<body>
	<!--Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark cyan">
		<div class="container">
			<a class="navbar-brand" href="index.html"> <img
				src="../resources/images/gj_logo.png" alt="nav-logo">
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent-4"
				aria-controls="navbarSupportedContent-4" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent-4">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="GiupReview.jsp">채용정보</a>
					</li>
					<li class="nav-item active"><a class="nav-link">기업정보 </a></li>
					<li class="nav-item"><a class="nav-link"
						href="ReviewUpdate.jsp">자기소개서 <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link">...님 로그인중</a></li>
				</ul>
			</div>
		</div>

	</nav>

	<form name="frm" id="frm" method="get">
	<input type="hidden" name="pageNum" id="pageNum" value="1">
	<input type="hidden" name="userId" id="userId">
		<div class="container">
			<div class="col-xl-9 col-lg-10 mx-auto">
				<div class="bg-faded rounded p-5">
					<div style="float: right;">
						<input type="text" name="searchWord" id="searchWord" value="${param.searchWord}" placeholder="기업 검색하기" maxlength="30">
						<button type="button" class="btn btn-danger btn-sm" onclick="doSearch();">검색</button>
					</div>
					</br> </br>
					<div class="table-responsive">
						<table id="listTable"
							class="table table-striped table-bordered table-hover"
							style="text-align: center; border: 1px;">
							<thead class="bg-warning">
								<tr>
									<th>기업명</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${list.size()>0}">
										<c:forEach var="userVO" items="${list}">
											<tr id="${userVO.userId}">
												<td class="text-center"><c:out value="${userVO.userNick}"></c:out></td>
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
						<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "giupList.do", "searchPage")%>
					</div>
				</div>
			</div>			
		</div>		
	</form>


	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
	<!-- Custom JavaScript -->
	<script src="../resources/js/animate.js"></script>
	<script src="../resources/js/custom.js"></script>
	<script type="text/javascript">
	 function searchPage(url,pageNum){
    	 //alert(url+":search_page:"+page_num);
    	 var frm = document.frm;
    	 frm.pageNum.value = pageNum;
    	 frm.action = url;
    	 frm.submit();
    	 
     }
	 
	 function doSearch(){
     	 var frm = document.frm;
     	 frm.pageNum.value =1;
     	 frm.action = "giupList.do";
     	 frm.submit();
      }
	 
	
	$(document).ready(function(){
		//엔터키 처리
		$("#searchWord").keydown(function(key) {
			if (key.keyCode == 13) {
				doSearch();
			}
		});
		$("#listTable>tbody").on("click","tr",function(){
			
			
			console.log("1 #listTable>tbody");

			var userId = $(this).attr('id');
			console.log("2 userId="+userId);
			alert(userId);
			
			if(""==userId)return;
			
			var frm = document.frm;
			frm.userId.value = userId;
			frm.action = "giupReview.do";
			frm.submit();
			
			
		});//--#listTable>tbody	
	});	//--document ready
	</script>
	
</body>
</html>