<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jstl 포맷라이브러리 추가 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Board</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

        :root {
            --animate-duration: 2s;
            --animate-delay: 0.9s;
        }

        * {
            box-sizing: border-box;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .writer:hover {
            color: #666666;
            cursor: pointer;
        }

        .alert {
            background: #fff;
            vertical-align: middle;
        }

        .titleline>div {
            font-size: 15px;
            font-weight: 900;
        }

        div {
            font-size: 14px;
            font-weight: 500;
        }

        i {
            margin-top: 15px;
        }

        .bg-secondary {
            - -badge-color: #999999;
        }

        .btn-bd-secondary {
            - -bs-btn-font-weight: 500;
            - -bs-btn-font-size: 12px;
            - -bs-btn-padding-x: 10px;
            - -bs-btn-padding-y: 3px;
            - -bs-btn-border-color: #333333;
            - -bs-btn-color: #333333;
            - -bs-btn-bg: white;
            - -bs-btn-hover-bg: #999999;
            - -bs-btn-hover-color: white;
        }

        .pagination {
            - -bs-pagination-color: #333333;
            - -bs-pagination-active-bg: #999999;
            - -bs-pagination-active-border-color: #999999;
            - -bs-pagination-hover-color: #333333;
            - -bs-pagination-font-size: 14px;
        }

        .cate {
            margin-top: 20px;
        }

        .board {
            margin-top: 10px;
        }

        .nav {
            - -bs-nav-link-color: #666666;
            - -bs-nav-link-hover-color: #222222;
            - -bs-nav-link-font-size: 14px;
        }

        .nav-pills {
            - -bs-nav-pills-link-active-bg: #999999;
        }

        h5 {
            text-align: center;
            font-weight: 900;
        }

        .align {
            text-align: right;
            margin-bottom: 100px;
        }


        .page-link {
            color: #000;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        .page-item.active .page-link {
            z-index: 1;
            color: #555;
            font-weight:bold;
            background-color: #f1f1f1;
            border-color: #ccc;

        }

        .page-link:focus, .page-link:hover {
            color: #000;
            background-color: #fafafa;
            border-color: #ccc;
        }

        a{
            text-decoration:none;
            color:#222222;
        }


        #title {
            text-align: left;
        }

        a:hover {
            font-weight: 700;
            color:#222222;
        }

        .bg-danger{margin-left:10px;
            position: relative;
            top: -1px;}

        .gray{color: #666666;
            font-size:13px;
            margin-left:3px;}

    </style>
</head>

<body>

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



</body>

</html>