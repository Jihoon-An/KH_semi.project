<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>	
<!-- Search main -->
<main id="search">
    <div class="container">
        <div id="map">
            <!-- 메인 검색창 -->
            <div class="search_main">
                <div class="search_main_span">
                    <span style="font-weight:100;">Your</span>
                    <span style="font-weight:700;">Needs</span>
                    <span style="font-weight:100;">For</span>
                    <span style="font-weight:700;">Fitness</span>
                </div>
                <div class="search_main_input">
                    <input type="text" id="gymSearch" placeholder="지역명 또는 헬스장명을 검색해보세요.">
                </div>
                <div class="search_main_icon">
                    <i class="fa-solid fa-magnifying-glass"></i>
                </div>
            </div>
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
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
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
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
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
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
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
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
                    </div>
                    <div class="gym_list_article">
                        <div class="gym_list_title">
                            <a href="">원숭이나무에올라가짐살라짐</a>
                        </div>
                        <div class="gym_list_location">
                            <span>
                            서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층
                            서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층
                            </span>
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
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSk-2OF05AQfP8ncj64XfrCoQ3TNBJ-r0xjzQ&usqp=CAU">
                    </div>
                    <div class="gym_list_article">
                        <div class="gym_list_title">
                            <a href="">바디와이짐&라필라테스 용현동헬스</a>
                        </div>
                        <div class="gym_list_location">
                            <span>
                            서울특별시 종로구 을지로입구 3번출구 나와서 직진 겁나하면
                            우리은행 옆에 빌딩들어가서 3층 들어가서 E강의장까지오면됨
                            </span>
                        </div>
                        <div class="gym_list_phone">
                            <span>02-353-1234</span>
                        </div>
                        <div class="gym_list_open">
                            <span>영업중 / CLOSE PM 24:00</span><br>
                            <span></span>
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
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(37.56793539931502, 126.98309190765903), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };
	
        ////////////////지도
        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
     	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
        var mapTypeControl = new kakao.maps.MapTypeControl();

        // 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
        var zoomControl = new kakao.maps.ZoomControl();
        map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMLEFT);
        // 지도에 컨트롤을 추가해야 지도위에 표시됩니다
        // kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
        map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMLEFT);

        
        /////////////검색
        // 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(); 
        
        var gymSearch = document.getElementById('gymSearch');
        
		// 키워드로 장소를 검색합니다
		$("#gymSearch").on("keyup", function (e) {
            if (e.keyCode == 13) {
				consol.log($(this).val());
				ps.keywordSearch($(this).val(), placesSearchCB); 
             };
          });

		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
		function placesSearchCB (data, status, pagination) {
		    if (status === kakao.maps.services.Status.OK) {

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		        // LatLngBounds 객체에 좌표를 추가합니다
		        var bounds = new kakao.maps.LatLngBounds();

		        for (var i=0; i<data.length; i++) {
		            displayMarker(data[i]);    
		            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
		        }       

		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		        map.setBounds(bounds);
		    } 
		}


        /////////////마커
        var imageSrc = '/resource/ping.png', // 마커이미지의 주소입니다    
            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
              
        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
            markerPosition = new kakao.maps.LatLng(37.56793539931502, 126.98309190765903); // 마커가 표시될 위치입니다

        // 마커를 생성합니다
        var marker = new kakao.maps.Marker({
            position: markerPosition, 
            image: markerImage, // 마커이미지 설정
            clickable: true
        });

        // 마커가 지도 위에 표시되도록 설정합니다
        marker.setMap(map);  
    </script>
        

</main>

</body>
</html>