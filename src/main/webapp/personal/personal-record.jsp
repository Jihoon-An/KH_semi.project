<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

			<%@ include file="/layout/header.jsp" %>



				<!-- Site Main -->
<div class="main_margin_85" style="height: 85px;"></div>
				<main id="personal-record" style="margin-top: 57px">
					<div class="containerbox row" align="center">
						<div class="col-12" style="padding-bottom: 0px">
							<div class="text_main_title_600 boundary" id="notice">
								<p></p>
							</div>
						</div>
						<div class="col-4">
							<div class="row">
								<div class="col-12">
									<div class="boundary" id="manager">
										디데이 매니저
										<c:choose>
											<c:when test="${userSeq == null}">
												<br><br><br><br>" 로그인 후 이용하세요! 😃 "
												<script>$("#manager").css("background-color","#18181840");</script>
											</c:when>
											<c:otherwise>

												<c:choose>
													<c:when test="${not empty manager.title}">
														<div class="manager_btnBox  m_md_box">
															<span id="manager_update"><i
																	class="fa-solid fa-pen-to-square"></i></span>
															<span id="manager_delete"><i
																	class="fa-solid fa-trash-can"></i></span>
														</div>
														<div class="manager_titleBox">
															${manager.title}
														</div>

														<jsp:useBean id="now" class="java.util.Date" />
														<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
															integerOnly="true" var="nowfmtTime" scope="request" />
														<fmt:parseNumber
															value="${manager.start_date.time / (1000*60*60*24)}"
															integerOnly="true" var="start_date" scope="request" />
														<fmt:parseNumber
															value="${manager.end_date.time / (1000*60*60*24)}"
															integerOnly="true" var="end_date" scope="request" />
														<fmt:parseNumber
															value="${manager.start_date.time / (1000*60*60*24)}"
															integerOnly="true" var="startDate" scope="request" />
														<fmt:parseNumber
															value="${manager.end_date.time / (1000*60*60*24)}"
															integerOnly="true" var="endDate" scope="request" />

														<c:set value="${nowfmtTime - start_date}" var="n_s_date" />
														<c:set value="${end_date - nowfmtTime}" var="e_n_date" />

														<div class="manager_startBox">
															🏋️‍♀️시작한지 <span style="font-size: 20px;">
																<c:out value="${n_s_date}" />일
															</span> 지났습니다 😊<br>
															<span style="font-size: 12px;">
																시작 날짜 :
																<fmt:formatDate value="${manager.start_date}"
																	pattern="yyyy년 MM월 dd일" />
															</span>

														</div>
														<div class="manager_endBox">
															🏋️‍♂️종료까지 <span style="font-size: 20px;">
																<c:out value="${e_n_date}" />일
															</span> 남았습니다 😂<br>
															<span style="font-size: 12px;">
																종료 날짜 :
																<fmt:formatDate value="${manager.end_date}"
																	pattern="yyyy년 MM월 dd일" />
															</span>
														</div>
													</c:when>

													<c:otherwise>
														<div class="manager_nullBox">
															<div class="manager_btnBox m_a_box">
																<span id="manager_add"><i
																		class="fa-solid fa-plus"></i></span>
															</div>
															" 입력된 정보가 없습니다 😢 "<br>
															<span style="font-size: 13px;">
																" 목표 일정이나 회원권 기간을 등록하기 좋아요! 😁"
															</span>
														</div>
													</c:otherwise>

												</c:choose>

											</c:otherwise>
										</c:choose>

									</div>
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
											<canvas id="inbody_chart" width="400" height="250"></canvas>
										</div>
									</div>
								</div>
								<div class="col-5">
									<div class="boundary" id="weight">
										몸무게 변화
										<div class="chart_wrap">
											<canvas id="weight_chart" width="250" height="250"></canvas>
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
												<div class="text_title col-12 mt-1" id="result_title"
													style="padding-bottom: 10px"></div>
												<div class="text_normal row justify-content-evenly"
													id="result_contents"></div>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-12 boundary" id="record">
										<div class="row" style="position: relative">
											<div class="col-6" style="padding-bottom: 0px">
												<div class="row" style="border: none; padding-bottom: 0px">
													<div class="text_title_600 col-12 mb-3">Record</div>
													<div class="col-5 text-end">
														<p>
															등록 일자<sup style="color: white">*</sup>
														</p>
													</div>
													<div class="col-7 text-start">
														<input type="text" class="text-center" id="reg_date"
															style="width: 120px" readonly>
													</div>
													<div class="col-5 text-end" style="margin-top: 30px">
														<p>
															운동 시간<sup>*</sup>
														</p>
													</div>
													<div class="col-7 text-start" style="margin-top: 30px">
														<input type="text" class="text-center" id="reg_hour"
															style="width: 36px;" value="0"
															oninput="validNaturalNumRange(24)">시간&nbsp <input
															type="text" class="text-center" id="reg_minute"
															style="width: 36px;" value="0"
															oninput="validNaturalNumRange(60)">분
													</div>
													<div class="col-5 text-end"
														style="padding-bottom: 0px; margin-top: 30px">
														<p>
															운동 강도<sup style="color: white">*</sup>
														</p>
													</div>
													<div class="col-7 text-start"
														style="padding-bottom: 0px; margin-top: 30px">
														<form>
															<input type="range" class="form-range" id="reg_range"
																min="1" max="5" style="width: 120px; height: 24px">
															<label id="reg_range_label"
																onforminput="value = foo.valueAsNumber;"></label>
																<label for="reg_range" id="reg_intens_label" style="position:relative; top:-6px; padding:3px">중</label>
														</form>
													</div>
												</div>
											</div>
											<div class="col-6" id="wrap_memo" style="padding-bottom: 0px;">
												<div class="row" style="border: none; padding-bottom: 0px">
													<div class="text_title_600 col-12">
														<p>
															Memo<sup>*</sup>
														</p>
													</div>
													<div class="col-12" style="padding-bottom: 0px">
														<textarea name="" id="reg_memo" cols="30" rows="8"
															style="padding: 5px; resize: none"></textarea>
													</div>
												</div>
											</div>
											<div class="col-12 gy-3">
												<button class="btn_outline" id="btn_regRecord"
													style="height: 40px">작성완료</button>
												<button class="btn_outline" style="height: 40px"
													onclick="regCancel()">돌아가기</button>
											</div>
											<div class="row boundary" id="reg_inbody">
												<div class="col-12"></div>
												<div class="col-6 text-end">
													<p>몸무게</p>
												</div>
												<div class="col-6 text-start">
													<input type="text" class="text-center" id="reg_weight"
														style="width: 60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-6 text-end">
													<p>체지방량</p>
												</div>
												<div class="col-6 text-start">
													<input type="text" class="text-center" id="reg_fat"
														style="width: 60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-6 text-end">
													<p>골격근량</p>
												</div>
												<div class="col-6 text-start">
													<input type="text" class="text-center" id="reg_muscle"
														style="width: 60px" oninput="vaildNumRange(1000)"
														maxlength="5">&nbspKg
												</div>
												<div class="col-6 text-end" style="padding-bottom:0px">
													<p>BMI</p>
												</div>
												<div class="col-6 text-start" style="padding-bottom:0px">
													<input type="text" class="text-center" id="reg_bmi"
														style="width: 60px" oninput="vaildNumRange(100)" maxlength="5">
												</div>
												<div class="col-12"></div>
												<button class=text_normal_600
													id="btn_inbody">I<br>n<br>b<br>o<br>d<br>y</button>
											</div>
											<div id="reg_filter"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Add Manager Form -->
					<form id="m_add_form" action="/add_manager.personal" method="post">
						<div class="m_table">
							<div class="m_head col-12 text-center">
								<strong>시설 이용 매니저</strong>
							</div>

							<div class="m_title m_inputDiv col-12" style="margin-left: 45px;">
								<span>제목</span>
								<input type="text" id="m_title_input" name="m_title_input" placeholder="제목"
									maxlength="15" oninput="this.value = this.value.replace(/[<>]/g, '');">
							</div>
							<div class="m_start m_inputDiv col-12" style="margin-left: 45px;">
								<span>시작</span>
								<input type="date" id="m_start_input" name="m_start_input" min="1950-1-1"
									max="9999-12-31">
							</div>
							<div class="m_end m_inputDiv col-12" style="margin-left: 45px;">
								<span>종료</span>
								<input type="date" id="m_end_input" name="m_end_input" max="9999-12-31">
							</div>

							<div class="col-12 text-center">
								<button id="m_add_saveBtn" class="m_table_btn" type="button">완료</button>
								<button id="m_add_backBtn" class="m_table_btn" type="button">닫기</button>
							</div>
						</div>
					</form>

					<!-- Update Manager Form -->
					<form id="m_update_form" action="/update_manager.personal" method="post">
						<div class="m_table">
							<div class="m_head col-12 text-center">
								<strong>디데이 매니저</strong>
							</div>
							<div class="m_title m_inputDiv col-12" style="margin-left: 45px;">
								<span>제목</span>
								<input type="text" id="mu_title_input" name="mu_title_input" placeholder="제목"
									value="${manager.title}" maxlength="15"
									oninput="this.value = this.value.replace(/[<>]/g, '');">
							</div>
							<div class="m_start m_inputDiv col-12" style="margin-left: 45px;">
								<span>시작</span>
								<fmt:formatDate value="${manager.start_date}" pattern="yyyy-MM-dd" var="startdate" />
								<input type="date" id="mu_start_input" name="mu_start_input" value="${startdate}"
									min="1950-1-1" max="9999-12-31">
							</div>
							<div class="m_end m_inputDiv col-12" style="margin-left: 45px;">
								<span>종료</span>
								<fmt:formatDate value="${manager.end_date}" pattern="yyyy-MM-dd" var="enddate" />
								<input type="date" id="mu_end_input" name="mu_end_input" value="${enddate}"
									max="9999-12-31">
							</div>

							<div class="col-12 text-center">
								<button id="m_update_saveBtn" class="m_table_btn" type="button">완료</button>
								<button id="m_update_backBtn" class="m_table_btn" type="button">닫기</button>
							</div>
						</div>
					</form>

					<!-- Delete Manager Form -->
					<form id="m_delete_form" action="/del_manager.personal" method="post">
						<input type="hidden" value="${userSeq}">
					</form>


					<script>
						//Update Manager
						$("#manager_update").on("click", () => {
							$("#m_update_form").show();
						});
						$("#m_update_backBtn").on("click", () => {
							$("#m_update_form").hide();
							$("#mu_title_input").css("background-color", "white");
							$("#mu_start_input").css("background-color", "white");
							$("#mu_end_input").css("background-color", "white");
						});
						$("#m_update_saveBtn").on("click", () => {
							if ($("#mu_title_input").val() == "") {
								$("#mu_title_input").css("background-color", "#faed77");
								$("#mu_title_input").css("transition", "2s");
								$("#mu_title_input").focus();
							} else if ($("#mu_start_input").val() == "") {
								$("#mu_start_input").css("background-color", "#faed77");
								$("#mu_start_input").css("transition", "2s");
								$("#mu_start_input").focus();
							} else if ($("#mu_end_input").val() == "") {
								$("#mu_end_input").css("background-color", "#faed77");
								$("#mu_end_input").css("transition", "2s");
								$("#mu_end_input").focus();
							} else {
								$("#mu_title_input").css("background-color", "white");
								$("#mu_start_input").css("background-color", "white");
								$("#mu_end_input").css("background-color", "white");
								$("#m_update_form").submit();
							}
						});
						// Delete Manager
						$("#manager_delete").on("click", () => {
							$("#m_delete_form").submit();
						})
						// Add Manager
						$("#manager_add").on("click", () => {
							$("#m_add_form").show();
						});
						$("#m_add_backBtn").on("click", () => {
							$("#m_add_form").hide();
							$("#m_title_input").css("background-color", "white");
							$("#m_start_input").css("background-color", "white");
							$("#m_end_input").css("background-color", "white");
						});
						$("#m_add_saveBtn").on("click", () => {
							if ($("#m_title_input").val() == "") {
								$("#m_title_input").css("background-color", "#faed77");
								$("#m_title_input").css("transition", "2s");
								$("#m_title_input").focus();
							} else if ($("#m_start_input").val() == "") {
								$("#m_start_input").css("background-color", "#faed77");
								$("#m_start_input").css("transition", "2s");
								$("#m_start_input").focus();
							} else if ($("#m_end_input").val() == "") {
								$("#m_end_input").css("background-color", "#faed77");
								$("#m_end_input").css("transition", "2s");
								$("#m_end_input").focus();
							} else {
								$("#m_title_input").css("background-color", "white");
								$("#m_start_input").css("background-color", "white");
								$("#m_end_input").css("background-color", "white");
								$("#m_add_form").submit();
							}
						});
					</script>

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
									setNotice(res.recordList);
									if (res.record != undefined) {
										setInbodyChart(res.record);
									}

									if (onRecord && $(".ui-state-active").hasClass("fire")) {
										regCancel();
									}

									if (res.record != null && getDateFormat(new Date(res.record.exr_date)) == $.datepicker.formatDate("yy-mm-dd 00:00:00", $("#calendar").datepicker("getDate"))) {
										$("#result_contents").empty();
										let exrHow = ""
										if (Number(res.record.exr_how) >= 60) {
											exrHow += Math.floor(Number(res.record.exr_how / 60)) + "시간"
											if (Number(res.record.exr_how % 60) != 0) {
												exrHow += " " + Number(res.record.exr_how % 60) + "분"
											}
										} else {
											exrHow = res.record.exr_how + "분"
										}
										let intens = ['최하', '하', '중', '상', '최상'];
										let output = "<div class='col-5 gy-4' id='summary'><div class='row' style='padding:0px'><div class='col-12' style='padding:5px; background-color:#DBE2EF'>"
											+ "<p>운동 기록</p></div><div class='col-12'><p>운동 시간 : " + exrHow + "&nbsp&nbsp/&nbsp&nbsp운동 강도 : " + intens[res.record.exr_intensity - 1] + "</p></div><div class='col-12' id='record_memo' style='height:105px'>"
											+ "</div></div></div><div class='col-6 gy-4' style='padding:0px'><div class='row' style='padding:0px'><div class='col-12' style='padding:0px'><div style='width:90%'>"
											+ "<canvas id='recordChart' width='400'height='175'></canvas></div></div></div></div><div class='col-12 gy-3'><button class='btn_outline' id='btn_delRecord' style='height:40px' onclick='tryDelRecord()'>기록 삭제</button></div>"
										$("#result_contents").html(output);
										$("#record_memo").text("메모 내용 : " + res.record.exr_memo)
										setRecordChart(res.recentRecord);
									} else {
										$("#result_contents").empty();
										let output = "<div class='gy-5'></div><div class='col-12 gy-5'><label>데이터가 존재하지 않습니다.</label><br><button class='btn_outline' id='btn_showRecord'onclick='showRecord()''>등록하기</button></div>"
										$("#result_contents").html(output);
									}
								});
						}
						// 운동한 날짜 Maker 생성 함수
						function setMarker(recordList) {
							let arrDate = document.querySelectorAll(".calendar .ui-state-default");
							year = $(".calendar .ui-datepicker-year").text();
							month = $(".calendar .ui-datepicker-month").text().slice(0, -1);
							for (i = 0; i < arrDate.length; i++) {
								for (j = 0; j < recordList.length; j++) {
									let calDate = getDateFormat(new Date(year + "-" + month + "-" + $(arrDate[i]).text())).slice(0, 10);
									let exrDate = getDateFormat(new Date(recordList[j].exr_date)).slice(0, 10);
									if (calDate == exrDate) {
										$(arrDate[i]).html("<img src='/resource/img/fire.png'>");
										$(arrDate[i]).addClass("fire");
										break;
									}
								}
							}
						}
						// Notice Text 생성 함수
						function setNotice(recordList) {
							if (recordList.length == 0) { $("#notice>p").text("아직 등록 된 데이터가 없어요. 😢"); return false; }
							let today = new Date(getDateFormat(new Date()).slice(0, 10) + " 00:00:00");
							let gap = (today.getTime() - new Date(recordList[recordList.length - 1].exr_date).getTime()) / 86400000;
							let context;
							if (gap >= 30) { context = "마지막 기록이 " + gap + "일 전? 운동 접었네 이 사람 😡" }
							else if (gap >= 7) { context = "근손실이 오고 있어요. 기록이 작성된 지 " + gap + "일이 지났어요... 😭" }
							else if (gap >= 1) { context = "기록이 작성된 지 " + gap + "일이 지났어요. 운동 후 기록 작성 잊지 말기! 😋" }
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

						let onRecord = false;
						// 기록 작성 창 열기 애니메이션
						function showRecord() {
							$("#inbody")[0].style.height = "250px";
							$("#weight")[0].style.height = "250px";
							$("#result")[0].style.height = "400px";
							$("#record")[0].style.height = "400px";
							$("#inbody_chart")[0].style.height = "200px";
							$("#weight_chart")[0].style.height = "200px";
							$("#result").fadeOut(500, () => { $("#record").fadeIn(0) });
							onRecord = true;
						}
						// 기록 작성 창 닫기 애니메이션
						function regCancel() {
							$("#record").fadeOut(0, () => {
								$("#result").fadeIn(500)
								$("#inbody")[0].style.height = "300px";
								$("#weight")[0].style.height = "300px";
								$("#result")[0].style.height = "350px";
								$("#record")[0].style.height = "350px";
								$("#inbody_chart")[0].style.height = "250px";
								$("#weight_chart")[0].style.height = "250px";
								$("#reg_hour, #reg_minute").val("0");
								$("#reg_memo, #reg_weight, #reg_fat, #reg_muscle, #reg_bmi").val("");
							});
							hideInbody();
							onRecord = false;
						}
						let regInbody = false;
						// 인바디 작성 창 열기 애니메이션
						function showInbody() {
							$("#reg_inbody")[0].style.left = "404px";
							regInbody = true;
						}
						// 인바디 작성 창 닫기 애니메이션
						function hideInbody() {
							$("#reg_inbody")[0].style.left = "746px";
							regInbody = false;
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
									$.post("/delRecord.personal", data).done(() => { location.reload(); });
								}
							});
						}
						// 기록 차트 작성 함수 
						function setRecordChart(recentRecord) {
							let recordCtx = document.getElementById('recordChart').getContext('2d');
							let arrDate = [];
							let arrHow = [];
							for (j = 0; j < recentRecord.length; j++) {
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
								options: { responsive: false, scales: { y: { beginAtZero: true } } }
							});
						}

						$("#reg_range").on("input", e => {
							let intens = ['최하', '하', '중', '상', '최상'];
							$("#reg_intens_label").text(intens[e.target.value - 1]);
						});
						$("#reg_range").on("change", e => {
							let element, width, point, place;
							let intens = ["😰", "🙁", "😶", "😊", "😆"];
							element = $(e.target);
							width = element.width();
							point = (element.val() - element.attr("min")) / (element.attr("max") - element.attr("min"));
							if (point < 0) { place = 0; }
							else if (point > 1) { place = width; }
							else { place = width * point }
							$("#reg_range_label").css({ left: (place * 0.88) - 6, }).text(intens[element.val() - 1]);
						}).trigger("change");
						$("#btn_regRecord").on("click", () => {
							if ($("#reg_hour").val() == "0" && $("#reg_minute").val() == "0") {
								wobble($("#reg_hour")[0]); wobble($("#reg_minute")[0]); return false;
							}
							if (!isFilled($("#reg_hour, #reg_minute, #reg_memo"))) {
								if (regInbody) { wobble($("#record")[0]); hideInbody(); }
								return false;
							}
							let today = new Date(getDateFormat(new Date()).slice(0, 10) + " 00:00:00");
							if (today < $("#calendar").datepicker("getDate")) {
								Swal.fire({ icon: 'error', title: 'Error!', html: '미래에서 오셨나요?<br>선택한 날짜가 오늘보다 뒤입니다.' });
							} else {
								tryRegist();
							}
						});
						$("#btn_inbody").on("click", () => { !regInbody ? showInbody() : hideInbody() })

						// 차트 초기화
						var inbodyCtx = document.getElementById('inbody_chart').getContext('2d');
						var arrData = ["체중", "체지방량", "골격근량", "BMI"];
						var arrInbody = [0, 0, 0, 0];
						var inbodyData = {
							labels: arrData,
							datasets: [{
								type: 'bar',
								label: 'inbody',
								data: arrInbody,
								borderColor: ['rgba(255, 99, 132, 1)',
									'rgba(54, 162, 235, 1)',
									'rgba(255, 206, 86, 1)',
									'rgba(75, 192, 192, 1)',
								],
								backgroundColor: ['rgba(255, 99, 132, 0.2)',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
								],
								borderWidth: 1
							}]
						};
						var inbodyChart = new Chart(inbodyCtx, {
							data: inbodyData,
							options: { responsive: false, indexAxis: 'y', scales: { y: { beginAtZero: true } } }
						});

						// inbody chart
						function setInbodyChart(record) {
							$("#inbody_chart").removeData();
							inbodyChart.destroy();
                            inbodyCtx = document.getElementById('inbody_chart').getContext('2d');

                            arrNum = ["체중", "체지방량", "골격근량", "BMI"];

                            arrWeight = [record.inbody_weight,
                            record.inbody_bfm,
                            record.inbody_sm,
                            record.inbody_bmi];

                            inbodyData = {
                                labels: arrNum,
                                datasets: [{
                                    type: 'bar',
                                    label: 'inbody',
                                    data: arrWeight,
                                    borderColor: ['rgba(255, 99, 132, 1)',
                                        'rgba(54, 162, 235, 1)',
                                        'rgba(255, 206, 86, 1)',
                                        'rgba(75, 192, 192, 1)',
                                    ],
                                    backgroundColor: ['rgba(255, 99, 132, 0.2)',
                                        'rgba(54, 162, 235, 0.2)',
                                        'rgba(255, 206, 86, 0.2)',
                                        'rgba(75, 192, 192, 0.2)',
                                    ],
                                    borderWidth: 1
                                }]
                            };

                            inbodyChart = new Chart(inbodyCtx, {
                                data: inbodyData,
                                options: { responsive: false, indexAxis: 'y', scales: { y: { beginAtZero: true } } }
                            });
                        }
						
						// weight change chart
					</script>
					
					<c:choose>
						<c:when test="${empty newWeight}">
							<script>
								let weightCtx = document.getElementById('weight_chart').getContext('2d');
								let weightChart = new Chart(weightCtx, {
									type: 'bar',
									data: {
										labels: ['1/1','1/1','1/1','1/1','1/1','1/1'], 
										datasets: [{
											label: '# weight change',
											data: [0,0,0,0,0,0],
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
						</c:when>
						<c:otherwise>
							<script>
								// weight change chart
								let weightCtx = document.getElementById('weight_chart').getContext('2d');
								let weightChart = new Chart(weightCtx, {
									type: 'bar',
									data: {
										labels: [
											'<fmt:formatDate value="${newWeight[5].exr_date}" pattern="MM/dd" />', 
											'<fmt:formatDate value="${newWeight[4].exr_date}" pattern="MM/dd" />', 
											'<fmt:formatDate value="${newWeight[3].exr_date}" pattern="MM/dd" />', 
											'<fmt:formatDate value="${newWeight[2].exr_date}" pattern="MM/dd" />', 
											'<fmt:formatDate value="${newWeight[1].exr_date}" pattern="MM/dd" />', 
											'<fmt:formatDate value="${newWeight[0].exr_date}" pattern="MM/dd" />'], 
										datasets: [{
											label: '# weight change',
											data: [
												${newWeight[5].inbody_weight}, 
												${newWeight[4].inbody_weight}, 
												${newWeight[3].inbody_weight}, 
												${newWeight[2].inbody_weight}, 
												${newWeight[1].inbody_weight}, 
												${newWeight[0].inbody_weight}
												],
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
						</c:otherwise>
					</c:choose>
					
					
				</main>

				<%@ include file="/layout/footer.jsp" %>