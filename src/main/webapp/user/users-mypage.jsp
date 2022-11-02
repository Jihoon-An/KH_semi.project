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

				#users-myprofile .profile_input_group{
					display: inline;
					float: left;
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
								<span><i class="fa-sharp fa-solid fa-arrow-up-from-bracket"></i></span><span class="text_normal"> 프로필 이미지</span>
							</div>
						</div>
					</div>
					<!-- input -->
					<div class="col">
						<div class="row" id="profile_input_group">
							<div class="profile_title">test</div>
							<div class="profile_input"><input type="text" name="" id=""></div>
						</div>
						<div class="row"></div>
						<div class="row"></div>
						<div class="row"></div>
					</div>
				</div>
			</main>

			<%@ include file="/layout/footer.jsp" %>