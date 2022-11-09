<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<html>

		<%@ include file="/layout/header.jsp" %>

			<div class="main_margin_85"></div>
			<!-- Site Main -->
			<main id="personal-record">
				<div class="containerbox row" align="center">
					<div class="col-12">
						<div class="row">
							<div class="col-12">
								<div id="notice">운동을 하지 않은지 30년 지났습니다.</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="row">
							<div class="col-12">
								<div id="manager">+</div>
							</div>
							<div class="col-12">
								<div class="calendar" id="calendar"></div>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="row">
							<div class="col-8">
								<div id="inbody">
									태어나서 처음 해본 인바디 결과
									<div class="chart_wrap">
										<canvas id="inbody_chart" height="110"></canvas>
									</div>
								</div>
							</div>
							<div class="col-4">
								<div id="weight">
									몸무게 변화
									<div class="chart_wrap">
										<canvas id="weight_chart" height="250"></canvas>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div id="result">
								</div>
							</div>
							<div class="col-12">
								<div id="record">
									기록 작성
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
					$(() => {
						initCalendar();
						$(".calendar").datepicker();
						modifyCalendarFont();
						$("#result").text($.datepicker.formatDate("yy년 mm월 dd일", $("#calendar").datepicker("getDate")) + "의 운동 기록");
					});

					// calendar 초기화
					function initCalendar() {
						$.datepicker.setDefaults({
							onSelect: onSelect,
							dateFormat: 'yy/mm/dd',
							prevText: '이전 달',
							nextText: '다음 달',
							monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
								'9월', '10월', '11월', '12월'],
							monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
								'9월', '10월', '11월', '12월'],
							dayNames: ['일', '월', '화', '수', '목', '금', '토'],
							dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
							dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
							showMonthAfterYear: true,
							yearSuffix: '년',
						});
					}

					function onSelect() {
						let date = $.datepicker.formatDate("yy년 mm월 dd일", $("#calendar").datepicker("getDate"));
						$("#result").text(date + "의 운동기록");
					}
					
					function modifyCalendarFont() {
						$(".ui-datepicker-header").css("height", "90px");
						$(".ui-datepicker-title").css("font-size", "20px");
						$(".ui-corner-all").find("a").css("transform", "translate(0, 6px)");
						$(".ui-datepicker-week-end").parent().find("th").css("font-size","18px").css("position", "relative").css("top", "-10px");
						$(".ui-datepicker td a").css("font-size", "20px");
						$(".ui-datepicker-calendar").css({"width":"90%", "height":"75%"});
					}

					// $(".ui-state-default").on("click", e => {
					// 	alert();
					// 	console.log(e);
					// 	console.log(e.target);
					// });

					// inbody chart
					let inbodyCtx = document.getElementById('inbody_chart').getContext('2d');
					let inbodyChart = new Chart(inbodyCtx, {
						type: 'bar',
						data: {
							labels: ['체중', '골격근량', '체지방량', 'BMI', '체지방률'
							],
							datasets: [{
								axis: 'y',
								label: '# inbody_chart',
								data: [74, 39, 16, 24, 21,],
								backgroundColor: ['rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
								],
								borderColor: ['rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
									'rgba(153, 102, 255, 1)',
								],
								borderWidth: 1
							}]
						},
						options: {
							indexAxis: 'y',
							scales: {
								y: {
									beginAtZero: true,
								}
							}
						}
					});
					// weight change chart
					let weightCtx = document.getElementById('weight_chart').getContext('2d');
					let weightChart = new Chart(weightCtx,
						{
							type: 'bar',
							data: {
								labels: ['09/01', '10/01', '11/01', '12/01', '01/01',
									'02/01'],
								datasets: [{
									label: '# weight change',
									data: [54, 52, 49, 51, 50, 46],
									backgroundColor: ['rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)'],
									borderColor: ['rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)'],
									borderWidth: 1
								}]
							},
							options: {
								scales: {
									y: {
										beginAtZero: true
									}
								}
							}
						});

				</script>
			</main>

			<%@ include file="/layout/footer.jsp" %>