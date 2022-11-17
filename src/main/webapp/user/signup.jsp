<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="signupModal" class="signupModal-overlay" align="center">
	<div class="window">

		<div class="col-12 text-end close-area" onclick=hideSignupModal()>
			<a><i class="fa-solid fa-x" style="color: #808080"></i></a>
		</div>

		<div class="text_title title">일반 회원가입</div>


		<!-- 회원가입 폼 -->
		<form id="form_sign" method="post">
			<div class="row justify-content-center">

				<div class="col-12 gy-3">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">이메일</span>
					</div>
					<input type="text" name="users_email" id="users_email"
						placeholder="이메일을 입력하세요." maxlength="25">
				</div>

				<div class="col-12 gy-2">
					<div class="error_msg text_mini text-start" style="width: 250px">
						<span class="error_msg_display" id="users_email_msg"></span>
					</div>
				</div>


				<div class="col-12 gy-4">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">비밀번호</span>
					</div>
					<input type="password" name="users_pw" id="users_pw"
						placeholder="비밀번호를 입력하세요." maxlength="16">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">비밀번호 확인</span>
					</div>
					<input type="password" name="users_pw_re" id="users_pw_re"
						placeholder="동일 비밀번호를 입력하세요." maxlength="16">
				</div>
				<div class="col-12 gy-2">
					<div class="error_msg text_mini text-start" style="width: 250px">
						<span class="error_msg_display" id="users_pw_re_msg"></span>
					</div>
				</div>




				<div class="col-12 gy-4">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">연락처</span>
					</div>
					<input type="text" name="users_phone" id="users_phone"
						placeholder="연락처를 입력하세요." maxlength="11" oninput=validNum()>
				</div>

				<div class="col-12 gy-2">
					<div class="error_msg text_mini text-start" style="width: 250px">
						<span class="error_msg_display" id="users_phone_msg"></span>
					</div>
				</div>

				<div class="col-12 gy-4">
					<button type="button" class="btn_base" id="btn_sign">회원가입</button>

				</div>
				<div class="col-12 gy-3"
					style="font-size: small; letter-spacing: -1px;">
					<span style="color: #808080;">시설운영자로 가입하길 원하시나요?</span><br> <a
						href="/sign.bs">사업자회원가입</a>
				</div>

			</div>
		</form>



	</div>
</div>



