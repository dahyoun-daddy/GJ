<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
  
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	 <!--구직자 회원가입 폼 -->
	   		<br><br><br><br>
	   		<h2>구직자 회원가입</h2>
	   		<br>
	    	<input type="hidden" name="work_div" id="work_div"> 
     	  	<label><b>이메일</b></label>
        	<input type="text" name="user_email" placeholder="이메일을 입력하세요">
        		<br><br>
    	 	<label><b>비밀번호</b></label>
        	<input type="password" id="pw" name="pw" placeholder="비밀번호 입력 조건">
        		<br><br>
     		<label><b>비밀번호 확인</b></label>
       		<input type="password" id="pw2" name="pw2" placeholder="다시 입력하세요">
      			<br><br>
      			<label><b>닉네임</b></label>
	        <input type="text" name="user_nickname" placeholder="닉네임을 입력하세요">
	        	<br><br>
	       	<label><b>성함</b></label>
	        <input type="text" name="user_name" placeholder="성함을 입력하세요">
	        	<br><br>
	        <label><b>전화번호</b></label>
	        <input type="text" name="user_phone" placeholder="ex) 010-0000-0000">
	       		<br><br>
	       	<label><b>주소</b></label> 
	        <input type="text" name="user_address" placeholder="주소를 입력하세요">
	       		<br><br>
	      	<label><b>비밀번호 찾기 질문:</b></label>
	      	<select name="passQ">
	      	<option value="1">기억에 남는 추억은 ?</option>
	      	<option value="2">자신의 인생 좌우명은 ?</option>
	      	<option value="3">자신의 보물 제 1호는 ?</option>
	      	<option value="4">가장 기억에 남는 선물은 ?</option>
	      	<option value="5">자신의 가장 소중한 친구 이름은 ?</option>
	      	<option value="6">다시 태어나면 되고싶은것은 ?</option>
	      	</select>
	      	<br><br>
	      	<label><b>비밀번호 찾기 답변</b></label> 
	        <input type="text" name="user_passA" placeholder="10글자 이하 입력">
	       		<br><br>
	        <!--  <input type="reset" name="reset"  value="초기화" onclick="javascript:do_reset()">-->
	        <!-- <input type="submit" name="submit" value="회원가입" onclick="javascript:do_insert()"> >-->
	         <button class="btn btn-primary" type="button" id="doUpdate">초기화</button>
			  <button class="btn btn-primary" type="button" id="doUpdate">회원가입</button>
			<br>
			

			
			</script>
      <!--// 구직자 회원가입 폼 -->
      
	
</body>
</html>