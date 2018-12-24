<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="com.sist.gj.vo.UserVO"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  	String hireNo = StringUtill.nvl(request.getParameter("hireNo"),"");
	
	UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
	String userId = "";
	
	if(null != sessionVO){
		userId = sessionVO.getUserId();
	}
%>

<!DOCTYPE html>
<html>
<head>
		<style type="text/css">
		#frm {
			width:800px;
			margin: 0 auto;
			border:1px solid #BDBDBD;
		}
		</style>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<!-- 메인화면 -->
	<br><form id="frm" name="frm" class="form-horizontal">
		<br><h4 style="text-align:center;">채용공고 수정</h4><br>
		<input type="hidden" name="workDiv" id="workDiv" value="">
		<input type="hidden" name="regId" id="regId" value="${userId}">
		<input type="hidden" name="upsert_div" id="upsert_div" value="">
		<input type="hidden" name="hireNo" id="hireNo" value="${hireNo}">
	  <div class="form-group">
	    <label for="hireTitle" class="col-sm-2 control-label">채용제목</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireTitle" name="hireTitle" value="${hireTitle}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="hireContens" class="col-sm-2 control-label">채용내용</label>
	    <div class="col-sm-12">
		    <textarea class="form-control" id="hireBody" name="hireBody" rows="6">${hireBody}</textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">채용시작</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireDate" name="hireDate" value="${hireDate}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">채용마감</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireDeadline" name="hireDeadline" value="${hireDeadline}">
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">기업명</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="userId" name="userId" value="${userId}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">근무지</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireAdd" name="hireAdd" value="${hireAdd}">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="salary" class="col-sm-2 control-label">연봉</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireSalary" name="hireSalary" value="${hireSalary}">
	    </div>
	  </div>  
	  <div class="form-group">
	    <label for="degree" class="col-sm-2 control-label">최종학력</label>
	    <div class="col-sm-12">
	      <input type="text" class="form-control" id="hireEdu" name="hireEdu" value="${hireEdu}">
	    </div>
	  </div>
	  <br>
	  <div lass="form-group">
	    <div class="col-sm-offset-2 col-sm-12" style="text-align:center;">
	       <input type="button" class="btn btn-default" id="historyBack" name="historyBack" onclick="historyBack()" value="취소하기"></input>
	      <input type="button" class="btn btn-default" id="update" name="update" onclick="update()" value="수정하기"></input>
	    </div>
	  </div><br>
	  </form><br>
  	  <form id="frm2" name="frm2">
	</form>
	
	
	<script type="text/javascript">
		function historyBack() { 
			window.history.back(); 
		}
		
		function doSearch(){
			var frm = document.frm2;
			frm.action="HireList.do";
			frm.submit();
		}
	
	    $(document).ready(function(){
	    	$("input[name='update']").on("click",function(){
				 if(false==confirm("수정할까요?"))	return;
				  
				 var upsert_div = $("#upsert_div").val();
				 upsert_div = (workDiv == "")?"updateInfo":"";
				 console.log("upsert_div:"+upsert_div);

			     $.ajax({
			         type:"GET",
			         url:"HireUpdate.do",
			         dataType:"html",// JSON
			         data:{
			         	"upsert_div": upsert_div,
			         	"hireTitle": $("#hireTitle").val(),
			         	"hireBody": $("#hireBody").val(),
			         	"hireDate": $("#hireDate").val(),
			         	"hireDeadline": $("#hireDeadline").val(),
			         	"userId": $("#userId").val(),
			         	"hireAdd": $("#hireAdd").val(),
			         	"hireSalary": $("#hireSalary").val(),
			         	"hireEdu": $("#hireEdu").val(),
			         	"hireNo" : $("#hireNo").val()
			         },
			         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
			             var parseData = $.parseJSON(data);
			         	 if(parseData.flag=="1"){
			         		 alert(parseData.message);
// 			         		location.href="HireList.do";
		   		         		doSearch();
			         	 }else{
			         		alert(parseData.message);
			         	 }
			         },
			         complete: function(data){//무조건 수행
			          
			         },
			         error: function(xhr,status,error){
			          
			         }
			        });//--ajax					
				
			});//--do_update
	    });
	</script>
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