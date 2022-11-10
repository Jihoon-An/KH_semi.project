<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="/layout/header.jsp" %>


<!-- Site Main -->
<main id="write_review" style="margin-top:70px">

    <div class="containerbox">
        <section>
            <form action="/write.review" id="write_review_frm" method="post" enctype="multipart/form-data">


                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <p style="margin-bottom: 5px"><span class="text_main_title_600">에이블짐</span>
                            <span class="text_title">에 방문하셨나요?</span></p>
                        <h1>리뷰를 작성해주세요</h1>
                    </div>


                    <div class="reviw_content reviw_content_star">
                        <div class="star-rating space-x-4 mx-auto">
                            <input type="radio" id="5-stars" class="star" name="rating" value="5">
                            <label for="5-stars" class="startext pr-4">★</label>
                            <input type="radio" id="4-stars" class="star" name="rating" value="4">
                            <label for="4-stars" class="startext">★</label>
                            <input type="radio" id="3-stars" class="star" name="rating" value="3">
                            <label for="3-stars" class="startext">★</label>
                            <input type="radio" id="2-stars" class="star" name="rating" value="2">
                            <label for="2-stars" class="startext">★</label>
                            <input type="radio" id="1-star" class="star" name="rating" value="1">
                            <label for="1-star" class="startext">★</label>
                        </div>
                        <div class="mx-auto p-2 " style="text-align: center;">
                            <font size=5 id="slider_star_value1">0</font> 점
                            <font size=2 id="slider_star_value_text1"></font>
                        </div>
                    </div>
                </div>

                <hr class="line">

                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <span class="text_main_title">이 장소에 어울리는 <br>
                            <h2 style="display: inline-flex">키워드는 어떤건가요?</h2> <span
                                    class="text_normal">(1~5개)</span></span>
                    </div>


                    <div class="reviw_content reviw_content_keyword">

                        <div class="checkbox-wrap mx-auto">
                            <input class="inp-cbx" id="review_check1" type="checkbox">
                            <label class="cbx" for="review_check1"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span>
										<img src="/resource/review/review_check1_icon.png" class="checkIcon"> 자세를 꼼꼼히
										봐주세요</span>
                            </label>
                        </div>


                        <div class="checkbox-wrap mx-auto">
                            <input class="inp-cbx" id="review_check2" type="checkbox">
                            <label class="cbx" for="review_check2"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/review/review_check2_icon.png"
                                                                class="checkIcon"> 상담이 자세해요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <input class="inp-cbx" id="review_check3" type="checkbox">
                            <label class="cbx" for="review_check3"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/review/review_check3_icon.png"
                                                                class="checkIcon"> 공간이 넓어요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <input class="inp-cbx" id="review_check4" type="checkbox">
                            <label class="cbx" for="review_check4"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/review/review_check4_icon.png"
                                                                class="checkIcon"> 기구가 다양해요</span>
                            </label>
                        </div>

                        <div class="checkbox-wrap mx-auto">
                            <input class="inp-cbx" id="cbx-46" type="checkbox">
                            <label class="cbx" for="cbx-46"><span>
										<svg width="12px" height="10px" viewbox="0 0 12 10">
											<polyline points="1.5 6 4.5 9 10.5 1"></polyline>
										</svg></span><span><img src="/resource/review/review_check5_icon.png"
                                                                class="checkIcon"> 시설이 깔끔해요</span>
                            </label>
                        </div>

                    </div>


                </div>

                <hr class="line2">


                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <h2 style="margin-bottom: 15px"><p style="margin-bottom: 5px">에이블짐 <span
                                class="text_title">에 대한</span></p>솔직한 평가를 남겨주세요
                        </h2>

                        <p class="star_value"><span class="text_main_title">만족도 <span
                                id="slider_star_value2">0</span>점을
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
							<textarea id="review_text" name="review_text"
                                      placeholder="다른 사용자들이 상처받지 않도록 좋은 표현을 사용해주세요.&#13;&#10;시설 이용에 도움되는 TIP도 같이 남겨주세요"></textarea>
                        <div id="review_text_cnt">(0 / 1000자)</div>
                    </div>


                </div>

                <hr class="line2">

                <div class="d-flex flex-row mb-3">
                    <div class="p-2 reviw_title">
                        <h2 style="margin-bottom: 15px"><p style="margin-bottom: 5px">실제 리뷰</p>
                            인증을 해주세요
                        </h2>
                        <span class="text_normal">선택 항목입니다</span>

                        <div class="text_mini reviw_img_info">
                            <p class="text_normal"><b>시설 회원권이나 영수증 등 시설 이용권에 대한 사진을 찍어 업로드 해주시면 <br>
                                운영자 확인 후 인증 리뷰어 뱃지를 등록해드립니다.</b></p>
                            <ul>
                                <li>인증 리뷰어 뱃지는 리뷰를 보는 다른 이들에게 신뢰감을 높여줍니다.</li>
                                <li>인증 리뷰어 뱃지 획득시 베스트 리뷰에 등록될 확률이 높습니다.</li>
                            </ul>

                        </div>
                    </div>

                    <div>
                        <label for="review_img" class="btn_check">
                            <i class="fa-regular fa-square-plus"></i>&nbsp; 시설 회원권 또는 영수증 첨부하기
                        </label>
                        <input type="file" id="review_img" style="display:none">
                        <div>
                            <div class="p-2">이미지 미리보기</div>
                            <div class="img_wrap">
                                <img id="review_img_view"/>
                            </div>
                        </div>

                    </div>

                </div>

                <hr class="line">

                <div class="d-flex justify-content-center" style="margin-top: 60px">
                    <button type="button" class="btn_outline" id="btn_cancle" style="font-size: 20px">등록 취소하기</button>
                    <button class="btn_base" id="btn_write" style="font-size: 20px">리뷰 등록하기</button>
                </div>

                <hr class="line2">

            </form>
        </section>

    </div>

</main>


<script>

    // 텍스트 글자수 세기

    $(document).ready(function () {
        $('#review_text').on('keyup', function () {
            $('#review_text_cnt').html("(" + $(this).val().length + " / 1000자)");

            if ($(this).val().length > 1000) {
                $(this).val($(this).val().substring(0, 1000));
                $('#review_text_cnt').html("(1000 / 1000)");
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


    $(document).ready(function () {
        $("#review_img").on("change", handleImgFileSelect);
    });


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
                $("#review_img_view").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });

        pi_check = true;
    }


    //이미지 저장
    function fn_submit() {

        var form = new FormData();
        form.append("review_img_in", $("#review_img_in")[0].files[0]);

        $.ajax({
            url: "/modifyPI.userMyPage"
            , type: "POST"
            , processData: false
            , contentType: false
            , data: form
            , success: function (response) {
                console.log("프로필 변경에 성공하였습니다.");
            }
            , error: function (jqXHR) {
                alert(jqXHR.responseText);
            }
        });
    }


</script>


<%@ include file="/layout/footer.jsp" %>