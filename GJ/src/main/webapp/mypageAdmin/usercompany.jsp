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

	searchDiv = StringUtill.nvl(request.getParameter("searchDiv"), "");
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

	List<CodeVO> codeSearch = (null == request.getAttribute("codeSearch")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("codeSearch");
	List<CodeVO> codePage = (null == request.getAttribute("codePage")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("codePage");
	List<CodeVO> userSearch = (null == request.getAttribute("userSearch")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("userSearch");

	List<CodeVO> signup_q = (null == request.getAttribute("SIGNUP_Q")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("SIGNUP_Q");
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
	<input type="button" class="btn btn-primary btn-lg" style="background-color: #B5A686;" value="기업 관리" id="goCom" name=""goCom""
					onclick="goCom()" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type="button" class="btn btn-primary btn-lg" style="background-color: #B5A686;" value="리뷰관리" id="goReview" name="goReview"
					onclick="goReview()" />
</div>
   
   
	
	<div class="container">
		<form id="frm" name="frm"  method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="1">
		<input type="hidden" name="selectClNo" id="selectClNo">
   		
   		<h1>구직자관리</h1>
        	
		<!-- 검색영역 -->
		
		
		<div class="row">
		 <div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
			<div class="form-group" > 
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(codePage, pageSize, "pageSize", false) %>
  						</div>
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(userSearch, searchDiv, "searchDiv", false) %>
  						</div>
  						<div style="float: left; width: 33%;">
  							<input type="text" name="searchWord" id="searchWord" value="${param.searchWord}" class="form-control input-sm" placeholder="검색어"/>
  						</div>
  					</div>
  					</div>
    			<div class="form-group">
  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
  				</div>
  			</div>
		</form>
	</div>
    <!--// 검색영역----------------------------------------------------->
   
   
   
    <!-- Grid영역 -->
    <br>
		<div class="table-responsive" align="center" >
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
				<table id="listTable" class="table table-striped table-bordered table-hover" >
				    					<colgroup>
								  			<col width="5%"style="background-color: #FFFFFF;"/>
								  			<col width="45%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  			<col width="20%"style="background-color: #FFFFFF;"/>
								  		</colgroup>
				    	
				  		<thead class="bg-primary">
				  		<tr>
				       <th class="text-center " style="background-color: #FACC2E;"><input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll();" ></th> 
				       <th class="text-center " style="background-color: #FACC2E;">이메일</th>
						<th class="text-center" style="background-color: #FACC2E;">이름</th>
						<th class="text-center" style="background-color: #FACC2E;">닉네임</th>
						<th class="text-center" style="background-color: #FACC2E;">가입일</th>
						
						
					</tr>
				</thead>
					<tbody> 
								<c:choose>
	  						<c:when test="${list.size()>0}">
	  							<c:forEach var="UserVO" items="${list}">
	  								<tr>
	  									<td class="text-center"><input type="checkbox" id="check" name="check"></td> 
	  									<td class="text-center"><c:out value="${UserVO.userId}"/></td>
	  									<td class="text-center"><c:out value="${UserVO.userName}"/></td>
	  									<td class="text-center"><c:out value="${UserVO.userNick}"/></td>
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
				
				  	<div class="dorm-inline text-center">
	  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "userList.do", "searchPage") %>
	  	</div>
  	</div><br><br>
	<!-- // Grid영역 -->
	

	
	
	<!-- 입력 Form영역---- ----------------------------------------------->
			
			<div class="table-responsive" align="center" >
			
			<div class="form-group">
			<label class="col-lg-4 control-label">이메일</label>
			<div  class="col-lg-3">
			<input type="text" name="userId" id="userId" disabled="disabled"
						   class="form-control input-sm" placeholder="이메일" />						   
			</div>
			</div>
			
			
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호</label>
					<div  class="col-lg-3">
						<input type="password" name="userPasswd" id="userPasswd"
						   class="form-control input-sm" placeholder="비밀번호"
						   maxlength="20" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">닉네임</label>
					<div  class="col-lg-3">
						<input type="text" name="userNick" id="userNick"
						   class="form-control input-sm" placeholder="닉네임"
						   maxlength="20" />
					</div>
				</div>				
							
				<div class="form-group">
					<label class="col-lg-4 control-label">성함</label>
					<div  class="col-lg-3">
						<input type="text" name="userName" id="userName"
						   class="form-control input-sm" placeholder="성함"
						   maxlength="4" />
					</div>
				</div>				
				<div class="form-group">
					<label class="col-lg-4 control-label">전화번호</label>
					<div  class="col-lg-3">
						<input type="text" name="userPhone" id="userPhone"
						   class="form-control input-sm" placeholder="전화번호"
						   maxlength="4" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">주소</label>
					<div  class="col-lg-3">
						<input type="text" name="uerAdd" id="userAdd"
						   class="form-control input-sm" placeholder="주소"
						   maxlength="200" />
					</div>
				</div>	
			<div class="form-group"> 
					<label class="col-lg-4 control-label">비밀번호 찾기 질문:</label>
					<div  class="col-lg-3">
	   			<%=StringUtill.makeSelectBox(signup_q, userPassQu, "userPassQu", false) %>
	      	</div>
			</div>	
	      				
			<div class="form-group">
					<label class="col-lg-4 control-label">비밀번호 찾기 답변:</label>
					<div  class="col-lg-3">
						<input type="text" name="userPassAn" id="userPassAn"
						   class="form-control input-sm" placeholder="비밀번호 찾기 답변"
						   maxlength="200" />
					</div>
				</div>		      				
	      <button type="button" class="btn btn-default btn-sm" id="do_update">수정하기</button>
		  <button type="button" class="btn btn-default btn-sm" id="do_delete">탈퇴시키기</button>		      														
			</div>
	<!-- //입력 Form영역---- ----------------------------------------------->			
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#listTable>tbody").on("click","tr",function(){

			console.log("1 #listTable>tbody");
	

			var tr = $(this);

			var td = tr.children();

			var userId = td.eq(1).text();

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