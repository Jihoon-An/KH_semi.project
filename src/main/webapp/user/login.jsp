<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Login</title>
            <link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">
            <script src="https://code.jquery.com/jquery-3.6.1.min.js"
                integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
                </script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT"
                crossorigin="anonymous">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
                crossorigin="anonymous"></script>
            <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <script src="https://kit.fontawesome.com/be3915f36a.js" crossorigin="anonymous"></script>
            <link rel="stylesheet" href="/css/base.css" type="text/css">
            <style>
                * {
                    box-sizing: border-box;
                }

                .container {
                    margin-top: 20px;
                    padding: 20px;
                    border: 1px solid #808080;
                    width: 350px;
                    height: 450px;
                    min-width: 350px;
                }

                a {
                    text-decoration: none;
                }

                a:hover {
                    cursor: pointer
                }

                input {
                    padding-left: 5px;
                    padding-right: 5px;
                    width: 250px;
                    border: 0px;
                    border-bottom: 1px solid black;
                }

                input:focus {
                    outline: none;
                }

                .btn_base {
                    width: 120px;
                    height: 50px;
                }

                .search {
                    visibility: hidden;
                }
            </style>
        </head>

        <body>
            <div class="container" align="center">
                <!-- 로그인 폼 -->
                <form id="form_login">
                    <div class="row justify-content-center">
                        <div class="col-12 text-end">
                            <a><i class="fa-solid fa-x" style="color:#808080"></i></a>
                        </div>
                        <div class="col-12 gy-4">
                            <div style="font-size:x-large">회원 로그인</div>
                        </div>
                        <div class="col-12 gy-3">
                            <div class="text-start" style="width:250px">
                                <span style="color:#808080; font-size:x-small">이메일</span>
                            </div>
                            <input type="text" name="user_id" id="login_id" placeholder="이메일을 입력하세요." maxlength="40">
                        </div>
                        <div class="col-12 gy-4">
                            <div class="text-start" style="width:250px">
                                <span style="color:#808080; font-size:x-small">비밀번호</span>
                            </div>
                            <input type="password" name="user_pw" id="login_pw" placeholder="비밀번호를 입력하세요."
                                maxlength="20">
                        </div>
                        <div class="col-12 gy-4">
                            <button type="button" class="btn_base" id="btn_login">로그인</button>
                        </div>
                        <div class="col-12 gy-1">
                            <input class="form-check-input" type="checkbox" name="bs_login" id="bs_login">
                            <label class="form-check-label" for="bs_login" style="color:#404040; font-size:14px">운영자
                                로그인</label>
                        </div>
                        <div class="col-12 gy-3">
                            <span style="color:#404040">계정이 없으신가요?</span>
                            <a href="signup">회원 가입</a>
                        </div>
                        <div class="col-12 gy-1" style="color:#808080; font-size:small">
                            <a onclick="$('#form_login').hide(); $('#form_searchId').show()">아이디 찾기</a>
                            <span>/</span>
                            <a onclick="$('#form_login').hide(); $('#form_searchPw').show()">비밀번호 찾기</a>
                        </div>
                    </div>
                </form>
                <!-- 아이디 찾기 폼 -->
                <form class="search" id="form_searchId">
                    <div class="row justify-content-center">
                        <div class="col-12 text-end">
                            <a><i class="fa-solid fa-x" style="color:#808080"></i></a>
                        </div>
                        <div class="col-12 gy-4">
                            <div class="mb-2" style="font-size:large">아이디 찾기</div>
                        </div>
                        <div class="col-12 gy-4">
                            <input type="text" name="user_name" id="searchId_name" placeholder="이름" maxlength="10">
                            <div class="text-start mt-1 mb-2" style="width:250px">
                                <span style="color:#808080; font-size:x-small">회원 가입시 사용한 이름을 입력하세요.</span>
                            </div>
                        </div>
                        <div class="col-12 gy-4">
                            <input type="text" name="user_phone" id="searchId_phone" placeholder="핸드폰 번호"
                                maxlength="14">
                            <div class="text-start mt-1 mb-2" style="width:250px">
                                <span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
                            </div>
                        </div>
                        <div class="col-12 gy-4">
                            <button class="btn_base mb-3" type="button" id="btn_searchId">찾기</button>
                        </div>
                        <div class="col-12 gy-4">
                            <a class="btn_back" style="color:#808080">Back</a>
                        </div>
                    </div>
                </form>
                <!-- 비밀번호 찾기 폼 -->
                <form class="search" id="form_searchPw">
                    <div class="row justify-content-center">
                        <div class="col-12 text-end">
                            <a><i class="fa-solid fa-x" style="color:#808080"></i></a>
                        </div>
                        <div class="col-12 gy-4">
                            <div class="mb-2" style="font-size:large">비밀번호 찾기</div>
                        </div>
                        <div class="col-12 gy-4">
                            <input type="text" name="user_email" id="searchPw_email" placeholder="이메일" maxlength="40">
                            <div class="text-start mt-1 mb-2" style="width:250px">
                                <span style="color:#808080; font-size:x-small">회원 가입시 사용한 이메일을 입력하세요.</span>
                            </div>
                        </div>
                        <div class="col-12 gy-4">
                            <input type="text" name="user_phone" id="searchPw_phone" placeholder="핸드폰 번호"
                                maxlength="14">
                            <div class="text-start mt-1 mb-2" style="width:250px">
                                <span style="color:#808080; font-size:x-small">회원 가입시 사용한 핸드폰 번호를 입력하세요.</span>
                            </div>
                        </div>
                        <div class="col-12 gy-4">
                            <button class="btn_base mb-3" type="button" id="btn_searchPw">찾기</button>
                        </div>
                        <div class="col-12 gy-4">
                            <a class="btn_back" style="color:#808080">Back</a>
                        </div>
                    </div>
                </form>
            </div>
            <script>
                // 떨림 애니메이션
                function wobble(element) {
                    let order = [0, -8, 8, -4, 4, -2, 2, -1, 1, 0];
                    let seq = [];
                    order.forEach(function (y) { seq.push({ transform: "translate(0," + y + "px)" }); });
                    element.animate(seq, { duration: 300 });
                }

                // 유효성 검사 (공백 확인)
                function isFilled(element1, element2) {
                    if (element1.val() == "") { wobble((element1)[0]); }
                    else if (element2.val() == "") { wobble((element2)[0]); }
                    else { return true; }
                }

                // 로그인 함수
                function tryLogin() {
                    $.post("/login.user", $("#form_login").serialize())
                        .done((res) => {
                            if (res == "true") {
                                Swal.fire({ title: "Success!", icon: "success", text: "로그인에 성공했습니다." })
                                    .then((result) => {
                                        if (result.isConfirmed) { location.reload(); }
                                    });
                            } else {
                                Swal.fire({ title: "Error", icon: "error", text: "ID가 등록되지 않았거나 비밀번호가 올바르지 않습니다." });
                            }
                        });
                }

                // 아이디 찾기 함수
                function trySearchId() {
                    $.post("/searchId.user", $("#form_login").serialize())
                }

                // 비밀번호 찾기 함수
                function trySearchPw() {
                    $.post("/searchPw.user", $("#form_login").serialize())
                }

                // 버튼 이벤트
                $("#btn_login").on("click", () => {
                    if (isFilled($("#login_id"), $("#login_pw"))) { tryLogin(); }
                });

                $("#btn_searchId").on("click", () => {
                    if (isFilled($("#searchId_name"), $("#searchId_phone"))) { trySearchId(); }
                });

                $("#btn_searchPw").on("click", () => {
                    if (isFilled($("#searchPw_email"), $("#searchPw_phone"))) { trySearchPw(); }
                });

                // 엔터 = 버튼 클릭
                $("#login_id, #login_pw").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_login").click() } });
                $("#searchId_name, #searchId_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchId").click() } });
                $("#searchPw_email, #searchPw_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchPw").click() } });

                // 뒤로가기 처리
                $(".btn_back").on("click", () => {
                    $(".search").hide();
                    $("#login_id, #login_pw, #searchId_name, #searchId_phone, searchPw_email, #searchPw_phone").val("");
                    $("#form_login").show();
                })
            </script>
        </body>

        </html>