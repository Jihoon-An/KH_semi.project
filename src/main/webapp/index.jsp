<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<head>
			<meta charset="UTF-8">
			<title>피트니즈 - Fitneeds</title>
			<link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">

			<!-- Jquery -->
			<script src="https://code.jquery.com/jquery-3.6.1.min.js"
				integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

			<!-- google font -->
			<link href="https://fonts.googleapis.com/css2?family=Inter:wght@800&display=swap" rel="stylesheet">

			<!-- bootstrap - icon -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

			<!-- bootstrap - css -->
			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
				crossorigin="anonymous"></script>

			<!-- fontawesome - icon -->
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
			<link rel="stylesheet" href="/css/gym-detail.css" type="text/css">
			<link rel="stylesheet" href="/css/users-mypage.css" type="text/css">
		</head>

		<%@ include file="/layout/header.jsp" %>

			<!-- Site Main -->
			<main id="index">
				<section>
					<div class="mainimg">
						<div class="containerbox">
							<form action="/search.gym" id="form_search">
							<div class="search_main" data-aos="zoom-out" data-aos-easing="linear" data-aos-duration="1000">
								<div class="search_main_span">
									<span style="font-weight: lighter;">Your</span> <span
										style="font-weight: bold;">Needs</span> <span
										style="font-weight: lighter;">For</span> <span
										style="font-weight: bold;">Fitness</span>
								</div>
									<div class="search_main_input" name="keyword">
										<input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요." style="padding-left:20px">
									</div>
									<div class="search_main_icon" id="btn_search">
										<i class="fa-solid fa-magnifying-glass"></i>
									</div>
								</form>
							</div>
						</div>
				</section>
				<div class="containerbox" align="center">
					<section class="row justify-content-center review">
						<div class="text_title col-12 gy-5">베스트 리뷰</div>
						<div class="col-12 gy-4 carousel">
							<div class="prevBox">
								<i class="fa-solid fa-angles-left prev"></i>
							</div>
							<div class="owl-carousel text-center gy-3" style="width:1000px; height:320px">
								<div class="item">
									<h4>1</h4>
								</div>
								<div class="item">
									<h4>2</h4>
								</div>
								<div class="item">
									<h4>3</h4>
								</div>
								<div class="item">
									<h4>4</h4>
								</div>
								<div class="item">
									<h4>5</h4>
								</div>
								<div class="item">
									<h4>6</h4>
								</div>
								<div class="item">
									<h4>7</h4>
								</div>
								<div class="item">
									<h4>8</h4>
								</div>
								<div class="item">
									<h4>9</h4>
								</div>
								<div class="item">
									<h4>10</h4>
								</div>
							</div>
							<div class="nextBox"><i class="fa-solid fa-angles-right next"></i></div>
						</div>
					</section>
					<hr class="col-12 mt-4">
					<section class="row justify-content-evenly ads">
						<div class="text_title col-12 gy-3">헬스용품 배너</div>
						<div class="col-5 banner gy-4">배너</div>
						<div class="col-5 banner gy-4">배너</div>
						<div class="col-5 banner gy-4">배너</div>
						<div class="col-5 banner gy-4">배너</div>
					</section>
				</div>
			</main>
			<script>
				$(() => { $('.owl-carousel').trigger('next.owl.carousel', [10000]) });
				let owl = $('.owl-carousel');
				owl.owlCarousel({
					items: 3,
					startPosition: 9,
					margin: 50,
					loop: true,
					autoplay: true,
					autoplaySpeed: 10000,
					autoplayTimeout: 10000,
					autoplayHoverPause: true
				});
				$(".prev").on("click", () => {
					owl.trigger('prev.owl.carousel', [2000]);
				})
				$(".next").on("click", () => {
					owl.trigger('next.owl.carousel', [2000]);
				})
				$("#btn_search").on("click", () => {
					$("#form_search").submit();
				})
				// AOS 스크립트 시작
		        AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
			</script>

			<%@ include file="/layout/footer.jsp" %>