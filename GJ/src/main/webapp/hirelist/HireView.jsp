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

</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 메인화면 -->
	<form id="frm" name="frm" class="form-horizontal" method="post">
		<input type="hidden" name="hireNo" id="hireNo" value="<%=hireNo%>">
	  <div class="form-group">
	    <label for="hireTitle" class="col-sm-2 control-label">채용제목</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireTitle" name="hireTitle" value="${hireTitle}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="hireContens" class="col-sm-2 control-label">채용내용</label>
	    <div class="col-sm-10">
		    <textarea class="form-control" id="hireBody" name="hireBody" rows="6" readonly>${hireBody}</textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">채용시작</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireDate" name="hireDate" value="${hireDate}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">채용마감</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireDeadline" name="hireDeadline" value="${hireDeadline}" readonly>
	    </div>
	  </div>
	   <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">기업명</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="userId" name="userId" value="${userId}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="location" class="col-sm-2 control-label">근무지</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireAdd" name="hireAdd" value="${hireAdd}" readonly>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="salary" class="col-sm-2 control-label">연봉</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireSalary" name="hireSalary" value="${hireSalary}" readonly>
	    </div>
	  </div>  
	  <div class="form-group">
	    <label for="degree" class="col-sm-2 control-label">최종학력</label>
	    <div class="col-sm-10">
	      <input type="text" class="form-control" id="hireEdu" name="hireEdu" value="${hireEdu}" readonly>
	    </div>
	  </div>
	  </form>
	  <br>
	    <div class="col-sm-offset-2 col-sm-10">
	    <button type="button" class="btn btn-default" id="historyBack" name="historyBack" onclick="historyBack()">이전화면</button>
	    <button type="button" class="btn btn-default" id="goUpdate" name="goUpdate">수정하기</button>
	    <button type="button" class="btn btn-default" id="apply" name="apply">지원하기</button>
	    </div><br><br>
	  
	
	<script type="text/javascript">
		function historyBack() { 
			window.history.back(); 
		}
		
		$(document).ready(function(){
			
			$("#goUpdate").on("click",function(){
				
				var frm = document.frm;
				//alert("수정 페이지로 이동?"+frm.hireNo.value);
				//var hireNo = document.getElementById("hireNo").value 
				 frm.action = "HireUpdate.do";
				 frm.submit();
			});
			
			$("#apply").on("click",function(){
				//alert("ready");
				if(false == confirm("지원하시겠습니까?")){
    				return;
    			}
				
				$.ajax({
   		         type:"POST",
   		         url:"HireApply.do",
   		         dataType:"html",// JSON
   		         data:{
   		        	//"applyNo":$("#applyNo").val() ,
   		         	"userId":$("#userId").val(),
   		         //	"applyDate":$("#applyDate").val(),
   		         	"hireNo":$("#hireNo").val(),
   		         	"applyCheck":1
   		         },
   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
   		         	var parseData = $.parseJSON(data);
   		         	if(parseData.flag == "1"){
   		         		alert(parseData.msg);
   		         		doSearch();
   		         	}else{
   		         		alert(parseData.msg);
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