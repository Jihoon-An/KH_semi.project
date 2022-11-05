<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<div id="signupModal" class="signupModal-overlay" align="center">
		<div class="window">

			<div class="col-12 text-end close-area" onclick="hidesignupModal()">
				<a><i class="fa-solid fa-x" style="color: #808080"></i></a>
			</div>

			<div class="text_title title">일반 회원가입</div>


			<!-- 회원가입 폼 -->
			<form id="form_sign">
				<div class="row justify-content-center">

					<div class="col-12 gy-3">
						<div class="text-start" style="width: 250px">
							<span style="color: #808080; font-size: x-small">이메일</span>
						</div>
						<input type="text" name="user_email" id="user_email"
							placeholder="이메일을 입력하세요." maxlength="25">
					</div>

					<div class="col-12 gy-2">
						<div class="error_msg text_mini text-start" style="width: 250px">
							<span class="error_msg_display" id="user_email_msg"></span>
						</div>
					</div>


					<div class="col-12 gy-4">
						<div class="text-start" style="width: 250px">
							<span style="color: #808080; font-size: x-small">비밀번호</span>
						</div>
						<input type="password" name="user_pw" id="user_pw"
							placeholder="비밀번호를 입력하세요." maxlength="16">
						<div class="text-start" style="width: 250px">
							<span style="color: #808080; font-size: x-small">비밀번호 확인</span>
						</div>
						<input type="password" name="user_pw_re" id="user_pw_re"
							placeholder="동일 비밀번호를 입력하세요." maxlength="16">
					</div>
					<div class="col-12 gy-2">
						<div class="error_msg text_mini text-start" style="width: 250px">
							<span class="error_msg_display" id="user_pw_re_msg"></span>
						</div>
					</div>




					<div class="col-12 gy-4">
						<div class="text-start" style="width: 250px">
							<span style="color: #808080; font-size: x-small">연락처</span>
						</div>
						<input type="text" name="user_phone" id="user_phone"
							placeholder="연락처를 입력하세요." maxlength="11" oninput=validNum()>
					</div>

					<div class="col-12 gy-2">
						<div class="error_msg text_mini text-start" style="width: 250px">
							<span class="error_msg_display" id="user_phone_msg"></span>
						</div>
					</div>

					<div class="col-12 gy-4">
						<button type="button" class="btn_base" id="btn_sign">회원가입</button>

					</div>
					<div class="col-12 gy-3" style="font-size: small">
						<span style="color: #808080">시설운영자로 가입하길 원하시나요?</span><br> <a
							href="/bs/bs-signup.jsp">사업자 회원가입</a>
					</div>

				</div>
			</form>



		</div>
	</div>



