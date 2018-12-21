<%@page import="com.sist.gj.common.StringUtill"%>
<%@page import="com.sist.gj.vo.SearchVO"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String context = request.getContextPath();

	String pageSize = "10";
	String pageNum = "1";
	String searchDiv = ""; //검색구분
	String searchWord = ""; //검색어

	String userPassQu = "";//찾기질문

	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "20");
	searchWord = StringUtill.nvl(request.getParameter("searchWord"), "");
	pageSize = StringUtill.nvl(request.getParameter("pageSize"), "10");
	pageNum = StringUtill.nvl(request.getParameter("pageNum"), "1");

	int totalCnt = 0;
	int bottomCount = 10;

	int oPageSize = Integer.parseInt(pageSize);
	int oPageNum = Integer.parseInt(pageNum);

	String totalCnts = (null == request.getAttribute("totalCnt")) ? "10"
			: request.getAttribute("totalCnt").toString();
	totalCnt = Integer.parseInt(totalCnts);
	
%>
    
<!DOCTYPE html>
<html>
<head>
  <title>구직자 관리</title>
  </head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br/>
	
  <div class="table-responsive" align="center" >
    
   
	<input type="button" class="btn btn-primary btn-lg" style="background-color: #B5A686;" value="구직자 관리" id="goUser" name="goUser"
					onclick="goUser()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" class="btn btn-primary btn-lg" style="background-color: #B5A686;" value="기업 관리" id="goCom" name="goCom"
					onclick="goCom()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" class="btn btn-primary btn-lg" style="background-color: #B5A686;" value="리뷰관리" id="goReview" name="goReview"
					onclick="goReview()" />
</div>
   
   
	
	<div class="container">
		<form id="frm" name="frm"  method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="1">
		<input type="hidden" name="selectClNo" id="selectClNo">
   		
   		<h1>신고 리뷰 관리</h1>
		
		</form>
	</div>
    <!--// 검색영역----------------------------------------------------->
   
   
   
    <!-- Grid영역 -->
    <br>
		<div class="table-responsive" align="center" >
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
				<table id="listTable" class="table table-striped table-bordered table-hover" >
				    					<colgroup>
								  			<col width="80%"style="background-color: #FFFFFF;"/>
								  			<col width="20%"style="background-color: #FFFFFF;"/>
								  		</colgroup>
				    	
				  		<thead class="bg-primary">
				  		<tr> 
				       <th class="text-center " style="background-color: #FACC2E;">제목</th>
						<th class="text-center" style="background-color: #FACC2E;">신고수</th>											
					</tr>
				</thead>
					<tbody> 
								<c:choose>
	  						<c:when test="${list.size()>0}">
	  							<c:forEach var="UserVO" items="${list}">
	  								<tr id="${UserVO.reviewNo}">
	  									<td class="text-center"><c:out value="${UserVO.reviewTitle}"/></td>
	  									<td class="text-center"><c:out value="${UserVO.reviewComplain}"/></td>
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
				
				  	<div class="dorm-inline text-center">
	  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "reviewList.do", "searchPage") %>
	  	</div>
  	</div><br><br>
	<!-- // Grid영역 -->
	

	
	
	<!-- 입력 Form영역---- ----------------------------------------------->
			
			<div class="table-responsive" align="center" >
			
			<div class="form-group">
			<label class="col-lg-4 control-label">제목</label>
			<div  class="col-lg-3">
			<input type="hidden" name="reviewNo" id="reviewNo" />						   
			
			<input type="text" name="reviewTitle" id="reviewTitle" disabled="disabled"
						   class="form-control input-sm" placeholder="제목" />						   
			</div>
			</div>
			
			
			<div class="form-group">
					<label class="col-lg-4 control-label">내용</label>
					<div  class="col-lg-3">
						<input type="text" name="reviewBody" id="reviewBody"
						   class="form-control input-sm" placeholder="내용"
						   maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">신고수</label>
					<div  class="col-lg-3">
						<input type="text" name="reviewComplain" id="reviewComplain"
						   class="form-control input-sm" placeholder="신고수"
						   maxlength="20" />
					</div>
				</div>	
				  <button type="button" class="btn btn-default btn-sm" id="do_delete">삭제하기</button>			
			</div>	
	      					      				
	      
				      														
			</div>
	<!-- //입력 Form영역---- ----------------------------------------------->			
	<script type="text/javascript">
	
	$(document).ready(function(){
			$("#do_delete").on("click",function(){
				//alert("ready");
				if(false == confirm("삭제 하시겠습니까?")){
    				return;
    			}
				
				
				$.ajax({
	   		         type:"POST",
	   		         url:"reviewDelete.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		         	"reviewNo": $("#reviewNo").val()
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

		$("#listTable>tbody").on("click","tr",function(){

			console.log("1 #listTable>tbody");
	

			var userId = $(this).attr('id');
			

			if(""==userId)return;
			
			//alert("userId"+userId);
			

	        $.ajax({

	            type:"POST",

	            url:"reviewSelect.do",

	            dataType:"html",// JSON

	            data:{

	            "reviewNo": userId

	            },

	            success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수

	              var parseData = $.parseJSON(data);
     
	              $("#reviewNo").val(parseData.reviewNo);	
	            
	              $("#reviewTitle").val(parseData.reviewTitle);

	              $("#reviewBody").val(parseData.reviewBody);

	              $("#reviewComplain").val(parseData.reviewComplain);
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
			frm.action="reviewList.do";
			frm.submit();
		}
	
		
		function goUser() {
			var frm = document.login;
			frm.action = "usercompany.jsp";
			frm.submit();
		}
		
		$(function() {
			$("#goUser").click(function() {
				location.href = "../mypageAdmin/userList.do";
			})
		})
		
		function goCom() {
			var frm = document.login;
			frm.action = "usercompany2.jsp";
			frm.submit();
		}
		
		$(function() {
			$("#goCom").click(function() {
				location.href = "../mypageAdmin/companyList.do";
			})
		})
		
		
		$(function() {
			$("#goReview").click(function() {
				location.href = "../mypageAdmin/reviewList.do";
			})
		})
	</script>
		
		

</body>
</html>