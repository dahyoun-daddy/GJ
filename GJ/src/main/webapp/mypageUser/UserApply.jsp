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
	
	#smallBtn {
	   border: 0px solid #000000;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   padding: 10.5px 21px;
	   -webkit-border-radius: 2px;
	   -moz-border-radius: 2px;
	   border-radius: 2px;
	   -webkit-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   -moz-box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   box-shadow: rgba(255,255,255,0.4) 0 0px 0, inset rgba(255,255,255,0.4) 0 0px 0;
	   text-shadow: #000000 0 1px 0;
	   color: #ffffff;
	   font-size: 13px;
	   text-decoration: none;
	   vertical-align: middle;
	   width:130px;
	   }
	#smallBtn:hover {
	   border: 0px solid #000000;
	   text-shadow: #000000 0 1px 0;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   color: #A9F5A9;
	   }
	#smallBtn:active {
	   text-shadow: #000000 0 1px 0;
	   border: 0px solid #000000;
	   background: #000000;
	   background: -webkit-gradient(linear, left top, left bottom, from(#000000), to(#000000));
	   background: -webkit-linear-gradient(top, #000000, #000000);
	   background: -moz-linear-gradient(top, #000000, #000000);
	   background: -ms-linear-gradient(top, #000000, #000000);
	   background: -o-linear-gradient(top, #000000, #000000);
	   background-image: -ms-linear-gradient(top, #000000 0%, #000000 100%);
	   color: #A9F5A9;
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
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<h5 style="color: orange" align="center"><strong>지원 현황</strong></h5>
					    	<br/>
					    	<div class="row" style="float: right;">
							  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
							  					<div class="form-group" >
							  						<div style="float: left; width: 25%;">
							  						<select name="search_Div" id="search_Div" class="form-control input-sm">
							  							<option value="1">10</option>
							  							<option value="2">20</option>
							  							<option value="3">50</option>
							  						</select>
							  						</div>
							  						<div style="float: left; width: 33%;">
							  							<select name="search_Div" id="search_Div" class="form-control input-sm">
							  							<option value="1">기업명</option>
							  							<option value="2">채용제목</option>
							  						</select>
							  						</div>
							  						<div style="float: left; width: 41%;">
							  							<input type="text" name="search_Word" id="search_Word" class="form-control input-sm" placeholder="검색어"/>
							  						</div>
							  					</div>
							  		  		</div>
							  		  		<div class="form-group">
							  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
							  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">지원취소</button>
							  				</div>
							  			</div>
									</form>
					    	<div class="table-responsive" align="center" style="float:left;">
								<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
								
								  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
								  		<colgroup>
								  			<col width="5%" style="background-color: #FFFFFF;"/>
								  			<col width="20%"style="background-color: #FFFFFF;"/>
								  			<col width="60%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  		</colgroup>
								  		<thead class="bg-primary">
								  		<tr>
								  			<th class="text-center" style="background-color: #FACC2E;"><input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll();" ></th> 
								  			<th class="text-center" style="background-color: #FACC2E;">기업명</th>
								  			<th class="text-center" style="background-color: #FACC2E;">채용제목</th>
								  			<th class="text-center" style="background-color: #FACC2E;">지원일</th>
								  		</tr>
								  		</thead>
								  		<tbody>
								  			<tr>
								  				<td class="text-center"><input type="checkbox" id="check" name="check"></td>
								  				<td class="text-center">쌍용교육센터</td>
								  				<td class="text-left">[쌍용강북교육센터]  매니저 정직원 채용 </td>
								  				<td class="text-center">오늘</td>
								  			</tr>	
								  			<tr>
								  				<td class="text-center"><input type="checkbox" id="check" name="check"></td>
								  				<td class="text-center">우아한 형제</td>
								  				<td class="text-left">[하반기 공채] 신입 개발자 본사 정직원... </td>
								  				<td class="text-center">2018/11/20</td>
								  			</tr>
								  		</tbody>
								  	</table>
							  	</div>
							  	<div class="dorm-inline text-center">
							  		1
							  	</div>
							  	
						  	</div>
				    		
				    	</div>
		          </div>
		      </div>
	
		
		 </section>
    
    <script type="text/javascript">
    
	     //check 전체 선택
	    function checkAll(){
	   	 if($("#checkAll").is(':checked') == true  ){
	   		 $("input[name='check']").prop("checked",true);
	   	 }else{
	   		 $("input[name='check']").prop("checked",false);
	   	 }
	   	   
	    }
	     
    </script>
    
</body>
</html>