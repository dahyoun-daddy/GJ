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
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserMyInfo.do'">나의 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserResumeView.do'">이력서</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserApply.do'">지원 현황</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<div style="float: left; width: 120%; height: auto; padding:10px; font-weight: bold;" align="center">
				    		<h5><strong>탈퇴하기</strong></h5><br/><br/>
				    		
			    		<form name="frmSave" id="frmSave" class="form-horizontal" method="post" >
							<input type="hidden" name="workDiv" id="workDiv" />
						   
						   	<div class="form-group" style="display: inline-block;" >
								<label for="su_id" style="float:left; margin-right: 10px;"><strong>이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
								<input type="text" name="email" id="email" maxlength="320" 
								       style="float:left; margin-right: 10px;" value="${userId}" readOnly><br/>			                   
							</div><br/>
							
							<div class="form-group" style="display: inline-block;">
								<label for="su_pw" style="float:left; margin-right: 10px;"><strong>비밀번호&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
								<input type="password" name="passwd" id="passwd" maxlength="20"
								       style="float:left; margin-right: 10px;"><br/><br/>
							</div>
							
							<div class="col;" style="color:orange; font-size:75%;">탈퇴하면 기존에 등록된 모든 정보들은 전부 파기되어 복구가 불가합니다.<br/>또한 작성한 리뷰 및 자기소개서 글은 무통보 삭제될 수 있습니다.<br/><br/></div>	
						    <input id="smallBtn" name="signout" type="button" value="탈퇴하기"/>  
						
						</form>
				    		
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		 </section>
    
    <script type="text/javascript">
    
    $(document).ready(function(){
		$("input[name='signout']").on("click",function(){
			if(false==confirm("관련된 개인정보는 파기됩니다. 정말 탈퇴하시겠습니까?"))return;
		
			$.ajax({
		         type:"POST",
		         url:"deleteUser.do",
		         dataType:"html",// JSON
		         data:{
		         	"userId": $("#email").val(),
		         	"userPasswd": $("#passwd").val()
		         },
		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
		             var parseData = $.parseJSON(data);
		         	 if(parseData.flag=="1"){
		         		 alert(parseData.msg);
		         		location.href="../common/Main.jsp";
		         	 }else{
		         		alert(parseData.msg);
		         	 }
		         },
		         complete: function(data){//무조건 수행
		          
		         },
		         error: function(xhr,status,error){
		          
		         }
		     });//--ajax				
		});//--signout
    });
    
    </script>
</body>
</html>