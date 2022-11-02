<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>




<%@ include file="/layout/header.jsp"%>	

<!-- Site Main -->
<main id="index">
	<section>
		<div class="mainimg type-a">
			<div class="containerbox">
			
				<div class="search_main" data-aos="zoom-out" data-aos-easing="linear" data-aos-duration="1000">
					<div class="search_main_span">
						<span style="font-weight: lighter;">Your</span> <span
							style="font-weight: bold;">Needs</span> <span
							style="font-weight: lighter;">For</span> <span
							style="font-weight: bold;">Fitness</span>
					</div>
					<div class="search_main_input">
						<input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요.">
					</div>
					<div class="search_main_icon">
						<i class="fa-solid fa-magnifying-glass"></i>
					</div>
				</div>
				
				<!-- AOS 스크립트 시작 -->
		        <script> 
		            AOS.init(); // 자바스크립트로 init()을 해야 동작한다.
		        </script>
				
			</div>
		</div>
	</section>

	<div class="containerbox">
		<section>만드는 내용 넣기</section>
		<section>세션 분리 없으면 세션 굳이 안써도 됨</section>
	</div>
</main>

<%@ include file="/layout/footer.jsp"%>
