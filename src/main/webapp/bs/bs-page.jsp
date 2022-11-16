<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/layout/header.jsp" %>
<div class="main_margin_155" style="height: 85px;"></div>

<div class="main_margin_85" style="height: 85px;"></div>

<main id="bs-page" class="containerbox" style="overflow: visible;">
    <div class="containerbox">
        <div id="bs_info" class="text-center">
            <h1>사업자 페이지</h1>
        </div>
        <!-- 정보 수정 버튼 -->
        <div class="text-center" id="btn_area">
            <button type="button" id="modify_profile_btn" class="btn_outline"
                    style="display:inline-table; line-height: 10px;">
                일반 정보 수정
            </button>
            <button type="button" id="modify_acc_btn" class="btn_outline"
                    style="display:inline-table; line-height: 10px;">
                계정 정보 수정
            </button>
        </div>

    </div>

    <!-- 일반 정보 수정 폼 -->
    <div class="fixed-top" id="modify_profile">
        <div id="profile_box">
            <div class="container">

                <div class="row header text-center pt-5 mx-3">
                    <div class="col-3 text-start">
                        <button class="button-6" id="profile_cancel">취소</button>
                    </div>
                    <div class="col-6">
                        <h2>정보 수정</h2>
                    </div>
                    <div class="col-3 text-end">
                        <button class="button-6" id="profile_save">저장</button>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-8">
                        <div class="row profile_title"><span>담당자이름</span></div>
                        <div class="row"><input id="bs_name" type="text" class="profile_input"
                                                maxlength="15"></div>

                        <div class="row profile_title pt-2"><span>담당자연락처</span></div>
                        <div class="row"><input id="bs_phone" type="text" class="profile_input"
                                                maxlength="11"></div>
                        <script>
                            $("#bs_phone").on("keydown", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            }).on("keyup", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            });

                        </script>

                        <div class="row profile_title pt-2"><span>사업자번호</span></div>
                        <div class="row"><input id="bs_number" type="text"
                                                class="profile_input" maxlength="10"></div>
                        <script>
                            $("#bs_number").on("keydown", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            }).on("keyup", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            });
                        </script>

                        <div class="row profile_title pt-2"><span>사업자등록증</span></div>
                        <div class="row">
                            <label for="bs_ctfc_input" id="file_label" class="bs_regl_name">이미지를 업로드하세요</label>
                            <input id="bs_ctfc_input" type="file" class="px-0 profile_input"
                                   style="display: none"></div>
                        <div class="row">
                            <img id="bs_ctfc_img" src="" alt="">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 계정 정보 수정 폼 -->
    <div class="fixed-top" id="modify_acc">
        <div id="acc_box">
            <div class="container">

                <div class="row header text-center pt-5 mx-3">
                    <div class="col-3 text-start">
                        <button class="button-6" id="acc_cancel">취소</button>
                    </div>
                    <div class="col-6">
                        <h2>정보 수정</h2>
                    </div>
                    <div class="col-3 text-end">
                        <button class="button-6" id="acc_save">저장</button>
                    </div>
                </div>

                <div class="row justify-content-center">
                    <div class="col-8">
                        <%--비밀번호 입력--%>
                        <div class="row profile_title pt-5"><span>비밀번호</span></div>
                        <div class="row"><input id="bs_pw1" type="password" class="profile_input"
                                                placeholder="영어,숫자,특수문자 8~16글자" maxlength="16"></div>
                        <div class="row profile_title pt-2"><span>비밀번호 확인</span></div>
                        <div class="row"><input id="bs_pw2" type="password" class="profile_input"
                                                placeholder="비밀번호 재입력" maxlength="16"></div>
                        <div class="row mt-1" id="acc_cf"></div>


                        <%--회원탈퇴--%>
                        <div class="row mt-2 text-center bs_sd" id="bs_sd" style=""><span id="bs_sd_btn">회원탈퇴</span>
                        </div>
                        <!--sd = sign down -->
                        <div class="row mt-2 text-center bs_sd justify-content-center text-center" id="bs_sd_cf">
                            <div style="color: blue; margin-bottom: 10px;">정말 탈퇴하시겠습니까?</div>
                            <button type="button" class="bs_sd_cf_btn mx-3" id="bs_cf_sd_y">예</button>
                            <button type="button" class="bs_sd_cf_btn mx-3" id="bs_cf_sd_n">아니오</button>
                        </div>
                        <form action="/signDown.bsPage" id="sign_down_form" method="post"></form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <!-- 매장 정보 -->
    <div id="gym_info">

        <div class="container-fluid">
            <hr>

            <!-- card -->
            <c:forEach var="gym" items="${gymList}" varStatus="status">
                <div class="row gym_card">
                    <form class="gym_form" method="post">
                        <input name="gym_seq" class="gym_seq" type="hidden" value="${gym.gym_seq}">
                    </form>
                    <div class="col-3 p-0 gym_img_box">
                        <c:choose>
                            <c:when test='${gym.gym_main_sysImg != null}'>
                                <img class="gym_img" src="/resource/gym/${gym.gym_main_sysImg}">
                            </c:when>
                            <c:otherwise>
                                <img class="gym_img" src="/resource/img/default02.png">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="col-7 gym_text">
                        <div class="row"><h4 class="gym_name gym_content htmlToText">${gym.gym_name}</h4></div>
                        <div class="row pt-2">
                            <div class="col-2 gym_label">주소</div>
                            <div class="col-8 gym_content htmlToText">${gym.gym_location}</div>
                        </div>
                        <div class="row pt-2">
                            <div class="col-2 gym_label">연락처</div>
                            <div class="col-8 gym_content htmlToText">${gym.gym_phone}</div>
                        </div>
                        <c:choose>
                            <c:when test='${gym.gym_open == null && gym.gym_close == null}'>
                                <div class="row pt-2">
                                    <div class="col-2 gym_label">오픈시간</div>
                                    <div class="col-8 gym_content">미입력</div>
                                </div>

                            </c:when>
                            <c:otherwise>
                                <div class="row pt-2">
                                    <div class="col-2 gym_label">오픈시간</div>
                                    <div class="col-8 gym_content htmlToText">OPEN:${gym.gym_open} CLOSE:${gym.gym_close}</div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                        <!-- 태그 -->
                        <div class="gym_list_tagBox">
                            <c:if test="${gymFilterList[status.index].open eq 'true'}">
                                <div class="gym_list_tag open">#24시간</div>
                            </c:if>
                            <c:if test="${gymFilterList[status.index].locker eq 'true'}">
                                <div class="gym_list_tag locker">#라커</div>
                            </c:if>
                            <c:if test="${gymFilterList[status.index].shower eq 'true'}">
                                <div class="gym_list_tag shower">#샤워실</div>
                            </c:if>
                            <c:if test="${gymFilterList[status.index].park eq 'true'}">
                                <div class="gym_list_tag park">#주차장</div>
                            </c:if>
                            <c:if test="${gymFilterList[status.index].open ne 'true' && gymFilterList[status.index].locker ne 'true' && gymFilterList[status.index].shower ne 'true' && gymFilterList[status.index].park ne 'true'}">
                                <div class="gym_list_tag">#태그없음</div>
                            </c:if>
                        </div>
                    </div>
                    <div class="col-2 justify-content-center">
                        <button class="btn_outline modify_gym_btn"
                                style="border: 2px solid #F0F0F0;
                                    background-color: #ffffff;
                                    scale: 0.75">수정
                        </button>
                    </div>
                </div>
                <hr>
            </c:forEach>

            <div class="text-center">
                <a href="/toAdd.addGym" style="text-decoration-line:none">
                    <button class="button-17" id="add_gym" style="font-weight: bold;">시설 추가하기</button>
                </a>
            </div>

        </div>

    </div>

