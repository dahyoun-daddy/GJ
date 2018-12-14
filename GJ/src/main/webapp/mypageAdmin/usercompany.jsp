<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="com.sist.gj.vo.SearchVO"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%

	String context = request.getContextPath();//context path

	

	String page_size ="10";//page_size

	String page_num  ="1";//page_num

	String search_div ="";//검색구분

	String search_word="";//검색어

	String userPassQu ="";//찾기질문

	int totalCnt      =0;

	int bottomCount   =10;

    

	SearchVO vo =  (SearchVO)request.getAttribute("param");

	//out.print("vo:"+vo);

		if(null !=vo ){

		search_div  = StringUtill.nvl(vo.getSearchDiv(), "");  

		search_word = StringUtill.nvl(vo.getSearchWord(), ""); 

		page_size   = StringUtill.nvl(vo.getPageSize(), "10"); 

		page_num   = StringUtill.nvl(vo.getPageNum(), "1"); 

	}else{ 

		search_div  = StringUtill.nvl(request.getParameter("search_div"), ""); 

		search_word = StringUtill.nvl(request.getParameter("search_word"), "");

		page_size = StringUtill.nvl(request.getParameter("page_size"), "10");

		page_num = StringUtill.nvl(request.getParameter("page_num"), "1");

	}
		

		int oPageSize = Integer.parseInt(page_size);

		int oPageNum  = Integer.parseInt(page_num);

		

		String iTotalCnt = (null == request.getAttribute("total_cnt"))?"0":request.getAttribute("total_cnt").toString();

		totalCnt = Integer.parseInt(iTotalCnt);

		

		List<CodeVO> code_page = (null == request.getAttribute("code_page"))

				     ?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("code_page");

				 	List<CodeVO> signup_q = (null == request.getAttribute("SIGNUP_Q"))

						     ?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("SIGNUP_Q");

		
	

	
	
	
%>	


    
    
