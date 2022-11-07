<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>피트니즈 - Fitneeds</title>
<link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">

<!-- fontawesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"
	rel="stylesheet">

<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"
	integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ="
	crossorigin="anonymous"></script>

<!-- google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- font-family: 'Noto Sans KR', sans-serif; -->


<!-- bootstrap - icon -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- bootstrap - css -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>

<!-- fontawesome - icon  -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css"
	rel="stylesheet">

<!-- Radar Chart -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<!-- daum zipcode -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
	rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- sweetalert -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<!-- css -->
<link rel="stylesheet" href="/css/base.css" type="text/css">
<link rel="stylesheet" href="/css/index.css" type="text/css">
<link rel="stylesheet" href="/css/search.css" type="text/css">
<link rel="stylesheet" href="/css/gym-detail.css" type="text/css">
<link rel="stylesheet" href="/css/users-mypage.css" type="text/css">
<link rel="stylesheet" href="/css/users.css" type="text/css">
<link rel="stylesheet" href="/css/bs.css" type="text/css">
<link rel="stylesheet" href="/css/host-user.css" type="text/css">
<link rel="stylesheet" href="/css/host-bsuser.css" type="text/css">

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
						<li class="float-start"><a class="header_a_tag"
							href="/main.search">헬스장검색</a></li>
						<li class="float-start"><a class="header_a_tag" href="#">실시간리뷰</a></li>
						<li class="float-start"><a class="header_a_tag" href="#">운동기록</a></li>
					</ul>
					<ul id="header_nav_person">
						<c:choose>
							<c:when test="${userSeq != null}">
								<li class="float-end">
									<a class="header_a_tag" onclick="$.get('/logout.user').done(() => { location.reload() });">로그아웃</a>
								</li>
								<li class="float-end">
									<a class="header_a_tag" href="/page.userMyPage">마이페이지</a>
								</li>
							</c:when>
							<c:when test="${bsSeq != null}">
								<li class="float-end">
									<a class="header_a_tag" onclick="$.get('/logout.user').done(() => { location.reload() });">로그아웃</a>
								</li>
								<li class="float-end">
									<a class="header_a_tag" href="#">사업자페이지</a>
								</li>
							</c:when>
							<c:when test="${admin}">
								<li class="float-end">
									<a class="header_a_tag" onclick="$.get('/logout.user').done(() => { location.reload() });">로그아웃</a>
								</li>
								<li class="float-end">
									<a class="header_a_tag" href="/userslist.host">관리자페이지</a>
								</li>
							</c:when>
							<c:otherwise>
								<li class="float-end">
									<a class="header_a_tag"onclick="showLoginModal()">로그인</a>
								</li>
								<li class="float-end">
									<a class="header_a_tag" onclick="showSignupModal()">회원가입</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>

		</div>
	</header>

	<!-- 로그인 Modal -->
	<%@ include file="/user/login.jsp"%>

	<!-- 회원가입 모달 -->
	<%@ include file="/user/signup.jsp"%>