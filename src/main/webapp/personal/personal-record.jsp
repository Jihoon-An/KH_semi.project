<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<%@ include file="/layout/header.jsp"%>

<!-- Site Main -->
<main id="personal-record">
	<section>
		<div class="mainimg">
			<div class="containerbox">

				<div class="search_main">
					<div class="search_main_span">
						<span style="font-weight: lighter;">Your</span> <span
							style="font-weight: bold;">Needs</span> <span
							style="font-weight: lighter;">For</span> <span
							style="font-weight: bold;">Fitness</span>
					</div>
					<div class="search_main_input">
						<input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요.">
					</div>
					<div class="search_main_icon">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
				</div>

			</div>
		</div>
	</section>

	<div class="containerbox">
		<div class="today">오늘 날짜</div>
		<div class="workless">운동하지않은 일 수</div>
		<div class="health_date">헬스일자
			<div class="start"></div>
			<div class="finish"></div>
			<div class="workday"></div>
		</div>
		<div class="inbody">인바디</div>
		<div class="weight_change">
		<div class="chart-wrap">
		<canvas id="weight_change" width="250" height="305"></canvas>
		</div>
		</div>
		<div class="calendar">달력</div>
		<div class="exercise_results">운동 결과</div>
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
</main>

<%@ include file="/layout/footer.jsp"%>