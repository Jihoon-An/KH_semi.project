<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/layout/header.jsp" %>
<div class="main_margin_155" style="height: 85px;"></div>
<main id="bs-page">
    <div class="containerbox">
        <div id="bs_info" class="text-center">
            <h1>사업자 페이지</h1>
        </div>
        <!-- 정보 수정 버튼 -->
        <div class="text-center" id="btn_area">
            <button type="button" id="modify_profile_btn" class="btn_base" style="display:inline-table">일반
                정보 수정
            </button>
            <button type="button" id="modify_account_btn" class="btn_base" style="display:inline-table">계정
                정보 수정
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
                        <div class="row profile_title"><span>이름</span></div>
                        <div class="row"><input id="bs_name" type="text" class="profile_input form-control"
                                                maxlength="15"></div>

                        <div class="row profile_title pt-2"><span>전화번호</span></div>
                        <div class="row"><input id="bs_phone" type="text" class="profile_input form-control"
                                                maxlength="11"></div>
                        <script>
                            $("#bs_phone").on("keydown", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            }).on("keyup", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            });

                        </script>

                        <div class="row profile_title pt-2"><span>사업자 번호</span></div>
                        <div class="row"><input id="bs_number" type="text"
                                                class="profile_input form-control" maxlength="10"></div>
                        <script>
                            $("#bs_number").on("keydown", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            }).on("keyup", function () {
                                $(this).val($(this).val().replace(/[^0-9]/ig, ''));
                            });
                        </script>

                        <div class="row profile_title pt-2"><span>사업증</span></div>
                        <div class="row"><input id="bs_ctfc_input" type="file"
                                                class="px-0 form-control profile_input" id="bs_ctfc"></div>
                        <div class="row">
                            <img id="bs_ctfc_img" src="" alt="">
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</main>


<script>
    ////////////////////////            프로필                   ///////////////////////////////////////////////////////////

    //// 프로필 정보 수정 버튼 클릭 이벤트
    $("#modify_profile_btn").on("click", () => {
        $("#modify_profile").css("display", "block");
    });
    /////////////////첨부파일
    $("#bs_ctfc_input").on("change", handleImgFileSelect);

    //이미지 미리보기
    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;

        filesArr.forEach(function (f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
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
    }

    //이미지 저장
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
                console.log("사업증 변경에 성공하였습니다.");
            }
            , error: function (jqXHR) {
                alert(jqXHR.responseText);
            }
        });
    }

    ////프로필 저장 버튼 클릭
    $("#profile_save").click(function () {
        let bs_name = $("#bs_name").val();
        let bs_phone = $("#bs_phone").val();
        let bs_number = $("#bs_number").val();
        // 정보 저장
        $.ajax({
            url: "/updateProflie.bsPage",
            data: {
                name: bs_name,
                phone: bs_phone,
                number: bs_number
            },
            type: "post",
            success: function () {
                console.log("success!!");
            }
        });
        // 사업증 저장
        fn_submit();
        //창 닫기
        $("#modify_profile").css("display", "none");
    });

    //// 프로필 변경 취소버튼
    $("#profile_cancel").click(function () {
        $("#modify_profile").css("display", "none");
        $("#bs_name").val("${bsUser.bs_name}");
        $("#bs_phone").val("${bsUser.bs_phone}");
        $("#bs_number").val("${bsUser.bs_number}");
        $("#bs_ctfc").attr("src", "${bsCtfc.sysName}");
        $("#bs_ctfc_img").attr("src", "/resource/ctfc/${bsCtfc.sysName}");
    });

    //// 프로필 기본값
    $("#modify_profile").css("display", "none");
    $("#bs_name").val("${bsUser.bs_name}");
    $("#bs_phone").val("${bsUser.bs_phone}");
    $("#bs_number").val("${bsUser.bs_number}");
    $("#bs_ctfc").attr("src", "${bsCtfc.sysName}");
    $("#bs_ctfc_img").attr("src", "/resource/ctfc/${bsCtfc.sysName}");
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////


</script>
<%@ include file="/layout/footer.jsp" %>