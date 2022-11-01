
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp" %>



 <main id="gym-detail">
            <div class="containerbox">
                <div class="lcontents"> 
                    <div class="placebox1">
                        <div class="placename">시설명   </div>
                        <div class="icon1"> 
                               <i class="fa-solid fa-heart"></i>
                            <i class="fa-sharp fa-solid fa-share-nodes"></i>
                        </div>
                        <div class="place"><dt>위치 : </dt>
                        <dd>위치내용</dd></div>
                        <div class="place"><dt>연락처 : </dt>
                        <dd>010</dd>
                 
                        </div>
                        <div class="placemap" id="map"></div>
                            <script>
                                var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                    mapOption = {
                                        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                                        level: 3 // 지도의 확대 레벨
                                    };

                                // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                                var map = new kakao.maps.Map(mapContainer, mapOption); 
                            </script>
                        <div class="machine_info">기구정보</div>
                        <div class="placeprice">가격정보</div>
                    </div>

                    <div class="reviewbox">
                        <div class="reviewn">리뷰 
                        </div>
                        <div class="reviewr"><button type="button" class="btn_base">리뷰작성</button></div>
                        <div class ="review2">
                            <div class="authmark">인증마크</div> 
                            <div class="ranwriter">writer</div>
                            <div class="writerd">writer_date</div>
                            <div class="starc">star</div>
                            <div class="recontents">contents</div>
                        </div>
                    </div>
                </div>
                <div class="rcontents">
                    <div class="chart1">
                        <canvas id="myChart"></canvas>
                    </div>
                    <div class="infotag"> 
                        <div class="infotag2">운영시간</div>
                        <div class="infotag2">휴무일</div>
                        <div class="infotag2">시설정보1</div>
                        <div class="infotag2">시설정보2</div>
                    </div>
                    <div class="infopicture"> 사진</div>
                </div>
            </div>


            

            <script>
                const data = {
                    labels: [
                        '친절도',
                        '청결',
                        '시설',
                        '기구',
                        '편리'
                    ],
                    datasets: [{
                        label: 'My Second Dataset',
                        data: [50, 30, 55, 50, 50],
                        fill: true,
                        backgroundColor: 'rgba(54, 162, 235, 0.2)',
                        borderColor: 'rgb(54, 162, 235)',
                        pointBackgroundColor: 'rgb(54, 162, 235)',
                        pointBorderColor: '#fff',
                        pointHoverBackgroundColor: '#fff',
                        pointHoverBorderColor: 'rgb(54, 162, 235)'
                    }]
                };

                const config = {
                    type: 'radar',
                    data: data,
                    options: {
                        elements: {
                            line: {
                                borderWidth: 3
                            }
                        }
                    },
                };
            </script>


<script>
    const myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
</script>
</main>

<%@ include file="/layout/footer.jsp" %>