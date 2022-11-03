<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="/layout/header.jsp"%>

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
						<div class="col-12 gy-3 carousel">
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
					<hr class="col-12 mt-3">
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
				$(".item").on("click", (e) => {
					console.log($(".item"));
					console.log($(e.target));
					alert($(e.target).text() + "번 item")
				})

















				$("#btn_search").on("click", () => {
					$("#form_search").submit();
				})
			</script>

<%@ include file="/layout/footer.jsp"%>