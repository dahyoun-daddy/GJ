<%@page import="com.sist.gj.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context = request.getContextPath();//context path
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
    <link rel="stylesheet" href="../resources/css/main.css">
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="../resources/js/animate.js"></script>
    <script src="../resources/js/custom.js"></script>
</head>
<body>
	<!--Navbar -->
   <jsp:include page="../common/top.jsp" flush="false"></jsp:include>
        
    </nav>
    <form id="frm" name="frm" method="get">
    <div class="container">
		<div class="col-xl-12 col-lg-12 mx-auto">
			<div class="bg-faded rounded p-5">    
				<div style="text-align: center; height:50px; width: 100%;">
				    면접리뷰 작성하기
				</div>
				
				<div style="float: left; height:50px; width: 30%;">
				  <label style="float: right; margin-top: 1%; margin-right: 10%;">제목</label>
				</div>
				
				<div style="float: left; height:50px; width: 70%;">
				   <input id="reviewTitle" name="reviewTitle" style="width:70%;" type="text" placeholder="제목" value="${reviewVO.reviewTitle}"/> 
				</div>
				
				<div style="float: left; height:150px; width: 30%;">
				  <label style="float: right; margin-top: 1%; margin-right: 10%;">내용</label>
				</div>
				
				<div style="float: left; height:150px; width: 70%;">
				   <textarea name="reviewBody" id="reviewBody" style="width:70%; height:150px;" placeholder="내용">${reviewVO.reviewBody}</textarea> 
				</div>
				
				<div style="float: left; height:50px; width: 30%;">
				  <label style="float: right; margin-top: 6%; margin-right: 10%;">나의 별점은?</label>
				</div>
				
				<div style="float: left; height:50px; width: 70%;">
				  <div style="margin-top: 1%;"> 
				   	<label class="starRev">
						  <span id="${reviewVO.reviewNo}0" class="starR1 on">1</span>
						  <span id="${reviewVO.reviewNo}1" class="starR2">2</span>
						  <span id="${reviewVO.reviewNo}2" class="starR1">3</span>
						  <span id="${reviewVO.reviewNo}3" class="starR2">4</span>
						  <span id="${reviewVO.reviewNo}4" class="starR1">5</span>
						  <span id="${reviewVO.reviewNo}5" class="starR2">6</span>
						  <span id="${reviewVO.reviewNo}6" class="starR1">7</span>
						  <span id="${reviewVO.reviewNo}7" class="starR2">8</span>
						  <span id="${reviewVO.reviewNo}8" class="starR1">9</span>
						  <span id="${reviewVO.reviewNo}9" class="starR2">10</span>
						  	<c:choose>
				  				<c:when test="${null == reviewVO.reviewPoint}"> 					
				  				</c:when>
				  				<c:otherwise>
				  					<script type="text/javascript">
								     	$("#${reviewVO.reviewPoint}").addClass('on').prevAll('span').addClass('on');
								   	</script>	
				  				</c:otherwise>
				  			</c:choose>					   				  
					</label>
				  </div>	
				</div>
				
				<div style="float: left; height:150px; width: 30%;">
				  <label style="float: right; margin-right: 10%;"></label>
				</div>
				
				<div style="float: right; height:150px; width: 21%;">
				</div>
				
				<div style="float: left; height:150px; width: 49%;">
				   <h6>과한 허구의 내용을 작성했을 시 발생하는 갈등 및 충돌은 책임지지 않습니다. 또한 신고가 들어왔을 시 관리자의 판단 후 사전 통보 없이 리뷰가 삭제 될 수 있습니다. 동의하십니까?</h6>
				   <div style="float: right;">
					  <input id="sign" name="sign" type = "radio">예    
	      			  <input id="noSign" name="noSign" type = "radio">아니요
      			  </div>
				</div>
				
				
				
				<div style="text-align: center; height:50px; width: 100%;">
				    <button name="doUpdateSave" id="doUpdateSave" type="button" class="btn btn-danger btn-sm" value="doUpdateSave">면접리뷰 등록하기</button>
				</div>
				   
   			</div>
   		</div>
   	</div>
   	<input type="hidden" name="userId" id="userId" value="${userId}" />
   	<input type="hidden" name="reviewComplain" id="reviewComplain" value="${reviewVO.reviewComplain}" />
   	<input type="hidden" name="star" id="star" value="${reviewVO.reviewPoint}" />
   	<input type="hidden" name="reviewNo3" id="reviewNo3" value="${reviewVO.reviewNo}" />
   	<input type="hidden" name="regId" id="regId" value="${user}" />
   	<input type="hidden" name="upsertDiv" id="upsertDiv" value="${upsertDiv}" />
   	<input type="hidden" name="userNick" id="userNick" value="${userId}" />
   	</form>
    

	
    
    <script type="text/javascript">
    $(document).ready(function(){     	   	
        $('.starRev span').click(function(){
		 $(this).parent().children('span').removeClass('on');
    	 $(this).addClass('on').prevAll('span').addClass('on');
    	 console.log("select:"+$(this).attr('id'));
    	 var star = $(this).attr('id');
    	 var frm = document.frm;
		 frm.star.value=star;
    	 return false;
    	});
        
       $("#sign").click(function(){
    	   $("input:radio[name='noSign']").prop('checked', false);     	   
        });
       
       $("#noSign").click(function(){
    	   $("input:radio[name='sign']").prop('checked', false);
        });
        
		$("#doUpdateSave").on("click",function(){
			if($(reviewTitle).val() == null || $(reviewTitle).val() == ""){
	    		 alert("제목이 없다?");
	    		 return;
	    	 }
			
			if($(reviewBody).val() == null || $(reviewBody).val() == ""){
	    		 alert("내용이 없다?");
	    		 return;
	    	 }
			
			if($("input[name='sign']").is(":checked") == false){
	    		 alert("동의 하셨나?");
	    		 return;
	    	 }
			
			
			var frm = document.frm;
			frm.action = "giupReview.do";
			frm.submit();
			
			
		});//--#doUpdateSave
        
    });	
    </script>
    
</body>
</html>