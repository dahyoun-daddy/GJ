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
    <title>기업관리</title>
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
	
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.js"></script>
    <!-- Custom JavaScript -->
    <script src="../resources/js/animate.js"></script>
    <script src="../resources/js/custom.js"></script>
    <br><br><br>
  
    	<div class="page-header">
    		<h1>기업관리</h1>
    	</div>
  	<!--// Title영역 -->
       	
     	 <input type="hidden" name="page_num" id="page_num">
		<!-- 검색영역 -->
		<div class="row">
		  <div class="text-right col-xs-12 col-sm-12 col-md-12 col-lg-12">
			
    
    <div class="form-group">
					<select name="search_div" id="search_div" class="form-control input-sm">
					    <option value="" >::전체::</option>
										
					</select>
					<input type="text" name="search_word" id="search_word" value="${param.search_word}"  class="form-control input-sm" placeholder="검색어" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-default btn-sm" onclick="javascript:doSearch();">조회</button>
										
				</div>					
    	</div>
    	</div>
    	
    <!--// 검색영역----------------------------------------------------->
   
    <!-- Grid영역 -->
		<div class="table-responsive" >
			<table id="listTable" class="table table-striped table-bordered table-hover">
   <thead class="bg-primary">
				    <tr>
				        <th class="text-center"><input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll();" ></th> 
						<th class="text-center col-xs-1 col-sm-1 col-md-1 col-lg-1">회사명</th>
						<th class="text-center col-xs-4 col-sm-4 col-md-4 col-lg-4">대표자</th>
						<th class="text-center col-xs-3 col-sm-3 col-md-3 col-lg-3">이메일</th>
						<th class="text-center col-xs-1 col-sm-1 col-md-1 col-lg-1">가입일</th>
						<th class="text-center col-xs-1 col-sm-1 col-md-1 col-lg-1">이용가능</th>
						
					</tr>
				</thead>
	<!-- // Grid영역 -->
	
	<!-- 입력 Form영역---- ----------------------------------------------->
			
			<div class="form-group">
			<label class="col-lg-4 control-label">이메일</label>
			<div  class="col-lg-8">
			<input type="text" name="regDt" id="regDt" disabled="disabled"
						   class="form-control input-sm" placeholder="이메일" />						   
			</div>
			</div>
			
			
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호</label>
					<div  class="col-lg-8">
						<input type="password" name="name" id="name"
						   class="form-control input-sm" placeholder="비밀번호"
						   maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">기업명</label>
					<div  class="col-lg-8">
						<input type="text" name="password" id="기업명"
						   class="form-control input-sm" placeholder="기업명"
						   maxlength="20" />
					</div>
				</div>				
												
				<div class="form-group">
					<label class="col-lg-4 control-label">대표 성함</label>
					<div  class="col-lg-8">
						<input type="text" name="login" id="login"
						   class="form-control input-sm" placeholder="대표성함"
						   maxlength="4" />
					</div>
				</div>				
				<div class="form-group">
					<label class="col-lg-4 control-label">회사 전화번호</label>
					<div  class="col-lg-8">
						<input type="text" name="recommend" id="recommend"
						   class="form-control input-sm" placeholder="회사 전화번호"
						   maxlength="4" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">주소</label>
					<div  class="col-lg-8">
						<input type="text" name="email" id="email"
						   class="form-control input-sm" placeholder="주소"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">매출액</label>
					<div  class="col-lg-8">
						<input type="text" name="email" id="email"
						   class="form-control input-sm" placeholder="매출액"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">사원수</label>
					<div  class="col-lg-8">
						<input type="text" name="email" id="email"
						   class="form-control input-sm" placeholder="사원수"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">설립일</label>
					<div  class="col-lg-8">
						<input type="text" name="email" id="email"
						   class="form-control input-sm" placeholder="설립일"
						   maxlength="200" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이용가능</label>
					<div  class="col-lg-8">
						<select name="level" id="level" class="form-control input-sm">
							<option value="1">유</option>
							<option value="2">무</option>
							
						</select>
					</div>
				</div>	      				
				
				
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호 찾기 질문:</label>
					<div  class="col-lg-8">
	      	<select name="passQ">
	      	<option value="1">자신의 인생 좌우명은 ?</option>
	      	<option value="2">자신의 보물 제 1호는 ?</option>
	      	<option value="3">가장 기억에 남는 선물은 ?</option>
	      	<option value="4">자신의 가장 소중한 친구 이름은 ?</option>
	      	<option value="5">다시 태어나면 되고싶은것은 ?</option>
	      	</select>		
	      	</div>
			</div>	
	      				
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호 찾기 답변:</label>
					<div  class="col-lg-8">
						<input type="text" name="email" id="email"
						   class="form-control input-sm" placeholder="비밀번호 찾기 답변"
						   maxlength="200" />
					</div>
				</div>		      				
			
			
			<button type="button" class="btn btn-default btn-sm" id="do_update">수정하기</button>
					<button type="button" class="btn btn-default btn-sm" id="do_delete">탈퇴시키기</button>				   
				      														
			</form>
	<!-- //입력 Form영역---- ----------------------------------------------->			
</body>
</html>