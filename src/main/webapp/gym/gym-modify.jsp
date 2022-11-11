<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>
<!-- Gym-Modify main -->
<main id="gym-modify">
	<form id="gym-modify-form" action="/updateGym.bsPage" method="post">
        <input type="hidden" name="gymSeq" value="${gym.gym_seq}">
        <input type="hidden" name="bsSeq" value="777">
		<div class="container" align="center">
			<!-- 사업자 회원가입 폼 -->

			<div class="row justify-content-center">

				<div class="col-12">

					<div class="bs_sign_box row justify-content-center">
						<div class="col-12">
							<h1>시설 정보 수정 페이지</h1>
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
							<input type="text" name="gym_name" id="gym_name" placeholder="시설 이름을 입력하세요" value="${gym.gym_name}">
                            <div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="gym_name_msg"></span>
							</div>
                        </div>

                        <div class="col-12 gy-2">
							<div class="text-start">
								<span class="inputTitle">시설연락처</span>
							</div>
							<input type="text" name="gym_phone" id="gym_phone" placeholder="시설 연락처를 입력하세요" maxlength="11" oninput=validNum() value="${gym.gym_phone}">
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
							<input type="text" name="gym_price" id="gym_price" placeholder="시설 가격을 입력하세요" value="${gym.gym_price}">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start">
								<span class="inputTitle">시설 OPEN 시간</span>
							</div>
							<input type="text" name="gym_open" id="gym_open" placeholder="시설 OPEN 시간을 입력하세요" value="${gym.gym_open}">


                            <div class="text-start">
								<span class="inputTitle">시설 CLOSE 시간</span>
							</div>
							<input type="text" name="gym_close" id="gym_close" placeholder="시설 CLOSE 시간을 입력하세요" value="${gym.gym_close}">
                        </div>


                        <div class="col-12 gy-4">
                            <div class="text-start" class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설주소</span>
							</div>

							<div class="zipcodebox text-start" class="text-start" style="width: 350px">
								<label className="gym_address1-button" for="gym_address1" class="lb_gym_address1 label">우편번호를 검색하세요</label> 
                                <input type="text" name="gym_address1" class="gym_address1" style="display: none">
								<input type="hidden" name="gym_x" value="${gym.gym_x}">
                                <input type="hidden" name="gym_y" value="${gym.gym_y}">
							</div>
                            
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설상세주소</span>
							</div>
							<input type="text" name="gym_address2" class="gym_address2" placeholder="시설상세주소를 입력하세요" maxlength="40" value="${gym.gym_location}">
                            
                            
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
                        
                        
                        <div class="col-2 text-center">
                            <span class="inputTitle">24시간 운영</span>
                            <div class="checkbox-wrapper-55">
                                <label class="rocker rocker-small">
                                    <c:if test="${gymFilter.open eq 'true'}">
                                        <input type="checkbox" name="open" id="open" class="filterCheck" checked>
                                    </c:if>
                                    <c:if test="${gymFilter.open ne 'true'}">
                                        <input type="checkbox" name="open" id="open" class="filterCheck">
                                    </c:if>
                                    <span class="switch-left">Yes</span>
                                    <span class="switch-right">No</span>
                                </label>
                            </div>
                        </div>
                        
                        <div class="col-2 text-center">
                            <span class="inputTitle">라커 여부</span>
                            <div class="checkbox-wrapper-55">
                                <label class="rocker rocker-small">
                                    <c:if test="${gymFilter.locker eq 'true'}">
                                        <input type="checkbox" name="locker" id="locker" class="filterCheck" checked>
                                    </c:if>
                                    <c:if test="${gymFilter.locker ne 'true'}">
                                        <input type="checkbox" name="locker" id="locker" class="filterCheck">
                                    </c:if>
                                    <span class="switch-left">Yes</span>
                                    <span class="switch-right">No</span>
                                </label>
                            </div>
                        </div>
                        
                        <div class="col-2 text-center">
                            <span class="inputTitle">샤워시설 여부</span>
                            <div class="checkbox-wrapper-55">
                                <label class="rocker rocker-small">
                                    <c:if test="${gymFilter.shower eq 'true'}">
                                        <input type="checkbox" name="shower" id="shower" class="filterCheck" checked>
                                    </c:if>
                                    <c:if test="${gymFilter.shower ne 'true'}">
                                        <input type="checkbox" name="shower" id="shower" class="filterCheck">
                                    </c:if>
                                    <span class="switch-left">Yes</span>
                                    <span class="switch-right">No</span>
                                </label>
                            </div>
                        </div>
                        
                        <div class="col-2 text-center">
                            <span class="inputTitle">주차장 여부</span>
                            <div class="checkbox-wrapper-55">
                                <label class="rocker rocker-small">
                                    <c:if test="${gymFilter.park eq 'true'}">
                                        <input type="checkbox" name="park" id="park" class="filterCheck" checked>
                                    </c:if>
                                    <c:if test="${gymFilter.park ne 'true'}">
                                        <input type="checkbox" name="park" id="park" class="filterCheck">
                                    </c:if>
                                    <span class="switch-left">Yes</span>
                                    <span class="switch-right">No</span>
                                </label>
                            </div>
                        </div>

                        <div class="col-1"></div>

                        <input type="hidden" name="open_result" id="open_result" value="false">
						<input type="hidden" name="locker_result" id="locker_result" value="false">
						<input type="hidden" name="shower_result" id="shower_result" value="false">
						<input type="hidden" name="park_result" id="park_result" value="false">
                        <script>
                            $(".filterCheck").change(function(){
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

						<div class="col-12 gy-3">
							<div class="text-start">
								<span class="inputTitle">대표사진</span>
							</div>


							<div class="filebox text-start">
								<label for="main_img" class="gym_imgFile_name label">이미지를 업로드하세요</label>
                                <input type="file" name="main_img" id="main_img" class="gym_imgFile" multiple>
							</div>

						</div>
                        

                        <div class="col-12 gy-4 imgesBox">
							<div class="text-start">
								<span class="inputTitle">시설사진</span>
                                <button type="button" id="fileAdd" class="btn_outline">+</button>
							</div>

							<div class="filebox text-start">
								<label for="gym_img" class="gym_imgFile_name label">이미지를 업로드하세요</label> 
                                <input type="file" name="gym_img" id="gym_img" class="gym_imgFile" multiple>
							</div>
						</div>


					</div>

				</div>

				<div class="col-12 gy-4">
					<button type="button" class="btn_base" id="btn_modify_complete">정보 수정</button>
				</div>

			</div>


		</div>

	</form>

	<script>

        $("#btn_modify_complete").on("click", function () {
            console.log('시발');
            console.log(gymSubmitCheck());
            if (gymSubmitCheck()) {
                $("#gym-modify-form").submit();
            }
        })
        
        
        // 회원가입 함수
        function gymSubmitCheck() {
            if(!isFilled($("#gym_name, #gym_phone, #gym_address1, #gym_address2, #gym_x, #gym_y"))) {
                console.log('1 뻑큐');
                return false;
            }else if (!isFilled($("#gym_name"))) {
                console.log('2 뻑큐');
                wobble($("#gym_name"));
                $("#gym_name").focus();
                return false;
            } else if (!isFilled($("#gym_phone"))) {
                console.log('3 뻑큐');
                wobble($("#gym_phone"));
                $("#gym_phone").focus();
                return false;
            }else if (!isFilled($("#gym_address2"))){
                console.log('4 뻑큐');
                wobble($("#gym_address2"));
                $("#gym_address2").focus();
                return false;
            } else {
                Swal.fire({title: "수정 성공", icon: "success", text: "수정이 완료되었습니다"});
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
                            result.x;
                            result.y;

                            $(e.target).siblings("input[name='gym_x']").val(result.y);
                            $(e.target).siblings("input[name='gym_y']").val(result.x);
                            
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
                var myTimer = setTimeout(function() { elements.style.boxShadow = "0px 0px 0px 0px black"; }, 1000);
                return false;
            }
            return true;
        }
    

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



    </script>


</main>

<%@ include file="/layout/footer.jsp"%>