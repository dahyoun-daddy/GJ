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
     <title>구직자 회원가입</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    <link rel="stylesheet" href="../resources/css/main.css">
</head>
<body>
	<!--Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark cyan fixed-top">
        <div class="container">
            <a class="navbar-brand" href="index.html">
            <img src="../resources/images/gj_logo.png" alt="nav-logo">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent-4" aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent-4">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">채용정보</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">기업정보 </a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link">자기소개서 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">...님 로그인중</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	 <!--구직자 회원가입 폼 -->
	   		<br><br><br><br>
	   		<h2>구직자 회원가입</h2>
	   		<br>
	    	<input type="hidden" name="work_div" id="work_div"> 
     	  	<label><b>이메일</b></label>
        	<input type="text" name="user_email" placeholder="이메일을 입력하세요">
        		<br><br>
    	 	<label><b>비밀번호</b></label>
        	<input type="password" name="user_pw" placeholder="비밀번호 입력 조건">
        		<br><br>
     		<label><b>비밀번호 확인</b></label>
       		<input type="password" name="pw_check"
              	    placeholder="다시 입력하세요">
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
	        <input type="reset" name="reset"  value="초기화" onclick="javascript:do_reset()">
	         <input type="submit" name="submit" value="회원가입" onclick="javascript:do_insert()">
	         
     
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