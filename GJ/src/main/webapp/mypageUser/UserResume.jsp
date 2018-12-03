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
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700|Playfair+Display:400,700,900" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
    <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.1.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    
<style>
	#bubble-float-right:{
	  display: inline-block;
	  position: relative;
	  transition-duration: 0.3s;
	  transition-property: transform;
	  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	  transform: translateZ(0);
	  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	}
	#bubble-float-right:before {
	  pointer-events: none;
	  position: absolute;
	  z-index: -1;
	  top: calc(50% - 10px);
	  right: 0;
	  content: '';
	  border-style: solid;
	  border-width: 10px 0 10px 10px;
	  border-color: transparent transparent transparent transparent;
	  transition-duration: 0.3s;
	  transition-property: right;
	}
	#bubble-float-right:hover {
	  transform: translateX(-5px);
	  border-color: transparent transparent transparent #A9F5A9;
	}
	#bubble-float-right:hover:before {
	  right: -10px;
	  border-color: transparent transparent transparent #A9F5A9;
	}
	
	#profimg{
		border: 1px solid black;
		width:15%;
		height:200px;
		padding: 15px;
		float: left;
	}
	#profcontext{
		border: 1px solid red;
		width: 88%;
		float: left;
		padding: 15px;
	}
	
	
</style>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	
	<br/><br/>
    
	<section class="page-section" style="height: auto;" >
		    <div class="about-heading-content" style="height: auto;">
		          <div class="row" style="width: 80%; height: auto; margin : auto">
		          	<div style=" float: left; height: 900px; width: 12%; padding:10px;" align="right">
				    	<div style=" height: 20%;" align="right">
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserMyInfo.jsp'">나의 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserResume.jsp'">이력서</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserApply.jsp'">지원 현황</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%; border: 1px solid green;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
			    		<h5 style="color: orange" align="center"><strong>나의 이력서</strong></h5>
				    	<div style="float: left; width: 110%; height: auto; padding:10px;" align="center">
					    	<div id="profcontext" style="text-align: center;">
					    		
					    		
					    		<div id ="profimg" style="margin: 10px;" >
					    		이미지 불러오기
					    		</div><br/>
	    		<form name="frmSave" id="frmSave" class="form-horizontal" method="post" >
					    		<div class="form-group" style="float: left;margin-right:45%;">
					    			<label for="su_nm" class="col-sm-4 control-label" style="float: left; display: inline; "><strong>이름</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="su_nm" name="su_nm"></textarea>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="su_pho" class="col-sm-4 control-label" style="float: left;"><strong>전화번호</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="su_pho" name="su_pho"></textarea>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="su_mail" class="col-sm-4 control-label" style="float: left;"><strong>이메일</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="su_mail" name="su_mail"></textarea>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
									<label for="grade" class="col-sm-4 control-label" style="float: left;"><strong>최종학력</strong></label>
									<div class="col-sm-7" style="float: left;">
										<select class="form-control" name="grade" id="grade" style="width:210px;">
											<option value="1">고졸</option>
											<option value="2">초대졸예정</option>
											<option value="3">초대졸</option>
											<option value="4">대졸예정</option>
											<option value="5">대졸</option>
											<option value="6">석박사이상</option>
										</select>
									</div>
								</div>
						    </div>	
						   
						    <div id="profcontext" style="font-size: 80%; text-align: left;">
						    	<strong style="color: #045FB4; font-size: 130%">보유한 기술</strong>
						    	<div class="col-sm-10">
								    <textarea class="form-control" id="tech" rows="1" placeholder="사용 가능한 기술을 나열해 주세요 ex) JAVA, C++, JSP, MariaDB, PHP 등"></textarea>
							    </div><br/>
						    
						    	<strong style="color: #045FB4; font-size: 130%">자격증/어학</strong><br/>
						    	
						    	<div class="form-group text-right">
									<button type="button" id="addBtn" class="btn btn-success btn-sm">추가</button>
						        </div>	
						        
						    	<div class="form-group" id="addDiv">
							    	<div class="form-group" style="float: left; margin-right:45%;">
						    			<label for="lcs_nm" class="col-sm-10 control-label" style="float: left;"><strong>자격증 이름/ 어학 시험 이름</strong></label>
										<div class="col-sm-7" style="float: left;">
									    	<input type="text" class="form-control" id="lcs_nm" name="lcs_nm"></textarea>
								    	</div>
									</div>
									
									<div class="form-group" style="float: left; margin-right:45%;">
						    			<label for="lcs_dt" class="col-sm-10 control-label" style="float: left;"><strong>취득일</strong></label>
										<div class="col-sm-7" style="float: left;">
									    	<input type="text" class="form-control" id="lcs_dt" name="lcs_dt"></textarea>
								    	</div>
									</div>
									
									<div class="form-group" style="float: left; margin-right:45%;">
						    			<label for="lcs_score" class="col-sm-10 control-label" style="float: left;"><strong>성적</strong></label>
										<div class="col-sm-7" style="float: left;">
									    	<input type="text" class="form-control" id="lcs_score" name="lcs_score"></textarea>
								    	</div>
									</div>
									<div style="float:left;"><input type=text style="border:none; width: 1000px;" value="-----------------------------------------------------------------------------------------"/></div>
								
								</div>
						    
						    </div>
					    	
					    	
			    	</form>
				    		
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		
		 </section>
		 
		 <script type="text/javascript">
		 	var fileNumber = 2;
	    	$(document).ready(function(){
	    		//alert('document');
	    		$("#addBtn").on("click",function(){
	    			//alert('addBtn');
	    			var tmpHtml  = "";
	    			    tmpHtml += "<div class='form-group' style='float: left; margin-right:45%;'>";
	    			    tmpHtml += "<label for='lcs_nm"+fileNumber+"' class='col-sm-10 control-label' style='float: left;'><strong>자격증 이름/ 어학 시험 이름</strong></label>";
	    				tmpHtml += "<div class='col-sm-7' style='float: left;'>";
	    				tmpHtml += "<input type='text' class='form-control' id='lcs_nm"+fileNumber+"' name='lcs_nm"+fileNumber+"'></textarea></div></div><div class='form-group' style='float: left; margin-right:45%;'>";
	    				tmpHtml += "<label for='lcs_dt"+fileNumber+"' class='col-sm-10 control-label' style='float: left;'><strong>취득일</strong></label><div class='col-sm-7' style='float: left;'><input type='text' class='form-control' id='lcs_dt"+fileNumber+"' name='lcs_dt"+fileNumber+"'></textarea></div></div>";
	    				tmpHtml += "<div class='form-group' style='float: left; margin-right:45%;'>";
	    				tmpHtml += "<label for='lcs_score"+fileNumber+"' class='col-sm-10 control-label' style='float: left;'><strong>성적</strong></label>";
	    				tmpHtml += "<div class='col-sm-7' style='float: left;'>";
	    				tmpHtml += "<input type='text' class='form-control' id='lcs_score"+fileNumber+"' name='lcs_score"+fileNumber+"'></textarea>";
	    				tmpHtml += "</div></div><button type='button' class='btnDel btn btn-danger btn-sm' style='float:right;'>삭제</button>";
						tmpHtml += "<div style='float:left;'><input type=text style='border:none; width: 1000px;' value='-----------------------------------------------------------------------------------------'/></div>";
				
	    			console.log("tmpHtml\n"+tmpHtml);  
	    			$("#addDiv").append(tmpHtml);
	    			fileNumber++;
	    			
	    			$(".btnDel").on("click",function(){
	    				$(this).prev().prev().prev().remove();
	    				$(this).prev().prev().remove();
	    				$(this).prev().remove();
	    				$(this).next().remove();
	    				$(this).remove();
	    			});
	    			
	    		});
	    	}); //-- document 
	 	</script>
    

</body>
</html>