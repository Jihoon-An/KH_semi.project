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
						<span style="font-weight: 100;">Your</span> <span
							style="font-weight: 700;">Needs</span> <span
							style="font-weight: 100;">For</span> <span
							style="font-weight: 700;">Fitness</span>
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
				<div class="search_sub">
					<div class="search_sub_input">
						<input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요.">
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

				<div class="gym_list">
					<div class="gym_list_logo">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
					</div>
					<div class="gym_list_article">
						<div class="gym_list_title">
							<a href="">에이블짐</a>
						</div>
						<div class="gym_list_location">
							<span>서울 중구 서소문로 124 지하2층</span>
						</div>
						<div class="gym_list_phone">
							<span>02-6250-5273</span>
						</div>
						<div class="gym_list_open">
							<span>영업중 / CLOSE PM 24:00</span>
						</div>
						<div class="gym_list_tagBox">
							<div class="gym_list_tag open btn_base">#24시간</div>
							<div class="gym_list_tag locker btn_base">#라커</div>
							<div class="gym_list_tag shower btn_base">#샤워실</div>
							<div class="gym_list_tag park btn_base">#주차장</div>
						</div>
					</div>
				</div>
				<div class="gym_list">
					<div class="gym_list_logo">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
					</div>
					<div class="gym_list_article">
						<div class="gym_list_title">
							<a href="">스포애니</a>
						</div>
						<div class="gym_list_location">
							<span>서울특별시 서울구 서울동 123-123 지하1층</span>
						</div>
						<div class="gym_list_phone">
							<span>02-353-1234</span>
						</div>
						<div class="gym_list_open">
							<span>영업종료 / CLOSE PM 21:00</span>
						</div>
						<div class="gym_list_tagBox">
							<div class="gym_list_tag open btn_base">#24시간</div>
							<div class="gym_list_tag park btn_base">#주차장</div>
						</div>
					</div>
				</div>
				<div class="gym_list">
					<div class="gym_list_logo">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
					</div>
					<div class="gym_list_article">
						<div class="gym_list_title">
							<a href="">원숭이나무에올라가짐</a>
						</div>
						<div class="gym_list_location">
							<span>서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층</span>
						</div>
						<div class="gym_list_phone">
							<span>02-353-1234</span>
						</div>
						<div class="gym_list_open">
							<span>영업중 / CLOSE PM 23:00</span>
						</div>
						<div class="gym_list_tagBox">
							<div class="gym_list_tag locker btn_base">#라커</div>
							<div class="gym_list_tag shower btn_base">#샤워실</div>
						</div>
					</div>
				</div>
				<div class="gym_list">
					<div class="gym_list_logo">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
					</div>
					<div class="gym_list_article">
						<div class="gym_list_title">
							<a href="">원숭이나무에올라가짐살라짐</a>
						</div>
						<div class="gym_list_location">
							<span> 서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층 서울특별시 서울구 서울동
								123-123 원숭이나무 빌딩 지하1층 </span>
						</div>
						<div class="gym_list_phone">
							<span>02-353-1234</span>
						</div>
						<div class="gym_list_open">
							<span>24 HOURS</span>
						</div>
						<div class="gym_list_tagBox">
							<div class="gym_list_tag locker btn_base">#라커</div>
							<div class="gym_list_tag shower btn_base">#샤워실</div>
							<div class="gym_list_tag park btn_base">#주차장</div>
						</div>
					</div>
				</div>
				<div class="gym_list">
					<div class="gym_list_logo">
						<img
							src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
					</div>
					<div class="gym_list_article">
						<div class="gym_list_title">
							<a href="">바디와이짐&라필라테스 용현동헬스</a>
						</div>
						<div class="gym_list_location">
							<span> 서울특별시 종로구 을지로입구 3번출구 나와서 직진 겁나하면 우리은행 옆에 빌딩들어가서 3층
								들어가서 E강의장까지오면됨 </span>
						</div>
						<div class="gym_list_phone">
							<span>02-353-1234</span>
						</div>
						<div class="gym_list_open">
							<span>영업중 / CLOSE PM 24:00</span><br> <span></span>
						</div>
						<div class="gym_list_tagBox">
							<div class="gym_list_tag open btn_base">#24시간</div>
							<div class="gym_list_tag locker btn_base">#라커</div>
							<div class="gym_list_tag shower btn_base">#샤워실</div>
							<div class="gym_list_tag park btn_base">#주차장</div>
						</div>
					</div>
				</div>
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
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();  
	
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
		// 키워드로 장소를 검색합니다
		searchPlaces();
	
		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
	
		    var keyword = document.getElementById('keyword').value;
	
		    if (!keyword.replace(/^\s+|\s+$/g, '')) {
		        alert('키워드를 입력해주세요!');
		        return false;
		    }
	
		    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		    ps.keywordSearch( keyword, placesSearchCB); 
		}
	
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {
	
		        // 정상적으로 검색이 완료됐으면
		        // 검색 목록과 마커를 표출합니다
		        displayPlaces(data);
	
		        // 페이지 번호를 표출합니다
		        displayPagination(pagination);
	
		    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
		        alert('검색 결과가 존재하지 않습니다.');
		        return;
	
		    } else if (status === kakao.maps.services.Status.ERROR) {
	
		        alert('검색 결과 중 오류가 발생했습니다.');
		        return;
	
		    }
		}
	
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
	
		    var listEl = document.getElementById('placesList'), 
		    menuEl = document.getElementById('menu_wrap'),
		    fragment = document.createDocumentFragment(), 
		    bounds = new kakao.maps.LatLngBounds(), 
		    listStr = '';
		    
		    // 검색 결과 목록에 추가된 항목들을 제거합니다
		    removeAllChildNods(listEl);
	
		    // 지도에 표시되고 있는 마커를 제거합니다
		    removeMarker();
		    
		    for ( var i=0; i<places.length; i++ ) {
	
		        // 마커를 생성하고 지도에 표시합니다
		        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
		            marker = addMarker(placePosition, i), 
		            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        bounds.extend(placePosition);
	
		        // 마커와 검색결과 항목에 mouseover 했을때
		        // 해당 장소에 인포윈도우에 장소명을 표시합니다
		        // mouseout 했을 때는 인포윈도우를 닫습니다
		        (function(marker, title) {
		            kakao.maps.event.addListener(marker, 'mouseover', function() {
		                displayInfowindow(marker, title);
		            });
	
		            kakao.maps.event.addListener(marker, 'mouseout', function() {
		                infowindow.close();
		            });
	
		            itemEl.onmouseover =  function () {
		                displayInfowindow(marker, title);
		            };
	
		            itemEl.onmouseout =  function () {
		                infowindow.close();
		            };
		        })(marker, places[i].place_name);
	
		        fragment.appendChild(itemEl);
		    }
	
		    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
		    listEl.appendChild(fragment);
		    menuEl.scrollTop = 0;
	
		    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		    map.setBounds(bounds);
		}
	
		// 검색결과 항목을 Element로 반환하는 함수입니다
		function getListItem(index, places) {
	
		    var el = document.createElement('li'),
		    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
		                '<div class="info">' +
		                '   <h5>' + places.place_name + '</h5>';
	
		    if (places.road_address_name) {
		        itemStr += '    <span>' + places.road_address_name + '</span>' +
		                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
		    } else {
		        itemStr += '    <span>' +  places.address_name  + '</span>'; 
		    }
		                 
		      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
		                '</div>';           
	
		    el.innerHTML = itemStr;
		    el.className = 'item';
	
		    return el;
		}
	
		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
		    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
		        imgOptions =  {
		            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
		            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
		            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
		        },
		        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
		            marker = new kakao.maps.Marker({
		            position: position, // 마커의 위치
		            image: markerImage 
		        });
	
		    marker.setMap(map); // 지도 위에 마커를 표출합니다
		    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
		    return marker;
		}
	
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
		    for ( var i = 0; i < markers.length; i++ ) {
		        markers[i].setMap(null);
		    }   
		    markers = [];
		}
	
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
		    var paginationEl = document.getElementById('pagination'),
		        fragment = document.createDocumentFragment(),
		        i; 
	
		    // 기존에 추가된 페이지번호를 삭제합니다
		    while (paginationEl.hasChildNodes()) {
		        paginationEl.removeChild (paginationEl.lastChild);
		    }
	
		    for (i=1; i<=pagination.last; i++) {
		        var el = document.createElement('a');
		        el.href = "#";
		        el.innerHTML = i;
	
		        if (i===pagination.current) {
		            el.className = 'on';
		        } else {
		            el.onclick = (function(i) {
		                return function() {
		                    pagination.gotoPage(i);
		                }
		            })(i);
		        }
	
		        fragment.appendChild(el);
		    }
		    paginationEl.appendChild(fragment);
		}
	
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
		    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
		    infowindow.setContent(content);
		    infowindow.open(map, marker);
		}
	
		 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {   
		    while (el.hasChildNodes()) {
		        el.removeChild (el.lastChild);
		    }
		}
	</script>


</main>

</body>
</html>