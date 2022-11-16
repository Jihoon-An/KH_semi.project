<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/layout/header.jsp" %>
<!-- Gym-Modify main -->
<div class="main_margin_85" style="height: 85px;"></div>
<main id="gym-modify">
    <form id="gym-modify-form" action="/add.addGym" method="post" enctype="multipart/form-data">
        <input type="hidden" name="bsSeq" value="${bsSeq}">
        <div class="container" align="center">
            <!-- 사업자 회원가입 폼 -->

            <div class="row justify-content-center">

                <div class="col-12">

                    <div class="bs_sign_box row justify-content-center">
                        <div class="col-12">
                            <h1>시설 정보 추가 페이지</h1>
                        </div>

                        <!------------------------------ 시설 정보 --------------------------->
                        <div class="col-12 gy-5">
                            <div class="text-start" style="width: 350px">
                                <p class="text_title">시설정보</p>
                            </div>
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start">
                                <span class="inputTitle">시설이름</span>
                            </div>
                            <input type="text" name="gym_name" id="gym_name" placeholder="시설 이름을 입력하세요"
                                   value="" maxlength="15">
                            <div class="error_msg text_mini text-start" style="width: 350px">
                                <span class="error_msg_display" id="gym_name_msg"></span>
                            </div>
                        </div>

                        <div class="col-12 gy-2">
                            <div class="text-start">
                                <span class="inputTitle">시설연락처</span>
                            </div>
                            <input type="text" name="gym_phone" id="gym_phone" placeholder="시설 연락처를 입력하세요"
                                   maxlength="11" oninput=validNum() value="">
                            <div class="col-12 gy-2">
                                <div class="error_msg text_mini text-start">
                                    <span class="error_msg_display" id="gym_phone_msg"></span>
                                </div>
                            </div>
                        </div>


                        <div class="col-12 gy-2">
                            <div class="text-start">
                                <span class="inputTitle">시설가격</span>
                            </div>
                            <input type="text" name="gym_price" id="gym_price" placeholder="시설 가격을 입력하세요"
                                   value="" maxlength="40">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start">
                                <span class="inputTitle">시설 OPEN 시간</span>
                            </div>
                            <input type="text" name="gym_open" id="gym_open" placeholder="시설 OPEN 시간을 입력하세요"
                                   value="" maxlength="20">


                            <div class="text-start">
                                <span class="inputTitle">시설 CLOSE 시간</span>
                            </div>
                            <input type="text" name="gym_close" id="gym_close" placeholder="시설 CLOSE 시간을 입력하세요"
                                   value="" maxlength="20">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start" class="text-start" style="width: 350px">
                                <span style="color: #808080; font-size: x-small">시설주소</span>
                            </div>

                            <div class="zipcodebox text-start" class="text-start" style="width: 350px">
                                <label className="gym_address1-button" for="gym_address1" class="lb_gym_address1 label">우편번호를
                                    검색하세요</label>
                                <input type="text" name="gym_address1" id="gym_address1" class="gym_address1"
                                       style="display: none">
                                <input type="hidden" name="gym_x" value="">
                                <input type="hidden" name="gym_y" value="">
                            </div>

                            <div class="text-start" style="width: 350px">
                                <span style="color: #808080; font-size: x-small">시설상세주소</span>
                            </div>
                            <input type="text" name="gym_address2" id="gym_address2" class="gym_address2" placeholder="시설상세주소를 입력하세요"
                                   maxlength="40" value="${gym.gym_location}">


                            <div class="col-12 gy-2">
                                <div class="error_msg text_mini text-start" style="width: 350px">
                                    <span class="error_msg_display gym_msg"></span>
                                </div>
                            </div>
                        </div>


                        <!------------------------------ 시설 태그 --------------------------->
                        <div class="col-12 gy-5">
                            <div class="text-start" style="width: 350px">
                                <p class="text_title">시설태그</p>
                            </div>
                        </div>

                        <div class="row justify-content-center">
                            <div class="col-2 text-center">
                                <span class="inputTitle">24시간 운영</span>
                                <div class="checkbox-wrapper-55">
                                    <label class="rocker rocker-small">
                                        <input type="checkbox" name="open" id="open" class="filterCheck">
                                        <span class="switch-left">Yes</span>
                                        <span class="switch-right">No</span>
                                    </label>
                                </div>
                            </div>

                            <div class="col-2 text-center">
                                <span class="inputTitle">라커 여부</span>
                                <div class="checkbox-wrapper-55">
                                    <label class="rocker rocker-small">
                                        <input type="checkbox" name="locker" id="locker" class="filterCheck">
                                        <span class="switch-left">Yes</span>
                                        <span class="switch-right">No</span>
                                    </label>
                                </div>
                            </div>

                            <div class="col-2 text-center">
                                <span class="inputTitle">샤워시설 여부</span>
                                <div class="checkbox-wrapper-55">
                                    <label class="rocker rocker-small">
                                        <input type="checkbox" name="shower" id="shower" class="filterCheck">
                                        <span class="switch-left">Yes</span>
                                        <span class="switch-right">No</span>
                                    </label>
                                </div>
                            </div>

                            <div class="col-2 text-center">
                                <span class="inputTitle">주차장 여부</span>
                                <div class="checkbox-wrapper-55">
                                    <label class="rocker rocker-small">
                                        <input type="checkbox" name="park" id="park" class="filterCheck">
                                        <span class="switch-left">Yes</span>
                                        <span class="switch-right">No</span>
                                    </label>
                                </div>
                            </div>

                        </div>

                        <input type="hidden" name="open_result" id="open_result" value="false">
                        <input type="hidden" name="locker_result" id="locker_result" value="false">
                        <input type="hidden" name="shower_result" id="shower_result" value="false">
                        <input type="hidden" name="park_result" id="park_result" value="false">
                        <script>
                            $(".filterCheck").change(function () {
                                $("#open_result").val($("#open").is(":checked"));
                                $("#locker_result").val($("#locker").is(":checked"));
                                $("#shower_result").val($("#shower").is(":checked"));
                                $("#park_result").val($("#park").is(":checked"));
                            });
                        </script>

                        <!------------------------------ 시설 사진 --------------------------->
                        <div class="col-12 gymtitle">
                            <div class="text-start">
                                <p class="text_title">시설사진</p>
                            </div>
                        </div>

                        <div class="col-12 gy-3" id="gym_img_box">
                            <div class="row justify-content-center">
                                <div class="col-5 p-1 text-center inputTitle">대표사진</div>
                                <div class="col-5 p-1"></div>
                            </div>

                            <div class="row px-2 justify-content-center">
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img1" id="gym_img1_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img1" id="gym_img1" type="file" class="gym_imgFile">
                                </div>
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img2" id="gym_img2_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img2" id="gym_img2" type="file" class="gym_imgFile">
                                </div>
                            </div>

                            <div class="row px-2 justify-content-center">
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img3" id="gym_img3_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img3" id="gym_img3" type="file" class="gym_imgFile">
                                </div>
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img4" id="gym_img4_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img4" id="gym_img4" type="file" class="gym_imgFile">
                                </div>
                            </div>

                            <div class="row px-2 justify-content-center">
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img5" id="gym_img5_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img5" id="gym_img5" type="file" class="gym_imgFile">
                                </div>
                                <div class="col-5 p-1 text-center">
                                    <label class="gym_img" for="gym_img6" id="gym_img6_label">
                                        <img src="/resource/img/default04.png">
                                    </label>
                                    <input name="gym_img6" id="gym_img6" type="file" class="gym_imgFile">
                                </div>
                            </div>
                            <input type="hidden" name="del_img_list" id="del_img_list">
                        </div>


                    </div>

                </div>

                <div class="row gy-4 justify-content-center">
                    <div class="col-4">
                        <button type="button" class="btn_base" id="btn_modify_complete">매장 등록</button>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script>

        var htmlToText = document.getElementsByClassName("htmlToText");
        for (var i = 0; i < htmlToText.length; i++) {
            htmlToText[i].innerText = htmlToText[i].innerHTML;
        }

        $("#btn_modify_complete").on("click", function () {
            if (gymSubmitCheck()) {
                $("#gym-modify-form").submit();
            }
        })


        // 비어있는지
        function gymSubmitCheck() {
            if ($("#gym_name").val() == "") {
                wobble($("#gym_name"));
                $("#gym_name").focus();
            }
            else if ($("#gym_phone").val() == "") {
                wobble($("#gym_phone"));
                $("#gym_phone").focus();
            }
            else if ($("#gym_price").val() == "") {
                wobble($("#gym_price"));
                $("#gym_price").focus();
            }
            else if ($("#gym_open").val() == "") {
                wobble($("#gym_open"));
                $("#gym_open").focus();
            }
            else if ($("#gym_close").val() == "") {
                wobble($("#gym_close"));
                $("#gym_close").focus();
            }
            else if ($("#gym_address1").val() == "") {
                wobble($(".lb_gym_address1"));
                $(".lb_gym_address1").focus();
            }
            else if ($("#gym_address2").val() == "") {
                wobble($("#gym_address2"));
                $("#gym_address2").focus();
            }
            else {
                Swal.fire({title: "등록 성공", icon: "success", text: "등록이 완료되었습니다"});
                return true;
            }
            Swal.fire({title: "수정 실패", icon: "error", text: "수정에 실패하였습니다. 관리자에게 문의해주세요"});
            return false;
        }


        // 유효성 검사 Regex
        let gym_phoneRegex = /^0[\d]{8,10}$/;


        // 시설번호 - 값 입력 유효성 검사 display
        function gymPhoneEvent(element) {
            if (element.val() == "") {
                $("#gym_phone_msg").css("display", "block");
                $("#gym_phone_msg").css("color", "#001A41");
                $("#gym_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
            } else if (!gym_phoneRegex.test(element.val())) {
                $("#gym_phone_msg").css("display", "block");
                $("#gym_phone_msg").css("color", "red");
                $("#gym_phone_msg").html("옳바른 번호 형식을 입력해주세요");
            } else {
                $("#gym_phone_msg").css("display", "none");
                $("#gym_phone_msg").css("color", "#001A41");
                $("#gym_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
            }
        }

        $(document).on("focus", "#gym_phone", function () {
            gymPhoneEvent($(this));
        })

        $(document).on("keyup", "#gym_phone", function () {
            gymPhoneEvent($(this));
        })


        // 엔터 = 버튼 클릭
        $("#gym_name, #gym_phone, #gym_price, #gym_open, #gym_close, #gym_address1, #gym_address2").on("keyup", (e) => {
            if (e.keyCode == 13) {
                $("#btn_modify_complete").click()
            }
        });


        // input 칸에 숫자 외에 입력 안되게 막기
        function validNum() {
            event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
        }


        // 우편번호 검색
        $(document).on("click", ".lb_gym_address1", function execDaumPostcode(e) {
            new daum.Postcode({
                oncomplete: function (data) {
                    var roadAddr = data.roadAddress; // 도로명 주소 변수
                    var extraRoadAddr = ''; // 참고 항목 변수

                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraRoadAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraRoadAddr !== '') {
                        extraRoadAddr = ' (' + extraRoadAddr + ')';
                    }

                    e.target.innerHTML = roadAddr;
                    $(e.target).siblings("input[name='gym_address1']").attr("value", roadAddr);


                    var geocoder = new kakao.maps.services.Geocoder();

                    var callback = function (result, status) {
                        if (status === kakao.maps.services.Status.OK) {
                            result[0].x;
                            result[0].y;

                            $(e.target).siblings("input[name='gym_x']").val(result[0].y);
                            $(e.target).siblings("input[name='gym_y']").val(result[0].x);

                        }
                    };
                    geocoder.addressSearch(roadAddr, callback);
                }
            }).open();
        })


        // 떨림 애니메이션
        function wobble(element) {
            let order = [0, -8, 8, -4, 4, -2, 2, -1, 1, 0];
            let seq = [];
            order.forEach(function (y) {
                seq.push({transform: "translate(0," + y + "px)"});
            });
            element.animate(seq, {duration: 300});
        }

        // 유효성 검사 (공백 확인)
        function isFilled(elements) {
            for (i = 0; i < elements.length; i++) {
                if (elements.value == "") {
                    wobble(elements);
                    elements.focus();
                    return false;
                }
            }
            return true;
        }

        function isFilledZip(elements) {

            if (elements.innerHTML == "우편번호를 검색하세요") {
                wobble(elements);
                elements.style.boxShadow = "0px 1px 0px 0px black";
                elements.focus();
                var myTimer = setTimeout(function () {
                    elements.style.boxShadow = "0px 0px 0px 0px black";
                }, 1000);
                return false;
            }
            return true;
        }


        // 파일 업로드시 파일명 삽입 기능
        $('.gym_imgFile').on('change', handleImgFileSelect);

        function fileTest(element) {  // 값이 변경되면
            var reader = new FileReader();
            if (window.FileReader) {  // modern browser
                var filename = element[0].files[0].name;
            } else {  // old IE
                var filename = element.val().split('/').pop().split('\\').pop();  // 파일명만 추출
            }

            if (filename != "") {
                var ext = filename.split('.').pop().toLowerCase(); //확장자분리
                //아래 확장자가 있는지 체크

                if ($.inArray(ext, ['jpg', 'jpeg', 'gif', 'png', 'pdf']) == -1) {
                    Swal.fire({
                        icon: 'error',
                        title: '파일 형식 오류',
                        text: 'jpg, jpeg, gif, png, pdf 파일만 업로드할 수 있습니다.',
                    })
                    element.siblings('.gym_imgFile_name').html("이미지를 업로드하세요");
                    element.val("");
                    return;
                }

                let maxSize = 10 * 1024 * 1024; // 10MB
                var fileSize = element[0].files[0].size;
                if (fileSize > maxSize) {
                    Swal.fire({
                        icon: 'error',
                        title: '파일 사이즈 초과',
                        text: '첨부파일 사이즈는 10MB 이내로 등록 가능합니다.',
                    })
                    element.siblings('.gym_imgFile_name').html("이미지를 업로드하세요");
                    element.val("");
                    return;
                }

                var pattern = /[\{\}\/?;:|*~`!^\+<>@\#$%&\\\=\'\"]/gi;
                var fileName = filename.split('\\').pop().toLowerCase();
                if (pattern.test(fileName)) {
                    Swal.fire({
                        icon: 'error',
                        title: '파일 이름 오류',
                        text: '파일명에 \\ / : * ? " < > | 사용 불가능합니다.',
                    })
                    $(this).val("");
                    return;
                }

            }

            // 추출한 파일명 삽입
            element.siblings('.gym_imgFile_name').html(filename);
            element.find('.gym_imgFile').val(filename);

        };


        //이미지 미리보기
        function handleImgFileSelect(e) {
            var img = $(this).siblings(".gym_img").find("img");
            var files = e.target.files;
            var filesArr = Array.prototype.slice.call(files);

            var reg = /(.*?)\/(jpg|jpeg|png|bmp|pdf|gif)$/;

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
                    img.attr("src", e.target.result);
                }
                reader.readAsDataURL(f);
            });

        }


    </script>


</main>

<%@ include file="/layout/footer.jsp" %>