</main>


<!------------------------------------------------------- script -------------------------------------------------------->


<script>

    var htmlToText = document.getElementsByClassName("htmlToText");
    for (var i = 0; i < htmlToText.length; i++) {
        htmlToText[i].innerText = htmlToText[i].innerHTML;
    }
    ////////////////////////            프로필                   ///////////////////////////////////////////////////////////

    /**
     * 프로필 정보 수정 버튼 클릭 이벤트
     */
    $("#modify_profile_btn").on("click", () => {
        $("#modify_profile").css("display", "block");
    });
    /////////////////첨부파일
    $("#bs_ctfc_input").on("change", handleImgFileSelect);

    /**
     * 이미지 미리보기
     * @param e
     */
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

        filesArr.forEach(function (f) {
            if (!f.type.match(reg)) {
                Swal.fire({
                    icon: 'error',
                    title: '이미지 업로드 불가',
                    text: '이미지 파일만 업로드 가능합니다.',
                    confirmButtonText: '확인'
                })
                return;
            }

            sel_file = f;

            var reader = new FileReader();
            reader.onload = function (e) {
                $("#bs_ctfc_img").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });

        pi_check = true;
        var filename = $(this)[0].files[0].name;
        $(this).siblings('#file_label').html(filename);
    }

    /**
     * 이미지 저장
     */
    function fn_submit() {

        var form = new FormData();
        form.append("bs_ctfc_img", $("#bs_ctfc_input")[0].files[0]);

        $.ajax({
            url: "/updateCtfc.bsPage"
            , type: "POST"
            , processData: false
            , contentType: false
            , data: form
            , success: function (response) {
            }
            , error: function (jqXHR) {
                alert(jqXHR.responseText);
            }
        });
    }

    /**
     * 프로필 저장
     */
    $("#profile_save").click(function () {
        let bs_name = $("#bs_name").val();
        let bs_phone = $("#bs_phone").val();
        let bs_number = $("#bs_number").val();
        // 정보 저장
        $.ajax({
            url: "/updateProfile.bsPage",
            data: {
                name: bs_name,
                phone: bs_phone,
                number: bs_number
            },
            type: "post",
            success: function () {
            }
        });
        // 사업증 저장
        fn_submit();
        //창 닫기
        $("#modify_profile").css("display", "none");
    });

    //// 프로필 변경 취소버튼
    $("#profile_cancel").click(function () {
        reset();
    });


    /**
     * 프로필 기본값 설정
     */
    function reset() {
        $("#modify_profile").css("display", "none");
        $("#bs_name").val("${bsUser.bs_name}");
        $("#bs_phone").val("${bsUser.bs_phone}");
        $("#bs_number").val("${bsUser.bs_number}");
        $("#bs_ctfc_img").attr("src", "/resource/ctfc/${bsCtfc.sysName}");
    }

    reset();

    ///////////////////////////////////////////       계정 정보 수정       ////////////////////////////////////////////////////////////////////

    acc_close();
    $("#modify_acc_btn").click(function () {
        $("#modify_acc").css("display", "block");
    });
    /*
     * 계정 정보 수정 취소
     */
    $("#acc_cancel").click(function () {
        acc_close();
    });

    function acc_close() {
        $("#bs_pw1").val("");
        $("#bs_pw2").val("");
        $("#bs_sd").css("display", "block");
        $("#bs_sd_cf").css("display", "none");
        $("#modify_acc").css("display", "none");
        $("#acc_cf").html("");
    }

    /*
     * 비밀번호 저장
     * @type {RegExp}
     */
    $("#bs_pw1").on("input", function () {
        $("#acc_cf").html("");
    });
    $("#bs_pw2").on("input", function () {
        $("#acc_cf").html("");
    });
    //유효성 검사
    let bsPwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
    $("#acc_save").click(function () {
        // 실패
        let pw1 = $("#bs_pw1").val();
        let pw2 = $("#bs_pw2").val();
        if (!(bsPwRegex.test(pw1))) {
            $("#acc_cf").html("옳바르지 않은 입력입니다.");
            $("#bs_pw1").val("");
            $("#bs_pw2").val("");
            $("#bs_pw1").focus();
            return false;
        }
        if (pw1 != pw2) {
            $("#acc_cf").html("비밀번호를 확인해주세요");
            $("#bs_pw2").val("");
            $("#bs_pw2").focus();
            return false;
        }
        //성공
        $.ajax({
            url: "/updatePw.bsPage",
            data: {
                pw: pw1
            },
            type: "post",
            success: function () {
                acc_close();
            }
        });
    });
    /*
     * 회원탈퇴
     */
    $("#bs_sd_btn").click(function () {
        $("#bs_sd").css("display", "none");
        $("#bs_sd_cf").css("display", "block");
    });
    //아니오 누를 시
    $("#bs_cf_sd_n").click(function () {
        $("#bs_sd").css("display", "block");
        $("#bs_sd_cf").css("display", "none");
    });
    $("#bs_cf_sd_y").click(function () {
        $("#sign_down_form").submit();
    });


    // gym 수정페이지로 이동
    $(".modify_gym_btn").click(function () {
        $(this).closest(".gym_card").find(".gym_form").attr("action", "/toUpdateGym.bsPage").attr("method", "post");
        $(this).closest(".gym_card").find(".gym_form").submit();
    });

    // 상세페이지 이동
    $(".gym_img").click(function () {
        $(this).closest(".gym_card").find(".gym_form").attr("action", "/detail.gym").attr("method", "post");
        $(this).closest(".gym_card").find(".gym_form").submit();
    });
    $(".gym_name").click(function () {
        $(this).closest(".gym_card").find(".gym_form").attr("action", "/detail.gym").attr("method", "post");
        $(this).closest(".gym_card").find(".gym_form").submit();
    });


</script>
<%@ include file="/layout/footer.jsp" %>