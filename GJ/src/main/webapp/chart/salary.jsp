<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/top.jsp" flush="false"></jsp:include>
	<br><br>
	<div id="chart_div" style="width: 800px; height: 500px;"></div>
	
	
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});

      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawChart);

      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart() {
     	var jsonData = $.ajax({
	     	url:"salary.do",
	     	dataType:"html",// JSON
	     	data:{
	      	},
	     	async: false
     	}).responseText;
     
     
        var newArr = JSON.parse(jsonData);
   
        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', '연봉');
        data.addColumn('number', '회사수');
      	 //data영역
        for(var i=0;i<newArr.length;i++){
        	data.addRow(newArr[i]);
         }

        // Set chart options
        var options = {'title':'it 회사 채용공고 연봉 분포'};

        // Instantiate and draw our chart, passing in some options.
        var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
</script>    
    
</body>
</html>