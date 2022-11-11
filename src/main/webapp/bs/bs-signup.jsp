<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/layout/header.jsp" %>

<main id="bs_sign">
	<form id="form_bs_sign" action="/signUp.bs" method="post"
		  enctype="multipart/form-data">

		<div class="container" align="center">
			<!-- 사업자 회원가입 폼 -->

			<div class="row justify-content-center">

				<div class="col-12">

					<div class="bs_sign_box row justify-content-center">
						<div class="col-12">
							<h1>사업자 회원가입</h1>
						</div>

						<div class="col-12 gy-5">
							<div class="text-start" style="width: 350px">
								<p class="text_title">사업자정보</p>
							</div>
						</div>

						<div class="col-12 gy-3">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">이메일</span>
							</div>
							<input type="text" name="bs_email" id="bs_email"
								   placeholder="이메일을 입력하세요" maxlength="25">
						</div>
						<div class="col-12 gy-2">
							<div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="bs_email_msg"></span>
							</div>
						</div>


						<div class="col-12 gy-4">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">비밀번호</span>
							</div>
							<input type="password" name="bs_pw" id="bs_pw"
								   placeholder="비밀번호를 입력하세요" maxlength="16">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">비밀번호 확인</span>
							</div>
							<input type="password" name="bs_pw_re" id="bs_pw_re"
								   placeholder="동일 비밀번호를 입력하세요" maxlength="16">
						</div>
						<div class="col-12 gy-2">
							<div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="bs_pw_re_msg"></span>
							</div>
						</div>

						<div class="col-12 gy-4">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">담당자이름</span>
							</div>
							<input type="text" name="bs_name" id="bs_name"
								   placeholder="이름을 입력하세요" maxlength="10"
								   oninput="this.value = this.value.replace(/[^ㄱ-ㅎ가-힣A-Za-z.]/g, '').replace(/(\..*)\./g, '$1');">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">담당자연락처</span>
							</div>
							<input type="text" name="bs_phone" id="bs_phone"
								   placeholder="연락처를 입력하세요" maxlength="11" oninput=validNum()>
						</div>
						<div class="col-12 gy-2">
							<div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="bs_phone_msg"></span>
							</div>
						</div>


						<div class="col-12 gy-4">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">사업자번호</span>
							</div>
							<input type="text" name="bs_number" id="bs_number"
								   placeholder="사업자번호 숫자만 입력하세요" maxlength="10" oninput=validNum()>
							<div class="text-start" class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">사업자등록증</span>
							</div>


							<div class="filebox text-start" style="width: 350px">
								<label for="file" class="bs_regl_name">이미지를 업로드하세요</label> <input
									type="file" name="file" id="file" style="display: none"
									class="bs_regl_hidden">
							</div>
						</div>

						<div class="col-12 gy-2">
							<div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display" id="bs_number_msg"></span>
							</div>
						</div>


						<div class="col-12 gy-5 gymtitle">
							<div class="text-start" style="width: 350px">
								<p class="text_title">시설정보</p>
							</div>
						</div>

						<div class="col-12 gy-3">
							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설명</span>
							</div>
							<input type="text" name="gym_name" class="gym_name"
								   placeholder="시설명을 입력하세요" maxlength="20">

							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설연락처</span>
							</div>
							<input type="text" name="gym_phone" class="gym_phone"
								   placeholder="연락처를 입력하세요" maxlength="11" oninput=validNum()>

							<div class="text-start" class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설주소</span>
							</div>

							<div class="zipcodebox text-start" class="text-start"
								 style="width: 350px">
								<label className="gym_address1-button" for="gym_address1"
									   class="lb_gym_address1">우편번호를 검색하세요</label> <input type="text"
																						  name="gym_address1"
																						  class="gym_address1"
																						  style="display: none">
								<input type="text" name="gym_x" style="display: none"><input
									type="text" name="gym_y" style="display: none">

							</div>

							<div class="text-start" style="width: 350px">
								<span style="color: #808080; font-size: x-small">시설상세주소</span>
							</div>
							<input type="text" name="gym_address2" class="gym_address2"
								   placeholder="시설상세주소를 입력하세요" maxlength="40">
						</div>

						<div class="col-12 gy-2">
							<div class="error_msg text_mini text-start" style="width: 350px">
								<span class="error_msg_display gym_msg"></span>
							</div>
						</div>


					</div>

				</div>


				<div class="col-12 gy-4">
					<button type="button" class="btn_outline" id="btn_gym_add">시설추가</button>
					<p style="color: #808080;" class="text_mini">시설 추가를 원하시면 버튼을 눌러
						추가 정보를 입력해주세요.</p>
				</div>


				<div class="col-12 gy-4">
					<button class="btn_base" type="button" id="btn_bs_sign">회원가입</button>
				</div>

			</div>


		</div>

	</form>

	<script>
		// input 칸에 숫자 외에 입력 안되게 막기
		function validNum() {
			event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
		}

		// 시설 추가
		var addBtnCount = 0;
		$("#btn_gym_add").on("click", function () {

			if ($("#bs_email").val() != ""
					&& $("#bs_pw").val() != ""
					&& $("#bs_pw_re").val() != ""
					&& $("#bs_name").val() != ""
					&& $("#bs_phone").val() != ""
					&& $("#bs_number").val() != ""
					&& $(".gym_name").val() != ""
					&& $(".gym_phone").val() != ""
					&& $(".gym_address1").val() != ""
					&& $(".gym_address2").val() != ""
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


		// 파일 업로드시 파일명 삽입 기능

		$('.filebox .bs_regl_hidden').on('change', function () {  // 값이 변경되면

			if (window.FileReader) {  // modern browser
				var filename = $(this)[0].files[0].name;
			} else {  // old IE
				var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
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
					$(this).val("");
					return;
				}

				let maxSize = 10 * 1024 * 1024; // 10MB
				var fileSize = $(this)[0].files[0].size;
				if (fileSize > maxSize) {
					Swal.fire({
						icon: 'error',
						title: '파일 사이즈 초과',
						text: '첨부파일 사이즈는 10MB 이내로 등록 가능합니다.',
					})
					$(this).siblings('.bs_regl_name').html("이미지를 업로드하세요");
					$(this).val("");
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
			$(this).siblings('.bs_regl_name').html(filename);
			$(this).find('#file').val(filename);

		});


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
					var myTimer = setTimeout(function () {
						elements[i].style.boxShadow = "0px 0px 0px 0px black";
					}, 1000);
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
					var myTimer = setTimeout(function () {
						elements[i].style.boxShadow = "0px 0px 0px 0px black";
					}, 1000);
					return false;
				}
			}
			return true;
		}



		// 유효성 검사 Regex
		let bsEmailRegex = /^[a-zA-Z0-9+-\_.]{1,20}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z-.]{1,12}$/;
		let bsPwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
		let bsPhoneRegex = /^0[\d]{8,10}$/;
		let bsNumberRegex = /^[1-6][\d]{7}[1-9][\d]$/;

		// 이메일(아이디) - 아이디 중복검사 & 값 입력 유효성 검사 display

		function bsIdEvent() {
			if ($("#bs_email").val() == "") {
				$("#bs_email_msg").css("display", "block");
				$("#bs_email_msg").css("color", "#001A41");
				$("#bs_email_msg").html("이메일 형식을 아이디로 사용합니다");
			} else if (!bsEmailRegex.test($("#bs_email").val())) {
				$("#bs_email_msg").css("display", "block");
				$("#bs_email_msg").css("color", "red");
				$("#bs_email_msg").html("이메일 형식을 확인해주세요");
			} else {
				let email = $("#bs_email").val();

				$.ajax({
					url: "/duplCheck.bs",
					data: {"bs_email": email}
				}).done(function (resp) {
					if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
						$("#bs_email_msg").css("display", "block");
						$("#bs_email_msg").css("color", "red");
						$("#bs_email_msg").html("이미 사용 중인 ID 입니다.");
					} else { // 아이디가 존재하지않으므로 사용할 수 있는 경우
						$("#bs_email_msg").css("display", "block");
						$("#bs_email_msg").css("color", "#001A41");
						$("#bs_email_msg").html("사용 가능한 ID 입니다.");
					}
				});
			}
		}

		$("#bs_email").on("focus", function () {
			bsIdEvent();
		})

		$("#bs_email").on("keyup", function () {
			bsIdEvent();
		})

		// 패스워드 - 값 입력 유효성 검사 display

		function bsPwEvent() {
			if ($("#bs_pw, #bs_pw_re").val() == "") {
				$("#bs_pw_re_msg").css("display", "block");
				$("#bs_pw_re_msg").css("color", "#001A41");
				$("#bs_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");

			} else {

				if (!bsPwRegex.test($("#bs_pw").val())) {
					$("#bs_pw_re_msg").css("display", "block");
					$("#bs_pw_re_msg").css("color", "red");
					$("#bs_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");

				} else if (($("#bs_pw").val() != $("#bs_pw_re").val()) && $("#bs_pw, #bs_pw_re").val() != "") {
					$("#bs_pw_re_msg").css("display", "block");
					$("#bs_pw_re_msg").css("color", "red");
					$("#bs_pw_re_msg").html("동일한 비밀번호를 입력해주세요");

				} else if (($("#bs_pw").val() != $("#bs_pw_re").val()) && $("#bs_pw, #bs_pw_re").val() == "") {
					$("#bs_pw_re_msg").css("display", "block");
					$("#bs_pw_re_msg").css("color", "red");
					$("#bs_pw_re_msg").html("위에 입력한 비밀번호와 일치하지않습니다");

				} else {
					$("#bs_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");
					$("#bs_pw_re_msg").css("color", "#001A41");
					$("#bs_pw_re_msg").css("display", "none");
				}
			}
		}

		$("#bs_pw, #bs_pw_re").on("focus", function () {
			bsPwEvent();
		})

		$("#bs_pw, #bs_pw_re").on("keyup", function () {
			bsPwEvent();
		})


		// 전화번호 - 값 입력 유효성 검사 display

		function bsPhoneEvent() {
			if ($("#bs_phone").val() == "") {
				$("#bs_phone_msg").css("display", "block");
				$("#bs_phone_msg").css("color", "#001A41");
				$("#bs_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
			} else if (!bsPhoneRegex.test($("#bs_phone").val())) {
				$("#bs_phone_msg").css("display", "block");
				$("#bs_phone_msg").css("color", "red");
				$("#bs_phone_msg").html("옳바른 번호 형식을 입력해주세요");
			} else {
				$("#bs_phone_msg").css("display", "none");
				$("#bs_phone_msg").css("color", "#001A41");
				$("#bs_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
			}
		}

		$("#bs_phone").on("focus", function () {
			bsPhoneEvent();
		})

		$("#bs_phone").on("keyup", function () {
			bsPhoneEvent();
		})

		// 사업자번호 - 값 입력 유효성 검사 display

		function bsNumberEvent() {
			if ($("#bs_number").val() == "") {
				$("#bs_number_msg").css("display", "block");
				$("#bs_number_msg").css("color", "#001A41");
				$("#bs_number_msg").html("사업자는 - 를 제외한 숫자만 입력해주세요");
			} else if (!bsNumberRegex.test($("#bs_number").val())) {
				$("#bs_number_msg").css("display", "block");
				$("#bs_number_msg").css("color", "red");
				$("#bs_number_msg").html("옳바른 사업자번호 형식을 입력해주세요");
			} else {
				$("#bs_number_msg").css("display", "none");
				$("#bs_number_msg").css("color", "#001A41");
				$("#bs_number_msg").html("사업자는 - 를 제외한 숫자만 입력해주세요");
			}
		}


		$("#bs_number").on("focus", function () {
			bsNumberEvent();
		})

		$("#bs_number").on("keyup", function () {
			bsNumberEvent();
		})


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


		
		$("#btn_bs_sign").on("click", function () {
			console.log(submitCheck());
			if (submitCheck()) {
				$("#form_bs_sign").submit();
			}
		})
		
		
		// 회원가입 함수
		function submitCheck() {

			if(!isBsFilled($("#bs_email, #bs_pw, #bs_pw_re, #bs_name, #bs_phone, #bs_number"))) {return false;}
					
					else if (!isBsFilledFile($(".bs_regl_name"))) {return false;}
					
					else if (!isBsFilled($(".gym_name, .gym_phone"))) {return false;}
					
					else if (!isBsFilledZip($(".lb_gym_address1"))) {return false;}
					
					else if (!isBsFilled($(".gym_address2"))) {
						
				return false;
				
			}	else if ($("#bs_email_msg").css("color") == "rgb(255, 0, 0)") {
				wobble($("#bs_email")[0]);
				$("#bs_email").focus();
				return false;

			} else if ($("#bs_pw_re_msg").css("color") == "rgb(255, 0, 0)") {
				if ($("#bs_pw_re_msg").html() == "특수문자를 포함한 8~16자리 입력해주세요") {
					wobble($("#bs_pw")[0]);
					$("#bs_pw").focus();
					return false;

				} else if ($("#bs_pw_re_msg").html() == "동일한 비밀번호를 입력해주세요") {
					wobble($("#bs_pw_re")[0]);
					$("#bs_pw_re").focus();
					return false;
				}
			} else if ($("#bs_phone_msg").css("color") == "rgb(255, 0, 0)") {
				wobble($("#bs_phone")[0]);
				$("#bs_phone").focus();
				return false;
			} else if ($("#bs_number_msg").css("color") == "rgb(255, 0, 0)")
			{
				wobble($("#bs_number")[0]);
				$("#bs_number").focus();
				return false;
			} else {
				Swal.fire({title: "회원가입 성공", icon: "success", text: "회원가입이 되었습니다"});
				return true;
			}
			Swal.fire({title: "회원가입 실패", icon: "error", text: "회원가입에 실패하였습니다. 관리자에게 문의해주세요"});
			$("#bs_email_msg, #bs_pw_re_msg, #bs_phone_msg, .lb_gym_address1, .gym_msg").html("");
			$(".bs_regl_name").html("이미지를 업로드하세요");
			$(".lb_gym_address1").html("우편번호를 검색하세요");
			$("#bs_email, #bs_pw, #bs_pw_re, #bs_name, #bs_phone, #bs_number, .gym_name, .gym_phone, .gym_address2").val("");
			return false;
		}





	</script>
</main>

<%@ include file="/layout/footer.jsp" %>
