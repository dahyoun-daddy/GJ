<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
   
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	 <!--기업 회원가입 폼 -->
	   		<br><br><br><br>
	   		<h2>기업 회원가입</h2>
	   		<br>
	    	<input type="hidden" name="work_div" id="work_div"> 
     	  	<label><b>이메일</b></label>
        	<input type="text" name="user_email" placeholder="이메일을 입력하세요">
        		<br><br>
    	 	<label><b>비밀번호</b></label>
        	<input type="password" name="comp_pw" placeholder="비밀번호 입력 조건">
        		<br><br>
     		<label><b>비밀번호 확인</b></label>
       		<input type="password" name="pw_check"
              	    placeholder="다시 입력하세요">
      			<br><br>
      			<label><b>기업명</b></label>
	        <input type="text" name="comp_compname" placeholder="기업명을 입력하세요">
	        	<br><br>
	       	<label><b>대표성함</b></label>
	        <input type="text" name="comp_name" placeholder="성함을 입력하세요">
	        	<br><br>
	        <label><b>회사 전화번호</b></label>
	        <input type="text" name="comp_phone" placeholder="ex) 02-0000-0000">
	       		<br><br>
	       	<label><b>주소</b></label> 
	        <input type="text" name="comp_address" placeholder="주소를 입력하세요">
	       		<br><br>
	       	<label><b>매출액</b></label> 
	        <input type="text" name="comp_money" placeholder="ex) 100,000,000">
	       		<br><br>
	       	<label><b>설립일</b></label> 
	        <input type="text" name="comp_date" placeholder="ex) 100,000,000">
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
	       		
	        <input type="reset" name="reset"  value="초기화" onclick="javascript:do_reset()">
	         <input type="submit" name="submit" value="회원가입" onclick="javascript:do_insert()">
	          	<label><b>   기업은 관리자의 승인 이후의 이용이 가능합니다 .</b></label> 
	         
     
   				<br>
      <!--// 구직자 회원가입 폼 -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="../resources/js/animate.js"></script>
    <script src="../resources/js/custom.js"></script>
</body>
</html>