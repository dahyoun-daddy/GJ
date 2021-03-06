<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="java.util.List"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
    
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
	String context = request.getContextPath();
			
	String pageSize = "10";
	String pageNum = "1";
	String searchDiv = "";  //검색구분
	String searchWord = ""; //검색어
	
	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "");
	searchWord = StringUtill.nvl(request.getParameter("searchWord"), "");
	pageSize = StringUtill.nvl(request.getParameter("pageSize"), "10");
	pageNum = StringUtill.nvl(request.getParameter("pageNum"), "1");
	
	int totalCnt = 0;
	int bottomCount = 10;
	
	int oPageSize = Integer.parseInt(pageSize);
	int oPageNum = Integer.parseInt(pageNum);
	
	String totalCnts = (null == request.getAttribute("totalCnt"))?"10":request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(totalCnts);
	
	List<CodeVO> codeSearch = (null == request.getAttribute("codeSearch"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codeSearch");
	List<CodeVO> codePage = (null == request.getAttribute("codePage"))?new ArrayList<CodeVO>():(List<CodeVO>)request.getAttribute("codePage");
	
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
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompMyInfo.do'">기업 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompMyHire.do'">채용 관리하기</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompHireStt.do'">지원자 확인하기</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 110%;"
					    	        onclick="location='CompResume.do'">오픈된 이력서<br/>열람하기</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
				    	<h5 style="color: orange" align="center"><strong>오픈된 이력서 열람하기</strong></h5>
					    	<br/>
					    	<form name="frm" id="frm" method="get">
					    	<input type="hidden" name="pageNum" id="pageNum"/>
					    	<input type="hidden" name="regId" id="regId">
					    	<!-- --검색영역 -->
					    	<div class="row" style="float: right;">
					  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
					  					<div class="form-group" >
					  						<div style="float: left; width: 25%;">
						  						<%=StringUtill.makeSelectBox(codePage, pageSize, "pageSize", false) %>
					  						</div>
					  						<div style="float: left; width: 33%;">
					  							<%=StringUtill.makeSelectBox(codeSearch, searchDiv, "searchDiv", false) %>
					  						</div>
					  						<div style="float: left; width: 41%;">
					  							<input type="text" name="searchWord" id="searchWord" value="${param.searchWord}" class="form-control input-sm" placeholder="검색어"/>
					  						</div>
					  					</div>
					  		  		</div>
					  		  		<div class="form-group">
					  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
					  				</div>
				  				</div>
				  				</form>
				  				
							<!--// 검색영역----------------------------------------------------->
					  
					  		<!-- Grid영역 -->
					    	<div class="table-responsive" align="center">
								<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
							  	
								  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
								  		<colgroup>
								  			<col width="20%"style="background-color: #FFFFFF;font-size: 80%;"/>
								  			<col width="60%"style="background-color: #FFFFFF;font-size: 80%;"/>
								  			<col width="20%"style="background-color: #FFFFFF;font-size: 80%;"/>
								  		</colgroup>
								  		<thead class="bg-primary">
								  		<tr>
								  			<th class="text-center" style="background-color: #FACC2E;">이름</th>
								  			<th class="text-center" style="background-color: #FACC2E;">자기소개서 제목</th>
								  			<th class="text-center" style="background-color: #FACC2E;">최종학력</th>
								  		</tr>
								  		</thead>
								  		<tbody>
									  		<c:choose>
										  		<c:when test="${list.size()>0}">
										  			<c:forEach var="resume" items="${list}">
											  			<tr id="${resume.regId }">
											  				<td class="text-center"><c:out value="${resume.userName}"/></td>
											  				<td class="text-center"><c:out value="${resume.clTitle}"/></td>
										  					<td class="text-center"><c:out value="${resume.cvGrade}"/></td>
											  			</tr>
										  			</c:forEach>
									  			</c:when>
									  			<c:otherwise>
						 	 						<tr>
						 	 							<td class="text-center" colspan="99">이력서를 오픈한 구직자가 없습니다.</td>
						 	 						</tr>
						  						</c:otherwise>
								  			</c:choose>
								  		</tbody>
								  	</table>
							  	</div>
							<!--pagenation ---------------------------------------------------->
						  	<div class="dorm-inline text-center">
			  			  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "CompHireStt.do", "searchPage") %>
						  	</div>
						  	<!--// pagenation영역 ----------------------------------------------->
				  		</div>
		    		<!--// Grid영역 ---------------------------------------------------->
			    </div>
	     	</div>
	     </div>
	
		
		 </section>
    
    <script type="text/javascript">
    
	    function searchPage(url,pageNum){
			//alert("url : "+url+" page_num : "+pageNum);
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}	
	
		function doSearch(){//검색
			var frm = document.frm;
			frm.pageNum.value = 1;
			frm.action="CompResume.do";
			frm.submit();
		}
		
		$(document).ready(function(){
	    	//엔터키 처리
			$("#searchWord").keydown(function(key) {
				if (key.keyCode == 13) {
					doSearch();
				}
			});
	    	
			$("#listTable>tbody").on("click","tr",function(){
				var regId = $(this).attr('id');
				
				if("" == regId){
    				return;
    			}
				
    			var frm = document.frm;
        		frm.regId.value = regId;
        		frm.action = "UserResumeView.do";
        		frm.submit();
        		
			});
	    	
		});// $(document).ready(function()
	     
    </script>
    
</body>
</html>