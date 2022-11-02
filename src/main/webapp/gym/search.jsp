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
                    <input type="text" placeholder="지역명 또는 헬스장명을 검색해보세요.">
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
                    <div class="search_tag" style="margin-left: 14px;">
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
                        <div class="gym_list_open">
                            <span>OPEN : AM 09:00</span><br>
                            <span>CLOSE : PM 22:30</span>
                        </div>
                        <div class="gym_list_location">
                            <span>서울특별시 서울구 서울동 123-12 3층</span>
                        </div>
                        <div class="gym_list_tagBox">
                            <div class="gym_list_tag open">#24시간</div>
                            <div class="gym_list_tag locker">#라커</div>
                            <div class="gym_list_tag shower">#샤워실</div>
                            <div class="gym_list_tag park">#주차장</div>
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
                        <div class="gym_list_open">
                            <span>24 HOURS</span><br>
                            <span>CLOSE : PM 22:30</span>
                        </div>
                        <div class="gym_list_location">
                            <span>서울특별시 서울구 서울동 123-123 지하1층</span>
                        </div>
                        <div class="gym_list_tagBox">
                            <div class="gym_list_tag open">#24시간</div>
                            <div class="gym_list_tag park">#주차장</div>
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
                        <div class="gym_list_open">
                            <span>24 HOURS</span><br>
                            <span></span>
                        </div>
                        <div class="gym_list_location">
                            <span>서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층</span>
                        </div>
                        <div class="gym_list_tagBox">
                            <div class="gym_list_tag locker">#라커</div>
                            <div class="gym_list_tag shower">#샤워실</div>
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
                        <div class="gym_list_open">
                            <span>24 HOURS</span><br>
                            <span>월요잉휴무지롱</span>
                        </div>
                        <div class="gym_list_location">
                            <span>
                            서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층
                            서울특별시 서울구 서울동 123-123 원숭이나무 빌딩 지하1층
                            </span>
                        </div>
                        <div class="gym_list_tagBox">
                            <div class="gym_list_tag locker">#라커</div>
                            <div class="gym_list_tag shower">#샤워실</div>
                            <div class="gym_list_tag park">#주차장</div>
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
                        <div class="gym_list_open">
                            <span>24 HOURS</span><br>
                            <span></span>
                        </div>
                        <div class="gym_list_location">
                            <span>
                            서울특별시 종로구 을지로입구 3번출구 나와서 직진 겁나하면
                            우리은행 옆에 빌딩들어가서 3층 들어가서 E강의장까지오면됨
                            </span>
                        </div>
                        <div class="gym_list_tagBox">
                            <div class="gym_list_tag open">#24시간</div>
                            <div class="gym_list_tag locker">#라커</div>
                            <div class="gym_list_tag shower">#샤워실</div>
                            <div class="gym_list_tag park">#주차장</div>
                            <div class="gym_list_tag">#아개졸리네;;</div>
                        </div>
                    </div>
                </div>
        </div>
        

        </div>
    </div>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
        var map = new kakao.maps.Map(mapContainer, mapOption); 
    </script>
        

</main>

</body>
</html>