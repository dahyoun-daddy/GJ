<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<% 
	String context = request.getContextPath();
%>
<head>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br/>
	<br/>
	
    <div id="wrap">
    <div class="container">
    	<form id="login" name="login" method="post" >
        	<br><br><br><br><br><br><br><br>
            <!-- 이미지 추가 -->
            <img src="<%=context%>/resources/images/GOOD_JOB_LOGO.png">
            <br><br>
            
            <table>
                <tr>
                    <td bgcolor="skyblue">아이디</td>
                    <td><input type="text" id="id" name="id" maxlength="50"></td>
                </tr>
                <tr>
                    <td bgcolor="skyblue">비밀번호</td>
                    <td><input type="password" name="password" name="password" maxlength="50"></td>
                </tr>
            </table>
            <br>
            <input type="button" value="로그인" id="loginBt" name="loginBt"/>
            <input type="button" value="구직자 가입" onclick="userSign()" />
            <input type="button" value="기업 가입" onclick="compSign()" />
            <input type="button" value="ID/PW찾기" onclick="findIdPass()" />
           
        </form>
    </div>
        
    </div>    
	<script type="text/javascript">
		function doLogin(){
			var frm = document.login;
    		frm.action="Main.do";
    		frm.submit();
		}
		
		function userSign(){
			var frm = document.login;
    		frm.action="userSignUp.jsp";
    		frm.submit();
		}
		
		function compSign(){
			var frm = document.login;
    		frm.action="companySignUp.jsp";
    		frm.submit();
		}

		function findIdPass(){
			var frm = document.login;
    		frm.action="findIdPass.jsp";
    		frm.submit();
		}
		$(document).ready(function(){
			//alert("ready");
			$("#loginBt").on("click",function(){
				//alert("ready");
				$.ajax({
	   		         type:"POST",
	   		         url:"login.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		        	"userId":$("#id").val(),
	   		        	"userPasswd":$("#password").val()
	   		         },
	   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
	   		         	var parseData = $.parseJSON(data);
	   		         	if(parseData.result == ""){
	   		         		alert("실패");
	   		         		return;
	   		         	}else{
	   		         		alert("성공");
	   		         		doLogin();
	   		         	}
	   		         },
	   		         complete: function(data){//무조건 수행
	   		          
	   		         },
	   		         error: function(xhr,status,error){
	   		          
	   		         }
	   		   	});
			});
		});
		
	
	$(function(){
		$("#findIdPass").click(function(){
			location.href="../login/findIdPass.do";
		})
	})	
		
	</script>


</body>
</html>