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
	List<CodeVO> companySearch = (null == request.getAttribute("companySearch")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("companySearch");

	List<CodeVO> signup_q = (null == request.getAttribute("SIGNUP_Q")) ? new ArrayList<CodeVO>()
			: (List<CodeVO>) request.getAttribute("SIGNUP_Q");
%>	
<!DOCTYPE html>
<html>
<head>
     <title>기업관리</title>
 </head>
<body>
<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	
	<br/>
	<br/>
	<div class="container">
		<form id="frm" name="frm"  method="get">
		<input type="hidden" name="pageNum" id="pageNum" value="">
		<input type="hidden" name="selectClNo" id="selectClNo">
   		
   		<h1>기업관리</h1>
        	
   		<!-- 검색영역 -->
				
		<div class="row"> 
		 <div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
			<div class="form-group" > 
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(codePage, pageSize, "pageSize", false) %>
  						</div>
  						<div style="float: left; width: 33%;">
  							<%=StringUtill.makeSelectBox(companySearch, searchDiv, "searchDiv", false) %>
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
   <br>
    <!-- Grid영역 --> 
		<div class="table-responsive" align="center"  >
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
			<table id="listTable" class="table table-striped table-bordered table-hover">
  					<colgroup>
								  			<col width="5%"style="background-color: #FFFFFF;"/>
								  			<col width="40%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  			<col width="15%"style="background-color: #FFFFFF;"/>
								  			<col width="10%"style="background-color: #FFFFFF;"/>
								  		</colgroup>
				    	
				    	<thead class="bg-primary">
				    	 <tr>
				        <th class="text-center" style="background-color: #FACC2E;"><input type="checkbox" id="checkAll" name="checkAll" onclick="checkAll();" ></th> 
				        <th class="text-center" style="background-color: #FACC2E;">이메일</th>
					     <th class="text-center" style="background-color: #FACC2E;">회사명</th>
						 <th class="text-center" style="background-color: #FACC2E;">대표자</th>
						<th class="text-center"  style="background-color: #FACC2E;">가입일</th>
						<th class="text-center"  style="background-color: #FACC2E;">이용가능</th>
						
					</tr>
				</thead>
				<tbody>
						<c:choose>
							<c:when test="${list.size()>0}">
						  	<c:forEach var="UserVO" items="${list}">
						  	<tr>
						  		<td class="text-center"><input type="checkbox" id="check" name="check"></td>
						  		<td class="text-center"><c:out value="${UserVO.userId}"/></td>
						  		<td class="text-center"><c:out value="${UserVO.userNick}"/></td>
  									<td class="text-center"><c:out value="${UserVO.userName}"/></td>
  									<td class="text-center"><c:out value="${UserVO.regDt}"/></td>
  									<td class="text-center"><c:out value="${UserVO.userLevel}"/></td>
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
	  		<%=StringUtill.renderPaging(totalCnt, oPageNum, oPageSize, bottomCount, "companyList.do", "searchPage") %>
	  	</div>
	  	</div><br><br>
	<!-- // Grid영역 -->
	
	<!-- 입력 Form영역---- ----------------------------------------------->
			
			<div class="table-responsive" align="center" >
			
			
			<label class="col-lg-4 control-label">이메일</label>
			<div  class="col-lg-3">
			<input type="text" name="userId" id="userId" disabled="disabled"
						   class="form-control input-sm" placeholder="이메일" />						   
			
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
					<label class="col-lg-4 control-label">기업명</label>
					<div  class="col-lg-3">
						<input type="text" name="userNick" id="userNick"
						   class="form-control input-sm" placeholder="기업명"
						   maxlength="20" />
					</div>
				</div>				
												
				<div class="form-group">
					<label class="col-lg-4 control-label">대표 성함</label>
					<div  class="col-lg-3">
						<input type="text" name="userName" id="userName"
						   class="form-control input-sm" placeholder="대표성함"
						   maxlength="4" />
					</div>
				</div>				
				<div class="form-group">
					<label class="col-lg-4 control-label">회사 전화번호</label>
					<div  class="col-lg-3">
						<input type="text" name="userPhone" id="userPhone"
						   class="form-control input-sm" placeholder="회사 전화번호"
						   maxlength="4" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-lg-4 control-label">주소</label>
					<div  class="col-lg-3">
						<input type="text" name="userAdd" id="userAdd"
						   class="form-control input-sm" placeholder="주소"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">매출액</label>
					<div  class="col-lg-3">
						<input type="text" name="enterSalay" id="enterSalay"
						   class="form-control input-sm" placeholder="매출액"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">사원수</label>
					<div  class="col-lg-3">
						<input type="text" name="enterCnt" id="enterCnt"
						   class="form-control input-sm" placeholder="사원수"
						   maxlength="200" />
					</div>
				</div>	
				
				<div class="form-group">
					<label class="col-lg-4 control-label">설립일</label>
					<div  class="col-lg-3">
						<input type="text" name="enterHiredate" id="enterHiredate"
						   class="form-control input-sm" placeholder="설립일"
						   maxlength="200" />
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-lg-4 control-label">이용가능</label>
					<div  class="col-lg-3">
						<select name="userLevel" id="userLevel" class="form-control input-sm">
							
							<option value="2">무</option>
							<option value="3">유</option>
							
						</select>
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
		function searchPage(url,pageNum){
			var frm = document.frm;
			frm.pageNum.value = pageNum;
			frm.action = url;
			frm.submit();
		}	
		
		
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

	            url:"companySelect.do",

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
	              
	              $("#enterSalay").val(parseData.enterSalay);
	              
	              $("#enterCnt").val(parseData.enterCnt);
	              	             	             
	              $("#enterHiredate").val(parseData.enterHiredate);
	
	              $("#UserLevel").val(parseData.UserLevel);
	              
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
			frm.action="companyList.do";
			frm.submit();
		} 
	
		
		
		$(document).ready(function(){
			//alert("ready");
			$("#do_update").on("click",function(){
				//alert("ready");
				if(false == confirm("수정 하시곘습니까?")){
    				return;
    			}
				
				$.ajax({
   		         type:"POST",
   		         url:"companyUpdate.do",
   		         dataType:"html",// JSON
   		         data:{
   		        	"userId":$("#userId").val() ,
   		         	"userPasswd":$("#userPasswd").val(),
   		         	"userNick":$("#userNick").val(),
   		         	"userName":$("#userName").val(),
   		         	"userPhone":$("#userPhone").val(),
   		         	"userAdd":$("#userAdd").val(),
   		        	"enterSalay":$("#enterSalay").val(),
   		    	   "enterCnt":$("#enterCnt").val(),
   		  	   	   "enterHiredate":$("#enterHiredate").val(),
   		  	  		"userLevel":$("#userLevel").val(), 
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
	   		         url:"companyDelete.do",
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
			
				
</body>
</html>