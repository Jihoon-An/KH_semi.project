<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>
<!-- Gym-Modify main -->
<main id="gym-modify">
	<form id="form_bs_sign" method="post" enctype="multipart/form-data">

		<div class="container" align="center">
			<!-- 사업자 회원가입 폼 -->

			<div class="row justify-content-center">

				<div class="col-12">

					<div class="bs_sign_box row justify-content-center">
						<div class="col-12">
							<h1>시설 정보 수정 페이지</h1>
						</div>

						<div class="col-12 gy-5">
							<div class="text-start" style="width: 350px">
								<p class="text_title">시설정보</p>
							</div>
						</div>

						

						<div class="col-12 gy-4">
							<div class="text-start">
								<span class="inputTitle">시설이름</span>
							</div>
							<input type="text" name="gym_name" id="gym_name" placeholder="시설 이름을 입력하세요">
                            <div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="gym_name_msg"></span>
							</div>
                        </div>

                        <div class="col-12 gy-2">
							<div class="text-start">
								<span class="inputTitle">시설연락처</span>
							</div>
							<input type="text" name="gym_phone" id="gym_phone"
								placeholder="시설 연락처를 입력하세요" maxlength="11" oninput=validNum()>
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
							<input type="text" name="gym_price" id="gym_price" placeholder="시설 가격을 입력하세요">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start">
								<span class="inputTitle">시설 OPEN 시간</span>
							</div>
							<input type="text" name="gym_open" id="gym_open" placeholder="시설 OPEN 시간을 입력하세요">


                            <div class="text-start">
								<span class="inputTitle">시설 CLOSE 시간</span>
							</div>
							<input type="text" name="gym_name" id="gym_name" placeholder="시설 CLOSE 시간을 입력하세요">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start" class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설주소</span>
							</div>

							<div class="zipcodebox text-start" class="text-start"
								style="width: 350px">
								<label className="gym_address1-button" for="gym_address1"
									class="lb_gym_address1">우편번호를 검색하세요</label> <input type="text"
									name="gym_address1" class="gym_address1" style="display: none">
								<input type="text" name="gym_x" style="display: none"><input
									type="text" name="gym_y" style="display: none">

							</div>

							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설상세주소</span>
							</div>
							<input type="text" name="gym_address2" class="gym_address2"
								placeholder="시설상세주소를 입력하세요" maxlength="40">


                            <div class="col-12 gy-2">
                                <div class="error_msg text_mini text-start" style="width: 350px">
                                    <span class="error_msg_display gym_msg"></span>
                                </div>
                            </div>
                        </div>
						

                        


                        <div class="col-12 gy-5 gymtitle">
							<div class="text-start">
								<p class="text_title">시설사진</p>
							</div>
						</div>

						<div class="col-12 gy-4">
							<div class="text-start">
								<span class="inputTitle">대표사진</span>
							</div>


							<div class="filebox text-start">
								<label for="main_img" class="gym_imgFile_name">이미지를 업로드하세요</label>
                                <input type="file" name="main_img" id="main_img" class="gym_imgFile" multiple>
							</div>

						</div>
                        

                        <div class="col-12 gy-4 imgesBox">
							<div class="text-start">
								<span class="inputTitle">시설사진</span>
                                <button type="button" id="fileAdd" class="btn_outline">+</button>
							</div>

							<div class="filebox text-start">
								<label for="gym_img" class="gym_imgFile_name">이미지를 업로드하세요</label> 
                                <input type="file" name="gym_img" id="gym_img" class="gym_imgFile" multiple>
							</div>
						</div>


							


					</div>

				</div>


				<div class="col-12 gy-4">
					<button type="button" class="btn_outline" id="btn_gym_add">시설추가</button>
					<p style="color: #808080;" class="text_mini">
                        시설 추가를 원하시면 버튼을 눌러 추가 정보를 입력해주세요.
                    </p>
				</div>

				<div class="col-12 gy-4">
					<button type="button" class="btn_base" id="btn_bs_sign">회원가입</button>
				</div>

			</div>


		</div>

	</form>

	<script>

    // 이미지 파일 입력 폼 추가 기능
    let count = 1;
    
    $("#fileAdd").on("click", function(){
        if($("input[type=file]").length > 15) {
            alert("파일은 최대 15개까지만 업로드 가능합니다.");
            return;
        }

            count++;

            let fileDiv = $("<div>");
            fileDiv.addClass("filebox");
            fileDiv.addClass("text-start");

            let inputLabel = $("<label>");
            inputLabel.attr("for", "gym_img" + count)
            inputLabel.addClass("gym_imgFile_name");
            inputLabel.html("이미지를 업로드하세요");
            
            let inputFile = $("<input>");
            inputFile.attr("type", "file");
            inputFile.attr("name", "gym_img" + count);
            inputFile.attr("id", "gym_img" + count);
            inputFile.attr("onchange", "fileTest($('#gym_img" + count+"'))");
            inputFile.addClass("gym_imgFile");
            

            let delBtn = $("<a>");
            delBtn.html("x");
            delBtn.addClass("line-del");
            delBtn.on("click", function(){
                $(this).parent().parent().remove();
            })
            
            
            inputLabel.append(delBtn);
            fileDiv.append(inputLabel);
            fileDiv.append(inputFile);
            
            $(".imgesBox").append(fileDiv);
    });


    
    // 파일 업로드시 파일명 삽입 기능
    $('.filebox .gym_imgFile').on('change', function () {
        fileTest($(this));
    })
    
    function fileTest(element) {  // 값이 변경되면
        if (window.FileReader) {  // modern browser
            var filename = element[0].files[0].name;
        }
        else {  // old IE
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





    // input 칸에 숫자 외에 입력 안되게 막기
    function validNum() {
        event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
    }

    // 시설 추가
    var addBtnCount = 0;
    $("#btn_gym_add").on("click", function () {
    	
        if( $("#bs_email").val()!="" 
        	&& $("#bs_pw").val()!="" 
        	&& $("#bs_pw_re").val()!="" 
        	&& $("#bs_name").val()!="" 
        	&& $("#bs_phone").val()!="" 
        	&& $("#bs_number").val()!="" 
        	&& $(".gym_name").val()!="" 
        	&& $(".gym_phone").val()!="" 
        	&& $(".gym_address1").val()!="" 
            && $(".gym_address2").val()!="" 
        ) {
        
            addBtnCount++;

            if (addBtnCount < 6) {
                let add_box_main = $("<div class='col-12 gym_add_box_main'>");
                let add_box = $("<div class='gym_add_box row gy-3'>")
                add_box_main.append(add_box)
                let delBtn = $("<a>")
                delBtn.append("<i class='fa-solid fa-x' style='color:#808080'>");
                delBtn.addClass("del").on("click", function () {
                    $(this).closest(".gym_add_box_main").remove();
                });
                add_box.append(delBtn);
                add_box.append("<div class='col-12'><div class='text-start' style='width:350px'><p class='text_title'>추가시설</p></div></div><div class='col-12 gy-3'><div class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>시설명</span></div><input type='text' name='gym_name' class='gym_name' placeholder='시설명을 입력하세요' maxlength='20'><div class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>시설연락처</span></div><input type='text' name='gym_phone' class='gym_phone' placeholder='연락처를 입력하세요' maxlength='11' oninput=validNum()><div class='text-start' class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>시설주소</span></div><div class='zipcodebox text-start' class='text-start' style='width:350px'><label className='gym_address1-button' for='gym_address1' class='lb_gym_address1'>우편번호를 검색하세요</label><input type='text' name='gym_address1' class='gym_address1' style='display:none'><input type='text' name='gym_x' style='display: none'><input type='text' name='gym_y' style='display: none'></div><div class='text-start' style='width:350px'><span style='color:#808080; font-size:x-small'>시설상세주소</span></div><input type='text' name='gym_address2' class='gym_address2' placeholder='시설상세주소를 입력하세요' maxlength='40'></div><div class='col-12 gy-2'><div class='error_msg text_mini text-start' style='width:350px'><span class='error_msg_display gym_msg'></span></div></div>")
                add_box_main.hide();

                $("#btn_gym_add").before(add_box_main);

                add_box_main.fadeIn(1000);
            } else {
                Swal.fire({
                    icon: 'error',
                    title: '시설 추가 불가',
                    text: '더이상의 시설 추가가 불가능합니다. 관리자에게 문의해주세요.',
                })
                return;
            }
            
        } else {
                Swal.fire({
                    icon: 'error',
                    title: '내용 미입력',
                    text: '모든 내용을 작성 후 추가해주세요.',
                })
                return;
            }
    })


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
        order.forEach(function (y) { seq.push({ transform: "translate(0," + y + "px)" }); });
        element.animate(seq, { duration: 300 });
    }

    // 유효성 검사 (공백 확인)
    function isBsFilled(elements) {
        for (i = 0; i < elements.length; i++) {
            if (elements[i].value == "") {
                wobble(elements[i]);
                elements[i].focus();
                return false;
            }
        }
        return true;
    }

    function isBsFilledFile(elements) {
        for (i = 0; i < elements.length; i++) {
            if (elements[i].innerHTML == "이미지를 업로드하세요") {
                wobble(elements[i]);
                elements[i].style.boxShadow = "0px 1px 0px 0px black";
                elements[i].focus();
                var myTimer = setTimeout(function() { elements[i].style.boxShadow = "0px 0px 0px 0px black"; }, 1000);
                return false;
            }
        }
        return true;
    }

    function isBsFilledZip(elements) {
        for (i = 0; i < elements.length; i++) {
            if (elements[i].innerHTML == "우편번호를 검색하세요") {
            	wobble(elements[i]);
                elements[i].style.boxShadow = "0px 1px 0px 0px black";
                elements[i].focus();
                var myTimer = setTimeout(function() { elements[i].style.boxShadow = "0px 0px 0px 0px black"; }, 1000);
                return false;
            }
        }
        return true;
    }

    // 회원가입 함수
    function tryBsSign() {

        /// event.preventDefault();
        var url = $("#form_bs_sign").attr("action");
        var form = $('#form_bs_sign')[0];
        var formData = new FormData(form);

        $.ajax({
            url: "/sign.bs",
            type: 'POST',
            data: formData,
            success: function (resp) {
            	
            	if (resp == "1") {
	                Swal.fire({ title: "Success!", icon: "success", text: "회원가입이 되었습니다" })
	                    .then((result) => {
	                        if (result.isConfirmed) { location.reload(); }
	                    });
            	} else {
            		Swal.fire({ title: "회원가입실패", icon: "error", text: "회원가입에 실패하였습니다. 관리자에게 문의해주세요" });
            	}
            	
            },
            error: function (data) {
                Swal.fire({ title: "관리자 문의", icon: "error", text: "오류가 발생되었습니다. 관리자에게 문의해주세요" });
            },
            cache: false,
            contentType: false,
            processData: false
        });

        
    }
    

    // 버튼 이벤트
    $("#btn_bs_sign").on("click", () => {

        if ($("#bs_email_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#bs_email")[0]); $("#bs_email").focus(); }
        else if ($("#bs_pw_re_msg").css("color") == "rgb(255, 0, 0)") {
            if ($("#bs_pw_re_msg").html() == "특수문자를 포함한 8~16자리 입력해주세요") { wobble($("#bs_pw")[0]); $("#bs_pw").focus(); }
            else if ($("#bs_pw_re_msg").html() == "동일한 비밀번호를 입력해주세요") { wobble($("#bs_pw_re")[0]); $("#bs_pw_re").focus(); }
        }
        else if ($("#bs_phone_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#bs_phone")[0]); $("#bs_phone").focus(); }
        else if ($("#bs_number_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#bs_number")[0]); $("#bs_number").focus(); }

        else {
            if (isBsFilled($("#bs_email, #bs_pw, #bs_pw_re, #bs_name, #bs_phone, #bs_number")) 
            && isBsFilledFile($(".bs_regl_name"))
            && isBsFilled($(".gym_name, .gym_phone")) 
            && isBsFilledZip($(".lb_gym_address1"))
            && isBsFilled($(".gym_address2"))
            ) { tryBsSign(); } 
        }

    });


            // 유효성 검사 Regex
            let bsPhoneRegex = /^0[\d]{8,10}$/;
            let bsNumberRegex = /^[1-6][\d]{7}[1-9][\d]$/;


            // 시설번호 - 값 입력 유효성 검사 display
            function gymPhoneEvent(element) {
                if (element.val() == "") {
                    element.parent().next().find(".gym_msg").css("display", "block");
                    element.parent().next().find(".gym_msg").css("color", "#001A41");
                    element.parent().next().find(".gym_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
                } else if (!bsPhoneRegex.test(element.val())) {
                    element.parent().next().find(".gym_msg").css("display", "block");
                    element.parent().next().find(".gym_msg").css("color", "red");
                    element.parent().next().find(".gym_msg").html("옳바른 번호 형식을 입력해주세요");
                } else {
                    element.parent().next().find(".gym_msg").css("display", "none");
                    element.parent().next().find(".gym_msg").css("color", "#001A41");
                    element.parent().next().find(".gym_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
                }
            }

            $(document).on("focus", ".gym_phone", function () {
                gymPhoneEvent($(this));
            })

            $(document).on("keyup", ".gym_phone", function () {
                gymPhoneEvent($(this));
            })



            // 엔터 = 버튼 클릭
            $("#bs_email, #bs_pw, #bs_pw_re, #bs_name, #bs_phone, #bs_number, #file, .gym_name, .gym_phone, .gym_address1, .gym_address2").on("keyup", (e) => { if (e.keyCode == 13) { $("#bs_btn_sign").click() } });


        </script>


</main>

<%@ include file="/layout/footer.jsp"%>