<script>

        // 회원가입 signupModal 열기
        function showSignupModal() {
            $("#signupModal").attr("style", "display:inline-flex");
            $("#loginModal").attr("style", "display:none");
            toBackward();
        }
        
     	// 회원가입 signupModal 닫기
		function hideSignupModal() {
			$("#signupModal").attr("style", "display:none");
			
        	$("#users_email").val("");
        	$("#users_pw").val("");
        	$("#users_pw_re").val("");
        	$("#users_phone").val("");
        	
        	$("#users_email_msg").css("display", "none");
            $("#users_email_msg").css("color", "#001A41");
            $("#users_email_msg").html("이메일 형식을 아이디로 사용합니다");

            $("#users_pw_re_msg").css("display", "none");
            $("#users_pw_re_msg").css("color", "#001A41");
            $("#users_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");
            
            $("#users_phone_msg").css("display", "none");
            $("#users_phone_msg").css("color", "#001A41");
            $("#users_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
		}
     	
        // ESC 누르면 signupModal 닫기
        $(window).on("keyup", e => {
            if ($("#signupModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideSignupModal(); }
        });

        //  회원가입 함수
        function trySign() {
        	$.post("/sign.user", $("#form_sign").serialize())
                .done((resp) => {
                	if (resp == "1") {
                        Swal.fire({ title: "Success!", icon: "success", text: "회원가입이 되었습니다."})
                            .then((result) => {
                                if (result.isConfirmed) { location.reload(); }
                            });
                    } else {
                        Swal.fire({ title: "Error", icon: "error", text: "오류입니다. 관리자에게 문의해주세요."});
                    }
                });
             	            
        }
        
        // 회원가입 버튼 이벤트
        $("#btn_sign").on("click", () => {
            
            if ($("#users_email_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#users_email")[0]); $("#users_email").focus(); }
            
            else if ($("#users_pw_re_msg").css("color") == "rgb(255, 0, 0)") {
                if ($("#users_pw_re_msg").html() == "특수문자를 포함한 8~16자리 입력해주세요") { wobble($("#users_pw")[0]); $("#users_pw").focus(); }
                else if ($("#users_pw_re_msg").html() == "동일한 비밀번호를 입력해주세요") { wobble($("#users_pw_re")[0]); $("#users_pw_re").focus(); }
            }
            else if ($("#users_phone_msg").css("color") == "rgb(255, 0, 0)") { 
            	wobble($("#users_phone")[0]); $("#users_phone").focus();
            	
            } else {
            	if (isFilled($("#users_email, #users_pw, #users_pw_re, #users_phone"))) { trySign(); }
            }

        });

        // 유효성 검사 Regex
        let emailRegex = /^[a-zA-Z0-9+-\_.]{1,20}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z-.]{1,12}$/;
        let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
        let phoneRegex = /^0[\d]{8,10}$/;

        // input 칸에 숫자 외에 입력 안되게 막기
        function validNum() {
            event.target.value = event.target.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');
        }
       
      
        // 이메일(아이디) - 아이디 중복검사 & 값 입력 유효성 검사 display

        function idEvent() {
            if ($("#users_email").val() == "") {
                $("#users_email_msg").css("display", "block");
                $("#users_email_msg").css("color", "#001A41");
                $("#users_email_msg").html("이메일 형식을 아이디로 사용합니다");
            } else if (!emailRegex.test($("#users_email").val())) {
                $("#users_email_msg").css("display", "block");
                $("#users_email_msg").css("color", "red");
                $("#users_email_msg").html("이메일 형식을 확인해주세요");
            } else {
            	let email = $("#users_email").val();
            	
            	$.ajax({
                    url: "/duplCheck.user",
                    data: { "users_email": email }
                }).done(function (resp) {
                	
                    if (resp == "true") { // 아이디가 이미 존재하므로 사용할 수 없는 경우
                        $("#users_email_msg").css("display", "block");
                        $("#users_email_msg").css("color", "red");
                        $("#users_email_msg").html("이미 사용 중인 ID 입니다.");
                    } else { // 아이디가 존재하지않으므로 사용할 수 있는 경우
                        $("#users_email_msg").css("display", "block");
                        $("#users_email_msg").css("color", "#001A41");
                        $("#users_email_msg").html("사용 가능한 ID 입니다.");
                    }
                });
            }
        }
        
        

        $("#users_email").on("focus", function () {
            idEvent();
        })

        $("#users_email").on("keyup", function () {
            idEvent();
        })

        // 패스워드 - 값 입력 유효성 검사 display

        function pwEvent() {
            if ($("#users_pw, #users_pw_re").val() == "") {
                $("#users_pw_re_msg").css("display", "block");
                $("#users_pw_re_msg").css("color", "#001A41");
                $("#users_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");

            } else {

                if (!pwRegex.test($("#users_pw").val())) {
                    $("#users_pw_re_msg").css("display", "block");
                    $("#users_pw_re_msg").css("color", "red");
                    $("#users_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");


                } else if (($("#users_pw").val() != $("#users_pw_re").val()) && $("#users_pw, #users_pw_re").val() != "") {
                    $("#users_pw_re_msg").css("display", "block");
                    $("#users_pw_re_msg").css("color", "red");
                    $("#users_pw_re_msg").html("동일한 비밀번호를 입력해주세요");


                } else if (($("#users_pw").val() != $("#users_pw_re").val()) && $("#users_pw, #users_pw_re").val() == "") {
                    $("#users_pw_re_msg").css("display", "block");
                    $("#users_pw_re_msg").css("color", "red");
                    $("#users_pw_re_msg").html("위에 입력한 비밀번호와 일치하지않습니다");

                } else {
                    $("#users_pw_re_msg").css("display", "none");
                    $("#users_pw_re_msg").css("color", "#001A41");
                    $("#users_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");
                }
            }
        }

        $("#users_pw, #users_pw_re").on("focus", function () {
            pwEvent();
        })

        $("#users_pw, #users_pw_re").on("keyup", function () {
            pwEvent();
        })

        // 전화번호 - 값 입력 유효성 검사 display

        function phoneEvent() {
            if ($("#users_phone").val() == "") {
                $("#users_phone_msg").css("display", "block");
                $("#users_phone_msg").css("color", "#001A41");
                $("#users_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
            } else {
            	if (!phoneRegex.test($("#users_phone").val())) {
                    $("#users_phone_msg").css("display", "block");
                    $("#users_phone_msg").css("color", "red");
                    $("#users_phone_msg").html("옳바른 번호 형식을 입력해주세요");
                } else {
                    $("#users_phone_msg").css("display", "none");
                    $("#users_phone_msg").css("color", "#001A41");
                    $("#users_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
                }
            }
        }

        $("#users_phone").on("focus", function () {
            phoneEvent();
        })

        $("#users_phone").on("keyup", function () {
            phoneEvent();
        })

        // 엔터 = 버튼 클릭
        $("#users_email, #users_pw, #users_pw_re, #users_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_sign").click() } });

    </script>