<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/layout/header.jsp" %>


<!-- Site Main -->
<main id="write_review" style="margin-top:70px">

    <div class="containerbox">
        <section>
            <form action="" id="modify_review_frm" method="post"
                  enctype="multipart/form-data">
                <input type="hidden" name="gym_seq" value="${gym_seq}">
                <input type="hidden" name="review_seq" value="${review_seq}">
                ${review_seq}

                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <p style="margin-bottom: 5px"><span class="text_main_title_600">${gym_name}</span>
                            <span class="text_title">에 방문하셨나요?</span></p>
                        <h1 style="margin: 0px">리뷰를 수정해주세요</h1>
                        <p style="margin-top: 15px" class="text_normal">필수 항목입니다</p>
                    </div>


                    <div class="reviw_content reviw_content_star">
                        <div class="star-rating space-x-4 mx-auto">
                            <c:if test="${review.review_star == '5'}">
                                <input type="radio" id="5-stars" class="star" name="review_star" value="5" checked>
                                <label for="5-stars" class="startext pr-4">★</label>
                                <input type="radio" id="4-stars" class="star" name="review_star" value="4">
                                <label for="4-stars" class="startext">★</label>
                                <input type="radio" id="3-stars" class="star" name="review_star" value="3">
                                <label for="3-stars" class="startext">★</label>
                                <input type="radio" id="2-stars" class="star" name="review_star" value="2">
                                <label for="2-stars" class="startext">★</label>
                                <input type="radio" id="1-star" class="star" name="review_star" value="1">
                                <label for="1-star" class="startext">★</label>
                            </c:if>
                            <c:if test="${review.review_star == '4'}">
                                <input type="radio" id="5-stars" class="star" name="review_star" value="5">
                                <label for="5-stars" class="startext pr-4">★</label>
                                <input type="radio" id="4-stars" class="star" name="review_star" value="4" checked>
                                <label for="4-stars" class="startext">★</label>
                                <input type="radio" id="3-stars" class="star" name="review_star" value="3">
                                <label for="3-stars" class="startext">★</label>
                                <input type="radio" id="2-stars" class="star" name="review_star" value="2">
                                <label for="2-stars" class="startext">★</label>
                                <input type="radio" id="1-star" class="star" name="review_star" value="1">
                                <label for="1-star" class="startext">★</label>
                            </c:if>
                            <c:if test="${review.review_star == '3'}">
                                <input type="radio" id="5-stars" class="star" name="review_star" value="5">
                                <label for="5-stars" class="startext pr-4">★</label>
                                <input type="radio" id="4-stars" class="star" name="review_star" value="4">
                                <label for="4-stars" class="startext">★</label>
                                <input type="radio" id="3-stars" class="star" name="review_star" value="3" checked>
                                <label for="3-stars" class="startext">★</label>
                                <input type="radio" id="2-stars" class="star" name="review_star" value="2">
                                <label for="2-stars" class="startext">★</label>
                                <input type="radio" id="1-star" class="star" name="review_star" value="1">
                                <label for="1-star" class="startext">★</label>
                            </c:if>
                            <c:if test="${review.review_star == '2'}">
                                <input type="radio" id="5-stars" class="star" name="review_star" value="5">
                                <label for="5-stars" class="startext pr-4">★</label>
                                <input type="radio" id="4-stars" class="star" name="review_star" value="4">
                                <label for="4-stars" class="startext">★</label>
                                <input type="radio" id="3-stars" class="star" name="review_star" value="3">
                                <label for="3-stars" class="startext">★</label>
                                <input type="radio" id="2-stars" class="star" name="review_star" value="2" checked>
                                <label for="2-stars" class="startext">★</label>
                                <input type="radio" id="1-star" class="star" name="review_star" value="1">
                                <label for="1-star" class="startext">★</label>
                            </c:if>
                            <c:if test="${review.review_star == '1'}">
                                <input type="radio" id="5-stars" class="star" name="review_star" value="5">
                                <label for="5-stars" class="startext pr-4">★</label>
                                <input type="radio" id="4-stars" class="star" name="review_star" value="4">
                                <label for="4-stars" class="startext">★</label>
                                <input type="radio" id="3-stars" class="star" name="review_star" value="3">
                                <label for="3-stars" class="startext">★</label>
                                <input type="radio" id="2-stars" class="star" name="review_star" value="2">
                                <label for="2-stars" class="startext">★</label>
                                <input type="radio" id="1-star" class="star" name="review_star" value="1" checked>
                                <label for="1-star" class="startext">★</label>
                            </c:if>


                        </div>
                        <div class="mx-auto p-2 " style="text-align: center;">
                            <font size=5 id="slider_star_value1">${review.review_star}</font> 점
                            <font size=2 id="slider_star_value_text1"></font>
                        </div>
                    </div>
                </div>

                <hr class="line2">

                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <span class="text_main_title">이 장소에 어울리는 <br>
                            <h2 style="display: inline-flex">키워드는 어떤건가요?</h2> <span
                                    class="text_normal">(1~5개)</span></span>
                        <p style="margin-top: 15px" class="text_normal">선택 항목입니다</p>
                    </div>


                    <div class="reviw_content reviw_content_keyword">
                        <div class="checkbox-wrap mx-auto">
                            <c:if test="${review.review_check1 == 'Y'}"><input class="inp-cbx" id="review_check1"
                                                                               type="checkbox" name="review_check1"
                                                                               checked></c:if>
                            <c:if test="${review.review_check1 != 'Y'}"><input class="inp-cbx" id="review_check1"
                                                                               type="checkbox"
                                                                               name="review_check1"></c:if>
                            <label class="cbx" for="review_check1"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span>
										<img src="/resource/img/review_check1_icon.png" class="checkIcon"> 자세를 꼼꼼히 봐주세요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <c:if test="${review.review_check2 == 'Y'}"><input class="inp-cbx" id="review_check2"
                                                                               type="checkbox" name="review_check2"
                                                                               checked></c:if>
                            <c:if test="${review.review_check2 != 'Y'}"><input class="inp-cbx" id="review_check2"
                                                                               type="checkbox"
                                                                               name="review_check2"></c:if>
                            <label class="cbx" for="review_check2"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/img/review_check2_icon.png"
                                                                class="checkIcon"> 상담이 자세해요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <c:if test="${review.review_check3 == 'Y'}"><input class="inp-cbx" id="review_check3"
                                                                               type="checkbox" name="review_check3"
                                                                               checked></c:if>
                            <c:if test="${review.review_check3 != 'Y'}"><input class="inp-cbx" id="review_check3"
                                                                               type="checkbox"
                                                                               name="review_check3"></c:if>
                            <label class="cbx" for="review_check3"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/img/review_check3_icon.png"
                                                                class="checkIcon"> 공간이 넓어요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <c:if test="${review.review_check4 == 'Y'}"><input class="inp-cbx" id="review_check4"
                                                                               type="checkbox" name="review_check4"
                                                                               checked></c:if>
                            <c:if test="${review.review_check4 != 'Y'}"><input class="inp-cbx" id="review_check4"
                                                                               type="checkbox"
                                                                               name="review_check4"></c:if>
                            <label class="cbx" for="review_check4"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/img/review_check4_icon.png"
                                                                class="checkIcon"> 기구가 다양해요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <c:if test="${review.review_check5 == 'Y'}"><input class="inp-cbx" id="review_check5"
                                                                               type="checkbox" name="review_check5"
                                                                               checked></c:if>
                            <c:if test="${review.review_check5 != 'Y'}"><input class="inp-cbx" id="review_check5"
                                                                               type="checkbox"
                                                                               name="review_check5"></c:if>
                            <label class="cbx" for="review_check5"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/img/review_check5_icon.png"
                                                                class="checkIcon"> 시설이 깔끔해요</span>
                            </label>
                        </div>
                    </div>


                </div>

                <hr class="line2">


                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <p style="margin-bottom: 5px"><span class="text_main_title_600">${gym_name}</span>
                            <span class="text_title">에 대한</span></p>
                        <h2 style="margin-bottom: 15px">솔직한 평가를 남겨주세요</h2>

                        <p style="margin-top: 15px" class="text_normal">필수 항목입니다</p>
                        <p class="star_value"><span class="text_main_title">만족도 <span
                                id="slider_star_value2">${review.review_star}</span>점을
                            주셨습니다. </span><span id="slider_star_value_text2"></span></p>

                        <div class="text_mini reviw_policy">
                            <p class="text_normal"><b>리뷰 정책을 위반하는 경우, 통보없이 리뷰를 숨김처리할 수 있습니다.</b></p>
                            <ul>
                                <li>잘못된 사진을 업로드하여 정상 이용 완료 되지않은 시설에 대해 리뷰를 작성한 경우</li>
                                <li>장소와 무관한 내용이나 사진, 동일 문자의 반복 등의 부적합한 내용을 포함한 경우</li>
                                <li>욕설, 비방, 명예훼손을 포함한 내용이 포함한 내용이 있는 경우</li>
                                <li>저작권, 초상권 등 타인의 권리, 명예, 신용, 기타 정당한 이익을 침해하는 경우</li>
                            </ul>
                        </div>
                    </div>

                    <div class="review_text_box">
                        <textarea id="review_contents" name="review_contents"
                                  placeholder="다른 사용자들이 상처받지 않도록 좋은 표현을 사용해주세요.&#13;&#10;시설 이용에 도움되는 TIP도 같이 남겨주세요">${review.review_contents}</textarea>
                        <div id="review_text_cnt"></div>
                    </div>


                </div>

                <hr class="line2">

                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <h2 style="margin-bottom: 15px"><p style="margin-bottom: 5px">실제 리뷰</p>
                            인증을 해주세요
                        </h2>
                        <span class="text_normal">선택 항목입니다</span>

                        <div class="text_mini review_photo_info">
                            <p class="text_normal"><b>시설 회원권이나 영수증 등 시설 이용권에 대한 사진을 찍어 업로드 해주시면 <br>
                                운영자 확인 후 인증 리뷰어 뱃지를 등록해드립니다.</b></p>
                            <ul>
                                <li>인증 리뷰어 뱃지는 리뷰를 보는 다른 이들에게 신뢰감을 높여줍니다.</li>
                                <li>인증 리뷰어 뱃지 획득시 베스트 리뷰에 등록될 확률이 높습니다.</li>
                            </ul>

                        </div>
                    </div>

                    <div>
                        <c:if test="${review.review_photo == '인증완료'}">
                            <label for="review_photo" class="btn_check">
                                실제 리뷰 인증이 완료되었습니다.
                            </label>
                            <input type="hidden" id="review_photo" style="display:none" name="review_photo">
                        </c:if>

                        <c:if test="${review.review_photo != '인증완료'}">
                            <label for="review_photo" class="btn_check">
                                <i class="fa-regular fa-square-plus"></i>&nbsp; 시설 회원권 또는 영수증 첨부하기
                            </label>
                            <input type="file" id="review_photo" style="display:none" name="review_photo">
                            <div>
                                <c:if test="${review.review_photo == '인증실패'}">
                                    <div class="p-2" id="review_photo_fail">인증 실패 되었습니다. 첨부를 다시 해주세요.</div>
                                    <div class="img_wrap">
                                        <img src="/resource/review/${review.review_photo}" id="review_photo_view"/>
                                    </div>
                                </c:if>
                                <c:if test="${review.review_photo != null && review.review_photo != '인증실패' && review.review_photo != '인증완료'}">
                                    <div class="p-2">이미지 미리보기</div>
                                    <div class="img_wrap">
                                        <img src="/resource/review/${review.review_photo}" id="review_photo_view"/>
                                    </div>
                                </c:if>

                            </div>
                        </c:if>
                    </div>

                </div>

                <hr class="line">

                <div class="d-flex justify-content-center" style="margin-top: 60px">
                    <button type="button" class="btn_outline" id="btn_cancle" style="font-size: 20px">수정 취소하기</button>
                    <button type="button" class="btn_base" id="btn_write" style="font-size: 20px">리뷰 수정하기</button>
                </div>

                <hr class="line2">
            </form>
        </section>

    </div>

