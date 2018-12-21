<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String context = request.getContextPath();
%>
<head>
<style>
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


	<br />
	<br />

	<div id="wrap">
		<div class="container">
			<form id="login" name="login" method="post">
				<br>
				<br>
				<br>
				<br>
				<br>
				<br>

				<!-- 이미지 추가 -->
				<img src="../resources/images/gj_logo_black.png" alt="nav-logo" >
								<br>
				
				<br>

				<table>
					<tr>
						<td bgcolor="white">아이디</td>
						<td><input type="text" id="id" name="id" maxlength="50"></td>
					</tr>
					<tr>
						<td bgcolor="white">비밀번호</td>
						<td><input type="password" id="password" name="password" maxlength="50"></td>
					</tr>
				</table>
				<br> <input type="button" value="로그인" id="smallBtn" name="loginBt" /> 
				<input type="button" value="구직자 가입" id="smallBtn" name="signupU" onclick="userSign()" /> 
				<input type="button" value="기업 가입" id="smallBtn" name="signupC" onclick="compSign()" />
				<input type="button" value="ID/PW찾기" id="smallBtn" name="findIdPass"
					onclick="findIdPass()" />

			</form>
		</div>

	</div>
	<script type="text/javascript">
		function doLogin() {
			var frm = document.login;
			frm.action = "Main.do";
			frm.submit();
		}

		function userSign() {
			var frm = document.login;
			frm.action = "userSignUp.jsp";
			frm.submit();
		}

		function compSign() {
			var frm = document.login;
			frm.action = "companySignUp.jsp";
			frm.submit();
		}

		function findIdPass() {
			var frm = document.login;
			frm.action = "findIdPass.do";
			frm.submit();
		}

		$(document).ready(function() {
			//alert("ready");
			$("input[name='loginBt']").on("click", function() {
				//alert("ready");
				$.ajax({
					type : "POST",
					url : "login.do",
					dataType : "html",// JSON
					data : {
						"userId" : $("#id").val(),
						"userPasswd" : $("#password").val()
					},
					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						var parseData = $.parseJSON(data);
						if (parseData.result == "") {
							alert("아이디, 비밀번호를 확인하세요");
							return;
						} else {
							alert("환영합니다!")
							doLogin();
						}
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {

					}
				});
			});

		});

		$(function() {
			$("input[name='findIdPass']").click(function() {
				location.href = "../login/findIdPass.do";
			})
		})
	</script>


</body>
</html>