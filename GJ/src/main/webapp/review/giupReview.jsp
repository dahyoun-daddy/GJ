<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
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
	
	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "20");
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
    <nav class="navbar navbar-expand-lg navbar-dark cyan">
        <div class="container">
            <a class="navbar-brand" href="jasoTest2.jsp">
            <img src="../resources/images/gj_logo.png" alt="nav-logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link">Home</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link">채용정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jasoTest.jsp">기업정보 </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="jasoTest3.jsp">자기소개서 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">...님 로그인중</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
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
				 <span style="font-size: 1.5em; font-weight: bold; color: green;">(주) 우아한 형제들</span>
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
					<label>1000명</label>
					</br>
					<label>1000억 </label>
					</br>
					<label>김준혁</label>	
				</div>
				<div style="border: 1px solid red; float: left; height:100px; width: 7%;">
					<label style="line-height:2.3em">리뷰 평점</label>
				</div>
				<div style="border: 1px solid red; float: left; height:100px; width: 63%;">
					<label class="starRev">
						  <span id="1" class="starR1 on">1</span>
						  <span id="2" class="starR2">2</span>
						  <span id="3" class="starR1">3</span>
						  <span id="4" class="starR2">4</span>
						  <span id="5" class="starR1">5</span>
						  <span id="6" class="starR2">6</span>
						  <span id="7" class="starR1">7</span>
						  <span id="8" class="starR2">8</span>
						  <span id="9" class="starR1">9</span>
						  <span id="10" class="starR2">10</span>
						  <script type="text/javascript">
						    $("#4").addClass('on').prevAll('span').addClass('on');
						  </script>						  
					</label>
					
				</div>
		
				<div style="line-height: 1.2em; border: 1px solid red; float: left; height:80px; width: 60%;">
					</br>
					<label style="line-height: 1.7;">경기도 고양시 일산동구 중산로 101 하늘마을</label>
					</br>
					<label style="line-height: 0.8;">010-6889-6689 </label>
					
				</div>
				<div style="border: 1px solid red; float: right; height:47px; width: 20%;">	
				</div>
				<div style="border: 1px solid red; float: right; height:33px; width: 20%;">
					<button style="float: right;" type="button" class="btn btn-danger btn-sm">면접리뷰 작성하기</button>
				</div>
   			<!-- 면접리뷰 -------------------------------  -->
<form name="frm" id="frm" method="get">
  <c:choose>
    <c:when test="${company!=null}">
      <c:forEach var="userVO" items="${company}">
				<div style="border: 1px solid red; float: left; height:20px; width: 100%;">
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 80%;">
				 <div>
					 <label style="margin-top: 1%;" class="starRev">
						  <span id="1" class="starR11 on">1</span>
						  <span id="2" class="starR22">2</span>
						  <span id="3" class="starR11">3</span>
						  <span id="4" class="starR22">4</span>
						  <span id="51" class="starR11">5</span>
						  <span id="6" class="starR22">6</span>
						  <span id="7" class="starR11">7</span>
						  <span id="8" class="starR22">8</span>
						  <span id="9" class="starR11">9</span>
						  <span id="10" class="starR22">10</span>
						  <script type="text/javascript">
						    $("#51").addClass('on').prevAll('span').addClass('on');
						  </script>						  
					</label>
				  </div>
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 20%;">
					<button style="float: right;" type="button" class="btn btn-danger btn-sm">신고하기</button>
					<button style="float: right; margin-right: 1px" type="button" class="btn btn-danger btn-sm">수정하기</button>
				</div>
				<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
					<label style="font-size:1em; color: #DBA901;">공채 최종면접 보고 연락 왔습니다.</label>
					
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:40px; width: 20%;">
					<span style="float: right; font-size: 80%;">작성일 : 18/11/28</span> 
				</div>
				
				<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
					ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">			
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">							    
				</div>
				
				
				<div style="border: 1px solid red; float: left; height:50px; width: 80%;">
				</div>
				<div style="border: 1px solid red; float: left; height:50px; width: 20%;">
				</div>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr>
				<td class="text-center" colspan="99">등록된 게시글이 없습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
</form>
				<!-- //첫번째 리뷰 끝 -->
										
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 80%;">
					 <label style="margin-top: 1%;" class="starRev">
						  <span id="1" class="starR11 on">1</span>
						  <span id="2" class="starR22">2</span>
						  <span id="3" class="starR11">3</span>
						  <span id="4" class="starR22">4</span>
						  <span id="51" class="starR11">5</span>
						  <span id="6" class="starR22">6</span>
						  <span id="7" class="starR11">7</span>
						  <span id="81" class="starR22">8</span>
						  <span id="9" class="starR11">9</span>
						  <span id="10" class="starR22">10</span>
						  <script type="text/javascript">
						    $("#81").addClass('on').prevAll('span').addClass('on');
						  </script>						  
					</label>      
				</div>    
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:30px; width: 20%;">
					<button style="float: right;" type="button" class="btn btn-danger btn-sm">신고하기</button>
					<button style="float: right; margin-right: 2px" type="button" class="btn btn-danger btn-sm">수정하기</button>
				</div>
				<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
					<label style="font-size:1em; color: #DBA901;">아오 드럽게 안되네</label>
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: left; height:40px; width: 20%;">
					<span style="float: right;">작성일 : 18/11/28</span>
				</div>
				
				<div style="border: 1px solid gold; background-color:#ECF6CE; float: left; height:40px; width: 80%;">
					넘나 화가난다.
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">			
				    
				</div>
				<div style="border: 1px solid red; background-color:#ECF6CE; float: right; height:20px; width: 20%;">			
				    
				</div>
				<!-- //두번째 리뷰 끝 -->
			
			<!-- // 면접리뷰 -------------------------------  -->
   		</div>
   	</div>
   	<!-- // 기업 상세정보 -------------------------------  -->
   	
	

    <script type="text/javascript">
    $(document).ready(function(){ 
    	$("#4").addClass('on').prevAll('span').addClass('on');
        $('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
    	 $(this).addClass('on').prevAll('span').addClass('on');
    	 console.log("select:"+$(this).select().text());
    	  return false;
    	}); 
    	<%-- $(<%=ad %>).click(function(){
       	 $(this).addClass('on').prevAll('span').addClass('on');
       	});
    	<%	
    		String ad="\"#"+"5"+"\"";   		
    	%>
    	$(<%=ad %>).trigger("click"); --%>
    });	
    </script>


</body>
</html>