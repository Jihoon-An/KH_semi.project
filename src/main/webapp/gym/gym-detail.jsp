<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/layout/header.jsp" %>


<main id="gym-detail">

    <div style="height: 70px;"></div>
    <div class="containerbox" style="overflow: hidden">
        <div class="lcontents">
            <div class="placebox1">
                <div>
                    <div class="placename" style="margin-bottom: 30px">
                        <h1>${gymList.gym_name}</h1>
                    </div>

                    <c:if test="${bsSeq !=null }">
                        <div class="bs_modify">
                            <button type="button" class="btn btn-outline-secondary">수정하기</button>
                        </div>
                    </c:if>
                    <!-- 사업자 회원 로그인시 수정하기 버튼 jstl 추후 추가 예정 -->

                    <div class="icon1" style="margin-top: 5px">
                        <c:if test="${userSeq !=null}">
                            <!-- list사용자 로그인만 보이게끔 -->
                            <i class="fa-solid fa-heart" check="${favresult }" id="heart"></i>
                        </c:if>

                        <span class="button gray medium" style="margin-left: 5px">
                            <a onclick="clip(); return false;" class="shareicon"> <i
                                    class="fa-sharp fa-solid fa-share-nodes" title="클릭시 URL 복사"
                                    style="cursor: pointer;" aria-hidden="true"></i></a></span>
                    </div>
                </div>

                <div class="place shadow-none p-3 rounded text_title">
                    <dt><p class="text_title_600">위치</p></dt>
                    <dd>${gymList.gym_location}</dd>
                </div>

                <div class="place shadow-none p-3 rounded text_title" style="margin-bottom: 10px">
                    <dt><p class="text_title_600">연락처</p></dt>
                    <dd>${gymList.gym_phone}</dd>
                </div>

                <div class="placemap mt-3" id="map"></div>

                <script>
                    let gym_x = "${gymList.gym_x}";
                    let gym_y = "${gymList.gym_y}";

                    var mapContainer = document.getElementById("map"), // 지도를 표시할 div
                        mapOption = {
                            center: new kakao.maps.LatLng(gym_x, gym_y), // 지도의 중심좌표
                            level: 3, // 지도의 확대 레벨
                        };

                    // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    function createMarker(name, x, y) {
                        var positions =
                            {
                                content: "<div class=info><img src='/resource/fitneeds.ico'>" + name + "</div>",
                                latlng: new kakao.maps.LatLng(x, y)
                            }

                        // 마커 이미지의 이미지 주소입니다
                        var imageSrc = "/resource/img/ping.png";

                        // 마커 이미지의 이미지 크기 입니다
                        var imageSize = new kakao.maps.Size(64, 69);

                        // 마커 이미지를 생성합니다
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            map: map, // 마커를 표시할 지도
                            position: positions.latlng, // 마커를 표시할 위치
                            image: markerImage // 마커 이미지
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
                        return function () {
                            infowindow.open(map, marker);
                        };
                    }

                    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
                    function makeOutListener(infowindow) {
                        return function () {
                            infowindow.close();
                        };
                    }

                    createMarker("${gymList.gym_name}", "${gymList.gym_x}", "${gymList.gym_y}");
                </script>


                <div class="placeprice shadow-none p-1 p-3 rounded bg-light text_title">
                    <dt><p class="text_title_600">이용료</p></dt>
                    <dd>${gymList.gym_price }</dd>
                </div>

            </div>

            <div class="reviewbox" style="margin-top: 80px">
                <div class="reviewn">
                    <h2 style="line-height: 50px">리뷰보기</h2>
                </div>

                <div class="reviewr" style="position: relative; top:-10px; right: -40px; margin-bottom: 30px">
                    <button type="button" class="btn_base" id="reviewbtn" type="button">리뷰작성</button>
                </div>


                <c:choose>
                    <c:when test="${not empty reviewList }">
                        <!-- 리스트가 비어있지않다면 -->
                        <c:forEach var="r" items="${reviewList }">
                            <div class="review2">

                                <div class="recontents shadow p-2 mb-5 bg-body rounded text_normal">


                                    <div class="ranwriter text_title" style="margin-bottom: 10px">
                                        <c:if test="${r.review.review_photo == '인증완료'}">
                                            <img src="/resource/img/medal.png" style="width: 40px; height: 40px">
                                            <span class="text_mini"
                                                  style="border: 1px solid #999999; padding: 3px; border-radius: 6px">인증리뷰어</span>
                                        </c:if>
                                        <span style="margin-left: 30px"
                                              class="text_title_600">${r.review.review_writer}</span></div>
                                    <div class="writerd" style="line-height: 35px">${r.review.formDate}</div>
                                    <div class="starc">
                                        <c:if test="${r.review.review_star == 1}">
                                            <span class="filledStar">★</span><span class="emptyStar">★★★★</span>
                                        </c:if>
                                        <c:if test="${r.review.review_star == 2}">
                                            <span class="filledStar">★★</span><span class="emptyStar">★★★</span>
                                        </c:if>
                                        <c:if test="${r.review.review_star == 3}">
                                            <span class="filledStar">★★★</span><span class="emptyStar">★★</span>
                                        </c:if>
                                        <c:if test="${r.review.review_star == 4}">
                                            <span class="filledStar">★★★★</span><span class="emptyStar">★</span>
                                        </c:if>
                                        <c:if test="${r.review.review_star == 5}">
                                            <span class="filledStar">★★★★★</span>
                                        </c:if>
                                    </div>


                                    <div class="reviewlike" style="line-height: 35px; position: relative; left: 35px">
                                        <input type="hidden" name="review_seq" class="rseq"
                                               value="${r.review.review_seq}"> <input type="hidden"
                                                                                      name="gym_seq" class="gym"
                                                                                      value="${r.review.gym_seq}">
                                        <input type="hidden" name="review_like" class="rlike"
                                               value="${r.review.review_like}">

                                        <c:if test="${r.liked == null}">
                                            <i class="relike fa-solid fa-thumbs-up"
                                               style="color:#8f959a;"></i> <!-- 선택안했을 때 -->
                                        </c:if>

                                        <c:if test="${r.liked != null}">
                                            <i class="relike fa-solid fa-thumbs-up"
                                               style="color:#001A41;"></i> <!-- 선택했을 때 색상 찐한블루 -->
                                        </c:if>

                                        <span class="reviewcnt" id="recnt"> ${r.review.review_like}</span>
                                    </div>

                                    <div class="reviewcon p-3">
                                            ${r.review.review_contents}
                                    </div>


                                    <div class="d-flex align-content-start flex-wrap" style="margin:40px 0px 10px 0px">
                                        <c:if test="${r.review.review_check1 == 'Y'}">
                                            <div class="detail_fillter p-2 m-1"><img
                                                    src="/resource/img/review_check1_icon.png"
                                                    class="checkIcon"> 자세를 꼼꼼히 봐주세요
                                            </div>
                                        </c:if>
                                        <c:if test="${r.review.review_check2 == 'Y'}">
                                            <div class="detail_fillter p-2 m-1"><img
                                                    src="/resource/img/review_check2_icon.png"
                                                    class="checkIcon"> 상담이 자세해요
                                            </div>
                                        </c:if>
                                        <c:if test="${r.review.review_check3 == 'Y'}">
                                            <div class="detail_fillter p-2 m-1"><img
                                                    src="/resource/img/review_check3_icon.png"
                                                    class="checkIcon"> 공간이 넓어요
                                            </div>
                                        </c:if>
                                        <c:if test="${r.review.review_check4 == 'Y'}">
                                            <div class="detail_fillter p-2 m-1"><img
                                                    src="/resource/img/review_check4_icon.png"
                                                    class="checkIcon"> 기구가 다양해요
                                            </div>
                                        </c:if>
                                        <c:if test="${r.review.review_check5 == 'Y'}">
                                            <div class="detail_fillter p-2 m-1"><img
                                                    src="/resource/img/review_check5_icon.png"
                                                    class="checkIcon"> 시설이 깔끔해요
                                            </div>
                                        </c:if>
                                    </div>


                                </div>
                            </div>
                        </c:forEach>
                        <c:if test="${reviewList !=null}">
                            <div class="newmore">
                                <a href="#" class="btn btn_outline" data-bs-toggle="button"
                                   id="load">리뷰 더보기</a>
                            </div>
                        </c:if>
                    </c:when>
                    <c:otherwise>
                        <div class="other" style="margin-bottom: 100px">작성된 리뷰가 없습니다</div>
                    </c:otherwise>
                </c:choose>


            </div>
        </div>


        <div class="rcontents">
            <c:choose>

                <c:when test="${gymAvg.gymAvg != null &&  gymAvg.gymAvg != '' }">

                    <div class="gymscore text_normal" id="gscore" style="line-height: 60px;">
                        <img src="/resource/img/images.png" style="width: 30px; height: 30px; margin-right: 10px">
                        <span style="position: relative; top:5px; color: #f29c2b; font-size: 28px; font-weight: 600;"> ${gymAvg.gymAvg }점</span>
                    </div>


                </c:when>
                <c:otherwise>
                    <div class="gymscore" id="gscore">등록된 평점이 없습니다</div>
                </c:otherwise>
            </c:choose>

            <div class="chart1">
                <canvas id="myChart"></canvas>
            </div>
            <div class="gym_info_open text_title">
                <div class="place shadow-none p-3 rounded text_title">
                    <dt class="dt"><i class="fa-regular fa-square-check" style="margin-right: 10px"></i> Open Time </dt>
                    <dd>${gymList.gym_open}</dd>
                </div>

                <div class="place shadow-none p-3 rounded text_title">
                    <dt class="dt"><i class="fa-regular fa-rectangle-xmark" style="margin-right: 10px"></i> Close Time </dt>
                    <dd>${gymList.gym_close}</dd>
                </div>

            </div>


            <div class="gym_info_tagBox" style="margin-top: 20px">

                <c:choose>
                    <c:when test="${gymFilter.open == 'true'}">
                        <div class="gym_info_tag open">#24시간</div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${gymFilter.locker == 'true'}">
                        <div class="gym_info_tag locker">#라커</div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${gymFilter.shower == 'true'}">
                        <div class="gym_info_tag shower">#샤워실</div>
                    </c:when>
                </c:choose>
                <c:choose>
                    <c:when test="${gymFilter.park == 'true'}">
                        <div class="gym_info_tag park">#주차장</div>
                    </c:when>
                </c:choose>
            </div>

            <c:if test="${gymImgList != null}">
                <c:forEach var="gymImg" items="${gymImgList}">
                    <script>
                        console.log("${gymImg}");
                    </script>
                    <div class="infopicture">
                        <figure class="figure">
                            <img src="/resource/gym/${gymImg}"
                                 class="figure-img img-fluid rounded" alt="..."/>
                            <figcaption class="figure-caption"></figcaption>
                        </figure>
                    </div>
                </c:forEach>
            </c:if>


        </div>
    </div>


    <script>

        // 태그 사용 못하게 출력 치환
        $(function () {
            $('.reviewcon').text($('.reviewcon').html());
        })


        $(".relike").on("click", function () {

            if ("${userSeq}" == "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '로그인 사용자만 클릭 가능합니다',

                })
            } else {
                var thumb = $(this);
                $.ajax({
                    url: "/reviewLikeAdd.gym",
                    data: {
                        "review_seq": $(this).closest(".reviewlike").find(".rseq").val(),
                        "gym_seq": $(this).closest(".reviewlike").find(".gym").val(),
                        "review_like": $(this).closest(".reviewlike").find(".rlike").val()

                    },
                    type: "post",
                    success: function (data) {

                        if (data == 'false') {

                            thumb.attr("style", "color:#001A41");
                            console.log(thumb + "좋아요 추가");
                            location.reload();


                        } else if (data == 'true') {
                            thumb.attr("style", "color:#8f959a");

                            console.log(thumb + "좋아요 삭제");
                            location.reload();
                        }

                    }

                })
            }


        })


        // 즐겨찾기 아이콘 트루면 빨강, 아니면 회색
        $(document).ready(function () {

            let fav = $("#heart").attr("check") == "true" ? true : false;

            console.log(fav);
            if (fav) {
                console.log(fav + ": 빨강")
                $("#heart").css("color", "#CF0C00");
            } else {
                console.log(fav + ": 회색")
                $("#heart").css("color", "#C7D3DC")
            }


        });


        $("#heart").on("click", function () {

            if ($("#heart").css("color") == "rgb(199,211,220)") {
                $("#heart").css("color", "#CF0C00");
                console.log("즐찾추가")
                $.ajax({
                    url: "/favoriteadd.gym?gym_seq=" +${gymList.gym_seq},
                    type: "get"
                })
            } else {
                $("#heart").css("color", "#C7D3DC")
                console.log("즐찾삭제")
                $.ajax({
                    url: "/favoriteremove.gym?gym_seq=" +${gymList.gym_seq},
                    type: "get"
                })
            }
        })

    </script>


    <script type="text/javascript">
        //아이콘 클릭시 주소복사 버튼

        $(".shareicon").on("click", function () {
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = window.document.location.href;
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
            $(".fa-sharp fa-solid fa-share-nodes").tooltip();  //URL 주소 복사 가능 TOOLTIP


        })

    </script>


    <script>


        $(function () {
            $(".review2").slice(0, 1).show(); // 초기갯수


            $("#load").click(function (e) {
                // 클릭시 more
                e.preventDefault();
                $(".review2:hidden").slice(0, 2).show(); // 클릭시 추가 갯수 지정
                if ($(".review2:hidden").length == 0) {
                    // 컨텐츠 남아있는지 확인
                    $("#load").css("display", "none")
                }
            });
        });  //게시글 더 보기 기능
    </script>

    <script>
        const data = {
            labels: ["PT 만족도", "상담 만족도", "시설 규모", "기구 다양성", "시설 청결"],
            datasets: [
                {
                    label: "My Second Dataset",
                    data: [${checkList.check1}, ${checkList.check2}, ${checkList.check3}, ${checkList.check4}, ${checkList.check5}],
                    fill: true,
                    backgroundColor: "rgba(54, 162, 235, 0.2)",
                    borderColor: "rgb(54, 162, 235)",
                    pointBackgroundColor: "rgb(54, 162, 235)",
                    pointBorderColor: "#fff",
                    pointHoverBackgroundColor: "#fff",
                    pointHoverBorderColor: "rgb(54, 162, 235)",
                },
            ],
        };

        const config = {
            type: "radar",
            data: data,
            options: {
                elements: {
                    line: {
                        borderWidth: 3,
                    },
                },
                scales: {
                    r: {
                        suggestedMin: 0,


                        stepSize: 1
                    },
                },
            },

        };


        //chart.js
    </script>

    <script>
        const myChart = new Chart(document.getElementById("myChart"), config);
    </script>

    <script>

        $("#reviewbtn").on("click", function () {
            if ("${userSeq}" == "") {
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    text: '로그인 사용자만 작성 가능합니다',

                })
                return false;
            } else {
                location.href = "/reviewWrite.gym?gym_seq=${gymList.gym_seq}";
            }

        }); //리뷰작성 이동
    </script>


</main>

<%@ include file="/layout/footer.jsp" %>