<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<style>
	.chart-wrap{
		width:575px;
		height:305px;
	}
</style>
<body>
	<div class="chart-wrap">
		<canvas id="myChart" width="575" height="305"></canvas>
	</div>
	
	<script>
			const ctx = document.getElementById('myChart').getContext('2d');
			const myChart = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ '체중', '골격근량', '체지방량', 'BMI', '체지방률'
							],
					datasets : [ {
						axis:'y',
						label : '# inbody',
						data : [ 74, 39, 16, 24, 21,],
						backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								],
						borderColor : [ 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								],
						borderWidth : 1
					} ]
				},
				options : {
					indexAxis:'y',
					scales : {
						y : {
							beginAtZero : true,
						}
					}
				}
			});
		</script>
</body>
</html>