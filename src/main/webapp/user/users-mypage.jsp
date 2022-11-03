<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




		<%@ include file="/layout/header.jsp" %>


			<div class="main_margin_155 containerbox"></div>
			<!-- Site Main -->
			<main class="containerbox" id="users-mypage">
				<div class="row text-center">
					<h1>마이페이지</h1>
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
						<div class="row justify-content-center">
							<!-- modify button -->
							<div style="display:inline-table; padding:0; margin:0; width:max-content;">
								<button class="btn_base modifyBtn" type="button" id="modifyProfile">내 프로필 수정</button>
								<button class="btn_base modifyBtn" type="button" id="modifyPrivate">개인 정보 수정</button>
							</div>
						</div>
					</div>
					<script>
						let profile_upload = $("#profile_upload");
						profile_upload.on("click", function () {

						});
					</script>

					<!-- input info -->
					<div class="col-4">
						<!-- name -->
						<div class="profile_input_group py-2">
							<div class="profile_title">이름</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="text">
							</div>
						</div>
						<!-- select sex -->
						<div class="profile_input_group py-2">
							<div class="profile_title">성별</div>
							<button id="select_sex" class="btn btn-outline-secondary dropdown-toggle modify_input"
								type="button" data-bs-toggle="dropdown" aria-expanded="false"
								style="--bs-btn-border-color: rgb(206,212,218);">선택</button>
							<ul class="dropdown-menu dropdown-menu-start">
								<li><a class="select_sex dropdown-item" href="#">남자</a></li>
								<li><a class="select_sex dropdown-item" href="#">여자</a></li>
							</ul>
							<script>
								$(".select_sex").on("click", function () {
									$("#select_sex").html($(this).html());
								});
							</script>
						</div>
						<!-- birthday -->
						<div class="profile_input_group py-2">
							<div class="profile_title">생년월일</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="date">
							</div>
						</div>
						<!-- interesting -->
						<div class="profile_input_group pt-2" style="height:50px;">
							<div class="profile_title">관심사</div>
							<div style="display:inline-table; width:300px; padding:0; margin:0;">
								<input id="interest_input" class="form-control modify_input" type="text" maxlength="16">
							</div>
							<div style="display:inline-table; padding:0; margin:0; transform:translate(0, -3px);">
								<button class="btn btn-outline-secondary modify_btn" type="button"
									style="--bs-btn-border-color: rgb(206,212,218);" onclick="addInterst()">등록</button>
							</div>
						</div>
						<!-- interest out -->
						<div id="interest_out"></div>
					</div>



					<script>
						function addInterst() {
							let interest_input = $("#interest_input").val();
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
								addInterst();
							};
						});

						$(".modify_input").attr("disabled", "true");
						$(".modify_btn").css("display", "none");
						$("#profile_upload").css("cursor", "default");
						$("#user_img_in").attr("disabled", "true");

						$("#modifyProfile").on("click", modifyProfile);
						let modifyBtn = $("#modifyProfile");
						function modifyProfile() {
							modifyBtn.html("변경 저장");
							$(".modify_input").removeAttr("disabled");
							$("#user_img_in").removeAttr("disabled");
							$(".modify_btn").css("display", "inline-table");
							$("#profile_upload").css("cursor", "pointer");
							modifyBtn.off("click");
							modifyBtn.on("click", submitProfile);
						};
						function submitProfile() {
							modifyBtn.html("프로필 수정");
							$(".modify_input").attr("disabled", "true");
							$(".modify_btn").css("display", "none");
							$("#profile_upload").css("cursor", "default");
							$("#user_img_in").attr("disabled", "true");
							modifyBtn.off("click");
							modifyBtn.on("click", modifyProfile);

							/*<!-- submit -->  */
							$.ajax({

							});
						};
					</script>
				</div>

				<!-- 좋아요 한 시설 -->
				<div class="row">
					<span class="text_title">좋아요 한 시설</span>
				</div>
				<!-- 시설 카드 -->
				<div class="gym_cards_box">
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
					<div class="gym_card">
						<img class="gym_img" src="/resource/duck.ico" alt="">
					</div>
				</div>
				<script>
					$(window).scroll(function () {
						let scrollTop = $(window).scrollTop();
						let offset = scrollTop - $(".gym_cards_box").offset().top;
						if (scrollTop > $(".gym_cards_box").offset().top) {
							$("gym_card").css("left", -offset);
						} else {
							$(".gym_card").css("left", -offset);
						}
					});
				</script>

				<!-- 내가 쓴 리뷰 -->
				<div class="row">
					<span class="text_title">내가 쓴 리뷰</span>
				</div>
				<!-- 리뷰 카드 -->
				<div class="row">

				</div>
			</main>

			<%@ include file="/layout/footer.jsp" %>