<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    
<style>

	#bubble-float-right:{
	  display: inline-block;
	  position: relative;
	  transition-duration: 0.3s;
	  transition-property: transform;
	  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	  transform: translateZ(0);
	  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	}
	#bubble-float-right:before {
	  pointer-events: none;
	  position: absolute;
	  z-index: -1;
	  top: calc(50% - 10px);
	  right: 0;
	  content: '';
	  border-style: solid;
	  border-width: 10px 0 10px 10px;
	  border-color: transparent transparent transparent transparent;
	  transition-duration: 0.3s;
	  transition-property: right;
	}
	#bubble-float-right:hover {
	  transform: translateX(-5px);
	  border-color: transparent transparent transparent #A9F5A9;
	}
	#bubble-float-right:hover:before {
	  right: -10px;
	  border-color: transparent transparent transparent #A9F5A9;
	}
	
	#smallBtn {
	   border: 0px solid #000000;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   padding: 10.5px 21px;
	   -webkit-border-radius: 2px;
	   -moz-border-radius: 2px;
	   border-radius: 2px;
	   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   text-shadow: #000000 0 1px 0;
	   color: #ffffff;
	   font-size: 13px;
	   text-decoration: none;
	   vertical-align: middle;
	   text-align: center;
	   width:130px;
	   }
	#smallBtn:hover {
	   border: 0px solid #000000;
	   text-shadow: #000000 0 1px 0;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   color: #A9F5A9;
	   }
	#smallBtn:active {
	   text-shadow: #000000 0 1px 0;
	   border: 0px solid #000000;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   color: #A9F5A9;
	   }
	
	#profimg{
		border: 1px solid black;
		width:15%;
		height:200px;
		float: left;
		padding: 15px;
	}
	
	#profmain{
		width:85%;
		height:200px;
		float: left;
		padding: 15px;
		text-align: left;
	}
	
	#profcontext{
		border: 1px solid red;
		width:100%;
		float: left;
		padding: 15px;
		text-align: left;
	}
	
	
	
</style>
<% 
	String nickname = "초보개발자";
	String openResume = "있습니다";

%>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	
	<br/><br/>
    
	<section class="page-section" style="height: auto;" >
		    <div class="about-heading-content" style="height: auto;">
		          <div class="row" style="width: 80%; height: auto; margin : auto">
		          	<div style=" float: left; height: 900px; width: 12%; padding:10px;" align="right">
				    	<div style=" height: 20%;" align="right">
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserMyInfo.jsp'">나의 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserResume.jsp'">이력서</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserApply.jsp'">지원 현황</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<div style="float: left; width: 120%; height: auto; padding:10px; font-size: 75%;" align="center">
				    		
				    		<div id ="profimg">
				    			이미지 불러오기
				    		</div>
				    		<div id ="profmain">
				    			<input id="smallBtn" type="button" value="사진 업로드"
		                   			   onclick="location='UserInfoUpdate.jsp'; return false;"><br/><br/>
					    		<orange style="color: orange;">자신을 증명할 있는 사진을 사용해 주세요.<br/>이력서 공개 및 채용에 지원했을 시 보여질 사진입니다.<br/><br/></orange>
					    		권장 사진 사이즈는 가로103*세로132 픽셀이며<br/>gif, jpg, jpeg 이미지 파일만 등록 가능합니다.
				    		</div>
				    		
				    		<div id="profcontext" style="text-align: center;">
					    		회원가입 폼과 동일하게 할 예정
					    		<br/><br/>
					    		<input id="smallBtn" type="button" value="정보 수정하기"
		                   			   onclick="location='UserInfoUpdate.jsp'; return false;">
				    		
				    		</div>
					    	
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		
		 </section>
    
    
</body>
</html>