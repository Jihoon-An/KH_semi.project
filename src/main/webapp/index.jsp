<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<%@ include file="/layout/header.jsp" %>


			<!-- Site Main -->
			<main id="index">
				<section>
					<form action="/search.gym" id="form_search">

						<div class="wrap">
							<div class="mainimg bg type-b"></div>
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
									<i class="fa-solid fa-magnifying-glass" id="btn_search" onclick="$('#form_search').submit();"></i>
								</div>
							</div>
						</div>

					</form>
				</section>


				<div class="containerbox" align="center">

					<!-- Review Carousel -->
					<section class="row justify-content-center review">
						<h1 class="text_title col-12 mt-5 mb-5">베스트 리뷰</h1>

						<div class="col-12 carousel">
							<div class="prevBox">
								<i class="fa-solid fa-play prev" onclick="owl.trigger('prev.owl.carousel', [2000]);"></i>
							</div>
							<div class="owl-carousel text-center" style="width: 1000px; height: 400px">
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
								<div class="item">
								</div>
							</div>
							<div class="nextBox">
								<i class="fa-solid fa-play next" onclick="owl.trigger('next.owl.carousel', [2000]);"></i>
							</div>
						</div>

					</section>

					<!-- Banner Section -->
					<section class="row justify-content-evenly ads mb-5">
						<h1 class="text_title col-12 mt-5 mb-5">헬스용품 배너</h1>

						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>
						<div class="col-5 banner gy-5">배너</div>

					</section>
				</div>
			</main>
			<script>
				$(() => { getReviewData(); $('.owl-carousel').trigger('next.owl.carousel', [10000]); });

				// AOS 스크립트 시작
				AOS.init(); // 자바스크립트로 init()을 해야 동작한다.

				// Review DB 가져오기
				function getReviewData() {
					$.getJSON("/review.index", res => {
						console.log(res.list)
						let item_list = document.querySelectorAll(".item");
						for (i = 0; i < item_list.length / 2; i++) {
							let review = reviewBuilder(res.list[i]);
							item_list[i].innerHTML = review;
							item_list[i + 10].innerHTML = review;
						}
					});
				}

				// Review 폼 구성 함수
				function reviewBuilder(data) {
					let date = new Date(data.review.review_writer_date);
					let dateFormat = date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일 " + date.getHours() + ":" + date.getMinutes();
					let gymName = "<tr><td colspan=2 class='text_title'>" + data.gym.gym_name + "</td></tr>";
					let score = "<tr><td colspan=2>★★★★★<hr class='mt-3 mb-3'></td></tr>";
					let writer = "<tr><td style='text-align:left'><strong>" + data.review.review_writer + "</strong></td>";
					let writeDate = "<td class='text_mini' style='text-align:right'>" + dateFormat + " 작성</td></tr>";
					let likes = "<tr><td colspan=2 class='text_mini' style='text-align:right'> 추천수 : " + data.review.review_like + "</td></tr>";
					let contents = "<tr><td colspan=2>" + data.review.review_contents + "</td></tr>";
					let space = "<tr><td><br></td></tr>";
					let result = "<table style='width:100%'>" + gymName + score + writer + writeDate + likes + space + contents + "</table>";
					return result;
				}

				// Carousel 스크립트
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
			</script>

			<%@ include file="/layout/footer.jsp" %>