</main>


<script>

    // 별점 무조건 선택해야 submit 되기
    $("#btn_write").on("click", function click() {
        if (!$("input[name=review_star]").is(":checked")) {
            Swal.fire({
                icon: 'error',
                title: '별점 미선택',
                text: '시설에 대한 별점을 꼭 선택해주세요',
                confirmButtonText: '확인'
            })
            return false;
        } else if ($("#review_contents").val() == "") {
            Swal.fire({
                icon: 'error',
                title: '리뷰 미입력',
                text: '시설에 대한 리뷰를 꼭 남겨주세요',
                confirmButtonText: '확인'
            })
            return false;
        } else if (!response($("#review_contents").val())) {
            return false;
        } else {
            // review_check checked 값 바꾸기
            if ($("#review_check1").is(":checked") == true) {
                $('#review_check1').val("Y");
            } else {
                $('#review_check1').val("");
            }

            if ($("#review_check2").is(":checked") == true) {
                $('#review_check2').val("Y");
            } else {
                $('#review_check2').val("");
            }

            if ($("#review_check3").is(":checked") == true) {
                $('#review_check3').val("Y");
            } else {
                $('#review_check3').val("");
            }

            if ($("#review_check4").is(":checked") == true) {
                $('#review_check4').val("Y");
            } else {
                $('#review_check4').val("");
            }

            if ($("#review_check5").is(":checked") == true) {
                $('#review_check5').val("Y");
            } else {
                $('#review_check5').val("");
            }

            Swal.fire({title: "Success!", icon: "success", text: "리뷰 수정을 완료하였습니다."})
                .then((result) => {
                    if (result.isConfirmed) {
                        $("#modify_review_frm").attr("action", "/reviewModifing.gym");
                        $("#modify_review_frm").submit();
                    }
                });
        }
    })

    // 리뷰 글쓰기에 욕설 필터링
    function response(msg) {
        var words = ["씨발", "시발", "ㅅㅂ", "tq", "병신", "멍청이", "바보",
            "새끼", "미친", "존나", "좆같네", "좆같다", "지랄", "염병", "썅",
            "개같은", "새키", "족같네", "씨팔", "죽어", "죽여", "자살", "놈", "년",
            "씹", "씨벌", "개색기", "종나", "카악", "퉤", "퉷", "족같네"];

        for (let n = 0; n < words.length; n++) {
            if (msg.includes(words[n])) {
                Swal.fire({
                    icon: 'error',
                    title: '필터 감지',
                    text: words[n] + ' 해당 단어는 사용 불가입니다',
                    confirmButtonText: '확인'
                })
                return false;
            }
        }
        return true;
    }

    // 취소버튼 뒤로가기
    $("#btn_cancle").on("click", () => {
        history.back();
    })


    // review_check checked 값 바꾸기
    $('#review_check1').on("click", function () {
        if ($("#review_check1").is(":checked") == true) {
            $('#review_check1').val("Y");
        } else {
            $('#review_check1').val("");
        }
    });

    $('#review_check2').on("click", function () {
        if ($("#review_check2").is(":checked") == true) {
            $('#review_check2').val("Y");
        } else {
            $('#review_check2').val("");
        }
    });

    $('#review_check3').on("click", function () {
        if ($("#review_check3").is(":checked") == true) {
            $('#review_check3').val("Y");
        } else {
            $('#review_check3').val("");
        }
    });

    $('#review_check4').on("click", function () {
        if ($("#review_check4").is(":checked") == true) {
            $('#review_check4').val("Y");
        } else {
            $('#review_check4').val("");
        }
    });

    $('#review_check5').on("click", function () {
        if ($("#review_check5").is(":checked") == true) {
            $('#review_check5').val("Y");
        } else {
            $('#review_check5').val("");
        }
    });


    // 텍스트 글자수 세기
    $(document).ready(function () {
        $('#review_text_cnt').html("(" + $("#review_contents").val().length + "/1000자)");

        $('#review_contents').on('keyup', function () {
            $('#review_text_cnt').html("(" + $(this).val().length + "/1000자)");

            if ($(this).val().length > 1000) {
                $(this).val($(this).val().substring(0, 1000));
                $('#review_text_cnt').html("(1000/1000)");
            }
        });
    });


    // 별점
    function ShowSliderValue(sVal) {
        var obValueView1 = document.getElementById("slider_star_value1");
        var obValueView2 = document.getElementById("slider_star_value2");
        obValueView1.innerHTML = sVal;
        obValueView2.innerHTML = sVal;
    }

    function ShowSliderText(sVal) {
        var obTextView1 = document.getElementById("slider_star_value_text1");
        var obTextView2 = document.getElementById("slider_star_value_text2");

        if (sVal == "5") {
            obTextView1.innerHTML = "(최고예요)"
            obTextView2.innerHTML = "어떤 점이 좋으셨나요?"
        } else if (sVal == "4") {
            obTextView1.innerHTML = "(좋아요)"
            obTextView2.innerHTML = "어떤 점이 좋으셨나요?"
        } else if (sVal == "3") {
            obTextView1.innerHTML = "(괜찮아요)"
            obTextView2.innerHTML = "어떤 점이 좋으셨나요?"
        } else if (sVal == "2") {
            obTextView1.innerHTML = "(그저그래요)"
            obTextView2.innerHTML = "어떤 점이 아쉬우셨나요?"
        } else if (sVal == "1") {
            obTextView1.innerHTML = "(별로예요)"
            obTextView2.innerHTML = "어떤 점이 아쉬우셨나요?"
        } else {
            obTextView1.innerHTML = "만족도를 선택해주세요."
            obTextView2.innerHTML = "만족도를 선택해주세요."
        }
    }

    var RangeSlider = function () {
        var range = $('.star');

        range.on('input', function () {
            ShowSliderValue(this.value);
            ShowSliderText(this.value);
        });
    };

    RangeSlider();


    //이미지 미리보기

    $(document).ready(function () {
        $("#review_photo").on("change", handleImgFileSelect);
    });

    $("#review_photo").on("change", () => {
        var review_photo_fail = document.getElementById("review_photo_fail");
        review_photo_fail.innerHTML = "미리보기";
    });


    function handleImgFileSelect(e) {
        var files = e.target.files;
        var filesArr = Array.prototype.slice.call(files);

        var reg = /(.*?)\/(jpg|jpeg|png|bmp|gif|pdf)$/;

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
                $("#review_photo_view").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });

        pi_check = true;
    }

</script>


<%@ include file="/layout/footer.jsp" %>