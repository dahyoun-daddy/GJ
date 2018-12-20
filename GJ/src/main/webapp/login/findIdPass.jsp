<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	List<CodeVO> signup_q = (null == request.getAttribute("SIGNUP_Q"))
			? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("SIGNUP_Q");
	String userPassQu = "";//찾기질문
%>
<html>
<head>
<title>id,pw찾기</title>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>

	<!--id,pw찾기 폼 -->
	<br>
	<br>
	<br>
	<br>
	<h2>아이디 찾기</h2>
	<form id="frm" name="frm" method="get">
		<br> <input type="hidden" name="work_div" id="work_div">
		<label><b>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label> <input type="text" id="name" name="name"
			placeholder="성함을 입력하세요"> <br> <br> <label><b>전화번호</b></label>
		<input type="text" id="pn" name="pn" placeholder="ex) 02-0000-0000">
		<br> <br>
		<div class="form-group">
			<input type="button" value="아이디 찾기" id="findId" name="findId">

		</div>
	</form>
	<br>
	<br>
	<br>

	<h2>비밀번호 찾기</h2>
	<form id="frm11" name="frm11" method="get">
		<br> <br> <label><b>이메일 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b></label> <input type="text"
			id="id" name="id" placeholder="이메일을 입력하세요"> <br> <br>
		
		<div class="form-inline" style="width:400px" >
		<label><b>비밀번호 찾기 질문</b></label>
		
		<%=StringUtill.makeSelectBox(signup_q, userPassQu, "userPassQu", false)%></div><br>
		 <label><b>비밀번호 찾기 답변</b></label> <input type="text" id="an"
			name="an" placeholder="10글자 이하 입력"> <br> <br> <input
			type="button" value="비밀번호 찾기" id="findPw" name="findPw">
	</form>

	<script type="text/javascript">
		function findId() {
			var frm = document.frm;
			frm.action = "findIdPass.do";
			frm.submit();
		}

		$(document).ready(function() {
			//alert("ready");
			$("#findId").on("click", function() {
				//alert("ready");

				$.ajax({
					type : "POST",
					url : "findId.do",
					dataType : "html",// JSON
					data : {
						"userName" : $("#name").val(),
						"userPhone" : $("#pn").val()

					},

					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						var parseData = $.parseJSON(data);
						if (parseData.result == "") {
							alert("등록된 아이디가 없습니다.");
							return;
						} else {
							alert("Id는 " + parseData.result + "입니다");
							findId();
						}
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {

					}
				});
			})
		});

		$(document).ready(function() {
			//alert("ready");
			$("#findPw").on("click", function() {
				//alert("ready");

				$.ajax({
					type : "POST",
					url : "findPass.do",
					dataType : "html",// JSON
					data : {
						"userId" : $("#id").val(),
						"userPassQu" : $("#userPassQu").val(),
						"userPassAn" : $("#an").val()

					},

					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						var parseData = $.parseJSON(data);
						if (parseData.result == "") {
							alert("등록된 아이디가 없습니다.");
							return;
						} else {
							alert("pw는 " + parseData.result + "입니다");
							findId();
						}
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {

					}
				});
			})
		});
	</script>
</body>
</html>