<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
	<jsp:include page="top.jsp" flush="false"></jsp:include>
	<br><br>
	<!-- 메인화면 -->
	<div style="border: 1px solid white; float: left; width: 36%;">
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
		    <input type="email" class="form-control" id="exampleInputEmail2" placeholder="검색어">
		  	&nbsp;&nbsp;
		  </div>
		  <div class="btn-group btn-group-lg">
		  <button type="submit" class="btn btn-default">검색</button>
		  </div>
		</form>
    </div>
    
	
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