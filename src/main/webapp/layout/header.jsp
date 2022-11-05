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
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
			<!-- font-family: 'Noto Sans KR', sans-serif; -->


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

			<!-- daum zipcode -->
            <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
            <!-- kakaomaps - ykm -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b70a07e8ebffe5918d15f49ba310485f&libraries=services"></script>
			<!-- kakaomaps - kms -->
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12fd95dff1fb7039a62aa4e24d3011f0&libraries=services"></script>

			<!-- AOS -->
			<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
			<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

			<!-- owl carousel -->
			<link href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
				rel="stylesheet">
			<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

			<!-- sweetalert -->
			<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

			<!-- css -->
			<link rel="stylesheet" href="/css/base.css" type="text/css">
			<link rel="stylesheet" href="/css/index.css" type="text/css">
			<link rel="stylesheet" href="/css/search.css" type="text/css">
			<link rel="stylesheet" href="/css/gym-detail.css" type="text/css">
			<link rel="stylesheet" href="/css/users-mypage.css" type="text/css">
    		<link rel="stylesheet" href="/css/bs.css" type="text/css">
    		
			<style>
				.swal2-shown {
					overflow-y: scroll;
					padding: 0px !important;
				}
				#loginModal.loginModal-overlay {
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

				#loginModal .window {
					background-color: white;
					backdrop-filter: blur(13.5px);
					-webkit-backdrop-filter: blur(13.5px);
					border-radius: 10px;
					border: 1px solid rgba(255, 255, 255, 0.18);
					box-shadow: 1px 1px 5px 1px #808080;
					position: relative;
					padding: 20px;
					padding-top: 30px;
					width: 350px;
					height: 450px;
					min-width: 350px;
				}

				#loginModal .title {
					display: inline;
					text-shadow: 1px 1px 2px gray;
				}

				#loginModal .close-area {
					display: inline;
					float: right;
					padding-right: 15px;
					cursor: pointer;
					text-shadow: 1px 1px 2px gray;
					color: white;
				}

				#loginModal .content {
					margin-top: 20px;
				}

				#loginModal input:not([type="checkbox"]) {
					padding-left: 5px;
					padding-right: 5px;
					width: 250px;
					border: 0px;
					border-bottom: 1px solid black;
					outline: none;
				}

				#loginModal input:not([type="checkbox"]):focus {
					box-shadow: 0px 1px 0px 0px black;
				}

				#loginModal .btn_base {
					width: 120px;
					height: 50px;
				}

				#loginModal a:hover {
					cursor: pointer;
				}

				#loginModal .search {
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
										<li class="float-end"><a class="header_a_tag" onclick="showLoginModal()">로그인</a>
										</li>
										<li class="float-end"><a class="header_a_tag"
												onclick="showSignuploginModal()">회원가입</a></li>
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
			
			<!-- 회원가입 모달 -->
			<%@ include file="/user/signup.jsp" %>
			
			<div id="loginModal" class="loginModal-overlay" align="center">
				<div class="window">
					<div class="text_title title">회원 로그인</div>
					<div class="close-area" onclick="hideLoginModal()">
						<i class="fa-solid fa-x" style="color:#808080"></i>
					</div>
					<!-- 로그인 폼 -->
					<form id="form_login">
						<div class="row justify-content-center mt-3">
							<div class="col-12 gy-3">
								<div class="text-start" style="width:250px">
									<span style="color:#808080; font-size:x-small">이메일</span>
								</div>
								<input type="text" name="login_id" id="login_id" placeholder="이메일을 입력하세요."
									maxlength="40">
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
							<div class="col-12 gy-4">
								<span style="color:#404040">계정이 없으신가요?</span>
								<a href="signup">회원 가입</a>
							</div>
							<div class="col-12 gy-1" style="color:#808080; font-size:small">
								<a onclick="showSearch()">아이디 찾기</a>
								<span>/</span>
								<a onclick="showSearch()">비밀번호 찾기</a>
							</div>
						</div>
					</form>
					<!-- 아이디 찾기 폼 -->
					<form class="search" id="form_searchId">
						<div class="row justify-content-center mt-4">
							<div class="col-12 gy-4">
								<input type="text" name="name" id="searchId_name" placeholder="이름" maxlength="10">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 이름을 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="phone" id="searchId_phone" placeholder="핸드폰 번호" maxlength="14">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<button class="btn_base mb-3" type="button" id="btn_searchId">찾기</button>
							</div>
							<div class="col-12" style="margin-top:30px">
								<a style="color:#808080" onclick="toBackward()">Back</a>
							</div>
						</div>
					</form>
					<!-- 비밀번호 찾기 폼 -->
					<form class="search" id="form_searchPw">
						<div class="row justify-content-center mt-4">
							<div class="col-12 gy-4">
								<input type="text" name="email" id="searchPw_email" placeholder="이메일" maxlength="40">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 이메일을 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<input type="text" name="phone" id="searchPw_phone" placeholder="핸드폰 번호" maxlength="14">
								<div class="text-start mt-1 mb-2" style="width:250px">
									<span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
								</div>
							</div>
							<div class="col-12 gy-4">
								<button class="btn_base mb-3" type="button" id="btn_searchPw">찾기</button>
							</div>
							<div class="col-12" style="margin-top:30px">
								<a style="color:#808080" onclick="toBackward()">Back</a>
							</div>
						</div>
					</form>
				</div>
			</div>

			<script>
				// 로그인 loginModal 열기
				function showLoginModal() {
					$("#loginModal").attr("style", "display:inline-flex");
				}

				// 로그인 loginModal 닫기
				function hideLoginModal() {
					$("#loginModal").attr("style", "display:none");
					toBackward();
				}

				// 아이디 / 비밀번호 찾기 페이지 처리
				function showSearch() {
					let text = event.target.innerText;
					$("#form_login").attr("style", "display:none"); $("#form_search" + (text == '아이디 찾기' ? 'Id' : 'Pw')).attr("style", "display:inline");
					$("#loginModal .title").text(text);
				}

				// 뒤로가기 처리
				function toBackward() {
					$(".search").attr("style", "display:none");
					$("#loginModal input:not([type='checkbox']").val("");
					$("#loginModal .title").text("회원 로그인");
					$("#form_login").attr("style", "display:inline");
				}

				// 떨림 애니메이션
                function wobble(element) {
                    let order = [0, -8, 8, -4, 4, -2, 2, -1, 1, 0];
                    let seq = [];
                    order.forEach(function (y) { seq.push({ transform: "translate(0," + y + "px)" }); });
                    element.animate(seq, { duration: 300 });
                }

                // 유효성 검사 (공백 확인)
                function isFilled(element1, element2) {
                    if (element1.val() == "") { wobble((element1)[0]); }
                    else if (element2.val() == "") { wobble((element2)[0]); }
                    else { return true; }
                }

                // 로그인 함수
                function tryLogin() {
                    $.post("/login.user", $("#form_login").serialize())
                        .done((res) => {
                            if (res == "true") {
                                Swal.fire({ title: "Success!", icon: "success", text: "로그인에 성공했습니다."})
                                    .then((result) => {
                                        if (result.isConfirmed) { location.reload(); }
                                    });
                            } else {
                                Swal.fire({ title: "Error", icon: "error", text: "ID가 등록되지 않았거나 비밀번호가 올바르지 않습니다."});
                            }
                        });
                }

                // 아이디 찾기 함수
                function trySearchId() {
                    console.log($("#form_searchId").serialize())
                    $.get("/searchId.user", $("#form_searchId").serialize())
                    .done((res => {
                        if(res != "null") {
                            Swal.fire({ title: "Success!", icon: "success", html: "등록된 아이디는<br><Strong>\'" + res + "\'</Strong><br>입니다." });
                        } else {
                            Swal.fire({ title: "Error", icon: "error", text: "등록된 가입 정보가 없습니다." });
                        }
                    }))
                }

                // 비밀번호 찾기 함수
                function trySearchPw() {
                    console.log($("#form_searchPw").serialize())
                    $.get("/searchPw.user", $("#form_searchPw").serialize())
                    .done((res => {
                        if(res == "true") {
                            // Fake Alert
                            Swal.fire({ title: "Success!", icon: "success", html: "등록된 이메일 주소로<br>비밀번호 설정 링크가 발송되었습니다.<br>" })
                        } else {
                            Swal.fire({ title: "Error", icon: "error", text: "등록된 가입 정보가 없습니다." });
                        }
                    }))
                }

				// ESC 누르면 Modal 닫기
				$(window).on("keyup", e => {
					if ($("#loginModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideLoginModal(); }
				});

				// 창 바깥쪽 클릭하면 Modal 닫기
				// $("#loginModal").on("click", e => {
				// 	if (e.target.classList.contains("loginModal-overlay")) { hideLoginModal(); }
				// });

                // 버튼 이벤트
                $("#btn_login").on("click", () => {
                    if (isFilled($("#login_id"), $("#login_pw"))) { tryLogin(); }
                });

                $("#btn_searchId").on("click", () => {
                    if (isFilled($("#searchId_name"), $("#searchId_phone"))) { trySearchId(); }
                });

                $("#btn_searchPw").on("click", () => {
                    if (isFilled($("#searchPw_email"), $("#searchPw_phone"))) { trySearchPw(); }
                });

                // 체크박스 이벤트
                $("#chk_bs").on("change", (e) => {
                    $("#login_bs")[0].value = $(e.target).is(":checked") ? "true" : "false";
                });

                // 엔터 = 버튼 클릭
                $("#login_id, #login_pw").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_login").click() } });
                $("#searchId_name, #searchId_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchId").click() } });
                $("#searchPw_email, #searchPw_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchPw").click() } });
			</script>