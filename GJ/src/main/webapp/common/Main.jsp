<%@page import="com.sist.gj.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	UserVO sessionVO = (UserVO)session.getAttribute("loginId");
	String userId = "";
	
	if(null != sessionVO){
		userId = sessionVO.getUserId();
	}
%>
<head>
    
</head>
<body>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 메인화면 -->
	<div style=text-align:center>
		<img src="../resources/images/gj_logo_black.png" alt="nav-logo" style="float:center">
	</div>
		<br><br><br>
	<div style="border: 1px solid white; float: left; width: 36%; float: 40%">
	</div>
	<div class="btn-group btn-group-lg" role="group" aria-label="...">
		<form style="text-align:center;" class="form-inline" >
			<div class="input-group input-group-lg">
				<select class="form-control">
				  <option>지역</option>
				  <option>스킬</option>
				  <option>기타</option>
				</select>
			</div>
			&nbsp;&nbsp;
		  <div class="input-group input-group-lg">
		    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="검색어를 입력하세요">
		  	&nbsp;&nbsp;
		  </div>
		  <div class="btn-group btn-group-lg">
		  <button type="submit" class="btn btn-default">검색</button>
		  <%=userId %>
		  </div>
		</form>
    </div>
    
</body>
</html>