<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>피트니즈 - Fitneeds Admin Page</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resource/fitneeds.ico">

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script>

    <!-- google font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@100;200;300;400;500;600;700;800;900&display=swap"
          rel="stylesheet">

    <!-- Pretendard font -->
    <link rel="stylesheet" type="text/css"
          href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/variable/pretendardvariable.css"/>

    <!-- bootstrap - css -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
            crossorigin="anonymous"></script>

    <!-- Bootstrap - icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <!-- Fontawesome - icon  -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.css" rel="stylesheet">

    <!-- sweetalert -->
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <!-- animate -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>

    <!-- css -->
    <link rel="stylesheet" href="/css/base.css" type="text/css">
    <link rel="stylesheet" href="/css/host.css" type="text/css">
    <link rel="stylesheet" href="/css/host-user.css" type="text/css">
    <link rel="stylesheet" href="/css/host-bsuser.css" type="text/css">
    <link rel="stylesheet" href="/css/host-review.css" type="text/css">

</head>


<body>
<div id="wrap_host" class="d-flex justify-content-start">
    <div id="headerMarginBox"></div>
    <header id="nav">
            <div class="logoDiv">
                <a class="a_tag" href="/admin.host"><h2 class="logo">Fitneeds</h2>
                    <h2 class="logo" id="adminText">ADMIN</h2></a>
            </div>
            <nav>
                <ul>
                    <li><a class="a_tag" style="cursor:default">
                        <div class="d-flex justify-content-start">
                            <div class="i_margin"><i class="fa-solid fa-user"></i></div>
                            회원관리
                        </div>
                    </a></li>
                    <li>
                        <ul style="list-style-type: circle; margin-top: -7px;">
                            <li style="list-style-type: none;"><a class="a_tag" href="/usersList.host?cpage=1">
                                <div class="d-flex justify-content-start" id="li_user">
                                    <div class="in_i_margin"><i class="fa-solid fa-circle"></i></div>
                                    일반회원
                                </div>
                            </a></li>
                            <li style="list-style-type: none;"><a class="a_tag" href="/bsUserList.host?cpage=1">
                                <div class="d-flex justify-content-start" id="li_bsuser">
                                    <div class="in_i_margin"><i class="fa-solid fa-circle"></i></div>
                                    사업자회원
                                </div>
                            </a></li>
                        </ul>
                    <li>
                    <!-- <li><a class="a_tag" href="/admin.host">
                        <div class="d-flex justify-content-start" id="li_gym">
                            <div class="i_margin"><i class="fa-solid fa-building"></i></div>
                            시설관리
                        </div>
                    </a></li> -->
                    <li><a class="a_tag" href="/reviewList.host?cpage=1">
                        <div class="d-flex justify-content-start" id="li_review">
                            <div class="i_margin"><i class="fa-regular fa-pen-to-square"></i></div>
                            리뷰관리
                        </div>
                    </a></li>
                    <!-- <li><a class="a_tag" href="/admin.host">
                        <div class="d-flex justify-content-start">
                            <div class="i_margin"><i class="fa-solid fa-rectangle-ad"></i></div>
                            광고관리
                        </div>
                    </a></li> -->
                </ul>
            </nav>
    </header>
