<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br/>
	<br/>
	<div class="container">
		<form>
		<input type="hidden" name="page_num" id="page_num">
  		<!-- --검색영역 -->
  			<div class="row" style="float: right;">
  		  		<div class="text-right col-xs-8 col-sm-8 col-md-8 col-lg-8">
  					<div class="form-group" >
  						<div style="float: left; width: 33%;">
  						<select name="search_Div" id="search_Div" class="form-control input-sm">
  							<option value="10">10</option>
  							<option value="20">20</option>
  							<option value="50">50</option>
  						</select>
  						</div>
  						<div style="float: left; width: 33%;">
  							<select name="search_Div" id="search_Div" class="form-control input-sm">
  							<option value="10">제목</option>
  							<option value="20">작성자</option>
  						</select>
  						</div>
  						<div style="float: left; width: 33%;">
  							<input type="text" name="search_Word" id="search_Word" class="form-control input-sm" placeholder="검색어"/>
  						</div>
  					</div>
  		  		</div>
  		  		<div class="form-group">
  					<button type="button" class="btn btn-default btn-sm" onclick="doSearch();">조회</button>
  					<button type="button" class="btn btn-default btn-sm" id="doSave" >등록</button>
  				</div>
  			</div>
		</form>
	</div>
	<div class="table-responsive" align="center">
		<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center">
		  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
		  		<colgroup>
		  			<col width="20%"/>
		  			<col width="60%"/>
		  			<col width="20%"/>
		  		</colgroup>
		  		<thead class="bg-primary">
		  		<tr>
		  			<th class="text-center">작성자</th>
		  			<th class="text-center">자기소개서 제목</th>
		  			<th class="text-center">작성일</th>
		  		</tr>
		  		</thead>
		  		<tbody>
		  			<c:choose>
  						<c:when test="${list.size()>0}">
  							<c:forEach var="jasoVO" items="${list}">
  								<tr>
  									<td class="text-center"><c:out value="${jasoVO.userNick}"/></td>
  									<td class="text-left"><c:out value="${jasoVO.clTitle}"/></td>
  									<td class="text-center"><c:out value="${jasoVO.regDt}"/></td>
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
	  		1
	  	</div>
  	</div>
  	<!-- Grid영역종료 -->
	<script type="text/javascript">
		
		$(document).ready(function(){
			//alert("ready");
			$("#doSave").on("click",function(){
				//alert("ready");
				location.href = "jasoUpdate.jsp";
			});
		});
	</script>
</body>
</html>