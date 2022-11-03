<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




		<%@ include file="/layout/header.jsp" %>

			<style>
				#users-mypage div {
					box-sizing: border-box;
					// border: 1px solid black;
				}

				#users-mypage #user_img {
					width: 159px;
					height: 159px;
					border-radius: 100%;
				}

				#users-mypage #profile_upload {
					width: max-content;
				}

				#users-mypage .profile_title {
					width: 100px;
					display: inline-table;

				}

				#users-mypage #interest_out {
					width: 480px;
					overflow: scroll;
					display: inline-table;
				}

				#users-mypage .interesting {
					border: 1px solid rgb(204, 204, 204);
					padding-left: 10px;
					padding-right: 10px;
					margin: 5px;
					text-align: center;
					border-radius: 30px;
					width: max-content;
					display: inline-table;
				}

				#users-mypage .modifyBtn {
					transform: translate(0, -2px);
					height: 50px;
					font-size: 15px;
					padding: 5px;
					display: inline-table;
				}
			</style>
			<div class="main_margin_155 containerbox"></div>
			<!-- Site Main -->
			<main class="containerbox" id="users-mypage">
				<div class="row text-center text_title">
					<h1>마이페이지</h1>
				</div>
				<div class="row pt-3" id="user-info">
					<!-- profile img -->
					<div class="col-3 text-center">
						<div class="row justify-content-center mb-2">
							<img class="p-0" id="user_img" src="/resource/default_profile.png" alt="">
						</div>
						<div class="row justify-content-center">
							<div class="m-0 p-0" id="profile_upload">
								<span><i class="fa-sharp fa-solid fa-arrow-up-from-bracket"
										style="color: rgb(8,33,71);"></i></span>
								<span class="text_normal" style="color: rgb(8,33,71);"> 프로필 이미지</span>
							</div>
						</div>
					</div>
					<!-- input -->
					<div class="col">
						<div class="profile_input_group py-2">
							<div class="profile_title">이름</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="text">
							</div>
						</div>
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
						<div class="profile_input_group py-2">
							<div class="profile_title">생년월일</div>
							<div style="display:inline-table;"><input class="form-control modify_input" type="date">
							</div>
						</div>
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
						<div id="interest_out"></div>
						<div style="display:inline-table; padding:0; margin:0; width:max-content;">
							<button class="btn_base modifyBtn" type="button" id="modifyProfile" style="width:120px;">프로필
								수정</button>
							<button class="btn_base modifyBtn" type="button" style="width:150px;">개인 정보
								수정</button>
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
									del_interest.attr("style", "cursor:pointer; color:rgb(104, 104, 204);");

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

							$("#modifyProfile").on("click", modifyProfile);
							let modifyBtn = $("#modifyProfile");
							function modifyProfile() {
								modifyBtn.html("변경 저장");
								$(".modify_input").removeAttr("disabled");
								$(".modify_btn").css("display", "inline-table");
								modifyBtn.off("click");
								modifyBtn.on("click", submitProfile);
							};
							function submitProfile() {
								modifyBtn.html("프로필 수정");
								$(".modify_input").attr("disabled", "true");
								$(".modify_btn").css("display", "none");
								modifyBtn.off("click");
								modifyBtn.on("click", modifyProfile);
							};
						</script>
					</div>
				</div>
			</main>

			<%@ include file="/layout/footer.jsp" %>