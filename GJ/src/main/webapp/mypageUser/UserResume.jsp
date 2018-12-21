<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sist.gj.vo.CodeVO"%>
<%@page import="com.sist.gj.vo.UserVO"%>
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
	input:focus, textarea:focus {
	  outline: none;
	}
	
	
</style>
<% 
	UserVO sessionVO = (UserVO)session.getAttribute("loginVo");
	int userLv = 5;
	
	if(null != sessionVO){
		userLv = sessionVO.getUserLevel();
	}
	
	String context = request.getContextPath();//context path
	String pictureUrl = context+request.getAttribute("pictureUrl");
	
	pageContext.setAttribute("newLineChar", "\n");
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
   		<form name="frm" id="frm" class="form-horizontal" method="post" >
			    		<div style="float: left; width: 1%; height: auto;" align="center"></div>
			    		<h5 style="color: orange" align="center"><strong>나의 이력서</strong></h5>
				    	<div style="float: left; width: 110%; height: auto; padding:10px;" align="center">
					    	<div id="profcontext" style="text-align: center;">
					    		
					    		
					    		<div id ="profimg" style="margin: 10px;" >
					    						    			<%
					    		if(!pictureUrl.equals("/gjnull")){
					    		%>
					    			<img src="<%=pictureUrl %>" height="180px" style='width: 100%; object-fit: contain' title="이미지는 나의 정보에서 변경 가능합니다">
					    		<%
					    		}else{
					    		%>
					    			<img src="../resources/images/noImage.png" height="180px" style='width: 100%; object-fit: contain' title="이미지는 나의 정보에서 변경 가능합니다">
					    		<%
					    		}
					    		%>
					    		</div><br/>

					    		<div class="form-group" style="float: left;margin-right:45%;">
					    			<label for="userName" class="col-sm-4 control-label" style="float: left; text-align: left;"><strong>이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="userName" name="userName" value="${userName}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="userPhone" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>전화번호</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="userPhone" name="userPhone" value="${userPhone}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
					    			<label for="regId" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>이메일&nbsp;&nbsp;&nbsp;</strong></label>
					    			<div class="col-sm-7" style="float: left;">
								    	<input type="text" class="form-control" id="regId" name="regId" value="${userId}" readOnly/>
							    	</div>
								</div>
								
								<div class="form-group" style="float: left; margin-right:45%;">
									<label for="cvGrade" class="col-sm-4 control-label" style="float: left;text-align: left;"><strong>최종학력</strong></label>
									<div class="col-sm-7" style="float: left;">
									    <c:set var="opt" value="${cvGrade}" />
										<select class="form-control" name="cvGrade" id="cvGrade" style="width:190px;">
											<option value="1"<c:if test="${opt == '1' }">selected</c:if>>학력무관</option>
											<option value="2"<c:if test="${opt == '2' }">selected</c:if>>고졸</option>
											<option value="3"<c:if test="${opt == '3' }">selected</c:if>>초대졸</option>
											<option value="4"<c:if test="${opt == '4' }">selected</c:if>>대졸</option>
											<option value="5"<c:if test="${opt == '5' }">selected</c:if>>석사이상	</option>
										</select>
									</div>
								</div>
						    </div>	
						   
						    <div id="profcontext" style="font-size: 80%; text-align: left;">
						    	<strong style="color: #045FB4; font-size: 130%">자격증/어학</strong><br/>
						    	성적이 없는 자격증/어학 시험일 경우 성적 부분을 입력하지 않아도 됩니다.<br>
						    	<red style="color:red;">단, 줄에 공백 없이 윗칸부터 작성해 주세요.</red>
						    	
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
						  			<c:set var="lic1" value="${lic1}" />
						  			<c:set var="lic2" value="${lic2}" />
						  			<c:set var="lic3" value="${lic3}" />
						  			<c:set var="lic4" value="${lic4}" />
						  			<c:set var="lic5" value="${lic5}" />
								  		<tr>
							  				<td class="text-center">
							  					<input type="hidden" id="licNo" id="licNo" name="licNo" value="<c:out value="${lic1.licNo }"/>"/>
							  					<textarea id="licName" name="licName" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;" ><c:out value="${lic1.licName }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licDate" name="licDate" rows="1" placeholder="2000/01/01" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic1.licDate }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licScore" name="licScore" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic1.licScore }"/></textarea>
							  				</td>
							  			</tr>
			 	 						<tr>
							  				<td class="text-center">
							  					<input type="hidden" id="licNo" id="licNo" name="licNo" value="<c:out value="${lic2.licNo }"/>"/>
							  					<textarea id="licName" name="licName" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;" ><c:out value="${lic2.licName }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licDate" name="licDate" rows="1" placeholder="2000/01/01" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic2.licDate }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licScore" name="licScore" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic2.licScore }"/></textarea>
							  				</td>
							  			</tr>
			 	 						<tr>
							  				<td class="text-center">
							  					<input type="hidden" id="licNo" id="licNo" name="licNo" value="<c:out value="${lic3.licNo }"/>"/>
							  					<textarea id="licName" name="licName" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;" ><c:out value="${lic3.licName }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licDate" name="licDate" rows="1" placeholder="2000/01/01" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic3.licDate }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licScore" name="licScore" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic3.licScore }"/></textarea>
							  				</td>
							  			</tr>
			 	 						<tr>
							  				<td class="text-center">
							  					<input type="hidden" id="licNo" id="licNo" name="licNo" value="<c:out value="${lic4.licNo }"/>"/>
							  					<textarea id="licName" name="licName" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;" ><c:out value="${lic4.licName }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licDate" name="licDate" rows="1" placeholder="2000/01/01" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic4.licDate }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licScore" name="licScore" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic4.licScore }"/></textarea>
							  				</td>
							  			</tr>
			 	 						<tr>
							  				<td class="text-center">
							  					<input type="hidden" id="licNo" id="licNo" name="licNo" value="<c:out value="${lic5.licNo }"/>"/>
							  					<textarea id="licName" name="licName" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;" ><c:out value="${lic5.licName }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licDate" name="licDate" rows="1" placeholder="2000/01/01" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic5.licDate }"/></textarea>
							  				</td> 
							  				<td class="text-center">
							  					<textarea id="licScore" name="licScore" rows="1" style="width:100%; border: 0; resize: none; background: transparent; text-align:center;"><c:out value="${lic5.licScore }"/></textarea>
							  				</td>
							  			</tr>
								  		</tbody>
								  	</table>
							  	</div>
							  	
								<br/><br/>
							</div>
							
								<div style="float: left;"><br/>
								위 사항들은 이력서에 포함되는 내용으로, 기업 열람 동의 시 기업에게 보여지게 되는 내용입니다.<br/>
								이하 아래의 자기소개서도 기업에게 보여지며, 자기소개서만 따로 게시판에 등록하여 유저들에게 조언을 얻을 수 있습니다.
								<br/><br/>
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
					            			<td>
					            				<input type="hidden" id="clNo" value="${clNo}"/>
					            				<textarea id="clTitle" name="clTitle" rows="1" style="width:100%; border: 0; resize: none;">${clTitle}</textarea>
					            			</td>
					            		</tr>
					            		<tr>
					            			<th>성장과정</th>
					            			<td><textarea id="clSungjang" name="clSungjang" rows="5" style="width:100%; border: 0; resize: none;"><c:out value="${fn:replace(clSungjang, newLineChar, '<br/>')}" escapeXml="false"/></textarea></td>
					            		</tr>
					            		<tr>
					            			<th>학교생활</th>
					            			<td><textarea id="clSang" name="clSang" rows="5" style="width:100%; border: 0; resize: none;"><c:out value="${fn:replace(clSang, newLineChar, '<br/>')}" escapeXml="false"/></textarea></td>
					            		</tr>
					            		<tr>
					            			<th>성격장단점</th>
					            			<td><textarea id="clJangdan" name="clJangdan" rows="5" style="width:100%; border: 0; resize: none;"><c:out value="${fn:replace(clJangdan, newLineChar, '<br/>')}" escapeXml="false"/></textarea></td>
					            		</tr>
					            		<tr>
					            			<th>지원동기</th>
					            			<td><textarea id="clJiwon" name="clJiwon" rows="5" style="width:100%; border: 0; resize: none;"><c:out value="${fn:replace(clJiwon, newLineChar, '<br/>')}" escapeXml="false"/></textarea></td>
					            		</tr>
					            	</tbody>
					            </table>
					            <div>
					            <strong>내 이력서 및 개인정보를 기업이 열람할 수 있게 하고, 기업이 연락할 수 있음에 동의합니다.</strong>
					            	<div style="text-align: right;">
						            	<label class="radio-inline">
						            		<input type="radio" name="cvCheck" id="cvCheck" value="1" > 예
						            	</label>
						            	<label class="radio-inline">
						            		<input type="radio" name="cvCheck" id="cvCheck" value="0" > 아니오
						            	</label>
					            	</div><br/>
					            </div>
					            <h6 style="color:red;">저장하기 버튼을 클릭하지 않으면, 수정된 정보가 저장되지 않습니다. 변경 사항이 있다면 꼭 저장하기 버튼을 눌러주십시오.<br/><br/></h6>
						    </div>
				    	<div style="margin: 50px;">
				    		<input id="smallBtn" name="do_save" type="button" value="저장하기">
				    	</div>	
				    	
				    	</div>
    	</form>
			    	</div>
		          </div>
		     </div>
		     
		 </section>
		 
		 <script type="text/javascript">
		 	var fileNumber = 2;
	    	$(document).ready(function(){
	    		$("input[name='do_save']").on("click",function(){
	    			
	    			var trueorfalse = $('input:radio[name=cvCheck]').is(':checked');
	    			if(trueorfalse == false){
	    				alert("마지막 항목에서 예 혹은 아니오를 반드시 선택해야 합니다.");
	    				return;
	    			}
	    			
	    			var licNo = [];
	    			var licName = [];
	    			var licDate = [];
	    			var licScore = [];
	    			$("input[name='licNo']").each(function(){
	    				var no = $(this).val(); 
	    				licNo.push(no);
	    			});
	    			$("textarea[name='licName']").each(function(){
	    				var name = $(this).val(); 
	    				licName.push(name);
	    			});
	    			$("textarea[name='licDate']").each(function(){
	    				var date = $(this).val(); 
	    				licDate.push(date);
	    			});
	    			$("textarea[name='licScore']").each(function(){
	    				var score = $(this).val(); 
	    				licScore.push(score);
	    			});
	    			
	    			for(var i=0; i<licScore.length; i++){
	    				if(licScore[i].length > 3){
	    					alert("자격증의 성적은 세 글자를 초과하여 적을 수 없습니다.");
	    					return;
	    				}
	    			}
	    			
	    			if(false==confirm("해당 내용을 저장하시겠습니까?"))return;
	    			
	    			var jsonNoList = JSON.stringify(licNo);
	    			var jsonNameList = JSON.stringify(licName);
	    			var jsonDateList = JSON.stringify(licDate);
	    			var jsonScoreList = JSON.stringify(licScore);
	    			
					$.ajax({
						type : 'POST',
						url : 'updateResume.do',
						data : {
							"regId": $("#regId").val(),
							"jsonNoList": jsonNoList,
							"jsonNameList": jsonNameList,
							"jsonDateList": jsonDateList,
							"jsonScoreList": jsonScoreList,
							"cvGrade": $("#cvGrade option:selected").val(),
							"cvCheck" : $("input[name='cvCheck']:checked").val(),
							"clNo": $("#clNo").val(),
							"clTitle": $("#clTitle").val(),
							"clSungjang": $("#clSungjang").val(),
							"clSang": $("#clSang").val(),
							"clJangdan": $("#clJangdan").val(),
							"clJiwon": $("#clJiwon").val()
						},
						success: function(data){//통신이 성공적으로 이루어 졌을때 받을 함수
				             var parseData = data;
			                 console.log("updateLic.flag="+parseData.flag);
			                 console.log("updateLic.message="+parseData.message);
				         	 if(parseData.flag > 0){
				         		alert(parseData.message);
				         		location.href="UserResumeView.do";
				         	 }else{
				         		alert(parseData.message);
				         	 }				             
			            },
			            complete: function(data){//무조건 수행
			             
			            },
			            error: function(xhr,status,error){
			             
			            }
					});//'updateLic.do' ajax
	    			
	    		});
	    		
	    		
    			
	    	}); //-- document 
	 	</script>
    

</body>
</html>