<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ include file="/layout/header.jsp" %>


<script>history.scrollRestoration = "manual"</script>
<%



%>
			<!-- Site Main -->
			<main id="index">
				<section>
					<form action="/gym.search" id="form_search">

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
											name="searchInput">
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
						<p class="text-start text_title col-12 mt-5 mb-5">Best User Reviews</p>

						<div class="col-12 carousel">
							<div class="prevBox">
								<i class="fa-solid fa-angle-left angle" onclick="owl.trigger('prev.owl.carousel', [2000]);"></i>
							</div>
							<div class="owl-carousel text-center" style="width: 1050px; height: 400px">
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
								<i class="fa-solid fa-angle-right angle" onclick="owl.trigger('next.owl.carousel', [2000]);"></i>
							</div>
						</div>

					</section>

					<!-- Image Section -->
					<section class="row justify-content-evenly preview mb-5">
						<p class="text-start text_title col-12 mt-5 mb-5">Image Preview</p>

						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>
						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>
						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>
						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>
						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>
						<div class="col-4 imgBox">
							<div class="imgFilter">
								<p></p>
								<input type="hidden">
							</div>
							<img src="/resource/health.png">
						</div>

					</section>

					<!-- Banner Section -->
					<section class="row justify-content-evenly ads mb-5">
						<p class="text-start text_title col-12 mt-5 mb-5">Recommended Items</p>

						<div class="col-6 gy-5">
							<div class="banner">배너</div>
						</div>
						<div class="col-6 gy-5">
							<div class="banner">배너</div>
						</div>
						<div class="col-6 gy-5">
							<div class="banner">배너</div>
						</div>
						<div class="col-6 gy-5">
							<div class="banner">배너</div>
						</div>

					</section>
				</div>
			</main>
			<script>
				
				$(() => {
					getReviewData();
					getGymData();
					$('.owl-carousel').trigger('next.owl.carousel', [10000]);
				});

				// AOS 스크립트 시작
				AOS.init(); // 자바스크립트로 init()을 해야 동작한다.

				// Review DB 가져온 뒤 Carousel 연결 함수
				function getReviewData() {
					$.getJSON("/review.index", res => {
						let item_list = document.querySelectorAll(".item");
						for (i = 0; i < item_list.length / 2; i++) {
							let review = reviewBuilder(res.reviewList[i]);
							item_list[i].innerHTML = review;
							item_list[i + 10].innerHTML = review;
						}
					});
				}

				// Review 폼 구성 함수
				function reviewBuilder(data) {
					let star = "<img src='/resource/ratingImg/rating_" + data.review.review_star + ".png' style='width:80%'>";
					let gymName = "<div class='col-12 text_title_600 text-truncate item_title'><a href='/detail.gym?gym_seq=" + data.gym.gym_seq + "'>" + data.gym.gym_name + "</a></div>";
					let score = "<div class='col-12 gy-2 item_score' align=center>" + star + "</div>";
					let space = "<div class='col-1 gy-3'></div><hr class='col-10 gy-3'><div class='col-1 gy-3'></div>";
					let writer = "<div class='col-6 text-start text-truncate item_writer' style='padding-left:15px'><img src='/resource/duck.ico' style='display:inline-block; width:20px'>&nbsp" + data.review.review_writer + "</div>";
					let writeDate = "<div class='col-6 text_mini text-end text item_date' style='color:#808080; padding-right:15px'>" + getDateFormat(new Date(data.review.review_writer_date)).slice(0, -3) + "</div>";
					let likes = "<div class='col-6'></div><div class='col-6 text_mini text-end item_likes' style='color:#808080; padding-right:15px'>추천수 : " + data.review.review_like + "</div>";
					let contents = "<div class='col-12 gy-3 item_contents'>" + data.review.review_contents + "</div>";
					let result = "<div class='row'>" + gymName + score + space + writer + writeDate + likes + contents + "</div>";
					return result;
				}

				// Carousel 스크립트
				let owl = $('.owl-carousel');
				owl.owlCarousel({
					items: 3,
					startPosition: 3,
					margin: 50,
					loop: true,
					dots: false,
					autoplay: true,
					autoplaySpeed: 10000,
					autoplayTimeout: 10000,
					autoplayHoverPause: false
				});

				function getGymData() {
					$.getJSON("/gym.index", res => {
						let item_list = document.querySelectorAll(".imgBox");
						for (i = 0; i < res.gymList.length; i++) {
							let item = item_list[i];
							let data = res.gymList[i];
							$(item).find(".imgFilter>p").html(data.gym.gym_name + "<br>❤️&nbsp" + data.favorites.count).attr("seq", data.gym.gym_seq);
						}
					});
				}

				$(".imgBox").on("click", e => {
					location.href = "/detail.gym?gym_seq=" + e.target.getAttribute("seq");
				});
			</script>

			<%@ include file="/layout/footer.jsp" %>