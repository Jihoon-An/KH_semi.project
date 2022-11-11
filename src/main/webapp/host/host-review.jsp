<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<%@ include file="/host/host-header.jsp"%>


<main>
<div class="container">

    <div class="board alert alert-secondary" role="alert">
        <h5>Free Board</h5>
        <hr class="d-none d-md-block">
        <div class="row text-center titleline">
            <div class="col-md-1 no d-none d-md-block">no.</div>
            <div class="col-12 col-md-6 title d-none d-md-block">title</div>
            <div class="col-md-2 writer d-none d-md-block">writer</div>
            <div class="col-md-1 hits d-none d-md-block">view</div>
            <div class="col-md-2 date d-none d-md-block">date</div>
        </div>

        <!-- choose 랑 when 사이에 아무것도 넣지않기. 넣으면 에러남. -->
        <c:choose>

            <c:when test="${not empty list}">
                <!-- 비어있지 않다면 -->
                <c:forEach var="i" items="${list}">
                    <!-- jstl에선 "" 필수 -->

                    <hr>
                    <div class="row text-center">
                        <div class="col-12 col-md-1 no d-none d-md-block">${i.seq}</div>
                        <div class="col-12 col-md-6 title text-truncate" id="title">
                            <a href="/detail.board?seq=${i.seq}">${i.title} <span class="gray">[${i.commentNum}]</span></a>

                            <!-- 날짜 계산 -->
                            <jsp:useBean id="now" class="java.util.Date" />
                            <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
                            <fmt:parseNumber value="${i.write_date.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
                            <c:if test="${(dbDtParse - nowfmtTime)==0}">
                                <span class="badge bg-danger animate__animated animate__flash animate__infinite">NEW</span>
                            </c:if>

                        </div>
                        <div class="col-5 col-md-2 writer">
                            <i class="bi bi-pen d-block d-md-none"> ${i.writer}</i><span
                                class="d-none d-md-block"> ${i.writer}</span>
                        </div>
                        <div class="col-2 col-md-1 hits">
                            <i class="bi bi-eye d-block d-md-none"> ${i.view_count}</i><span
                                class="d-none d-md-block"> ${i.view_count}</span>
                        </div>
                        <div class="col-5 col-md-2 date">
                            <i class="bi bi-clock-history d-block d-md-none">
                                    ${i.formedDate}</i><span class="d-none d-md-block">
                                ${i.formedDate}</span>
                        </div>
                    </div>

                </c:forEach>
            </c:when>
            <c:otherwise>
                <div>
                    <h2>출력할 내용이 없습니다.</h2>
                </div>
            </c:otherwise>
        </c:choose>

    </div>



    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                ${navi}
            </ul>
        </nav>
    </div>


    <div class="align">
        <button class="btn btn-secondary" id="toWrite">Write</button>
    </div>
</div>

<script>
    $("#toWrite").on("click", function () {
        location.href = "/write.board";
    })
</script>



</main>
<%@ include file="/host/host-footer.jsp"%>