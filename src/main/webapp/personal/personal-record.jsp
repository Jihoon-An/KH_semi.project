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
								<div class="text_title_600" id="notice">
									<p>운동을 하지 않은지 30년 지났습니다.</p>
								</div>
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
						<div class="personal_info row">
							<div class="col-7">
								<div id="inbody">
									태어나서 처음 해본 인바디 결과
									<div class="chart_wrap">
										<canvas id="inbody_chart" width="400" height="300"></canvas>
									</div>
								</div>
							</div>
							<div class="col-5">
								<div id="weight">
									몸무게 변화
									<div class="chart_wrap">
										<canvas id="weight_chart" width="250" height="300"></canvas>
									</div>
								</div>
							</div>
							<div class="col-12">
								<div id="result">
									<div class="text_title" id="result_title" style="padding-top:10px"></div>
									<div class="text_normal" id="result_contents">
										데이터가 존재하지 않습니다.
										<div><button class="btn_outline" id="btn_regRecord"
												onclick="showRegRecord()">등록하기</button></div>
									</div>
								</div>

								<div id="record">
									<div class="row">
										<div class="col-7"
											style="padding:0px; height:286px; border-right:1px solid #C8C8C8">
											<div class="row" style="border:none; padding-bottom:0px">
												<div class="text_title_600 col-12 mb-3">
													Record
												</div>
												<div class="col-5 text-end">
													<p>등록 일자</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_date"
														style="width:160px" readonly>
												</div>
												<div class="col-5 text-end">
													<p>운동 시간</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" style="width:50px"
														oninput="validNaturalNumRange(24)">&nbsp시간&nbsp
													<input type="text" class="text-center" style="width:50px"
														oninput="validNaturalNumRange(60)">&nbsp분&nbsp
												</div>
												<div class="col-5 text-end">
													<p>운동 강도</p>
												</div>
												<div class="col-7 text-start">
													<input type="range" class="form-range" id="reg_intens"
														style="width:180px; height:27px" min="1" max="5">
												</div>
												<div class="col-5 text-end" style="padding-bottom:0px">
													<p>메모 내용</p>
												</div>
												<div class="col-7 text-start" style="padding-bottom:0px">
													<input type="text" style="width:180px" maxlength="20">
												</div>
											</div>
										</div>
										<div class="col-5" style="padding:0px; height:286px">
											<div class="row" style="border:none; padding-bottom:0px">
												<div class="text_title_600 col-12 mb-3">
													InBody
												</div>
												<div class="col-5 text-end">
													<p>몸무게</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" style="width:70px"
														oninput="vaildNumRange(1000)">&nbspKg
												</div>
												<div class="col-5 text-end">
													<p>체지방량</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" style="width:70px"
														oninput="vaildNumRange(1000)">&nbspKg
												</div>
												<div class="col-5 text-end">
													<p>골격근량</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" style="width:70px"
														oninput="vaildNumRange(1000)">&nbspKg
												</div>
												<div class="col-5 text-end" style="padding-bottom:0px">
													<p>BMI</p>
												</div>
												<div class="col-7 text-start" style="padding-bottom:0px">
													<input type="text" class="text-center" style="width:70px"
														oninput="vaildNumRange(100)">
												</div>
											</div>
										</div>
										<div class="col-12">
											<button class="btn_outline">작성완료</button>
											<button class="btn_outline" onclick="regCancel()">돌아가기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<script>
					$(() => {
						initCalendar();
						$(".calendar").datepicker();
						$("#result_title").text($.datepicker.formatDate("yy년 mm월 dd일", $("#calendar").datepicker("getDate")) + "의 운동 기록");
					});

					// calendar 초기화
					function initCalendar() {
						$.datepicker.setDefaults({
							onSelect: onSelect,
							dateFormat: 'yy / mm / dd',
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
							altField: "#reg_date"
						});
					}

					function onSelect() {
						let date = $.datepicker.formatDate("yy년 mm월 dd일", $("#calendar").datepicker("getDate"));
						$("#result_title").text(date + "의 운동기록");
					}

					function validNaturalNumRange(max) {
						event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
						if (Number(event.target.value) >= max) {
							event.target.value = max - 1;
						}
					}

					function vaildNumRange(max) {
						event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
						if (Number(event.target.value) >= max) {
							event.target.value = max - 1;
						}
					}

					function showRegRecord() {
						$("#inbody")[0].style.height = "250px";
						$("#weight")[0].style.height = "250px";
						$("#result")[0].style.height = "400px";
						$("#record")[0].style.height = "400px";
						$("#inbody_chart")[0].style.height = "200";
						$("#weight_chart")[0].style.height = "200";
						$("#result").fadeOut(500, () => { $("#record").fadeIn(0) });
					}

					function regCancel() {
						$("#record").fadeOut(0, () => { $("#result").fadeIn(500)
						$("#inbody")[0].style.height = "350px";
						$("#weight")[0].style.height = "350px";
						$("#result")[0].style.height = "300px";
						$("#record")[0].style.height = "300px";
						$("#inbody_chart")[0].style.height = "300";
						$("#weight_chart")[0].style.height = "300"; });
					}

					$("#reg_intens").on("input", e => {
						$("#reg_intens_label").text(e.target.value);
					});

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
							responsive: false,
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
								responsive: false,
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