<!DOCTYPE html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>구직자 관리</title>
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
                    </li>채용정보
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
	
	<form id="frm" name="frm">
	
	</form>
	
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
    		<h1>구직자관리</h1>
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
						<th class="text-center col-xs-1 col-sm-1 col-md-1 col-lg-1">이름</th>
						<th class="text-center col-xs-4 col-sm-4 col-md-4 col-lg-4">닉네임</th>
						<th class="text-center col-xs-3 col-sm-3 col-md-3 col-lg-3">이메일</th>
						<th class="text-center col-xs-1 col-sm-1 col-md-1 col-lg-1">가입일</th>
						
						
					</tr>
				</thead>
				<tbody> 
							<c:choose>
  						<c:when test="${list.size()>0}">
  							<c:forEach var="UserVO" items="${list}">
  								<tr>
  									<td class="text-center"><input type="checkbox" id="check" name="check"></td>
  									<td class="text-center"><c:out value="${UserVO.userName}"/></td>
  									<td class="text-left"><c:out value="${UserVO.userNick}"/></td>
  									<td class="text-center"><c:out value="${UserVO.userId}"/></td>
  									<td class="text-center"><c:out value="${UserVO.regDt}"/></td>
  								</tr>
  							</c:forEach>
  						</c:when>
 	 					<c:otherwise>
 	 						<tr>
 	 							<td class="text-center" colspan="99">등록된 게시글이 없습니다.</td>
 	 						</tr>
  						</c:otherwise>
  					</c:choose>
				
				</tbody>
				</table>
				</div>
	<!-- // Grid영역 -->
	
		<!--pagenation ---------------------------------------------------->

		<div class="form-inline text-center">

			<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "search.do", "search_page") %>

		</div>

		<!--// pagenation영역 ----------------------------------------------->
	
	
	<!-- 입력 Form영역---- ----------------------------------------------->
			
			<div class="form-group">
			<label class="col-lg-4 control-label">이메일</label>
			<div  class="col-lg-8">
			<input type="text" name="userId" id="userId" disabled="disabled"
						   class="form-control input-sm" placeholder="이메일" />						   
			</div>
			</div>
			
			
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호</label>
					<div  class="col-lg-8">
						<input type="password" name="userPasswd" id="userPasswd"
						   class="form-control input-sm" placeholder="비밀번호"
						   maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">닉네임</label>
					<div  class="col-lg-8">
						<input type="text" name="userNick" id="userNick"
						   class="form-control input-sm" placeholder="닉네임"
						   maxlength="20" />
					</div>
				</div>				
							
				<div class="form-group">
					<label class="col-lg-4 control-label">성함</label>
					<div  class="col-lg-8">
						<input type="text" name="userName" id="userName"
						   class="form-control input-sm" placeholder="성함"
						   maxlength="4" />
					</div>
				</div>				
				<div class="form-group">
					<label class="col-lg-4 control-label">전화번호</label>
					<div  class="col-lg-8">
						<input type="text" name="userPhone" id="userPhone"
						   class="form-control input-sm" placeholder="전화번호"
						   maxlength="4" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">주소</label>
					<div  class="col-lg-8">
						<input type="text" name="uerAdd" id="userAdd"
						   class="form-control input-sm" placeholder="주소"
						   maxlength="200" />
					</div>
				</div>	
			<div class="form-group"> 
					<label class="col-lg-4 control-label">비밀번호 찾기 질문:</label>
					<div  class="col-lg-8">
	   			<%=StringUtill.makeSelectBox(signup_q, userPassQu, "userPassQu", false) %>
	      	</div>
			</div>	
	      				
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호 찾기 답변:</label>
					<div  class="col-lg-8">
						<input type="text" name="userPassAn" id="userPassAn"
						   class="form-control input-sm" placeholder="비밀번호 찾기 답변"
						   maxlength="200" />
					</div>
				</div>		      				
	      <button type="button" class="btn btn-default btn-sm" id="do_update">수정하기</button>
		  <button type="button" class="btn btn-default btn-sm" id="do_delete">탈퇴시키기</button>		      														
			</form>
	<!-- //입력 Form영역---- ----------------------------------------------->			
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#listTable>tbody").on("click","tr",function(){

			console.log("1 #listTable>tbody");

			

			var tr = $(this);

			var td = tr.children();

			var userId = td.eq(3).text();

			console.log("2 userId="+userId);

			

			if(""==userId)return;
			
			//alert("userId"+userId);
			

	        $.ajax({

	            type:"POST",

	            url:"userSelect.do",

	            dataType:"html",// JSON

	            data:{

	            "userId": userId

	            },

	            success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수

	              var parseData = $.parseJSON(data);



	            

	              

	              $("#userId").val(parseData.userId);

	              $("#userPasswd").val(parseData.userPasswd);

	              $("#userNick").val(parseData.userNick);

	              
	              $("#userName").val(parseData.userName);

	              $("#userPhone").val(parseData.userPhone);

	              $("#userAdd").val(parseData.userAdd);

	              $("#userPassQu").val(parseData.userPassQu);

	              $("#userPassAn").val(parseData.userPassAn);

	              
	              
 
	              $("#userId").prop("disabled",true);              

	            },

	            complete: function(data){//무조건 수행
          
	            },
	            error: function(xhr,status,error){
           
	            }
	       }); //--ajax

		});//--#listTable>tbody

	});  
	
</script>

<script type="text/javascript">
		function doSearch(){
			var frm = document.frm;
			frm.action="userList.do";
			frm.submit();
		}
	
		
		
		$(document).ready(function(){
			//alert("ready");
			$("#do_update").on("click",function(){
				//alert("ready");
				if(false == confirm("수정 하시겠습니까?")){
    				return;
    			}
				
				$.ajax({
   		         type:"POST",
   		         url:"userUpdate.do",
   		         dataType:"html",// JSON
   		         data:{
   		        	"userId":$("#userId").val() ,
   		         	"userPasswd":$("#userPasswd").val(),
   		         	"userNick":$("#userNick").val(),
   		         	"userName":$("#userName").val(),
   		         	"userPhone":$("#userPhone").val(),
   		         	"userAdd":$("#userAdd").val(),
   		          	"userPassQu":$("#userPassQu").val(),
   		    	   "userPassAn":$("#userPassAn").val()
   		        
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
		
		
		
		$(document).ready(function(){
			$("#do_delete").on("click",function(){
				//alert("ready");
				if(false == confirm("삭제 하시겠습니까?")){
    				return;
    			}
				
				
				$.ajax({
	   		         type:"POST",
	   		         url:"userDelete.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		         	"userId": $("#userId").val()
	   		         },
	   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
	   		         	var parseData = $.parseJSON(data);
	   		         	if(parseData.flag > 0){
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
			});
		});
	
		
		
	</script>
	
	<
	
	

</body>
</html>