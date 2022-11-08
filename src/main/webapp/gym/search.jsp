<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>
<!-- Search main -->
<main id="search">
	<div class="mapContainer">
		<div id="map" class="fuck">
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
							<i id="searchBtn" class="fa-solid fa-magnifying-glass" style="cursor: pointer;"></i>
						</div>
						<script>
							$("#keyword").on("keyup", function(e){
								if(e.keyCode == 13) {
									$("#mainForm").submit();
								};
							});
							$("#searchBtn").on("click", function(){
								$("#mainForm").submit();
							});
						</script>
				</div>
			</form>

		</div>
		<!-- 검색 리스트 네비 -->
		<div class="searchListNav">
			<form action="/gym.search" id="subForm">
				<div class="search_sub">
					<div class="search_sub_input">
						<input type="text" id="searchInput" name="searchInput" 
							placeholder="지역명 또는 헬스장명을 검색해보세요." value="${searchInput}">
					</div>
					<div class="search_sub_icon">
						<i id="searchSubBtn" class="fa-solid fa-magnifying-glass" style="cursor: pointer;"></i>
					</div>
				</div>
				<div class="search_sub_filter">
					<div class="search_tag_icon" style="margin-left: 37px;">
						<img src="/resource/filter.png" alt="">
					</div>
					<div class="search_tag" id="openTagDiv" style="margin-left: 5px;">
						<label for="filter_open" class="filter_open filter">#24시간</label>
					</div>
					<div class="search_tag" id="lockerTagDiv" style="margin-left: 5px;">
						<label for="filter_locker" class="filter_locker filter">#라커</label>
					</div>
					<div class="search_tag" id="showerTagDiv" style="margin-left: 5px;">
						<label for="filter_shower" class="filter_shower filter">#샤워실</label>
					</div>
					<div class="search_tag" id="parkTagDiv" style="margin-left: 5px;">
						<label for="filter_park" class="filter_park filter">#주차장</label>
					</div>
					<div class="tagCheckBox" style="display: none;">
						<c:if test="${filter_open eq 'true'}">
							<input type="checkbox" name="open" id="filter_open" class="filter_check" checked>
							<script>
								$("#openTagDiv").removeClass('search_tag');
								$("#openTagDiv").addClass('search_tag_check');
							</script>
						</c:if>
						<c:if test="${filter_open ne 'true'}">
							<input type="checkbox" name="open" id="filter_open" class="filter_check">
						</c:if>
						<c:if test="${filter_locker eq 'true'}">
							<input type="checkbox" name="locker" id="filter_locker" class="filter_check" checked>
							<script>
								$("#lockerTagDiv").removeClass('search_tag');
								$("#lockerTagDiv").addClass('search_tag_check');
							</script>
						</c:if>
						<c:if test="${filter_locker ne 'true'}">
							<input type="checkbox" name="locker" id="filter_locker" class="filter_check">
						</c:if>
						<c:if test="${filter_shower eq 'true'}">
							<input type="checkbox" name="shower" id="filter_shower" class="filter_check" checked>
							<script>
								$("#showerTagDiv").removeClass('search_tag');
								$("#showerTagDiv").addClass('search_tag_check');
							</script>
						</c:if>
						<c:if test="${filter_shower ne 'true'}">
							<input type="checkbox" name="shower" id="filter_shower" class="filter_check">
						</c:if>
						<c:if test="${filter_park eq 'true'}">
							<input type="checkbox" name="park" id="filter_park" class="filter_check" checked>
							<script>
								$("#parkTagDiv").removeClass('search_tag');
								$("#parkTagDiv").addClass('search_tag_check');
							</script>
						</c:if>
						<c:if test="${filter_park ne 'true'}">
							<input type="checkbox" name="park" id="filter_park" class="filter_check">
						</c:if>

						<input type="hidden" name="open_result" id="open_result" value="false">
						<input type="hidden" name="locker_result" id="locker_result" value="false">
						<input type="hidden" name="shower_result" id="shower_result" value="false">
						<input type="hidden" name="park_result" id="park_result" value="false">
					</div>
				</div>
			</form>
			
			<script>
				$("#searchInput").on("keyup", function(e){
					if(e.keyCode == 13) {
						$("#subForm").submit();
					};
				});

				$("#searchSubBtn").on("click", function(){
					$("#subForm").submit();
				});

				$(".filter_check").change(function(){
					$("#open_result").val($("#filter_open").is(":checked"));
					$("#locker_result").val($("#filter_locker").is(":checked"));
					$("#shower_result").val($("#filter_shower").is(":checked"));
					$("#park_result").val($("#filter_park").is(":checked"));

					$("#subForm").submit();
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
							<a href="/detail.gym?gym_seq=${gymList.gym_seq}">${gymList.gym_name }</a>
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
							<input type="hidden" class="gym_list_x" value="${gymList.gym_x}">
							<input type="hidden" class="gym_list_y" value="${gymList.gym_y}">
							<input type="hidden" class="gym_list_name" value="${gymList.gym_name}">
						</div>
					</div>
				</div>				
			</c:forEach>
			
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
					content: "<div class=info><img src='/resource/fitneeds.ico'>"+name+"</div>", 
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
				// 마커 클릭 시 해당 리스트로 focus
				kakao.maps.event.addListener(marker, 'click', function() {
					let target = $(".gym_list_name[value='"+ name + "']").closest(".gym_list").attr('tabindex', 0).focus();
				});
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
		$(".gym_list").on("click", e => { 
			panTo(e);
		});
		// 지도 이동 함수
		function panTo(e) {
			// 이동할 위도 경도 위치를 생성합니다 
			let x = $(e.target).closest(".gym_list").find(".gym_list_x").val();
			let y = $(e.target).closest(".gym_list").find(".gym_list_y").val();
			var moveLatLon = new kakao.maps.LatLng(x, y);
			
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);            
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