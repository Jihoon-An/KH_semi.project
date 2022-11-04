<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/layout/header.jsp" %>


			<div class="main_margin_155 containerbox"></div>
			<!-- Site Main -->
			<main class="containerbox" id="users-mypage">
				<div class="row text-center">
					<h1>My 페이지</h1>
				</div>
				<!-- profile -->
				<div class="row pt-3 justify-content-center" id="user-info">
					<!-- profile img -->
					<div class="col-3 text-center">
						<div class="row justify-content-center">
							<div class="row justify-content-center mb-2">
								<img class="p-0" id="user_img" src="/resource/default_profile.png" alt="">
							</div>
							<div class="row justify-content-center">
								<label class="" id="profile_upload" for="user_img_in">
									<span><i class="modify_btn fa-sharp fa-solid fa-arrow-up-from-bracket"
											style="color: rgb(8,33,71);"></i></span>
									<span class="text_normal" style="color: rgb(8,33,71);"> 프로필 이미지</span>
								</label>
							</div>
							<input type="file" name="user_img_in" id="user_img_in" hidden>
						</div>

					</div>
					<script>
						let profile_upload = $("#profile_upload");
						profile_upload.on("click", function () {

						});
					</script>

					<!-- input info -->
					<div class="col-5" style="height:318px;">
						<!-- name -->
						<div class="profile_input_group py-2">
							<div class="profile_title">이름</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="text" name="user_name">
							</div>
						</div>
						<!-- select sex -->
						<div class="profile_input_group py-2">
							<div class="profile_title">성별</div>
							<button type="button" class="modify_input sex_btn" id="manBtn">남자</button>
							<button type="button" class="modify_input sex_btn" id="womanBtn">여자</button>
							<input type="hidden" name="sex" id="sex">
							<script>
								$("#manBtn").on("click", function(){
									$("#sex").val("man");
									$("#manBtn").css("border","1px solid #001A41").css("color","#001A41");
									$("#womanBtn").css("border","1px solid #cbcbcb").css("color","#cbcbcb");
								})
								$("#womanBtn").on("click", function(){
									$("#sex").val("woman");
									$("#womanBtn").css("border","1px solid #001A41").css("color","#001A41");
									$("#manBtn").css("border","1px solid #cbcbcb").css("color","#cbcbcb");
								})
							</script>
						</div>
						<!-- birthday -->
						<div class="profile_input_group py-2">
							<div class="profile_title">생년월일</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="date" name="user_birthday">
							</div>
						</div>
						<!-- interesting -->
						<div class="profile_input_group pt-2" style="height:50px;">
							<div class="profile_title">관심사</div>
							<div style="display:inline-table; width:300px; padding:0; margin:0;">
								<input id="interest_input" class="form-control modify_input" type="text" maxlength="10"
									placeholder="최대4개, 10글자">
							</div>
							<div style="display:inline-table; padding:0; margin:0; transform:translate(0, -3px);">
								<button class="btn btn-outline-secondary modify_btn" type="button"
									style="--bs-btn-border-color: rgb(206,212,218);" onclick="addInterest()">등록</button>
							</div>
						</div>
						<!-- interest out -->
						<div id="interest_out"></div>
					</div>
				</div>
				<div class="row justify-content-center mb-5">
					<!-- modify button -->
					<div style="display:inline-table; padding:0; margin-top:0; width:max-content;">
						<button class="btn_base modifyBtn" type="button" id="modifyProfile">내 프로필 수정</button>
						<button class="btn_base modifyBtn" type="button" id="modifyPrivate">개인 정보 수정</button>
					</div>
				</div>

				<script>
					// 떨림 애니메이션
					function wobble(element) {
						let order = [0, -8, 8, -4, 4, -2, 2, -1, 1, 0];
						let seq = [];
						order.forEach(function (y) { seq.push({ transform: "translate(0," + y + "px)" }); });
						element.animate(seq, { duration: 300 });
					}

					function addInterest(interest_input) {
						if ($(".interesting").length >= 4) {
							wobble(document.getElementById("interest_input"));
							return false;
						}
						if (interest_input != "") {
							console.log(interest_input);
							let interest_out = $("#interest_out");

							let interesting = $("<div>");
							interesting.addClass("interesting");
							interesting.html(interest_input);

							let del_interest = $("<a>").on("click", function () {
								$(this).parent().remove();
							});
							del_interest.html(" X");
							del_interest.addClass("modify_btn");
							del_interest.attr("style", "cursor:pointer; color:rgb(104, 104, 204); text-decoration: none;");

							interesting.append(del_interest);

							interest_out.append(interesting);
							$("#interest_input").val("");
						}
					}
					$("#interest_input").on("keyup", function (e) {
						if (e.keyCode == 13) {
							addInterest($("#interest_input").val());
						};
					});

					$(".modify_input").attr("disabled", "true");
					$(".modify_btn").css("display", "none");
					$("#profile_upload").css("cursor", "default");
					$("#user_img_in").attr("disabled", "true");

					$("#modifyProfile").on("click", modifyProfile);
					let modifyBtn = $("#modifyProfile");
					// 프로필 수정버튼 누를 때
					function modifyProfile() {
						modifyBtn.html("변경 저장");
						$(".modify_input").removeAttr("disabled");
						$("#user_img_in").removeAttr("disabled");
						$(".modify_btn").css("display", "inline-table");
						$("#profile_upload").css("cursor", "pointer");
						$("#manBtn").addClass("sex_btn_hover");
						$("#womanBtn").addClass("sex_btn_hover");
						modifyBtn.off("click");
						modifyBtn.on("click", submitProfile);
					};
					// 저장버튼 누를 때
					function submitProfile() {
						modifyBtn.html("프로필 수정");
						$(".modify_input").attr("disabled", "true");
						$(".modify_btn").css("display", "none");
						$("#profile_upload").css("cursor", "default");
						$("#user_img_in").attr("disabled", "true");
						$("#interest_input").val("");
						$("#manBtn").removeClass("sex_btn_hover");
						$("#womanBtn").removeClass("sex_btn_hover");
						modifyBtn.off("click");
						modifyBtn.on("click", modifyProfile);
					};
				</script>

				<hr>

				<!-- 즐겨찾기 시설 -->
				<div class="row pt-4 pb-3">
					<span class="text_title">My 즐겨찾기</span>
				</div>
				<!-- 시설 카드 -->
				<div class="gym_area mb-5">
					<div class="gym_cards_box" id="gym_cards_box"></div>
				</div>
				<!-- 카드 생성 -->
				<script>
					createGymCard();
					createGymCard();
					createGymCard();
					createGymCard();
					createGymCard();
					createGymCard();
					createGymCard();

					function createGymCard() {
						let a_img = $("<a>").attr("href", "#");
						let a_text = $("<a>").attr("href", "#");

						let gym_card = $("<div>");
						gym_card.addClass("gym_card");


						let gym_img = $("<img>");
						let gym_text = $("<span>");
						let heart = $("<i>");


						gym_img.addClass("gym_img").attr("src", "/resource/main.jpg");
						a_img.append(gym_img);
						gym_text.addClass("gym_text").text("testtesttest");
						a_img.append(gym_text);
						heart.addClass("fa-solid fa-heart fa-xl heart");

						heart.on("click", function () {
							if ($(this).css("color") == "rgb(143, 149, 154)") {
								$(this).css("color", "#CF0C00");
							} else {
								$(this).css("color", "#8f959a")
							}
						})

						gym_card.append(a_img).append(a_text).append(heart);
						$("#gym_cards_box").append(gym_card);
					};
				</script>

				<hr>

				<!-- 내가 쓴 리뷰 -->
				<div class="row pt-4 pb-3">
					<span class="text_title">My 리뷰</span>
				</div>
				<!-- 리뷰 카드 영역 -->
				<div class="row review_cards_area" id="review_cards_area">
					<!-- review card -->

					<script>
						createReviewCard();
						createReviewCard();
						createReviewCard();
						createReviewCard();

						function createReviewCard() {
							let review_card = $("<div>").addClass("col-6 review_card p-1");
							let border = $("<div>").addClass("border p-1");
							let row = $("<div>").addClass("row");
							let review_gymName = $("<div>").addClass("col-10 review_gymName");
							let modify_col = $("<div>").addClass("col-1");

							/*modify link*/
							let modify_a = $("<a>").addClass("modify_review_btn").attr("href", "#");

							let modify_icon = $("<i>").addClass("fa-regular fa-pen-to-square");
							let del_col = $("<div>").addClass("col-1 text-start");
							let del_icon = $("<i>").addClass("fa-solid fa-x del_review_btn").on("click", function () {
								$.ajax({
									//del Controller
								}).done(
									function (response) {
										$(this).closest(".review_card").remove();
									}
								);
							});
							let hr = $("<hr>");
							let review_text = $("<div>").addClass("review_text");
							let span = $("<span>");


							$("#review_cards_area").append(review_card.append(
								border.append(
									row.append(
										review_gymName.append("매장명")
									).append(
										modify_col.append(
											modify_a.append(
												modify_icon
											)
										)
									).append(
										del_col.append(
											del_icon
										)
									)
								).append(
									hr
								).append(
									review_text.append("일부 내용")
								)
							)
							)
						};
					</script>
				</div>

				<!-- 개인정보 수정 테이블 -->

				<form id="form_pw" class="modal-overlay">
					<div id="private_table">
						<!-- X icon -->
						<i class="fa-solid fa-x" id="close_private"></i>
						<script>
							$("#close_private").click(() => {
								$("#form_pw").css("display", "none");
							});
						</script>

						<!-- title -->
						<span id="private_title">
							개인정보 수정
						</span>
					</div>
					<div id="pw">
						<!-- 1차 비밀번호 입력 -->
						<div class="input_pw">
							<span>새 비밀번호</span>
							<input id="pw1" name="pw" type="password" placeholder="8~16자, 영어,숫자,특수문자" maxlength="16">
						</div>
						<!-- 2차 비밀번호 입력 -->
						<div class="input_pw">
							<span>새 비밀번호 확인</span>
							<input id="pw2" type="password" placeholder="비밀번호 확인" maxlength="16">
						</div>

						<div id="pw_confirm" style="height: 30px;color:red;"></div>

						<button type="button" id="pw_save_btn" class="btn_base"
							style="margin: auto; margin-top:40px;">저장하기</button>
					</div>
					<!-- 회원탈퇴 -->
					<div id="sign_down">
						<div class="sign_down_area" id="sign_down_btn_area">
							<a onclick="signDown()" id="sign_down_btn">회원탈퇴</a>
						</div>
						<div class="sign_down_area" id="sign_down_confirm">
							<div>정말 탈퇴하시겠습니까?</div>
							<button type="button" class="sign_down_confirm_btn" id="confirm_y">예</button>
							<button type="button" class="sign_down_confirm_btn" id="confirm_n">아니오</button>
						</div>
					</div>
				</form>
				<script>


					//회원 탈퇴
					function signDown() {
						$("#sign_down_btn_area").css("display", "none");
						$("#sign_down_confirm").css("display", "block");
					};

					$("#confirm_n").click(function () {
						$("#sign_down_btn_area").css("display", "block");
						$("#sign_down_confirm").css("display", "none");
					});
					$("#confirm_y").click(function () {
						///////
					});

					// 개인 정보 수정 버튼 동작
					$("#modifyPrivate").click(function () {
						$("#form_pw").css("display", "");
					});

					// password confirm
					$("#pw1").on("keydown", () => {
						$("#pw_confirm").html("");
					});
					$("#pw2").on("keydown", () => {
						$("#pw_confirm").html("");
					});

					let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
					// 비밀번호 저장 버튼 이벤트
					$("#pw_save_btn").on("click", () => {
						// regex Exception
						if ($("#pw1").val() == "") {
							wobble(document.getElementById("pw1"));
							$("#pw_confirm").html("비밀번호를 입력하세요.");
							$("#pw1").val("").focus();
							return false;
						}
						if (!pwRegex.test($("#pw1").val())) {
							wobble(document.getElementById("pw1"));
							$("#pw_confirm").html("입력이 옳바르지 않습니다.");
							$("#pw1").val("").focus();
							$("#pw2").val("");
							return false;
						}
						// same pw Exception
						if ($("#pw1").val("") != $("#pw2").val("")) {
							wobble(document.getElementById("pw2"));
							$("#pw_confirm").html("비밀번호가 일치하지 않습니다.");
							$("#pw2").focus();
							return false;
						}

						//submit

						$("#form_pw").submit();
					});

					$("#sign_down_confirm").css("display", "none");
					$("#form_pw").css("display", "none");
				</script>
			</main>

			<%@ include file="/layout/footer.jsp" %>