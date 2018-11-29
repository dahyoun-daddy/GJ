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
                        <a class="nav-link">자기소개서 <span class="sr-only">(current)</span></a>
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
	<div class="container" align="center">
		<div class="col-lg-8 col-md-12">
			<div class="row">
			    <div class="col-md-12">
			        <div class="right-side">
			            <h3>자소서 제목</h3>
			            <br/>
			            <div class="form-group" align="right">
			            	<!------------------------------- 작성자만 보이는 버튼 -------------------------------------- -->
  							<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">수정</button>
  							<button type="button" class="btn btn-default btn-sm" id="do_save" >삭제</button>
  							<!-- ------------------------------------------------------------------------------- -->
  						</div>
			            <table class="table table-bordered" style="table-layout:fixed; word-break:break-all;">
			            	<colgroup>
		  						<col width="20%"/>
		  						<col width="80%"/>
		  					</colgroup>
			            	<thead>
			            		<tr>
			            			<th></th>
			            			<th>내용</th>
			            		</tr>
			            	</thead>
			            	<tbody>
			            		<tr>
			            			<th>성장과정</th>
			            			<td>잘컷다.</td>
			            		</tr>
			            		<tr>
			            			<th>학교생활</th>
			            			<td>잘다녔다.</td>
			            		</tr>
			            		<tr>
			            			<th>성격장단점</th>
			            			<td>좋은점은 좋고 나쁜점도 좋다.</td>
			            		</tr>
			            		<tr>
			            			<th>지원동기</th>
			            			<td>돈좀준다해서 지원했다.</td>
			            		</tr>
			            	</tbody>
			            </table>
			            <br/>
			            <table class="table table-bordered" style="table-layout:fixed; word-break:break-all;">
			            	<colgroup>
		  						<col width="20%"/>
		  						<col width="55%"/>
		  						<col width="25%"/>
		  					</colgroup>
			            	<thead>
			            		<tr>
			            			<th>작성자</th>
			            			<th>내용</th>
			            			<th>날짜</th>
			            		</tr>
			            	</thead>
			            	<tbody>
			            		<tr>
			            			<td>박태건</td>
			            			<td>진짜못썼네 토토나하시길</td>
			            			<td>2018-11-28
			            				<button type="button" class="btn btn-default btn-sm" id="do_save" >삭제</button>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>김무혁</td>
			            			<td>잘쓰셨네요 이정도면 무신사 입사도 가능하곘어요</td>
			            			<td>2018-11-28</td>
			            		</tr>
			            	</tbody>
			            </table>
			            <form id="contact" method="post" class="form" role="form">
			                <textarea class="form-control" id="message" name="message" placeholder="Message" rows="5"></textarea>
			                <br/>
			                <div class="row">
			                    <div class="col-xs-12 col-md-12 form-group">
			                        <button class="btn btn-primary" type="submit">댓글달기</button>
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
			
		</div>
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