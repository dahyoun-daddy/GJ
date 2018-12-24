<%@page import="com.sist.gj.vo.PictureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%
	String context = request.getContextPath();
	PictureVO profileVO = (PictureVO)session.getAttribute("pictureVO");
	String usId ="";
	String fileOrgName = "";
	String imgPath = "";
	String projectPath = "";
	if(null != profileVO){
		usId = profileVO.getUserId();
		fileOrgName = profileVO.getpFlNm();
		int pathNum = profileVO.getpFlPt().indexOf("resources");
		projectPath = profileVO.getpFlPt().substring(pathNum);
		imgPath = context+"/"+projectPath+"/"+profileVO.getpSvNm()+profileVO.getpFlTp();
		//"gj/"+projectPath+"/"+profileVO.getpSvNm()+profileVO.getpFlTp();
	}
	
	String pictureUrl = context+request.getAttribute("pictureUrl");
%>
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
								<% if(null != imgPath && !imgPath.equals("")){
					    		%>
					    			<img src="<%=imgPath%>" height="180px" style='width: 100%; object-fit: contain'>
					    		<%
					    		}else if(!pictureUrl.equals("/gjnull")){
					    		%>
					    			<img src="<%=pictureUrl%>" height="180px" style='width: 100%; object-fit: contain'>
					    		
					    		<%
					    		}else{
					    		%>
					    			<img src="../resources/images/noImage.png" height="180px" style='width: 100%; object-fit: contain'>
					    		<%
					    		}
					    		%>
				    		</div>
				    		<div id ="profmain">
				    			<input id="smallBtn" type="button" value="사진 업로드"
		                   			   onclick="PicturePopup1()"><br/><br/>
					    		<orange style="color: orange;">회사를 대표할 수 있는 로고 혹은 이미지를 올려 주세요.<br/>기업 정보 및 채용 공고에 보여질 사진입니다.<br/><br/></orange>
				    		</div>
				    		
				    		<!-- 가운데로 오게 하려면 text-align center로 주기 -->
				    		<div id="profcontext" style="text-align: left;">
				    		<form role="form" id="frmEdit" name="frmEdit" action="infoUpdate.do"
			  					  method="post" class="form-horizontal">
					    		<input type="hidden" name="upsert_div" id="upsert_div" value="">
						    	<input type="hidden" name="work_div" id="work_div"> 
					     	  	<label style="width:100px"><b>이메일</b></label>
					        	<input type="text" id="user_email" value="${userId}" readOnly>
					        		<br><br>
					    	 	<label style="width:100px"><b>비밀번호</b></label>
					        	<input type="password" id="comp_pw" value="${userPasswd}">
					        		<br><br>
					     		<label style="width:100px"><b>비밀번호 확인</b></label>
					       		<input type="password" id="pw_check"
					              	    placeholder="비밀번호를 다시 입력하세요">
					      			<br><br>
					      			<label style="width:100px"><b>기업명</b></label>
						        <input type="text" id="comp_compname" value="${userNick}">
						        	<br><br>
						       	<label style="width:100px"><b>대표성함</b></label>
						        <input type="text" id="comp_name" value="${userName}">
						        	<br><br>
						        <label style="width:100px"><b>회사 전화번호</b></label>
						        <input type="text" id="comp_phone" value="${userPhone}">
						       		<br><br>
						       	<label style="width:100px"><b>주소</b></label> 
						        <input type="text" id="comp_address" value="${userAdd}">
						       		<br><br>
						       	<label style="width:100px"><b>매출액</b></label> 
						        <input type="text" id="comp_money" value="${enterSalay}">
						       		<br><br>
						       	<label style="width:100px"><b>사원수</b></label> 
						        <input type="text" id="comp_cnt" value="${enterCnt}">
						       		<br><br>
						       	<label style="width:100px"><b>설립일</b></label> 
						        <input type="text" id="comp_date" value="${enterHiredate}">
						       		<br><br>
						      	<label style="width:100px"><b>비밀번호 찾기 질문:</b></label>
						      	<c:set var="opt" value="${userPassQu}" />
						      	<select id="passQ" name="passQ">
							      	<option value="1"<c:if test="${opt == '1' }">selected</c:if>>자신의 인생 좌우명은 ?</option>
							      	<option value="2"<c:if test="${opt == '2' }">selected</c:if>>자신의 보물 제 1호는 ?</option>
							      	<option value="3"<c:if test="${opt == '3' }">selected</c:if>>가장 기억에 남는 선물은 ?</option>
							      	<option value="4"<c:if test="${opt == '4' }">selected</c:if>>자신의 가장 소중한 친구 이름은 ?</option>
							      	<option value="5"<c:if test="${opt == '5' }">selected</c:if>>다시 태어나면 되고싶은것은 ?</option>
						      	</select>
						      	<br><br>
						      	<label style="width:100px"><b>비밀번호 찾기 답변</b></label> 
						        <input type="text" id="user_passA" value="${userPassAn}">
						       		<br><br>
						      	
					    		<input id="smallBtn" name="do_update" type="button" value="정보 수정하기">
				    		</form>
				    		</div>
					    	
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		
		 </section>

     <script type="text/javascript">
	    function PicturePopup1(){
	    	var popUrl = "../common/UserPicPopup.jsp";	//팝업창에 출력될 페이지 URL
	    	var popOption = "width=360, height=360, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
	   		window.open(popUrl,"",popOption);
	    }
		
		function validatephone(phone) {
			var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			return regExp.test(phone);
		}
		function validatehire(hire) {
			var pat = /^(19|20)\d{2}\/(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[0-1])$/;
			return pat.test(hire);
		}
     
	    $(document).ready(function(){
	    	$("input[name='do_update']").on("click",function(){
				
				  
				 var upsert_div = $("#upsert_div").val();
				 upsert_div = (upsert_div == "")?"updateInfo":"";
				 console.log("upsert_div:"+upsert_div);
				 
				 var pwcheck = $("#comp_pw").val();
				if (pwcheck == "") {
					alert("비밀번호를 입력해주세요");
					return;
				}
				var pwchecklength = $("#comp_pw").val().length;
				if (pwchecklength >= (15) || pwchecklength <= (5)) {
					alert("비밀번호를 5자이상 15자 이하로 입력해주세요");
					return;
				}
				var pw2check = $("#pw_check").val();
				if (pw2check == "") {
					alert("비밀번호 확인을 입력해주세요");
					return;
				}
				if (pw2check != pwcheck) {
					alert("비밀번호가 일치하지 않습니다");
					return;
				}
				var nickcheck = $("#comp_compname").val();
				if (nickcheck == "") {
					alert("기업명을 입력해주세요");
					return;
				}
				var nicklength = $("#comp_compname").val().length;
				if (nicklength >= (20) || nicklength <= (2)) {
					alert("기업명을 2자이상 20자 이하로 입력해주세요");
					return;
				}
				var namecheck = $("#comp_name").val();
				if (namecheck == "") {
					alert("대표자성함을 입력해주세요");
					return;
				}
				var namelength = $("#comp_name").val().length;
				if (namelength >= (20) || namelength <= (2)) {
					alert("대표자성함을 2자이상 20자 이하로 입력해주세요");
					return;
				}
				var pncheck = $("#comp_phone").val();
				if (pncheck == "" || !validatephone(pncheck)) {
					alert("ex)02-0000-0000형식으로 입력해주세요");
					return;

				}
				var pnchecklength = $("#comp_phone").val().length;
				if (pnchecklength > (13)) {
					alert("회사전화번호 자릿수를 확인해주세요");
					return;
				}
				var adcheck = $("#comp_address").val();
				if (adcheck == "") {
					alert("회사주소를 입력해주세요");
					return;
				}
				var adchecklength = $("#comp_address").val().length;
				if (adchecklength > (50)) {
					alert("회사주소를 50자 미만으로 입력해주세요");
					return;
				}
				var passQcheck = $("#passQ").val();
				if (passQcheck == "") {
					return;
				}
				var passAcheck = $("#user_passA").val();
				if (passAcheck == "") {
					alert("비밀번호찾기답을 입력해주세요");
					return;
				}
				var passAcheck = $("#passA").val().length;
				if (passAcheck > (10)) {
					alert("답을 10글자 미만으로 입력해주세요");
					return;
				}
				var adcheck = $("#ad").val();
				if (adcheck == "") {
					alert("회사주소를 입력해주세요");
					return;
				}
				var adchecklength = $("#comp_address").val().length;
				if (adchecklength > (50)) {
					alert("회사주소를 50자 미만으로 입력해주세요");
					return;

				}
				var salaycheck = $("#comp_money").val();
				if (salaycheck == "") {
					alert("매출액을 입력해주세요");
					return;
				}
				var salaychecklength = $("#comp_money").val().length;
				if (salaychecklength > (10)) {
					alert("매출액을 50자 미만으로 입력해주세요");
					return;
				}
				var cntcheck = $("#comp_cnt").val();
				if (cntcheck == "") {
					alert("사원수를 입력해주세요");
					return;
				}
				var cntchecklength = $("#comp_cnt").val().length;
				if (cntchecklength > (50)) {
					alert("사원수를 다시 확인해주세요");
					return;
				}
				var hirecheck = $("#comp_date").val();
				if (hirecheck == "" || !validatehire(hirecheck)) {
					alert("ex)1990/09/09 형식으로 입력해주세요");
					return;
				}
				var hirechecklength = $("#comp_date").val().length;
				if (hirechecklength > (50)) {
					alert("설립일을 다시 확인해주세요");
					return;
				}
				if(false==confirm("수정 하시겠습니까?"))return;
	
				
			     $.ajax({
			         type:"POST", 
			         url:"infoUpdate.do",
			         dataType:"html",// JSON
			         data:{
			         	"upsert_div": upsert_div,
			         	"userId": $("#user_email").val(),
			         	"userPasswd": $("#comp_pw").val(),
			         	"userNick": $("#comp_compname").val(),
			         	"userName": $("#comp_name").val(),
			         	"userAdd": $("#comp_address").val(),
			         	"userPassQu": $("#passQ option:selected").val(),
			         	"userPassAn": $("#user_passA").val(),
			         	"userPhone": $("#comp_phone").val(),
			         	"enterSalay": $("#comp_money").val(),
			         	"enterCnt": $("#comp_cnt").val(),
			         	"enterHiredate": $("#comp_date").val()
			         },
			         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
			             var parseData = $.parseJSON(data);
			         	 if(parseData.flag=="1"){
			         		 alert(parseData.message);
			         		location.href="CompMyInfo.do";
			         	 }else{
			         		alert(parseData.message);
			         	 }
			         },
			         complete: function(data){//무조건 수행
			          
			         },
			         error: function(xhr,status,error){
			          
			         }
			        });//--ajax					
				
				
			});//--do_update
	    });
	     
    </script>
    
</body>
</html>