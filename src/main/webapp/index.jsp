<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="/layout/header.jsp" %>

			<!-- Site Main -->
			<main id="index">
				<section>
					<form action="/search.gym" id="form_search">
						<div class="mainimg zoom-a type-a mb-5">
							<div class="containerbox">
								<div class="search_main" data-aos="zoom-out" data-aos-easing="linear"
									data-aos-duration="1000">
									<div class="search_main_span">
										<span style="font-weight: lighter;">Your</span> <span
											style="font-weight: bold;">Needs</span> <span
											style="font-weight: lighter;">For</span> <span
											style="font-weight: bold;">Fitness</span>
									</div>
									<div class="search_main_input">
										<input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요." style="padding-left: 20px"
											name="keyword">
									</div>
									<i class="fa-solid fa-magnifying-glass" id="btn_search"></i>
								</div>
							</div>
						</div>
					</form>
				</section>


				<div class="containerbox" align="center">
					<section class="row justify-content-center review">
						<div class="text_title col-12 mt-5 mb-5">베스트 리뷰</div>
						<hr>
						<div class="col-12 carousel">
							<div class="prevBox">
								<i class="fa-solid fa-play prev"></i>
							</div>
							<div class="owl-carousel text-center" style="width: 1000px; height: 400px">
								<div class="item">
									<h4>리뷰1</h4>
								</div>
								<div class="item">
									<h4>리뷰2</h4>
								</div>
								<div class="item">
									<h4>리뷰3</h4>
								</div>
								<div class="item">
									<h4>리뷰4</h4>
								</div>
								<div class="item">
									<h4>리뷰5</h4>
								</div>
								<div class="item">
									<h4>리뷰6</h4>
								</div>
								<div class="item">
									<h4>리뷰7</h4>
								</div>
								<div class="item">
									<h4>리뷰8</h4>
								</div>
								<div class="item">
									<h4>리뷰9</h4>
								</div>
								<div class="item">
									<h4>리뷰10</h4>
								</div>
							</div>
							<div class="nextBox">
								<i class="fa-solid fa-play next"></i>
							</div>
						</div>
						<hr>
					</section>
					<section class="row justify-content-evenly ads mb-5">
						<div class="text_title col-12 mt-5 mb-5">헬스용품 배너</div>
						<hr>
						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>
						<hr class="mt-5">
					</section>
				</div>
			</main>
			<script>
				// AOS 스크립트 시작
				AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
				$(() => { $('.owl-carousel').trigger('next.owl.carousel', [10000]) });
				let owl = $('.owl-carousel');
				owl.owlCarousel({
					items: 3,
					startPosition: 9,
					margin: 50,
					loop: true,
					dots: false,
					autoplay: true,
					autoplaySpeed: 10000,
					autoplayTimeout: 10000,
					autoplayHoverPause: false
				});
				$(".prev").on("click", () => {
					owl.trigger('prev.owl.carousel', [2000]);
				});
				$(".next").on("click", () => {
					owl.trigger('next.owl.carousel', [2000]);
				});
				$(".item").on("click", (e) => {
					console.log($(".item"));
					// item Index 얻기
					console.log(e.target.innerText);
				});
				$("#btn_search").on("click", () => {
					$("#form_search").submit();
				});
			</script>

			<%@ include file="/layout/footer.jsp" %>