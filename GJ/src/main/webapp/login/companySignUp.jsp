<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<!--기업 회원가입 폼 -->
	<br>
	<br>
	<br>
	<br>
	<h2>기업 회원가입</h2>
	<form id="frm" name="frm" method="get">
		<br> <input type="hidden" name="work_div" id="work_div">
		<label><b>이메일</b></label> <input type="text" id="id" name="id"
			placeholder="이메일을 입력하세요"> <input type="hidden" id="idcheck"
			name="idcheck" value="0">
		<div class="form-group">
			<input type="button" value="아이디 중복확인" id="checkId" name="checkId">
			<br>
			<br> <label><b>비밀번호</b></label> <input type="password" id="pw"
				name="pw" placeholder="비밀번호 입력 조건"> <br>
			<br> <label><b>비밀번호 확인</b></label> <input type="password"
				id="pw2" name="pw2" placeholder="다시 입력하세요"> <br>
			<br> <label><b>기업명</b></label> <input type="text" id="nick"
				name="nick" placeholder="기업명을 입력하세요"> <br>
			<br> <label><b>대표자</b></label> <input type="text" id="name"
				name="name" placeholder="대표자을 입력하세요"> <br>
			<br> <label><b>회사 전화번호</b></label> <input type="text" id="pn"
				name="pn" placeholder="ex) 02-0000-0000"> <br>
			<br> <label><b>회사 주소</b></label> <input type="text" id="ad"
				name="ad" placeholder="회사 주소를 입력하세요"> <br>
			<br> <label><b>매출액</b></label> <input type="text" id="salay"
				name="salay" placeholder="매출액을 입력하세요"> <br>
			<br> <label><b>사원수</b></label> <input type="text" id="cnt"
				name="cnt" placeholder="사원수를 입력하세요"> <br>
			<br> <label><b>설립일</b></label> <input type="text" id="hire"
				name="hire" placeholder="ex 1990-05-05"> <br>
			<br> <label><b>비밀번호 찾기 질문:</b></label> <select id="passQ"
				name="passQ">
				<option value="1">기억에 남는 추억은 ?</option>
				<option value="2">자신의 인생 좌우명은 ?</option>
				<option value="3">자신의 보물 제 1호는 ?</option>
				<option value="4">가장 기억에 남는 선물은 ?</option>
				<option value="5">자신의 가장 소중한 친구 이름은 ?</option>
				<option value="6">다시 태어나면 되고싶은것은 ?</option>
			</select> <br>
			<br> <label><b>비밀번호 찾기 답변</b></label> <input type="text"
				id="passA" name="passA" placeholder="10글자 이하 입력"> <br>
			<br>
			<!--  <input type="reset" name="reset"  value="초기화" onclick="javascript:do_reset()">-->
			<!-- <input type="submit" name="submit" value="회원가입" onclick="javascript:do_insert()"> >-->
			<button class="btn btn-primary" type="button" id="reset" name="reset">초기화</button>
			<button class="btn btn-primary" type="button" id="insertId"
				name="insertId">회원가입</button>
			<br> <label><b> 기업은 관리자의 승인 이후의 이용이 가능합니다 .</b></label>
		</div>
	</form>
	<br>
	<!--// 구직자 회원가입 폼 -->

	<script type="text/javascript">
		function checkId() {
			var frm = document.frm;
			frm.action = "checkId.do";
			frm.submit();
		}

		function validateEmail(email) {
			var re = /^([\w-]+(?:.[\w-]+))@((?:[\w-]+.)\w[\w-]{0,66}).([a-z]{2,6}(?:.[a-z]{2})?)$/i;
			return re.test(email);
		}

		function validatephone(phone) {
			var regExp = /^\d{2,3}-\d{3,4}-\d{4}$/;
			return regExp.test(phone);
		}
		function validatehire(hire) {
			var pattern = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;

			return pattern.test();
		}

		$(document).ready(function() {
			//alert("ready");
			$("#checkId").on("click", function() {

				var id = $("#id").val()
				if (id == "" || !validateEmail(id)) {
					alert("유효한 이메일형식을 입력해주세요");
					return;
				}
				$.ajax({
					type : "POST",
					url : "checkId.do",
					dataType : "html",// JSON
					data : {
						"userId" : $("#id").val(),

					},

					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						var parseData = $.parseJSON(data);
						if (parseData.result == "") {
							alert("사용가능한아이디입니다.");
							$("#idcheck").val(1)
							return;
						} else {
							alert("중복된 아이디입니다. ");

						}
					},
					complete : function(data) {//무조건 수행

					},
					error : function(xhr, status, error) {

					}
				});
			})

			$("#insertId").on("click", function() {
				var check = $("#idcheck").val()
				if (check != 1) {
					alert("id중복체크를 해주세요")
					return;
				}
				var pwcheck = $("#pw").val()
				if (pwcheck == "") {
					alert("비밀번호를 입력해주세요")
					return;
				}
				var pwchecklength = $("#pw").val().length
				if (pwchecklength >= (15) || pwchecklength <= (5)) {
					alert("비밀번호를 5자이상 15자 이하로 입력해주세요")
					return;
				}
				var pw2check = $("#pw2").val()
				if (pw2check == "") {
					alert("비밀번호확인을 입력해주세요")
					return;
				}
				var pw2checklength = $("#pw").val().length
				if (pw2checklength >= (15) || pw2checklength <= (5)) {
					alert("비밀번호를 5자이상 15자 이하로 입력해주세요")
					return;
				}
				if (pw2check != pwcheck) {
					alert("비밀번호를 다시 확인해주세요")
					return;
				}
				var nickcheck = $("#nick").val()
				if (nickcheck == "") {
					alert("기업명을 입력해주세요")
					return;
				}
				var nicklength = $("#nick").val().length
				if (nicklength >= (20) || nicklength <= (2)) {
					alert("기업명을 2자이상 20자 이하로 입력해주세요")
					return;
				}
				var namecheck = $("#name").val()
				if (namecheck == "") {
					alert("대표자성함을 입력해주세요")
					return;
				}
				var namelength = $("#name").val().length
				if (namelength >= (20) || namelength <= (2)) {
					alert("대표자성함을 2자이상 20자 이하로 입력해주세요")
					return;
				}
				var pncheck = $("#pn").val()
				if (pncheck == "" || !validatephone(pncheck)) {
					alert("ex)02-0000-0000형식으로 입력해주세요")
					return;

				}
				var pnchecklength = $("#pn").val().length
				if (pnchecklength > (13)) {
					alert("회사전화번호 자릿수를 확인해주세요")
					return;
				}
				var adcheck = $("#ad").val()
				if (adcheck == "") {
					alert("회사주소를 입력해주세요")
					return;
				}
				var adchecklength = $("#ad").val().length
				if (adchecklength > (50)) {
					alert("회사주소를 50자 미만으로 입력해주세요")
					return;
				}
				var passQcheck = $("#passQ").val()
				if (passQcheck == "") {
					return;
				}
				var passAcheck = $("#passA").val()
				if (passAcheck == "") {
					alert("비밀번호찾기답을 입력해주세요")
					return;
				}
				var passAcheck = $("#passA").val().length
				if (passAcheck > (10)) {
					alert("답을 10글자 미만으로 입력해주세요")
					return;
				}
				var adcheck = $("#ad").val()
				if (adcheck == "") {
					alert("회사주소를 입력해주세요")
					return;
				}
				var adchecklength = $("#ad").val().length
				if (adchecklength > (50)) {
					alert("회사주소를 50자 미만으로 입력해주세요")
					return;

				}
				var salaycheck = $("#salay").val()
				if (salaycheck == "") {
					alert("매출액을 입력해주세요")
					return;
				}
				var salaychecklength = $("#salay").val().length
				if (salaychecklength > (10)) {
					alert("매출액을 50자 미만으로 입력해주세요")
					return;
				}
				var cntcheck = $("#cnt").val()
				if (cntcheck == "") {
					alert("사원수를 입력해주세요")
					return;
				}
				var cntchecklength = $("#cnt").val().length
				if (cntchecklength > (50)) {
					alert("사원수를 다시 확인해주세요")
					return;
				}
				var hirecheck = $("#hire").val()
				if (hirecheck == "" || !validatehire(hirecheck)) {
					alert("ex)1990-09-09 형식으로 입력해주세요")
					return;
				}
				var hirechecklength = $("#hire").val().length
				if (hirechecklength > (50)) {
					alert("설립일을 다시 확인해주세요")
					return;
				}

				$.ajax({
					type : "POST",
					url : "insertId2.do",
					dataType : "html",// JSON
					data : {

						"userId" : $("#id").val(),
						"userPasswd" : $("#pw").val(),
						"userNick" : $("#nick").val(),
						"userName" : $("#name").val(),
						"userPhone" : $("#pn").val(),
						"userAdd" : $("#ad").val(),
						"enterSalay" : $("#salay").val(),
						"enterCnt" : $("#cnt").val(),
						"enterHiredate" : $("#hire").val(),
						"userPassQu" : $("#passQ").val(),
						"userPassAn" : $("#passA").val()

					},

					success : function(data) {//통신이 성공적으로 이루어 졌을때 받을 함수
						var parseData = $.parseJSON(data);
						if (parseData.flag == 1) {
							alert("회원가입이 완료되었습니다.");
							location.replace('login.jsp');

							return;
						} else {
							alert("회원가입 실패 ");

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