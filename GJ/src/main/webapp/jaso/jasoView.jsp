<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			            	<input type="hidden" id="clTitle" name="clTitle" value="${clTitle}">
			            	<input type="hidden" id="clSungjang" name="clSungjang" value="${clSungjang}">
			            	<input type="hidden" id="clSang" name="clSang" value="${clSang}">
			            	<input type="hidden" id="clJangdan" name="clJangdan" value="${clJangdan}">
			            	<input type="hidden" id="clJiwon" name="clJiwon" value="${clJiwon}">
			            	<!------------------------------- 작성자만 보이는 버튼 -------------------------------------- -->
  							<button type="button" class="btn btn-default btn-sm" onclick="doUpdate();">수정</button>
  							<button type="button" class="btn btn-default btn-sm" id="doDelete" >삭제</button>
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
			            		<tr>
			            			<td>박태건</td>
			            			<td>진짜못썼네 토토나하시길</td>
			            			<td>2018-11-28
			            				<button type="button" class="btn btn-default btn-sm" id="do_save" >삭제</button>
			            			</td>
			            		</tr>
			            		<tr>
			            			<td>김무혁</td>
			            			<td>잘쓰셨네요 이정도면 무신사 입사도 가능하곘어요</td>
			            			<td>2018-11-28</td>
			            		</tr>
			            	</tbody>
			            </table>
			            <form id="contact" method="post" class="form" role="form">
			                <textarea class="form-control" id="message" name="message" placeholder="Message" rows="5"></textarea>
			                <br/>
			                <div class="row">
			                    <div class="col-xs-12 col-md-12 form-group">
			                        <button class="btn btn-primary" type="submit">댓글달기</button>
			                    </div>
			                </div>
			            </form>
			        </div>
			    </div>
			</div>
			
		</div>
	</div>
	<script type="text/javascript">
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
		});
	</script>
</body>
</html>