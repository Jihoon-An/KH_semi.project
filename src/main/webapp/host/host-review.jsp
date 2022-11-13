<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/host/host-header.jsp" %>

<main id="host-review" style="margin: 0 auto">

    <form action="" id="frm">

        <div id="search_box">
            <div style="margin: auto; width: 1010px; position: relative; left: 6px">
                <!-- 검색분류 -->
                <select name="type" id="select">
                    <option value="select_contents" selected>리뷰내용</option>
                    <option value="select_email">작성자이메일</option>
                    <option value="select_photo">인증여부</option>
                </select>

                <input type="text" placeholder="검색어를 입력해주세요" name="search" id="search">
                <button class="btn_search" role="button" type="button" id="searchBtn">검색</button>
            </div>
        </div>


        <div class="btn_function_box">
            <button class="btn_function" role="button">인증확인</button>
            <button class="btn_function" role="button" type="button" id="btn_del">삭제하기
            </button>
        </div>


        <div class="board_list containerbox">
            <div class="board_title_row d-flex flex-row">
                <div class="checkbox p-1"><input type="checkbox" name="reviewAll" id="allcheck"
                                                 onclick="checkAll();"></div>
                <div class="review_seq p-1">번호</div>
                <div class="gym_name p-1">시설명</div>
                <div class="user_email p-1">이메일</div>
                <div class="review_contents p-1">리뷰내용</div>
                <div class="review_star p-1">별점</div>
                <div class="review_like p-1">추천수</div>
                <div class="review_photo p-1">인증여부</div>
                <div class="review_date p-1">작성날짜</div>
            </div>

            <c:choose>
                <c:when test="${not empty list}">
                    <!-- 비어있지 않다면 -->
                    <c:forEach var="i" items="${list}">
                        <div class="board_row d-flex flex-row">
                            <div class="checkbox p-1"><input type="checkbox" name="reviewEach" class="check" value="${i.review_seq}"></div>
                            <div class="review_seq p-1">
                                <span class="position-relative">
                                    ${i.review_seq}
                                    <!-- 날짜 계산 -->
                                    <jsp:useBean id="now" class="java.util.Date"/>
                                    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true"
                                                     var="nowfmtTime" scope="request"/>
                                    <fmt:parseNumber value="${i.review_writer_date.time / (1000*60*60*24)}" integerOnly="true"
                                                     var="dbDtParse" scope="request"/>
                                    <c:if test="${(dbDtParse - nowfmtTime)==0}">
                                    <span style="font-size:8px; font-weight: 300; width:30px; height: 15px; position: absolute; top: -3px; left: 40px"
                                          class="translate-middle badge rounded-pill bg-danger animate__animated animate__flash animate__infinite">
                                        <span style="position: absolute; top: 2px; left: 4px">NEW</span>
                                    </span>
                                    </c:if>
                                </span>
                            </div>
                            <div class="gym_name p-1">${i.gym_name}</div>
                            <div class="user_email p-1">${i.users_email}</div>
                            <div class="review_contents p-1">${i.review_contents}</div>
                            <div class="review_star p-1" style="font-size: 10px;">
                                <c:if test="${i.review_star == 1}">★</c:if>
                                <c:if test="${i.review_star == 2}">★★</c:if>
                                <c:if test="${i.review_star == 3}">★★★</c:if>
                                <c:if test="${i.review_star == 4}">★★★★</c:if>
                                <c:if test="${i.review_star == 5}">★★★★★</c:if>
                            </div>
                            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> ${i.review_like}</span></div>
                            <div class="review_photo p-1">
                                <c:if test="${i.review_photo !=null}">미인증</c:if>
                            </div>
                            <div class="review_date p-1">
                                <fmt:formatDate value="${i.review_writer_date}" type="both" dateStyle="short" timeStyle="short"/>
                            </div>
                        </div>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="width: 1200px; height: 400px; text-align: center">
                        <h2 style="margin:50px">등록된 리뷰가 없습니다</h2>
                    </div>
                </c:otherwise>
            </c:choose>

            <div style="margin-top: 20px">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        ${navi}
                    </ul>
                </nav>
            </div>
        </div>
    </form>

    <div id="img_layout" onclick='ViewLayerClose()'>
        <img src="/resource/img/main.jpg" style="width: 100%; height: 100%">
    </div>

</main>


<script>
    // 이미지 저장 되어있으면, 이미지등록 이라고 멘트 바꾸기
    // 인증리뷰어 체크를 해준다면, 인증완료로 멘트 바꾸기
    // null 값은 빈값으로 나오기



    // 텍스트 클릭하면 이미지 보기 창 새로 뜨기
    function ViewLayer() {
        //클릭시 이미지 주소 바꾸는 함수 짜기 /resource/img/main.jpg
        ok();
    }


    function ok() {
        if (document.getElementById("Pop").style.display == "none") {
            document.getElementById("Pop").style.display = 'inline'
        } else {
            document.getElementById("Pop").style.display = 'none'
        }
    }

    function ViewLayerClose() {
        document.getElementById("Pop").style.display = 'none'
    }






    // 페이지 선택 확인용
    $(function () {
        $("#li_review").css("color", "#ffe92d")
    });

    // 엔터 = 버튼 클릭
    $("#search").on("keyup", (e) => {
        if (e.keyCode == 13) {
            $("#searchBtn").click()
        }
    });

    // 전체 선택, 해제
    function checkAll() {
        if ($("#allcheck").is(':checked')) {
            $("input[name=reviewEach]").prop("checked", true);
        } else {
            $("input[name=reviewEach]").prop("checked", false);
        }
    }

    // 전체 체크중 하나 체크 취소하면 전체체크 풀림
    $(document).on("click", "input:checkbox[name=reviewEach]", function (e) {
        var chks = document.getElementsByName("reviewEach");
        var chksChecked = 0;

        for (var i = 0; i < chks.length; i++) {
            var cbox = chks[i];

            if (cbox.checked) {
                chksChecked++;
            }
        }
        if (chks.length == chksChecked) {
            $("#allcheck").prop("checked", true);
        } else {
            $("#allcheck").prop("checked", false);
        }
    });

    // 리뷰 검색
    $("#searchBtn").on("click", function click() {
        let input = $("#search").val();
        let select = $("#select option:selected").val();
        if (input == "") {
            Swal.fire({
                icon: 'error',
                title: '검색어 누락',
                text: '입력된 내용이 없습니다',
                confirmButtonText: '확인'
            })
            return false;
        } else {
            if(select == "select_contents") { //리뷰내용

                $("#frm").attr("action", "/reviewSearch.host?cpage=1")
                $("#frm").submit();
            } else if (select == "select_email") { // 작성자이메일

                $("#frm").attr("action", "/reviewSearch.host?cpage=1")
                $("#frm").submit();
            } else if (select == "select_photo") { // 인증여부

                $("#frm").attr("action", "/reviewSearch.host?cpage=1")
                $("#frm").submit();
            }

            $("#select option:selected").val() == "select_email"
            $("#select option:selected").val() == "select_photo"


        }
    })


    // 리뷰 삭제
    $("#btn_del").on("click", function () {
        var reviewSeq = [];
        let checked = document.querySelectorAll(".check:checked");
        for (let i = 0; i < checked.length; i++) {
            reviewSeq.push(checked[i].value);
        }
        $.ajax({
            url: "/reviewDel.host",
            type: "post",
            data: {"review_seq": JSON.stringify(reviewSeq)},
            success: function (data) {
                location.reload();
            }
        })
    })

</script>

<%@ include file="/host/host-footer.jsp" %>