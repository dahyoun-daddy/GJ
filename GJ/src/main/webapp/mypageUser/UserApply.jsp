<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.sist.gj.vo.SearchVO"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
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
<% 
	String context = request.getContextPath();//context path
	
	String page_size ="10";//page_size
	String page_num  ="1";//page_num
	String search_div ="";//검색구분
	String search_word="";//검색어
	
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
	
	
%>
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
					    	        onclick="location='UserResumeView.jsp'">이력서</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserApply.jsp'">지원 현황</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<h5 style="color: orange" align="center"><strong>지원 현황</strong></h5>
					    	<br/>
					    	<form action="#">
							<input type="hidden" name="page_num" id="page_num">
							<!-- --검색영역 -->
					    	<div class="row" style="float: right;">
					  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
					  					<div class="form-group" >
					  						<div style="float: left; width: 25%;">
						  						<select name="page_size" id="page_size" class="form-control input-sm">
						  							<option value="10">10</option>
						  							<option value="20">20</option>
						  							<option value="50">50</option>
						  						</select>
					  						</div>
					  						<div style="float: left; width: 33%;">
					  							<select name="search_div" id="search_div" class="form-control input-sm">
					  							<option value="" >::전체::</option>
					  							<option value="1" <%if(search_div.equals("1"))out.print("selected='selected'"); %> >기업명</option>
					  							<option value="3" <%if(search_div.equals("3"))out.print("selected='selected'"); %> >채용제목</option>
					  						</select>
					  						</div>
					  						<div style="float: left; width: 41%;">
					  							<input type="text" name="search_word" id="search_word" class="form-control input-sm" placeholder="검색어"/>
					  						</div>
					  					</div>
					  		  		</div>
					  		  		<div class="form-group">
					  					<button type="button" class="btn btn-default btn-sm" onclick="javascript:doSearch();">조회</button>
					  					<button type="button" class="btn btn-default btn-sm" onclick="cancelApply();">지원취소</button>
					  				</div>
				  				</div>
				  				</form>
				  				
							<!--// 검색영역----------------------------------------------------->
							
							<!-- Grid영역 -->
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
								  			<c:choose>
								  				<c:when test="${list.size()>0}">
								  					<c:forEach var="applyVO" items="${list}">
								  					<tr>
								  						<td class="text-center"><input type="checkbox" id="check" name="check"></td> 
										  				<td class="text-center"><c:out value="${applyVO.compNick}"/></td> 
										  				<td class="text-left"><c:out value="${applyVO.hireTitle}"/></td> 
		 								  				<td class="text-center"><c:out value="${applyVO.applyDate}"/></td>
		 								  			</tr>
								  					</c:forEach>
								  				</c:when>
			  				 	 					<c:otherwise>
							 	 						<tr>
							 	 							<td class="text-center" colspan="99">지원한 정보가 없습니다.</td>
							 	 						</tr>
							  						</c:otherwise>
								  			</c:choose>
								  		
								  		</tbody>
								  	</table>
							  	</div>
							  	<!--// Grid영역 ---------------------------------------------------->
						  	</div>
						  	<!--pagenation ---------------------------------------------------->
						  	<div class="dorm-inline text-center">
						  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "UserApply.do", "search_page") %>
						  	</div>
						  	<!--// pagenation영역 ----------------------------------------------->
							  	
				    		
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
	    }//checkAll()
	    
	    function search_page(url,page_num){
        	 alert(url+":search_page:"+page_num);
        	 var frm = document.frm;
        	 frm.page_num.value = page_num;
        	 frm.action = url;
        	 frm.submit();
        	 
         }
	    
	    function doSearch(){
	    	var frm = document.frm;
	    	frm.page_num.value = 1;
	    	frm.action="UserApply.do";
	    	frm.submit();
	    }
	     
    </script>
    
</body>
</html>