<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="com.sist.gj.common.StringUtill"%>
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
	
	#profimg{
		border: 1px solid black;
		width:15%;
		height:200px;
		padding: 15px;
		float: left;
	}
	#profcontext{
		width: 88%;
		float: left;
		padding: 15px;
	}
	input:focus {
	  outline: none;
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
					    	        onclick="location='UserMyInfo.do'">나의 정보</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserResumeView.do'">이력서</button><br/><br/>
					    	<button id ="bubble-float-right" 
					    			style="background-color: transparent; border: 0; outline:0; font-weight: bold; font-size: 120%;"
					    	        onclick="location='UserApply.do'">지원 현황</button>
				    	</div>
			    	</div>
			    	
			    	<div style=" float: left; height: auto; width: 80%;" align="left">
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
			    		<h5 style="color: orange" align="center"><strong>나의 이력서</strong></h5>
				    	<div style="float: left; width: 110%; height: auto; padding:10px;" align="center">
					    	<div id="profcontext" style="text-align: center;">
					    		
					    		<div id ="profimg" style="margin: 10px;" >
					    		이미지 불러오기
						    		<div style="float:left; font-size:70%">
						    		이미지는 나의 정보에서 변경 가능합니다
						    		</div>
					    		</div><br/>
	    		<form name="frm" id="frm" class="form-horizontal" method="post" >
					    		<div class="form-group" style="float: left;margin-right:45%;">
					    			<label for="regId" class="col-sm-4 control-label" style="float: left; text-align: left;"><strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="regId" name="regId" value="${userName}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="userPhone" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>전화번호</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="userPhone" name="userPhone" value="${userPhone}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="userId" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>이메일&nbsp;&nbsp;&nbsp;</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="userId" name="userId" value="${userId}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
									<label for="cvGrade" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>최종학력</strong></label>
									<div class="col-sm-7" style="float: left;">
									    <c:set var="opt" value="${cvGrade}" />
										<select class="form-control" name="cvGrade" id="cvGrade" style="width:190px;" disabled>
											<option value="1"<c:if test="${opt == '1' }">selected</c:if>>학력무관</option>
											<option value="2"<c:if test="${opt == '2' }">selected</c:if>>고졸</option>
											<option value="3"<c:if test="${opt == '3' }">selected</c:if>>초대졸</option>
											<option value="4"<c:if test="${opt == '4' }">selected</c:if>>대졸</option>
											<option value="5"<c:if test="${opt == '5' }">selected</c:if>>석사이상	</option>
										</select>
									</div>
								</div>
				</form>
						    </div>	
						   
						    <div id="profcontext" style="font-size: 80%; text-align: left;">
						    
						    	<strong style="color: #045FB4; font-size: 130%">자격증/어학</strong><br/>
						    	
						    	<div class="table-responsive" align="center">
								<div class="text-center col-xs-8 col-sm-8 col-md-8 col-lg-8" align="center" style="float:left;">
								
							  	
								  	<table id="listTable" class="table table-striped table-bordered table-hover" style="table-layout:fixed; word-break:break-all;">
								  		<colgroup>
								  			<col width="50%"style="background-color: #FFFFFF;"/>
								  			<col width="25%"style="background-color: #FFFFFF;"/>
								  			<col width="25%"style="background-color: #FFFFFF;"/>
								  		</colgroup>
								  		<thead class="bg-primary">
								  		<tr>
								  			<th class="text-center" style="background-color: #FACC2E;">자격증/어학 시험 이름</th>
								  			<th class="text-center" style="background-color: #FACC2E;">취득일</th>
								  			<th class="text-center" style="background-color: #FACC2E;">성적</th>
								  		</tr>
								  		</thead>
								  		<tbody>
								  			<c:choose>
								  				<c:when test="${list.size()>0}">
								  					<c:forEach var="license" items="${list}">
								  					<tr id="${license.licNo }">
										  				<td class="text-center"><c:out value="${license.licName}"/></td> 
										  				<td class="text-center"><c:out value="${license.licDate}"/></td> 
		 								  				<td class="text-center"><c:out value="${license.licScore}"/></td>
		 								  			</tr>
								  					</c:forEach>
								  				</c:when>
			  				 	 					<c:otherwise>
						 	 						<tr>
						 	 							<td class="text-center" colspan="99">자격증 정보가 없습니다.</td>
						 	 						</tr>
							  						</c:otherwise>
								  			</c:choose>
								  		</tbody>
								  	</table>
							  	</div>
							  	
								<br/><br/>
								</div>
								<div style="float:left;">
									<strong style="color: #045FB4; font-size: 130%">자기소개서<br/></strong>
								</div>
								<table class="table table-bordered" style="table-layout:fixed; word-break:break-all;">
					            	<colgroup>
				  						<col width="20%"/>
				  						<col width="80%"/>
				  					</colgroup>
					            	<tbody>
					            		<tr>
					            			<th>제목</th>
					            			<td><strong>${clTitle}</strong></td>
					            		</tr>
					            		<tr>
					            			<th>성장과정</th>
					            			<td>${clSungjang}</td>
					            		</tr>
					            		<tr>
					            			<th>성장과정</th>
					            			<td>${clSang}</td>
					            		</tr>
					            		<tr>
					            			<th>학교생활</th>
					            			<td>${clJangdan}</td>
					            		</tr>
					            		<tr>
					            			<th>성격장단점</th>
					            			<td>${clJiwon}</td>
					            		</tr>
					            		<tr>
					            			<th>지원동기</th>
					            			<td>${clCheck}</td>
					            		</tr>
					            	</tbody>
					            </table>
					            <div>
					            	<strong>내 이력서 및 개인정보를 기업이 열람할 수 있게 하고, 기업이 연락할 수 있음에 동의합니다.</strong>
					            	<div style="text-align: right;">
						            	<c:set var="cvChk" value="${cvCheck }" />
											<c:if test="${cvChk eq '0'}">
								            	<label class="radio-inline">
								            		<input type="radio" name="cvCheck" id="cvCheck" value="1" disabled="disabled"> 예
								            	</label>
								            	<label class="radio-inline">
								            		<input type="radio" name="cvCheck" id="cvCheck" value="2" checked="checked" disabled="disabled"> 아니오
								            	</label>
							            	</c:if>
							            	<c:if test="${cvChk eq '1'}">
								            	<label class="radio-inline">
								            		<input type="radio" name="cvCheck" id="cvCheck" value="1" checked="checked" disabled="disabled"> 예
								            	</label>
								            	<label class="radio-inline">
								            		<input type="radio" name="cvCheck" id="cvCheck" value="2" disabled="disabled"> 아니오
								            	</label>
							            	</c:if>
						            	</div><br/>
						            	<strong>내 자기소개서를 자기소개서 게시판에 게시하여 유저들의 첨삭을 받겠습니다.</strong>
						            	<div style="text-align: right;">
						            		<c:set var="clChk" value="${clCheck }" />
						            			<c:if test="${clChk eq '0'}">
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck" id="clCheck" value="1" disabled="disabled"> 예
									            	</label>
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck" id="clCheck" checked="checked" disabled="disabled"> 아니오
									            	</label>
									            </c:if>
									            <c:if test="${clChk ne '0'}">
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck" id="clCheck" value="1" checked="checked" disabled="disabled"> 예
									            	</label>
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck" id="clCheck" disabled="disabled"> 아니오
									            	</label>
									            </c:if>
					            		</div><br/>
					            		<strong>현재 자기소개서를 나의 이력서와 한 묶음으로 취급합니다. <br/>(이를 '예'에 체크하지 않을 시, 지원하는 기업의 이력서에 자기소개서는 빈칸으로 나타나게 됩니다.)</strong>
					            		<div style="text-align: right;">
						            		<c:set var="clChk" value="${clCheck }" />
						            			<c:if test="${clChk ne '2'}">
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck2" id="clCheck2" value="2" disabled="disabled"> 예
									            	</label>
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck2" id="clCheck2" checked="checked" disabled="disabled"> 아니오
									            	</label>
									            </c:if>
									            <c:if test="${clChk eq '2'}">
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck2" id="clCheck2" value="2" checked="checked" disabled="disabled"> 예
									            	</label>
									            	<label class="radio-inline">
									            		<input type="radio" name="clCheck2" id="clCheck2" disabled="disabled"> 아니오
									            	</label>
									            </c:if>
					            		</div><br/><br/>
					            </div>
					            <h6 style="color:red;">변경할 사항이 있다면 수정하기 버튼을 누른 후 수정해 주십시오.<br/>단, 기업에 지원했을 경우 보여지는 이력서는 최근 변경된 이력서이며, 변경 전의 이력서를 기업이 열람했을 수 있습니다.<br/></h6>
						    </div>
				    	<div style="margin: 50px;">
				    		<input id="smallBtn" type="button" value="수정하기"
				    		       onclick="location='UserResume.do'">
				    	</div>	
				    	
				    	</div>
			    	</div>
		          </div>
		     </div>
	
		
		 </section>
		 
		 <script type="text/javascript">
	    	$(document).ready(function(){
	    		//alert('document');
	    		
	    	}); //-- document 
	 	
	    	
	    </script>
    

</body>
</html>