<%@page import="com.sist.gj.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<% 
	String context = request.getContextPath();
	UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
	String userId = "";
	String userNick = "";
	
	if(null != sessionVO){
		userId = sessionVO.getUserId();
		userNick = sessionVO.getUserNick();
	}
%>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title> || Good Job || 신입 개발자를 위한 구인구직</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="<%=context %>/resources/css/animate.css">
    <link rel="stylesheet" href="<%=context %>/resources/css/main.css">
    
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:300,400,700&amp;subset=korean" rel="stylesheet">
	<style>
		p, label, button, form, li
		{
			font-family: 'Noto Sans KR', sans-serif;
		}
	</style>
</head>
<body>
	<!--Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark cyan">
        <div class="container">
            <a class="navbar-brand" href="<%=context %>/common/Main.jsp">
            <img src="<%=context %>/resources/images/gj_logo.png" alt="nav-logo">
            </a>
            <form id="topFrm" name="topFrm">
            	<input type="hidden" id="nowLoginId" name="nowLoginId" >
            </form>
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
                    <li class="nav-item">
                        <a class="nav-link" onclick="moveJasoList()">자기소개서 </a>
                    </li>
                    <li class="nav-item">
                    		<%
						      	if(null != userNick && !userNick.equals("")){
						    %>
						    <a class="nav-link" href="<%=context %>/login/login.jsp">로그아웃</a>
                        
                        	<%
						        }else{
						    %>
						    <a class="nav-link" href="<%=context %>/login/login.jsp">로그인</a>
						    <%}%>
                    </li>
                </ul> 
            </div>
        </div>
    </nav>
    
   	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="<%=context %>/resources/js/animate.js"></script>
    <script src="<%=context %>/resources/js/custom.js"></script>
    <script type="text/javascript">
    	function moveJasoList(){
    		var frm = document.topFrm;
    		frm.action="../jaso/jasoList.do";
    		frm.submit(); 
    	}
    </script>
    
</body>
</html>