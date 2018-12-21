<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
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
		width:100%;
		float: left;
		padding: 15px;
		text-align: left;
	}
	
	
	
</style>
<%
	String context = request.getContextPath();
	String pictureUrl = context+request.getAttribute("pictureUrl");

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
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompMyInfo.do'">기업 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompMyHire.do'">채용 관리하기</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompHireStt.do'">지원자 확인하기</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompResume.do'">오픈된 이력서<br/>열람하기</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<div style="float: left; width: 120%; height: auto; padding:10px; font-size: 75%;" align="center">
				    		
				    		<div id ="profimg">
				    			<%
					    		if(!pictureUrl.equals("/gjnull")){
					    		%>
					    			<img src="<%=pictureUrl %>" height="180px" style='width: 100%; object-fit: contain'>
					    		<%
					    		}else{
					    		%>
					    			<img src="../resources/images/noImage.png" height="180px" style='width: 100%; object-fit: contain'>
					    		<%
					    		}
					    		%>
				    		</div>
				    		<div id ="profmain">
					    		<orange style="color: orange;">회사를 대표할 수 있는 로고 혹은 이미지를 올려 주세요.<br/>기업 정보 및 채용 공고에 보여질 사진입니다.<br/><br/></orange>
				    		</div>
				    		
				    		<!-- 가운데로 오게 하려면 text-align center로 주기 -->
				    		<form id="frm" name="frm">
						    	<input type="hidden" name="work_div" id="work_div"> 
					     	  	<label style="width:100px"><b>이메일</b></label>
					        	<input type="text" name="user_email" value="${userId}" readOnly>
					        		<br><br>
					      			<label style="width:100px"><b>기업명</b></label>
						        <input type="text" name="comp_compname" value="${userNick}" readOnly>
						        	<br><br>
						       	<label style="width:100px"><b>대표성함</b></label>
						        <input type="text" name="comp_name" value="${userName}" readOnly>
						        	<br><br>
						        <label style="width:100px"><b>회사 전화번호</b></label>
						        <input type="text" name="comp_phone" value="${userPhone}" readOnly>
						       		<br><br>
						       	<label style="width:100px"><b>주소</b></label> 
						        <input type="text" name="comp_address" value="${userAdd}" readOnly>
						       		<br><br>
						       	<label style="width:100px"><b>매출액</b></label> 
						        <input type="text" name="comp_money" value="${enterSalay}" readOnly>
						       		<br><br>
						       	<label style="width:100px"><b>설립일</b></label> 
						        <input type="text" name="comp_date" value="${enterHiredate}" readOnly>
						       		<br><br>
						      	
					    		<input id="smallBtn" type="button" value="정보 수정하기"
		                   			   onclick="location='CompInfoUpdate.do'; return false;">
				    		
				    		</form>
					    	
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		
		 </section>

    
    
</body>
</html>