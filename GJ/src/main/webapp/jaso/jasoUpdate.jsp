<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br/>
	<br/>
	<div class="container" align="center">
		<div class="col-lg-8 col-md-12">
			<div class="row">
			<form action="jasoUpdate.do">
			    <div class="col-md-12">
			        <div class="right-side"> 
			            <h3>자소서 작성</h3>
			            <br/> 
			            <input type="hidden" id="clNo" name="clNo" value="${clNo}"/>
			            <table class="table table-bordered" style="table-layout:fixed; word-break:break-all;">
			            	<colgroup>
		  						<col width="20%"/>
		  						<col width="80%"/>
		  					</colgroup>
			            	<thead>
			            		<tr>
			            			<th>분류</th>
			            			<th>내용</th>
			            		</tr>
			            	</thead>
			            	<tbody>
			            		<tr>
			            			<th>제목</th>
			            			<td><input type="text" id="jasotitle" name="jasotitle" class="form-control col-lg-8 col-md-12" value="${clTitle}" placeholder="제목"></td>
			            		</tr>
			            		<tr>
			            			<th>성장과정</th>
			            			<td><textarea class="form-control" id="grow" name="grow" placeholder="성장과정" rows="5">${clSungjang}</textarea></td>
			            		</tr>
			            		<tr>
			            			<th>학교생활</th>
			            			<td><textarea class="form-control" id="school" name="school" placeholder="학교생활" rows="5">${clSang}</textarea></td>
			            		</tr>
			            		<tr>
			            			<th>성격장단점</th>
			            			<td><textarea class="form-control" id="mind" name="mind" placeholder="성격장단점" rows="5">${clJangdan}</textarea></td>
			            		</tr>
			            		<tr>
			            			<th>지원동기</th>
			            			<td><textarea class="form-control" id="apply" name="apply" placeholder="지원동기" rows="5">${clJiwon}</textarea></td>
			            		</tr>
			            	</tbody>
			            </table>
			        </div>
			    </div>
			    <button class="btn btn-primary" type="button" id="doUpdate">등록/수정</button>
			</form>
			<form id="frm" name="frm">
			</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function doSearch(){
			var frm = document.frm;
			frm.action="jasoList.do";
			frm.submit();
		}
	
		$(document).ready(function(){
			//alert("ready");
			$("#doUpdate").on("click",function(){
				//alert("ready");
				if(false == confirm("등록 하시곘습니까?")){
    				return;
    			}
				
				$.ajax({
   		         type:"POST",
   		         url:"jasoUpdate.do",
   		         dataType:"html",// JSON
   		         data:{
   		        	"clNo":$("#clNo").val() ,
   		         	"clTitle":$("#jasotitle").val(),
   		         	"clSungjang":$("#grow").val(),
   		         	"clSang":$("#school").val(),
   		         	"clJangdan":$("#mind").val(),
   		         	"clJiwon":$("#apply").val(),
   		         	"clCheck":1
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