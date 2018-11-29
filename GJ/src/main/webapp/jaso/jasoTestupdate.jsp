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
			<form action="">
			    <div class="col-md-12">
			        <div class="right-side">
			            <h3>자소서 작성</h3>
			            <br/>
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
			            			<td><input type="text" class="form-control col-lg-8 col-md-12" placeholder="제목"></td>
			            		</tr>
			            		<tr>
			            			<th>성장과정</th>
			            			<td> <textarea class="form-control" id="message" name="message" placeholder="성장과정" rows="5"></textarea></td>
			            		</tr>
			            		<tr>
			            			<th>성장과정</th>
			            			<td><textarea class="form-control" id="message" name="message" placeholder="성장과정" rows="5"></textarea></td>
			            		</tr>
			            		<tr>
			            			<th>학교생활</th>
			            			<td><textarea class="form-control" id="message" name="message" placeholder="학교생활" rows="5"></textarea></td>
			            		</tr>
			            		<tr>
			            			<th>성격장단점</th>
			            			<td><textarea class="form-control" id="message" name="message" placeholder="성격장단점" rows="5"></textarea></td>
			            		</tr>
			            		<tr>
			            			<th>지원동기</th>
			            			<td><textarea class="form-control" id="message" name="message" placeholder="지원동기" rows="5"></textarea></td>
			            		</tr>
			            	</tbody>
			            </table>
			        </div>
			    </div>
			</form>    
				<div class="col-lg-8 col-md-12">
					<button class="btn btn-primary" type="submit">등록/수정</button>
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