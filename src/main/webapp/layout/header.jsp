
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>피트니즈 - Fitneeds</title>
<link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
	crossorigin="anonymous">

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="/resource/base.css" type="text/css">

<style>

#header {
	width: 100%;
	height: 85px;
	background: #001A41;
	opacity: 0.97;
	position: fixed;
	top: 0px;
	left: 0px;
	overflow: hidden;
}

#header_logo {
	font-family: 'Inter', sans-serif;
	font-weight: Extra Bold;
	font-style: italic;
	color: #FFFFFF;
	font-size: 40px;
	line-height: 85px;
	display: inline;
	margin-right: 80px;
}

nav {
	display: inline;
}

#nav_text>ul {
	list-style: none;
	padding: 0;
	display: inline;
}

#nav_text {
	width: 100px;
	height: 100px;
	color: #FFFFFF;
	font-size: 18px;
	line-height: 85px;
}

#nav_menu {
	margin: 0;
}

#nav_menu>li {
	margin-right: 50px;
}

#nav_person {
	margin: 0;
	position: relative;
	left: 300px;
}

#nav_person>li {
	margin-left: 50px;
}

a {
	text-decoration: none;
	color: #FFFFFF;
}

a:hover {
	color: #FFFFFF;
}

#nav_text>ul>li>a:hover {
	color: #FFFFFF;
	font-weight: 500;
}
</style>

</head>

<body>

	<!-- Site header -->
	<header id="header">
		<div class="containerbox">

			<div class="float-start">
				<h1 id="header_logo">
					<a href="#">Fitneeds</a>
				</h1>
			</div>

			<div class="float-start">
				<nav id="nav_text">
					<ul id="nav_menu">
						<li class="float-start"><a href="#">헬스장검색</a></li>
						<li class="float-start"><a href="#">실시간리뷰</a></li>
						<li class="float-start"><a href="#">운동기록</a></li>
					</ul>
					<ul id="nav_person">
						<li class="float-end"><a href="#">로그아웃</a></li>
						<li class="float-end"><a href="#">회원가입</a></li>
					</ul>
				</nav>
			</div>

		</div>
	</header>

</body>

</html>