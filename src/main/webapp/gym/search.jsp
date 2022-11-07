<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>
<!-- Search main -->
<main id="search">
	<div class="container">
		<div id="map">
			<!-- 메인 검색창 -->
			<form onsubmit="searchPlaces(); return false;" id="mainForm">
				<div class="search_main">
					<div class="search_main_span">
						<span style="font-weight: 100;">Your</span> 
						<span style="font-weight: 700;">Needs</span>
						<span style="font-weight: 100;">For</span> 
						<span style="font-weight: 700;">Fitness</span>
					</div>
						<div class="search_main_input">
							<input type="text" id="keyword"
								placeholder="지역명 또는 헬스장명을 검색해보세요.">
						</div>
						<div class="search_main_icon">
							<i id="searchBtn" class="fa-solid fa-magnifying-glass"></i>
						</div>
						<script>
							$("#keyword").on("keyup", function(e){
								if(e.keyCode == 13) {
									$("#mainForm").submit();
								};
							});
						</script>
				</div>
			</form>
			<!-- 검색 리스트 네비 -->
			<div class="searchListNav">
				<form action="/gym.search" id="subForm">
					<div class="search_sub">
						<div class="search_sub_input">
							<input type="text" id="searchInput" name="searchInput" 
								placeholder="지역명 또는 헬스장명을 검색해보세요.">
						</div>
						<div class="search_sub_icon">
							<i class="fa-solid fa-magnifying-glass"></i>
						</div>
					</div>
					<div class="search_sub_filter">
						<div class="search_tag_icon" style="margin-left: 37px;">
							<img src="/resource/filter.png" alt="">
						</div>
						<div class="search_tag" style="margin-left: 5px;">
							<label for="" class="filter_open filter">#24시간</label>
						</div>
						<div class="search_tag" style="margin-left: 5px;">
							<label for="" class="filter_locker filter">#라커</label>
						</div>
						<div class="search_tag" style="margin-left: 5px;">
							<label for="" class="filter_shower filter">#샤워실</label>
						</div>
						<div class="search_tag" style="margin-left: 5px;">
							<label for="" class="filter_park filter">#주차장</label>
						</div>
					</div>
				</form>
				
				<script>
					$("#searchInput").on("keyup", function(e){
						if(e.keyCode == 13) {
							$("#subForm").submit();
						};
					});
				</script>


				<c:forEach var="gymList" items="${gymList}">
					<div class="gym_list">
						<div class="gym_list_logo">
							<img
								src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
						</div>
						<div class="gym_list_article">
							<div class="gym_list_title">
								<a href="/detail.gym?gym_seq=${gymList}">${gymList.gym_name }</a>
							</div>
							<div class="gym_list_location">
								<span>${gymList.gym_location }</span>
							</div>
							<div class="gym_list_phone">
								<span>${gymList.gym_phone }</span>
							</div>
							<div class="gym_list_open">
								<span>${gymList.gym_open } / ${gymList.gym_close }</span>
							</div>
							<div class="gym_list_tagBox">
								<div class="gym_list_tag open btn_base">#24시간</div>
								<div class="gym_list_tag locker btn_base">#라커</div>
								<div class="gym_list_tag shower btn_base">#샤워실</div>
								<div class="gym_list_tag park btn_base">#주차장</div>
							</div>
						</div>
					</div>				
				</c:forEach>
				
			</div>

		</div>
	</div>
	<script>
		var markers = [];
	
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(37.56793539931502, 126.98309190765903), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
	
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();
        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMLEFT);
        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMLEFT);
        
		

  
		
		function createMarker(name, x, y){
			var positions =
				{
					content: "<div class=info><img src='/resource/duck.ico'>"+name+"</div>", 
					latlng: new kakao.maps.LatLng(x, y)
				}
			
			// 마커 이미지의 이미지 주소입니다
			var imageSrc = "/resource/ping.png"; 
				
				
				// 마커 이미지의 이미지 크기 입니다
				var imageSize = new kakao.maps.Size(64, 69);
				
				// 마커 이미지를 생성합니다    
				var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
				
				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					map: map, // 마커를 표시할 지도
					position: positions.latlng, // 마커를 표시할 위치
					image : markerImage // 마커 이미지 
				});

				// 마커에 표시할 인포윈도우를 생성합니다 
				var infowindow = new kakao.maps.InfoWindow({
					content: positions.content // 인포윈도우에 표시할 내용
				});

				// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				// 이벤트 리스너로는 클로저를 만들어 등록합니다 
				// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
		};

		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
			return function() {
				infowindow.open(map, marker);
			};
		}

		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
			return function() {
				infowindow.close();
			};
		}

	</script>
	<c:forEach var="gymList" items="${gymList}">
		<script>
			createMarker("${gymList.gym_name}","${gymList.gym_x}","${gymList.gym_y}");
		</script>
	</c:forEach>

</main>

</body>
</html>