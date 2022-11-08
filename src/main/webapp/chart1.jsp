<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
</head>
<style>
.chart-wrap {
	width: 250px;
	height: 305px;
}
</style>
<body>
	<div class="chart-wrap">
		<canvas id="weight_change" width="250" height="305"></canvas>
	</div>
	<script>
		const ctx = document.getElementById('weight_change').getContext('2d');
		const myChart = new Chart(ctx,
				{
					type : 'bar',
					data : {
						labels : [ '09/01', '10/01', '11/01', '12/01', '01/01',
								'02/01' ],
						datasets : [ {
							label : '# weight change',
							data : [ 54, 52, 49, 51, 50, 46 ],
							backgroundColor : [ 'rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)' ],
							borderColor : [ 'rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
									'rgba(255, 159, 64, 1)' ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
	</script>
</body>
</html>