<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>피트니즈 - Fitneeds</title>
			<link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">

			<!-- fontawesome -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

			<!-- Jquery -->
			<script src="https://code.jquery.com/jquery-3.6.1.min.js"
				integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

			<!-- google font -->
			<link rel="preconnect" href="https://fonts.googleapis.com">
			<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
			<link
				href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
				rel="stylesheet">
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet"><!-- font-family: 'Noto Sans KR', sans-serif; -->
				

			<!-- bootstrap - icon -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

			<!-- bootstrap - css -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
				crossorigin="anonymous"></script>

			<!-- fontawesome - icon  -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

			<!-- Radar Chart -->
			<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

			<!-- kakaomaps - ykm -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f"></script>
			<!-- kakaomaps - kms -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12fd95dff1fb7039a62aa4e24d3011f0"></script>

			<!-- AOS -->
			<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
			<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

			<!-- owl carousel -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
				rel="stylesheet">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

			<!-- css -->
			<link rel="stylesheet" href="/css/base.css" type="text/css">
			<link rel="stylesheet" href="/css/index.css" type="text/css">
			<link rel="stylesheet" href="/css/search.css" type="text/css">
			<link rel="stylesheet" href="/css/gym-detail.css" type="text/css">
			<link rel="stylesheet" href="/css/users-mypage.css" type="text/css">

			<style>
				#modal.modal-overlay {
					width: 100%;
					height: 100%;
					position: fixed;
					left: 0;
					top: 0;
					display: none;
					flex-direction: column;
					align-items: center;
					justify-content: center;
					backdrop-filter: blur(1.5px);
					-webkit-backdrop-filter: blur(1.5px);
					border-radius: 6px;
					border: 1px solid #808080;
					z-index: 5;
				}
				#modal .modal-window {
					background-color: white;
					backdrop-filter: blur( 13.5px );
					-webkit-backdrop-filter: blur( 13.5px );
					border-radius: 10px;
					border: 1px solid rgba( 255, 255, 255, 0.18 );
					box-shadow: 1px 1px 5px 1px #808080;
					position: relative;
					top: -100px;
					padding: 20px;
					padding-bottom: 50px;
                    width: 350px;
                    height: 450px;
                    min-width: 350px;
				}
				#modal .title {
					display: inline;
					text-shadow: 1px 1px 2px gray;
				}

				#modal .close-area {
					display: inline;
					float: right;
					padding-right: 10px;
					cursor: pointer;
					text-shadow: 1px 1px 2px gray;
					color: white;
				}
				
				#modal .content {
					margin-top: 50px;
				}

				#modal input:not([type="checkbox"]) {
                    padding-left: 5px;
                    padding-right: 5px;
                    width: 250px;
                    border: 0px;
                    border-bottom: 1px solid black;
                    outline: none;
                }

                #modal input:not([type="checkbox"]):focus{
                    box-shadow: 0px 1px 0px 0px black;
                }

                #modal .btn_base {
                    width: 120px;
                    height: 50px;
                }

                #modal .search {
                    display: none;
                }
			</style>
		</head>

		<body>
			<!-- Site header -->
			<header id="header">
				<div class="containerbox">

					<div class="float-start">
						<h1 id="header_logo">
							<a class="header_a_tag" href="/index.jsp">Fitneeds</a>
						</h1>
					</div>

					<div class="float-start">
						<nav id="header_nav_text">
							<ul id="header_nav_menu">
								<li class="float-start"><a class="header_a_tag" href="/gym/search.jsp">헬스장검색</a></li>
								<li class="float-start"><a class="header_a_tag" href="#">실시간리뷰</a></li>
								<li class="float-start"><a class="header_a_tag" href="#">운동기록</a></li>
							</ul>
							<ul id="header_nav_person">
								<c:choose>
									<c:when test="${userId == null}">
										<li class="float-end"><a class="header_a_tag" onclick="showLogin()">로그인</a></li>
										<li class="float-end"><a class="header_a_tag" onclick="showSignup">회원가입</a></li>
										<script>
											function showLogin() {
												alert("");
												window.showModalDialog();
											}
										</script>
									</c:when>
									<c:otherwise>
										<li class="float-end"><a class="header_a_tag" onclick="tryLogout()">로그아웃</a>
										</li>
										<li class="float-end"><a class="header_a_tag" href="/mypage.user">마이페이지</a></li>
										<script>
											function tryLogout() {
												$.get("/logout.user").done(() => { location.reload() });
											}
										</script>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>

				</div>
			</header>
			<div id="modal" class="modal-overlay" align="center">
				<div class="modal-window">
					<div class="text_title title">회원 로그인</div>
					<div class="close-area">
						<i class="fa-solid fa-x" id="btn_close" style="color:#808080"></i>
					</div>
					<!-- 로그인 폼 -->
					<form id="form_login">
						<div class="row justify-content-center modal-content">
							<div class="col-12 gy-3">
								<div class="text-start" style="width:250px">
									<span style="color:#808080; font-size:x-small">이메일</span>
								</div>
								<input type="text" name="login_id" id="login_id" placeholder="이메일을 입력하세요." maxlength="40">
							</div>
							<div class="col-12 gy-4">
								<div class="text-start" style="width:250px">
									<span style="color:#808080; font-size:x-small">비밀번호</span>
								</div>
								<input type="password" name="login_pw" id="login_pw" placeholder="비밀번호를 입력하세요."
									maxlength="20">
							</div>
							<div class="col-12 gy-4">
								<button type="button" class="btn_base" id="btn_login">로그인</button>
							</div>
							<div class="col-12 gy-1">
								<input type="hidden" name="login_bs" id="login_bs" value="false">
								<input class="form-check-input" type="checkbox" id="chk_bs">
								<label class="form-check-label" for="login_bs" style="color:#404040; font-size:14px">운영자
									로그인</label>
							</div>
							<div class="col-12 gy-3">
								<span style="color:#404040">계정이 없으신가요?</span>
								<a href="signup">회원 가입</a>
							</div>
							<div class="col-12 gy-1" style="color:#808080; font-size:small">
								<a
									onclick="$('#form_login').attr('style', 'display:none'); $('#form_searchId').attr('style', 'display:inline')">아이디
									찾기</a>
								<span>/</span>
								<a
									onclick="$('#form_login').attr('style', 'display:none'); $('#form_searchPw').attr('style', 'display:inline')">비밀번호
									찾기</a>
							</div>
						</div>
					</form>
					<!-- 아이디 찾기 폼 -->
					<form class="search" id="form_searchId">
						<div class="row justify-content-center">
							<div class="col-12 text-end">
								<a><i class="fa-solid fa-x" style="color:#808080"></i></a>
							</div>
							<div class="col-12 gy-4">
								<div class="mb-2" style="font-size:large">아이디 찾기</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="name" id="searchId_name" placeholder="이름" maxlength="10">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 이름을 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="phone" id="searchId_phone" placeholder="핸드폰 번호"
									maxlength="14">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<button class="btn_base mb-3" type="button" id="btn_searchId">찾기</button>
							</div>
							<div class="col-12 gy-4">
								<a class="btn_back" style="color:#808080">Back</a>
							</div>
						</div>
					</form>
					<!-- 비밀번호 찾기 폼 -->
					<form class="search" id="form_searchPw">
						<div class="row justify-content-center">
							<div class="col-12 text-end">
								<a><i class="fa-solid fa-x" style="color:#808080"></i></a>
							</div>
							<div class="col-12 gy-4">
								<div class="mb-2" style="font-size:large">비밀번호 찾기</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="email" id="searchPw_email" placeholder="이메일" maxlength="40">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 이메일을 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="phone" id="searchPw_phone" placeholder="핸드폰 번호"
									maxlength="14">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<button class="btn_base mb-3" type="button" id="btn_searchPw">찾기</button>
							</div>
							<div class="col-12 gy-4">
								<a class="btn_back" style="color:#808080">Back</a>
							</div>
						</div>
					</form>
					</div>
				</div>
			</div>

			<script>
				const modal = document.getElementById("modal")
				function showLogin() {
					modal.style.display = "inline-flex"
				}
				function isModalOn() {
					return modal.style.display === "inline-flex"
				}
				function modalOff() {
					modal.style.display = "none"
				}
				const closeBtn = modal.querySelector(".close-area")
				closeBtn.addEventListener("click", e => {
					modalOff()
				})
				$("#btn_close").on("click", () => {
					$("#modal").attr("style","display:none");
				});
				modal.addEventListener("click", e => {
					const evTarget = e.target
					if (evTarget.classList.contains("modal-overlay")) {
						modalOff()
					}
				})
				window.addEventListener("keyup", e => {
					if (isModalOn() && e.key === "Escape") {
						modalOff()
					}
				})
			</script>
