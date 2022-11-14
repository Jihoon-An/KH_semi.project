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
								<div class="text_title_600 boundary" id="notice">
									<p></p>
								</div>
							</div>
						</div>
					</div>
					<div class="col-4">
						<div class="row">
							<div class="col-12">
								<div class="boundary" id="manager">+</div>
							</div>
							<div class="col-12">
								<div class="calendar" id="calendar"></div>
							</div>
						</div>
					</div>
					<div class="col-8">
						<div class="personal_info row">
							<div class="col-7">
								<div class="boundary" id="inbody">
									태어나서 처음 해본 인바디 결과
									<div class="chart_wrap">
										<canvas id="inbody_chart" width="400" height="300"></canvas>
									</div>
								</div>
							</div>
							<div class="col-5">
								<div class="boundary" id="weight">
									몸무게 변화
									<div class="chart_wrap">
										<canvas id="weight_chart" width="250" height="300"></canvas>
									</div>
								</div>
							</div>
						</div>

						<div class="col-12">
							<div class="row">
								<div class="col-12 boundary" id="result">
									<c:choose>
										<c:when test="${userSeq == null}">
											<div class="filter">
												<p>로그인 후 이용하세요.</p>
											</div>
										</c:when>
										<c:otherwise>
											<div class="text_title col-12" id="result_title"
												style="padding-bottom:10px"></div>
											<div class="text_normal row justify-content-evenly" id="result_contents">
											</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-12 boundary" id="record">
									<div class="row">
										<div class="col-7" style="padding-bottom:0px; border-right:1px solid #C8C8C8">
											<div class="row" style="border:none; padding-bottom:0px">
												<div class="text_title_600 col-12 mb-3">
													Record
												</div>
												<div class="col-5 text-end">
													<p>등록 일자<sup style="color:white">*</sup></p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_date"
														style="width:120px" readonly>
												</div>
												<div class="col-5 text-end">
													<p>운동 시간<sup>*</sup></p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_hour"
														style="width:30px;" value="0"
														oninput="validNaturalNumRange(24)" maxlength="2">시간&nbsp
													<input type="text" class="text-center" id="reg_minute"
														style="width:30px;" value="0"
														oninput="validNaturalNumRange(60)" maxlength="2">분
												</div>
												<div class="col-5 text-end">
													<p>운동 강도<sup style="color:white">*</sup></p>
												</div>
												<div class="col-7 text-start">
													<form>
														<input type="range" class="form-range" id="reg_range" min="1"
															max="5" style="width:160px; height:24px">
														<label id="reg_range_label"
															onforminput="value = foo.valueAsNumber;"></label>
													</form>
												</div>
												<div class="col-5 text-end" style="padding-bottom:0px">
													<p>메모 내용<sup>*</sup></p>
												</div>
												<div class="col-7 text-start" style="padding-bottom:0px">
													<input type="text" id="reg_memo" style="width:180px"
														placeholder="20자 이내로 입력하세요." maxlength="20">
												</div>
											</div>
										</div>
										<div class="col-5" style="padding-bottom:0px;">
											<div class="row" style="border:none; padding-bottom:0px">
												<div class="text_title_600 col-12 mb-3">
													InBody
												</div>
												<div class="col-5 text-end">
													<p>몸무게</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_weight"
														style="width:60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-5 text-end">
													<p>체지방량</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_fat"
														style="width:60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-5 text-end">
													<p>골격근량</p>
												</div>
												<div class="col-7 text-start">
													<input type="text" class="text-center" id="reg_muscle"
														style="width:60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-5 text-end" style="padding-bottom:0px">
													<p>BMI</p>
												</div>
												<div class="col-7 text-start" style="padding-bottom:0px">
													<input type="text" class="text-center" id="reg_bmi"
														style="width:60px" oninput="vaildNumRange(100)" maxlength="5">
												</div>
											</div>
										</div>
										<div class="col-12">
											<button class="btn_outline" id="btn_regRecord">작성완료</button>
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
						onSelect();
					});

					// calendar 초기화
					function initCalendar() {
						$.datepicker.setDefaults({
							onSelect: onSelect,
							dateFormat: 'yy / mm / dd',
							monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
							dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
							showMonthAfterYear: true,
							yearSuffix: '년',
							altField: "#reg_date"
						});
					}

					// calendar 날짜 선택 함수
					function onSelect() {
						let date = $.datepicker.formatDate("yy년 mm월 dd일", $("#calendar").datepicker("getDate"));
						$("#result_title").text(date);

						let data = { "date": $.datepicker.formatDate("yy-mm-dd 00:00:00", $("#calendar").datepicker("getDate")) }

						$.getJSON("/datepick.personal", data)
							.done(res => {
								setMarker(res.recordList);
								setNotice(res.recentRecord);

								if (res.record != null && getDateFormat(new Date(res.record.exr_date)) == $.datepicker.formatDate("yy-mm-dd 00:00:00", $("#calendar").datepicker("getDate"))) {
									$("#result_contents").empty();
									let exrHow = ""
									if (Number(res.record.exr_how) >= 60) {
										exrHow += Math.floor(Number(res.record.exr_how / 60 )) + "시간"
										if (Number(res.record.exr_how % 60) != 0) {
											exrHow += " " + Number(res.record.exr_how % 60) + "분"
										}
									} else {
										exrHow = res.record.exr_how + "분"
									}
									let intens = ['최하', '하', '중', '상', '최상'];
									let output = "<div class='col-5' style='padding:0px; background-color: #E8E8E8; border-radius:6px'><div class='row' style='padding:0px'><div class='col-12'>"
										+"<p>운동 기록</p></div><div class='col-12'><p>운동 시간 : " + exrHow + "&nbsp&nbsp/&nbsp&nbsp운동 강도 : " + intens[res.record.exr_intensity - 1] + "</p></div><div class='col-12' style='height:100px'>"
											+"<p>메모 내용 : " + res.record.exr_memo + "</p></div></div></div><div class='col-6' style='padding:0px'><div class='row' style='padding:0px'><div class='col-12' style='padding:0px'><div style='width:90%'>"
												+"<canvas id='recordChart' width='400'height='175'></canvas></div></div></div></div><div class='col-12'><button class='btn_outline' id='btn_delRecord' style='height:40px' onclick='tryDelRecord()'>기록 삭제</button></div>"
									$("#result_contents").html(output);
									setRecordChart(res.recentRecord);
								} else {
									$("#result_contents").empty();
									let output = "<div class='col-12 gy-5'><label>데이터가 존재하지 않습니다.</label><br><button class='btn_outline' id='btn_showRecord'onclick='showRecord()''>등록하기</button></div>"
									$("#result_contents").html(output);
								}
							});
					}

					// 운동한 날짜 Maker 생성 함수
					function setMarker(resData) {
						let arrDate = document.querySelectorAll(".calendar .ui-state-default");
						year = $(".calendar .ui-datepicker-year").text();
						month = $(".calendar .ui-datepicker-month").text().slice(0, -1);
						for (i = 0; i < arrDate.length; i++) {
							for (j = 0; j < resData.length; j++) {
								let calDate = getDateFormat(new Date(year + "-" + month + "-" + $(arrDate[i]).text())).slice(0, 10);
								let exrDate = getDateFormat(new Date(resData[j].exr_date)).slice(0, 10);
								if (calDate == exrDate) {
									$(arrDate[i]).text("🔥");
									break;
								}
							}
						}
					}

					// Notice Text 생성 함수
					function setNotice(recentRecord) {
						if (recentRecord.length == 0) { $("#notice>p").text("아직 등록 된 데이터가 없어요. 😢"); return false; }
						let today = new Date(getDateFormat(new Date()).slice(0, 10) + " 00:00:00");
						let gap = (today.getTime() - new Date(recentRecord[recentRecord.length - 1].exr_date).getTime()) / 86400000;
						let context;
						if (gap >= 30) { context = "마지막 기록이 " + gap + "일 전? 운동 접었네 이 사람 😡"}
						else if (gap >= 7) { context = "근손실이 오고 있어요. 기록이 작성된 지 " + gap + "일이 지났어요... 😭"}
						else if (gap >= 1) { context = "기록이 작성된 지 " + gap + "일이 지났어요. 운동 후 기록 작성 잊지 말기! 😋"}
						else if (gap == 0) { context = "오늘 열심히 운동하셨군요. 앞으로도 화이팅!! 😊" }
						$("#notice>p").text(context);
					}

					// 숫자 유효성 검사 (자연수)
					function validNaturalNumRange(max) {
						event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
						if (Number(event.target.value) >= max) {
							event.target.value = max - 1;
						}
					}

					// 숫자 유효성 검사
					function vaildNumRange(max) {
						event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
						if (Number(event.target.value) >= max) {
							event.target.value = max - 1;
						}
					}

					// 기록 작성 창 열기 애니메이션
					function showRecord() {
						$("#inbody")[0].style.height = "250px";
						$("#weight")[0].style.height = "250px";
						$("#result")[0].style.height = "400px";
						$("#record")[0].style.height = "400px";
						$("#inbody_chart")[0].style.height = "200";
						$("#weight_chart")[0].style.height = "200";
						$("#result").fadeOut(500, () => { $("#record").fadeIn(0) });
					}

					// 기록 작성 창 닫기 애니메이션
					function regCancel() {
						$("#record").fadeOut(0, () => {
							$("#result").fadeIn(500)
							$("#inbody")[0].style.height = "350px";
							$("#weight")[0].style.height = "350px";
							$("#result")[0].style.height = "300px";
							$("#record")[0].style.height = "300px";
							$("#inbody_chart")[0].style.height = "300";
							$("#weight_chart")[0].style.height = "300";
							$("#reg_hour, #reg_minute").val("0");
							$("#reg_memo, #reg_weight, #reg_fat, #reg_muscle, #reg_bmi").val("");
						});
					}

					// 기록 등록 함수
					function tryRegist() {
						data = {
							"date": $.datepicker.formatDate("yy-mm-dd 00:00:00", $("#calendar").datepicker("getDate")),
							"how": Number(($("#reg_hour").val() * 60)) + Number($("#reg_minute").val()),
							"intens": $("#reg_range").val(),
							"memo": $("#reg_memo").val(),
							"weight": $("#reg_weight").val(),
							"fat": $("#reg_fat").val(),
							"muscle": $("#reg_muscle").val(),
							"bmi": $("#reg_bmi").val(),
						}
						$.post("/record.personal", data)
							.done(() => {
								regCancel();
								onSelect();
							});
					}

					// 기록 삭제 함수
					function tryDelRecord() {
						Swal.fire({
							title: 'Are you sure?',
							text: "기록을 삭제합니다.",
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#d33',
							cancelButtonColor: '#3085d6',
							confirmButtonText: '삭제',
							cancelButtonText: '취소'
							}).then((result) => {
								if (result.isConfirmed) {
									let data = {
									"date": $.datepicker.formatDate("yy-mm-dd 00:00:00", $("#calendar").datepicker("getDate"))
									}
									$.post("/delRecord.personal", data).done(() => { onSelect();});
								}
							});
					}

					// 기록 차트 작성 함수 
					function setRecordChart(recentRecord) {
						let recordCtx = document.getElementById('recordChart').getContext('2d');
						let arrDate = [];
						let arrHow = [];
						for (j=0; j< recentRecord.length; j++) {
							arrDate.push(getDateFormat(new Date(recentRecord[j].exr_date)).slice(5, 10));
							arrHow.push(recentRecord[j].exr_how);
						}
						let recordData = {
							labels: arrDate,
							datasets: [{
								type: 'line',
								label: '운동 시간(분)',
								data: arrHow,
								borderColor: 'rgb(255, 99, 132)',
								backgroundColor: 'rgba(255, 99, 132, 0.2)'
							}]
						};

						let recordChart = new Chart(recordCtx, {
							data: recordData,
							options: { responsive: false, scales: {y: {beginAtZero: true}}}
						});
					}

					$("#reg_intens").on("input", e => {
						$("#reg_intens_label").text(e.target.value);
					});

					$("#reg_range").on("change", e => {
						let element, width, point, place;
						let intens = ["😰", "🙁", "🤔", "😊", "😆"];
						element = $(e.target);
						width = element.width();
						point = (element.val() - element.attr("min")) / (element.attr("max") - element.attr("min"));

						if (point < 0) { place = 0; }
						else if (point > 1) { place = width; }
						else { place = width * point }

						$("#reg_range_label").css({ left: (place * 0.9) - 5, }).text(intens[element.val() - 1]);
					}).trigger("change");

					$("#btn_regRecord").on("click", () => {
						if ($("#reg_hour").val() == "0" && $("#reg_minute").val() == "0") { wobble($("#reg_hour")[0]); wobble($("#reg_minute")[0]); return false; }
						if (isFilled($("#reg_hour, #reg_minute, #reg_memo"))) { 
							let today = new Date(getDateFormat(new Date()).slice(0, 10) + " 00:00:00");
							if(today < $("#calendar").datepicker("getDate")) {
								Swal.fire({icon: 'error', title: 'Error!', html: '미래에서 오셨나요?<br>선택한 날짜가 오늘보다 뒤입니다.'});
							} else if ($(".ui-state-active").text() == "🔥") {
								Swal.fire({icon: 'error', title: 'Error!', html: '기록이 이미 등록 되어있습니다.<br>날짜를 다시 선택하세요.'});
							} else {
								tryRegist(); 
							}
						}
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
					let weightChart = new Chart(weightCtx, {
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