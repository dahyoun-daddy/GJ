<%@page import="com.sist.gj.vo.PictureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	PictureVO inVO = new PictureVO();
	inVO = (PictureVO)request.getAttribute("picture");
	String picName = "";
	if(null != inVO){
		picName = inVO.getpFlNm();
	}
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" action="file.do">
		<%=picName %>
		<br>
		<input type="file" id="pic" name="pic" >
	</form>
	<input type="button" id="insert" name="insert" value="입력" onclick="retrieve()">
</body>
<script type="text/javascript">
	function retrieve(){
		var frm = document.frm;
		frm.action="../file/file.do";
		frm.submit();
	}
</script>
</html>