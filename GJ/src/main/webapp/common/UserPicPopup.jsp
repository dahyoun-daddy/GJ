<%@page import="com.sist.gj.vo.PictureVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
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
	<form id="frm" name="frm" method="post" enctype="multipart/form-data" >
		<br>
		<input type="file" id="pic" name="pic" >
		<input type="hidden" id="resultVO" name="resultVO">
	</form>
	<input type="button" id="insert" name="insert" value="입력">
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="<%=context %>/resources/js/animate.js"></script>
    <script src="<%=context %>/resources/js/custom.js"></script>
</body>
<script type="text/javascript">
	function moveUpdate(){
		//var frm = document.frm;
		//frm.resultVO = result;
		//frm.action = "moveUpdate.do";
		//frm.submit();
		window.opener.location.reload();    //부모창 reload
		window.close();    //현재 팝업창 Close
	}
	
	$(document).ready(function(){
		//alert("ready");
		$("#insert").on("click",function(){
			//alert("ready");
			
			var form = new FormData(document.getElementById('frm'));
			
			$.ajax({
		         type:"POST",
		         url:"file.do",
		         processData: false,
		         contentType: false,
		         dataType:"html",// JSON
		         data:form,
		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
		        	 var parseData = $.parseJSON(data);
	   		         	if(parseData.flag == "1"){
	 	  		         	moveUpdate();
	   		         	}else{
	   		         		alert(parseData.msg);
	   		         		$("#pic").val(null);
	   		         	}
		         },
		         complete: function(data){//무조건 수행
		          
		         },
		         error: function(xhr,status,error){
		          
		         }
		   	});
		})
	});
</script>
</html>