<script>
        // 회원가입 signupModal 열기
        function showSignupModal() {
            $("#signupModal").attr("style", "display:inline-flex");
        }

        // ESC 누르면 signupModal 닫기
        $(window).on("keyup", e => {
            if ($("#signupModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideSignupModal(); }
        });


        // 유효성 검사 (공백 확인)
        function isFilled(element1, element2, element3, element4) {
            if (element1.val() == "") { wobble((element1)[0]); element1.focus(); }
            else if (element2.val() == "") { wobble((element2)[0]); element2.focus(); }
            else if (element3.val() == "") { wobble((element3)[0]); element3.focus(); }
            else if (element4.val() == "") { wobble((element4)[0]); element4.focus(); }
            else { return true; }
        }

        //  회원가입 함수
        function trySign() {
            $.post("/sign.user", $("#form_sign").serialize())
                .done((res) => {
                    if (res == "true") {
                        Swal.fire({ title: "Success!", icon: "success", text: "회원가입이 되었습니다." })
                            .then((result) => {
                                if (result.isConfirmed) { location.reload(); }
                            });
                    } else {
                        Swal.fire({ title: "Error", icon: "error", text: "오류입니다. 관리자에게 문의해주세요." });
                    }
                });
        }

        // 버튼 이벤트
        $("#btn_sign").on("click", () => {
            
            if ($("#user_email_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#user_email")[0]); $("#user_email").focus(); }
            else if ($("#user_pw_re_msg").css("color") == "rgb(255, 0, 0)") {
                if ($("#user_pw_re_msg").html() == "특수문자를 포함한 8~16자리 입력해주세요") { wobble($("#user_pw")[0]); $("#user_pw").focus(); }
                else if ($("#user_pw_re_msg").html() == "동일한 비밀번호를 입력해주세요") { wobble($("#user_pw_re")[0]); $("#user_pw_re").focus(); }
            }
            else if ($("#user_phone_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#user_phone")[0]); $("#user_phone").focus(); }
            else {
            	if (isFilled($("#user_email"), $("#user_pw"), $("#user_pw_re"), $("#user_phone"))) { trySign(); }
            }

        });

        // 유효성 검사 Regex
        let emailRegex = /^[a-zA-Z0-9+-\_.]{1,20}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z-.]{1,12}$/;
        let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
        let phoneRegex = /^0[\d]{2}\d{3,4}\d{4}$/;

        // input 칸에 숫자 외에 입력 안되게 막기
        function validNum() {
            event.target.value = event.target.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
        }

        // 아이디 중복검사
        $("#user_email").on("input", function () {
            let email = $("#user_email").val();

            $.ajax({
                url: "/duplCheck.user",
                data: { "user_email": email }
            }).done(function (resp) {
                console.log(resp);
                if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
                    $("#user_email_msg").css("display", "block");
                    $("#user_email_msg").css("color", "red");
                    $("#user_email_msg").html("이미 사용 중인 ID 입니다.");
                } else { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                    $("#user_email_msg").css("display", "block");
                    $("#user_email_msg").css("color", "#001A41");
                    $("#user_email_msg").html("사용 가능한 ID 입니다.");
                }
            });
        })

        // 이메일(아이디) - 값 입력 유효성 검사 display

        function idEvent() {
            if ($("#user_email").val() == "") {
                $("#user_email_msg").css("display", "block");
                $("#user_email_msg").css("color", "#001A41");
                $("#user_email_msg").html("이메일 형식을 아이디로 사용합니다");
            } else if (!emailRegex.test($("#user_email").val())) {
                $("#user_email_msg").css("display", "block");
                $("#user_email_msg").css("color", "red");
                $("#user_email_msg").html("이메일 형식을 확인해주세요");
            } else {
                $("#user_email_msg").css("display", "none");
            }
        }

        $("#user_email").on("focus", function () {
            idEvent();
        })

        $("#user_email").on("keyup", function () {
            idEvent();
        })

        // 패스워드 - 값 입력 유효성 검사 display

        function pwEvent() {
            if ($("#user_pw, #user_pw_re").val() == "") {
                $("#user_pw_re_msg").css("display", "block");
                $("#user_pw_re_msg").css("color", "#001A41");
                $("#user_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");

            } else {

                if (!pwRegex.test($("#user_pw").val())) {
                    $("#user_pw_re_msg").css("display", "block");
                    $("#user_pw_re_msg").css("color", "red");
                    $("#user_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");

                    console.log("패스워드 : " + $("#user_pw").val());
                    console.log("패스워드확인 : " + $("#user_pw_re").val());

                } else if (($("#user_pw").val() != $("#user_pw_re").val()) && $("#user_pw, #user_pw_re").val() != "") {
                    $("#user_pw_re_msg").css("display", "block");
                    $("#user_pw_re_msg").css("color", "red");
                    $("#user_pw_re_msg").html("동일한 비밀번호를 입력해주세요");

                    console.log("패스워드 : " + $("#user_pw").val());
                    console.log("패스워드확인 : " + $("#user_pw_re").val());

                } else if (($("#user_pw").val() != $("#user_pw_re").val()) && $("#user_pw, #user_pw_re").val() == "") {
                    $("#user_pw_re_msg").css("display", "block");
                    $("#user_pw_re_msg").css("color", "red");
                    $("#user_pw_re_msg").html("위에 입력한 비밀번호와 일치하지않습니다");

                    console.log("패스워드 : " + $("#user_pw").val());
                    console.log("패스워드확인 : " + $("#user_pw_re").val());

                } else {
                    $("#user_pw_re_msg").css("display", "none");
                }
            }
        }

        $("#user_pw, #user_pw_re").on("focus", function () {
            pwEvent();
        })

        $("#user_pw, #user_pw_re").on("keyup", function () {
            pwEvent();
        })

        // 전화번호 - 값 입력 유효성 검사 display

        function phoneEvent() {
            if ($("#user_phone").val() == "") {
                $("#user_phone_msg").css("display", "block");
                $("#user_phone_msg").css("color", "#001A41");
                $("#user_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
            } else if (!phoneRegex.test($("#user_phone").val())) {
                $("#user_phone_msg").css("display", "block");
                $("#user_phone_msg").css("color", "red");
                $("#user_phone_msg").html("옳바른 번호 형식을 입력해주세요");
            } else {
                $("#user_phone_msg").css("display", "none");
            }
        }

        $("#user_phone").on("focus", function () {
            phoneEvent();
        })

        $("#user_phone").on("keyup", function () {
            phoneEvent();
        })

        // 엔터 = 버튼 클릭
        $("#user_email, #user_pw, #user_pw_re, #user_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_sign").click() } });

    </script>