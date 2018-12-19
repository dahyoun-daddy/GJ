<%@page import="com.sist.gj.vo.UserVO"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String context = request.getContextPath();

	String pageSize = "5";
	String pageNum = "1";
	String searchDiv = "";  //검색구분
	String searchWord = ""; //검색어
	
	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "");
	searchWord = StringUtill.nvl(request.getParameter("searchWord"), "");
	pageSize = StringUtill.nvl(request.getParameter("pageSize"), "5");
	pageNum = StringUtill.nvl(request.getParameter("pageNum"), "1");
	
	int totalCnt = 0;
	int bottomCount = 10;
	
	int oPageSize = Integer.parseInt(pageSize);
	int oPageNum = Integer.parseInt(pageNum);
	
	String totalCnts = (null == request.getAttribute("totalCnt"))?"5":request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(totalCnts);
	
	List<CodeVO> codeSearch = (null == request.getAttribute("codeSearch"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codeSearch");
	List<CodeVO> codePage = (null == request.getAttribute("codePage"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codePage");
%>

<% 
	UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
	String user = "";
	String userNick = "";
	
	if(null != sessionVO){
		user = sessionVO.getUserId();
		userNick = sessionVO.getUserNick();
	}
	request.setAttribute("user", user);
%>
    
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Good Job</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    <link rel="stylesheet" href="../resources/css/main.css?after">
    
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="../resources/js/animate.js"></script>
    <script src="../resources/js/custom.js"></script>
    
    <style type="text/css">
	  label {
	  	line-height: 0.5em; 
	  	font-size: 80%; 
	  	font-weight: bold;
	  	bottom: 1px;  
	  }
	
	</style>
    
</head>
<body>
	<!--Navbar -->
    <jsp:include page="../common/top.jsp" flush="false"></jsp:include>
    
       <!-- 기업 상세정보 -------------------------------  -->
	    <div class="container">
		<div class="col-xl-12 col-lg-12 mx-auto">
				<div style="border: 1px solid gold; height:40px; float: left; width: 10%;">
				</div>
				<div style="border: 1px solid red; height:40px; float: left; width: 90%;">
				 <span style="font-size: 1.5em; font-weight: bold; color: green;"></span>
				</div>
				
				<div style="border: 1px solid gold; height:40px; float: left; width: 10%;">
				</div>
				<div style="border: 1px solid red; height:40px; float: left; width: 90%;">
				 <span style="font-size: 1.5em; font-weight: bold; color: green;">${company.userNick}</span>
				</div>
				
				<div style="border: 1px solid gold; float: left; height:180px; width: 10%;">
				<img src="../resources/images/bono.jpeg" height="180px" style='width: 100%; object-fit: contain'>
				</div>
				<div style="border: 1px solid red; float: left; height:180px; width: 10%;">
					<label style="line-height: 1.5em;">설립일 </label>
					</br>
					<label>사원수 </label>
					</br>
					<label>연매출액 </label>
					</br>
					<label>대표 </label>
					</br>
					<label>주소 </label>
					</br>
					<label>전화번호 </label>				 
				</div>
				<div style="border: 1px solid red; float: left; height:100px; width: 10%;">
					<label style="line-height: 1.2em;">2018/11/28 </label>
					</br>
					<label>${company.enterCnt}명</label>
					</br>
					<label>${company.enterSalay}억 </label>
					</br>
					<label>${company.userName}</label>	
				</div>
				<div style="border: 1px solid red; float: left; height:100px; width: 7%;">
					<label style="line-height:2.3em">리뷰 평점</label>
				</div>
				<div style="border: 1px solid red; float: left; height:100px; width: 63%;">
					<label class="starRev">
						  <span id="0" class="starR1 on">1</span>
						  <span id="1" class="starR2">2</span>
						  <span id="2" class="starR1">3</span>
						  <span id="3" class="starR2">4</span>
						  <span id="4" class="starR1">5</span>
						  <span id="5" class="starR2">6</span>
						  <span id="6" class="starR1">7</span>
						  <span id="7" class="starR2">8</span>
						  <span id="8" class="starR1">9</span>
						  <span id="9" class="starR2">10</span>
						  <script type="text/javascript">
						    $("#<%=request.getAttribute("star") %>").addClass('on').prevAll('span').addClass('on');
						  </script>						  
					</label>
					
				</div>
		
				<div style="line-height: 1.2em; border: 1px solid red; float: left; height:80px; width: 60%;">
					</br>
					<label style="line-height: 1.7;">${company.userAdd}</label>
					</br>
					<label style="line-height: 0.8;">${company.userPhone} </label>
					
				</div>
				<div style="border: 1px solid red; float: right; height:47px; width: 20%;">	
				</div>
				
				<div style="border: 1px solid red; float: right; height:33px; width: 20%;">
						<button id="doWrite" name="doWrite" style="float: right;" type="button" class="btn btn-danger btn-sm" value="doWrite" onclick="doWrite();">면접리뷰 작성하기</button>
				</div>
   			<!-- 면접리뷰 -------------------------------  -->
			<form name="frm" id="frm" method="get">
			  <c:choose>
			    <c:when test="${list.size()>0}">
			      <c:forEach var="reviewVO" items="${list}">
							<div style="border: 1px solid red; float: left; height:20px; width: 100%;">
							</div>
							<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 80%;">
							 <div>
								 <label style="margin-top: 1%;" class="starRev">
									  <span id="${reviewVO.reviewNo}0" class="starR11 on">1</span>
									  <span id="${reviewVO.reviewNo}1" class="starR22">2</span>
									  <span id="${reviewVO.reviewNo}2" class="starR11">3</span>
									  <span id="${reviewVO.reviewNo}3" class="starR22">4</span>
									  <span id="${reviewVO.reviewNo}4" class="starR11">5</span>
									  <span id="${reviewVO.reviewNo}5" class="starR22">6</span>
									  <span id="${reviewVO.reviewNo}6" class="starR11">7</span>
									  <span id="${reviewVO.reviewNo}7" class="starR22">8</span>
									  <span id="${reviewVO.reviewNo}8" class="starR11">9</span>
									  <span id="${reviewVO.reviewNo}9" class="starR22">10</span>
									  <script type="text/javascript">
									    $("#${reviewVO.reviewPoint}").addClass('on').prevAll('span').addClass('on');
									  </script>						  
								</label>
							  </div>
							</div>
							<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 20%;">
						 		<button id="doComplain" name="doComplain" style="float: right;" type="button" class="doComplain btn btn-danger btn-sm" value="${reviewVO.reviewNo}">신고하기</button>
								<button <c:if test="${user != reviewVO.regId}">style="display:none;"</c:if> id="doUpdate" name="doUpdate" style="float: right; margin-right: 1px" type="button" class="doUpdate btn btn-danger btn-sm" value="${reviewVO.reviewNo}">수정하기</button>
								<button <c:if test="${user != reviewVO.regId}">style="display:none;"</c:if> id="doDelete" name="doDelete" style="float: right; margin-right: 1px" type="button" class="doDelete btn btn-danger btn-sm" value="${reviewVO.reviewNo}">삭제하기</button>
							</div>
							<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
								<label style="font-size:1em; color: #DBA901;">${reviewVO.reviewTitle}</label>
								
							</div>
							<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:40px; width: 20%;">
								<span style="float: right; font-size: 80%;">작성일 : ${reviewVO.regDt}</span> 
							</div>
							
							<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
								${reviewVO.reviewBody}
							</div>
							<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">			
							</div>
							<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">							    
							</div>
							
							
							<div style="border: 1px solid red; float: left; height:30px; width: 80%;">
							</div>
							<div style="border: 1px solid red; float: left; height:30px; width: 20%;">
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td class="text-center" colspan="99">등록된 게시글이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
						
			<!-- // 면접리뷰 -------------------------------  -->
   		</div>
   	</div>
   	
   	<div class="dorm-inline text-center">
			<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "giupReview.do", "searchPage")%>
	</div>
	<input type="hidden" name="pageNum" id="pageNum" value="1">
	<input type="hidden" name="userId" id="userId" value="${company.userId}">
	<input type="hidden" name="reviewNo" id="reviewNo" value="" />
	<input type="hidden" name="reviewNo2" id="reviewNo2" value="" />
	<input type="hidden" name="upsertDiv" id="upsertDiv" value="" />
	<input type="hidden" name="userNick" id="userNick" value="${company.userNick}" />
	</form>
	
   	<!-- // 기업 상세정보 -------------------------------  -->
   	
	

    <script type="text/javascript">
	 function doWrite(){
    	 //alert(url+":search_page:"+page_num);
    	 if("${user}" == null || "${user}" == ""){
    		 alert("로그인을 하시죠?");
    		 return;
    	 }
    	 
    	 var frm = document.frm;
    	 var upsertDiv = $("#doWrite").val();
    	 frm.upsertDiv.value = upsertDiv;
    	 frm.action = "reviewUpdate.do";
    	 frm.submit();
    	 
     }
	 
	 function searchPage(url,pageNum){
    	 //alert(url+":search_page:"+page_num);
    	 var frm = document.frm;
    	 frm.pageNum.value = pageNum;
    	 frm.action = url;
    	 frm.submit();
    	 
     }
	 
    
    $(document).ready(function(){ 
    	$(".doUpdate").on("click",function(){
			//alert("doComplain");
			
			var reviewNo = $(this).val();
			alert(reviewNo);
			
			if(false==confirm("수정 하시겠습니까?"))return;			
			var frm = document.frm;
			
	    	frm.upsertDiv.value = "doUpdate";
			frm.reviewNo.value =reviewNo;
			frm.action = "reviewUpdate.do";
			frm.submit();
			
		});//--doUpdate
    	
    	$(".doDelete").on("click",function(){
			//alert("doComplain");
			
			var reviewNo = $(this).val();
			
			if(false==confirm("삭제 하시겠습니까?"))return;
			
			var frm = document.frm;
			frm.reviewNo.value =reviewNo;
			frm.action = "giupReview.do";
			frm.submit();
			
		});//--do_delete
		
		$(".doComplain").on("click",function(){
			//alert("doComplain");
			if("${user}" == null || "${user}" == ""){
	    		 alert("로그인을 하시죠?");
	    		 return;
	    	}
			 
			if(false==confirm("신고 하시겠습니까?"))return;
			
			var reviewNo2 = $(this).val();
							
			$.ajax({
		         type:"POST",
		         url:"complain.do",
		         dataType:"html",// JSON
		         data:{
		         	"reviewNo2": reviewNo2,
		         },
		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
		             var parseData = $.parseJSON(data);
		         	 if(parseData.flag=="1"){
		         		alert(parseData.message);
		         	 }else{
		         		alert(parseData.message);
		         	 }
		         },
		         complete: function(data){//무조건 수행
		          
		         },
		         error: function(xhr,status,error){
		          
		         }
		    });//--ajax		
			
		});//--do_delete
    	
    	
    });	
    </script>


</body>
</html>