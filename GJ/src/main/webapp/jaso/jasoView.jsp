<%@page import="com.sist.gj.vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% 
	String context = request.getContextPath();
	UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
	String userId = "";
	String userNick = "";
	
	if(null != sessionVO){
		userId = sessionVO.getUserId();
		userNick = sessionVO.getUserNick();
	}
%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
    <br/>
    <br/>
    <form id="frm" name="frm">
    </form>
	<div class="container" align="center">
		<div class="col-lg-8 col-md-12">
			<div class="row">
			    <div class="col-md-12">
			        <div class="right-side">
			            <h3>${clTitle}</h3>
			            <br/>
			            <div class="form-group" align="right">
			            <form id="updateFrm" name="updateFrm">
			            	<input type="hidden" id="clNo" name="clNo" value="${clNo}">
			            	<input type="hidden" id="selectClNo" name="selectClNo" value="${clNo}">
			            	<input type="hidden" id="clTitle" name="clTitle" value="${clTitle}">
			            	<input type="hidden" id="clSungjang" name="clSungjang" value="${clSungjang}">
			            	<input type="hidden" id="clSang" name="clSang" value="${clSang}">
			            	<input type="hidden" id="clJangdan" name="clJangdan" value="${clJangdan}">
			            	<input type="hidden" id="clJiwon" name="clJiwon" value="${clJiwon}">
			            	<input type="hidden" id="userNick" name="userNick" value="${userNick}">
			            	<input type="hidden" id="regDt" name="regDt" value="${regDt}">
			            	<input type="hidden" id="cList" name="cList" value="${cList}">
			            	<input type="hidden" id="regId" name="regId" value="${regId}">
			            	<button type="button" class="btn btn-default btn-sm" onclick="moveList();">목록</button>
			            	<c:set var="LoginId" value="<%=userId%>" />
			  				<!------------------------------- 작성자만 보이는 버튼 -------------------------------------- -->
			  				<c:if test="${LoginId eq regId}">
			  					<button type="button" class="btn btn-default btn-sm" onclick="doUpdate();">수정</button>
  								<button type="button" class="btn btn-default btn-sm" id="doDelete" >삭제</button>
			  				</c:if>
  							<!-- ------------------------------------------------------------------------------- -->
			            </form>
			            	
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
			            			<td>${clSungjang}</td>
			            		</tr>
			            		<tr>
			            			<th>학교생활</th>
			            			<td>${clSang}</td>
			            		</tr>
			            		<tr>
			            			<th>성격장단점</th>
			            			<td>${clJangdan}</td>
			            		</tr>
			            		<tr>
			            			<th>지원동기</th>
			            			<td>${clJiwon}</td>
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
			            		<c:choose>
			  						<c:when test="${cList.size()>0}">
			  							<c:forEach var="jasoCVO" items="${cList}">
			  								<tr id="${jasoCVO.commentNo}">
			  									<td class="text-center"><c:out  value="${jasoCVO.userNick}"/></td>
			  									<td class="text-left"><c:out value="${jasoCVO.commentBody}"/></td>
			  									<td class="text-center"><c:out value="${jasoCVO.regDt}"/>
			  									<c:set var="CId" value="<%=userId%>" />
			  									<c:if test="${CId eq jasoCVO.regId}">
			  										<button type="button" class="btn btn-default btn-sm" id="doCDelete" >삭제</button>
			  									</c:if>
			  									</td>
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
			            <form id="contact" name="contact" method="post" class="form" role="form">
			            	<c:set var="LoginId" value="<%=userId%>" />
			            	<c:choose>
			            		<c:when test="${LoginId ne ''}">
			            			<textarea class="form-control" id="comment" name="comment" placeholder="Message" rows="5"></textarea>
			            		</c:when>
			            		<c:otherwise>
			            			댓글작성은 로그인이 필요합니다.
			            		</c:otherwise>
			            	</c:choose>
			                
			            </form>   
			                <br/>
			                <div class="row">
			                    <div class="col-xs-12 col-md-12 form-group">
			                    		<c:if test="${LoginId ne ''}">
						  					<input type="button" class="btn btn-primary" id="submitC" name="submitC" value="댓글달기"/>
						  				</c:if>
			                    </div>
			                </div>
			            
			        </div>
			    </div>
			</div>
			
		</div>
	</div>
	<script type="text/javascript">
		function moveList(){
			var frm = document.frm;
			frm.action="jasoList.do";
			frm.submit();
		}
	
		function reLoad(){
			var frm = document.updateFrm;
			frm.action="jasoView.do";
			frm.submit();
		}
	
		function doUpdate(){ 
			var frm = document.updateFrm;
			frm.action="jasoUpdateMove.do";
			frm.submit();
		}
	
		function doSearch(){
			var frm = document.frm;
			frm.action="jasoList.do";
			frm.submit();
		}
		
		$(document).ready(function(){
			$("#doDelete").on("click",function(){
				//alert("ready");
				if(false == confirm("삭제 하시겠습니까?")){
    				return;
    			}
				
				
				$.ajax({
	   		         type:"POST",
	   		         url:"delete.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		         	"clNo": $("#clNo").val()
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
			
			$("#doCDelete").on("click",function(){
				if(false == confirm("삭제 하시겠습니까?")){
    				return;
    			}
				var bt = $(this);
				var td = bt.parents("td");
				var tr = td.parents("tr");
				var clcId = tr.attr('id');
				//alert(clcId);
				
				$.ajax({
	   		         type:"POST",
	   		         url:"cDelete.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		         	"commentNo": clcId
	   		         },
	   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
	   		         	var parseData = $.parseJSON(data);
	   		         	if(parseData.flag > 0){
	   		         		alert(parseData.msg);
	   		         		reLoad();
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
			
			$("#submitC").on("click",function(){
				//alert("click");
				var frm = $("#comment").val();
				//alert(frm);
				if("" == frm){
					alert("댓글을 입력해주세요.");
					return;
				}
				
				$.ajax({
	   		         type:"POST",
	   		         url:"cInsert.do",
	   		         dataType:"html",// JSON
	   		         data:{
	   		         	"commentBody": frm,
	   		         	"clNo":$("#clNo").val() ,
	   		         	//--------------------------------------
	   		         	//세션처리
	   		         	//"userId":userId,
	   		         	//"regId":userId
						//--------------------------------------
	   		         },
	   		         success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
	   		         	var parseData = $.parseJSON(data);
	   		         	if(parseData.flag > 0){
	   		         		alert(parseData.msg);
	   		         		reLoad();
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