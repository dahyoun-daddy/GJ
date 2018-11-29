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
    <title>Good Job</title>
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
    <nav class="navbar navbar-expand-lg navbar-dark cyan">
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
                        <a class="nav-link">자기소개서</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">...님 로그인중</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	<br/>
	<br/>
	<div class="container">
		<form>
		<input type="hidden" name="page_num" id="page_num">
  		<!-- --검색영역 -->
  			<div class="row" style="float: right;">
  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
  					<div class="form-group" >
  						<div style="float: left; width: 33%;">
  						<select name="search_Div" id="search_Div" class="form-control input-sm">
  							<option value="10">10</option>
  							<option value="20">20</option>
  							<option value="50">50</option>
  						</select>
  						</div>
  						<div style="float: left; width: 33%;">
  							<select name="search_Div" id="search_Div" class="form-control input-sm">
  							<option value="10">제목</option>
  							<option value="20">작성자</option>
  						</select>
  						</div>
  						<div style="float: left; width: 33%;">
  							<input type="text" name="search_Word" id="search_Word" class="form-control input-sm" placeholder="검색어"/>
  						</div>
  					</div>
  		  		</div>
  		  		<div class="form-group">
  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
  					<button type="button" class="btn btn-default btn-sm" id="do_save" >등록</button>
  				</div>
  			</div>
		</form>
	</div>
	<div class="table-responsive" align="center">
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8">
		  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
		  		<colgroup>
		  			<col width="20%"/>
		  			<col width="60%"/>
		  			<col width="20%"/>
		  		</colgroup>
		  		<thead class="bg-primary">
		  		<tr>
		  			<th class="text-center">작성자</th>
		  			<th class="text-center">자기소개서 제목</th>
		  			<th class="text-center">작성일</th>
		  		</tr>
		  		</thead>
		  		<tbody>
		  			<tr>
		  				<td class="text-center">이모티콘</td>
		  				<td class="text-left">진짜잘쓴 자소서</td>
		  				<td class="text-center">오늘</td>
		  			</tr>	
		  		</tbody>
		  	</table>
	  	</div>
	  	<div class="dorm-inline text-center">
	  		1
	  	</div>
  	</div>
  	<!-- Grid영역종료 -->
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