<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/host/host-header.jsp" %>


<main id="host-review" style="margin: auto">

    <div id="search_box">
        <div style="margin: auto; width: 1010px; position: relative; left: 6px">
            <!-- 검색분류 -->
            <select name="type" id="select">
                <option value="board_title" selected>리뷰내용</option>
                <option value="board_writer">작성자이메일</option>
                <option value="board_writer">인증여부</option>
            </select>

            <input type="text" placeholder="검색어를 입력해주세요" id="search">
            <button class="btn_search" role="button">검색</button>
        </div>
    </div>


    <div class="btn_function_box">
        <button class="btn_function" role="button">인증확인</button>
        <button class="btn_function" role="button">리뷰삭제</button>
    </div>


    <div class="board_list containerbox">
        <div class="board_title_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1" style="font-size: 17px;"><b>번호</b></div>
            <div class="gym_name p-1" style="font-size: 17px;"><b>시설명</b></div>
            <div class="user_email p-1" style="font-size: 17px;"><b>작성자이메일</b></div>
            <div class="review_contents p-1" style="font-size: 17px;"><b>리뷰내용</b></div>
            <div class="review_star p-1" style="font-size: 17px;"><b>별점</b></div>
            <div class="review_like p-1" style="font-size: 17px;"><b>천수</b></div>
            <div class="review_photo p-1" style="font-size: 17px;"><b>인증여부</b></div>
            <div class="review_date p-1" style="font-size: 17px;"><b>작성날짜</b></div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">띵곡파티고짐</div>
            <div class="user_email p-1">asd@nave.rcsd</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1"><a href="javascript:ViewLayer();">이미지등록</a></div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">가보자고짐</div>
            <div class="user_email p-1">ertertretert@nave.asd</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1"></div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">티가자고짐</div>
            <div class="user_email p-1">dfgghj@navfghe.fg</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1">인증완료</div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">띵곡보자고짐</div>
            <div class="user_email p-1">khjk@nave.ghj</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1"></div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">띵곡파티가고짐</div>
            <div class="user_email p-1">fghfghy@nave.rcomasd</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1">인증완료</div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">띵곡파티가보자고짐</div>
            <div class="user_email p-1">sdf@nave.dsdf</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1">이미지등록</div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">민섭짐</div>
            <div class="user_email p-1">poi@nave.iuo</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1"></div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">섭섭짐</div>
            <div class="user_email p-1">dfgsgs@nave.ert</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1">인증완료</div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>

        <div class="board_row d-flex flex-row">
            <div class="checkbox p-1"><input type="checkbox"></div>
            <div class="review_seq p-1">1234</div>
            <div class="gym_name p-1">짐짐</div>
            <div class="user_email p-1">asd1@nave.rcomasd</div>
            <div class="review_contents p-1">리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝리뷰내용살짝</div>
            <div class="review_star p-1">★★★★★</div>
            <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> 1234</span></div>
            <div class="review_photo p-1">인증완료</div>
            <div class="review_date p-1">22/11/12 13:31</div>
        </div>


        <c:choose>
            <c:when test="${not empty list}">
                <!-- 비어있지 않다면 -->
                <c:forEach var="i" items="${list}">
                    <div class="board_row d-flex flex-row">
                        <div class="checkbox p-1"><input type="checkbox"></div>
                        <div class="review_seq p-1">${i.REVIEW_SEQ}</div>
                        <div class="gym_name p-1">${i.GYM_SEQ}</div>
                        <div class="user_email p-1">${i.USER_SEQ}</div>
                        <div class="review_contents p-1">
                            <!-- 날짜 계산 -->
                            <jsp:useBean id="now" class="java.util.Date"/>
                            <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true"
                                             var="nowfmtTime" scope="request"/>
                            <fmt:parseNumber value="${i.write_date.time / (1000*60*60*24)}" integerOnly="true"
                                             var="dbDtParse" scope="request"/>
                            <c:if test="${(dbDtParse - nowfmtTime)==0}">
                                <span class="badge bg-danger animate__animated animate__flash animate__infinite">NEW</span>
                            </c:if>
                                ${i.REVIEW_CONTENTS}</div>
                        <div class="review_star p-1">${i.REVIEW_STAR}</div>
                        <div class="review_like p-1"><span><i class="fa-regular fa-thumbs-up"></i> ${i.REVIEW_LIKE}</span></div>
                        <div class="review_photo p-1">${i.REVIEW_PHOTO}</div>
                        <div class="review_date p-1">${i.formedDate}</div>
                    </div>


                    ${i.REVIEW_SEQ}
                    ${i.USER_SEQ}
                    ${i.GYM_SEQ}
                    ${i.BS_SEQ}
                    ${i.REVIEW_WRITER}
                    ${i.REVIEW_CONTENTS}
                    ${i.REVIEW_STAR}
                    ${i.REVIEW_LIKE}
                    ${i.REVIEW_WRITER_DATE}
                    ${i.formedDate}
                    ${i.REVIEW_CHECK1}
                    ${i.REVIEW_CHECK2}
                    ${i.REVIEW_CHECK3}
                    ${i.REVIEW_CHECK4}
                    ${i.REVIEW_CHECK5}
                    ${i.REVIEW_PHOTO}

                </c:forEach>
            </c:when>
            <c:otherwise>
                <div style="width: 1200px; height: 400px; text-align: center">
                    <h2 style="margin:50px">출력할 내용이 없습니다.</h2>
                </div>
            </c:otherwise>
        </c:choose>

        <div>
            <nav aria-label="Page navigation">
                <ul class="pagination justify-content-center">
                    ${navi}
                </ul>
            </nav>
        </div>

        <div id="img_layout" onclick='ViewLayerClose()'>
            <img src="/resource/img/main.jpg" style="width: 100%; height: 100%">
        </div>

    </div>




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

    </script>


</main>
<%@ include file="/host/host-footer.jsp" %>