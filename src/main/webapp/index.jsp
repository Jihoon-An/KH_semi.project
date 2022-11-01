
<%@ include file="/layout/header.jsp" %>

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



/* main */
.searchbtn {
	
}

.mainimg {
	width: 100%;
	height: 950px;
	background-image: url(../webapp/resource/main.jpg);
	background-repeat: no-repeat;
	background-position: center;
}
</style>
</head>

<body>


	<!-- Site Main -->
	<main>
		<div class="containerbox">
			<!-- 위 class는 1200px, margin: auto 임. 전체 내용 감싸는 용도로 사용할 것-->

			<!-- section 은 시멘틱태그인데 복잡한거같으면 사용하지않아도 됨. 
						대신 <main><div class="containerbox"> 안에 본인 페이지 내용을 넣어주세요. -->

			<section>만드는 내용 넣기</section>
			<section>세션 분리 없으면 세션 굳이 안써도 됨</section>


		</div>
	</main>



</body>

</html>

<%@ include file="/layout/footer.jsp" %>
