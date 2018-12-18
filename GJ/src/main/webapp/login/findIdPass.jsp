<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
      <title>id,pw찾기</title>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
    </nav>
	 <!--id,pw찾기 폼 -->
	   		<br><br><br><br>
	   		<h2>아이디 찾기</h2>
	   		<form id="frm" name="frm"  method="get">
	   		<br>
	    	<input type="hidden" name="work_div" id="work_div"> 
     	   	<label><b>이름</b></label>
	        <input type="text" id= "id" name="id" placeholder="성함을 입력하세요">
	        	<br><br>
	        <label><b>전화번호</b></label>
	        <input type="text" id= "pn" name="pn" placeholder="ex) 02-0000-0000">
	      		<br><br>      
	         <div class="form-group">
  					 <input type="button" value="아이디 찾기" id="findId" name="findId">
  					 
  				</div>
	         </form>
	         <br><br><br>
	         
	         <h2>비밀번호 찾기</h2>
	         <form id="frm11" name="frm11"  method="get">
	         <br><br>
	        <label><b>이메일</b></label>
        	<input type="text" name="user_email" placeholder="이메일을 입력하세요">
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
	          <input type="submit" name="submit" value="비밀번호 찾기" onclick="javascript:do_insert()">
	       </form>
	       
	    <script type="text/javascript">
		function findId(){
			var frm = document.frm;
			frm.action="findIdPass.do";
			frm.submit();
		}
	
		
		
		$(document).ready(function(){
			//alert("ready");
			$("#findId").on("click",function(){
				//alert("ready");
							
				$.ajax({
   		         type:"POST",
   		         url:"findIdPass.do",
   		         dataType:"html",// JSON
   		         data:{
   		        	"userId":$("#id").val() ,
   		          	"userPhone":$("#pn").val()
   		         
   		         },
         		      	         
   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
   		         	var parseData = $.parseJSON(data);
   		         	if(parseData.result == ""){
   		         		alert("등록된 아이디가 없습니다.");
   		         		return;
   		         	}else{
   		         		alert("dfdfdf");
   		         		findId();
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
</body>
</html>