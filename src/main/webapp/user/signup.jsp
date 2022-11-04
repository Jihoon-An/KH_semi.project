<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Sign</title>
    <link rel="shortcut icon" type="image/x-icon" href="/resource/duck.ico">
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
        integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
        </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8"
        crossorigin="anonymous"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://kit.fontawesome.com/be3915f36a.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/css/base.css" type="text/css">
    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            margin-top: 20px;
            padding: 20px;
            border: 1px solid #808080;
            width: 350px;
            height: 565px;
            min-width: 350px;
        }

        a {
            text-decoration: none;
        }

        a:hover {
            cursor: pointer
        }

        input {
            padding-left: 5px;
            padding-right: 5px;
            width: 250px;
            border: 0px;
            border-bottom: 1px solid black;
        }

        input:focus {
            outline: none;
            box-shadow: 0px 1px 0px 0px black;
        }

        .error_msg {
            height: 12px;
        }

        #user_email_msg,
        #user_pw_re_msg,
        #user_phone_msg {
            color: #001A41;
            display: none;
			letter-spacing : -1px;
        }
    </style>
</head>

<body>
    <main>
        <div class="container" align="center">
            <!-- 회원가입 폼 -->
            <form id="form_sign">
                <div class="row justify-content-center">
                    <div class="col-12 text-end">
                        <a><i class="fa-solid fa-x" style="color:#808080"></i></a>
                    </div>
                    <div class="col-12 gy-4">
                        <div class="text_title">일반 회원가입</div>
                    </div>
                    <div class="col-12 gy-3">
                        <div class="text-start" style="width:250px">
                            <span style="color:#808080; font-size:x-small">이메일</span>
                        </div>
                        <input type="text" name="user_email" id="user_email" placeholder="이메일을 입력하세요." maxlength="40">
                    </div>

                    <div class="col-12 gy-2">
                        <div class="error_msg text_mini text-start" style="width:250px">
                            <span class="error_msg_display" id="user_email_msg"></span>
                        </div>
                    </div>


                    <div class="col-12 gy-4">
                        <div class="text-start" style="width:250px">
                            <span style="color:#808080; font-size:x-small">비밀번호</span>
                        </div>
                        <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호를 입력하세요." maxlength="20">
                        <div class="text-start" style="width:250px">
                            <span style="color:#808080; font-size:x-small">비밀번호 확인</span>
                        </div>
                        <input type="password" name="user_pw_re" id="user_pw_re" placeholder="동일 비밀번호를 입력하세요."
                            maxlength="16">
                    </div>

                    <div class="col-12 gy-2">
                        <div class="error_msg text_mini text-start" style="width:250px">
                            <span class="error_msg_display" id="user_pw_re_msg"></span>
                        </div>
                    </div>

                    <div class="col-12 gy-4">
                        <div class="text-start" style="width:250px">
                            <span style="color:#808080; font-size:x-small">연락처</span>
                        </div>
                        <input type="text" name="user_phone" id="user_phone" placeholder="연락처를 입력하세요." maxlength="11" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
                    </div>

                    <div class="col-12 gy-2">
                        <div class="error_msg text_mini text-start" style="width:250px">
                            <span class="error_msg_display" id="user_phone_msg"></span>
                        </div>
                    </div>

                    <div class="col-12 gy-4">
                        <button type="button" class="btn_base" id="btn_sign">회원가입</button>
                    </div>
                </div>
            </form>

        </div>
        <script>
            // 떨림 애니메이션
            function wobble(element) {
                let order = [0, -8, 8, -4, 4, -2, 2, -1, 1, 0];
                let seq = [];
                order.forEach(function (y) { seq.push({ transform: "translate(0," + y + "px)" }); });
                element.animate(seq, { duration: 300 });
            }

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
                if (isFilled($("#user_email"), $("#user_pw"), $("#user_pw_re"), $("#user_phone"))) { trySign(); }
            
                    if ($("#user_email_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#user_email")[0]); $("#user_email").focus(); }
                    else if ($("#user_pw_re_msg").css("color") == "rgb(255, 0, 0)"){
                        if($("#user_pw_re_msg").html() == "특수문자를 포함한 8~16자리 입력해주세요") { wobble($("#user_pw")[0]); $("#user_pw").focus(); }
                        else if ($("#user_pw_re_msg").html() == "동일한 비밀번호를 입력해주세요") { wobble($("#user_pw_re")[0]); $("#user_pw_re").focus(); }  
                    }
                    else if ($("#user_phone_msg").css("color") == "rgb(255, 0, 0)") { wobble($("#user_phone")[0]); $("#user_phone").focus(); }
                    
                    
                        $("#user_email_msg").css("display", "none");
                        $("#user_email_msg").css("color", "#001A41");
                        $("#user_email_msg").html("이메일 형식을 아이디로 사용합니다");
             
            });

            // 유효성 검사 Regex
            let emailRegex = /^[a-zA-Z0-9+-\_.]{1,20}@[a-zA-Z0-9-]{1,15}\.[a-zA-Z0-9-.]{1,5}$/;
            let pwRegex = /^(?=.*[A-Za-z\d])(?=.*[~!@#$%^&*()+|=])[A-Za-z\d~!@#$%^&*()+|=]{8,16}$/;
            let phoneRegex = /^0[\d]{2}\d{3,4}\d{4}$/;

         // 아이디 중복검사
            $("#user_email").on("input", function () {
                let email =  $("#user_email").val();

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
            	let email =  $("#user_email").val();

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
                    	
                    	if ($("#user_email").val() == "") {
                            $("#user_email_msg").css("display", "block");
                            $("#user_email_msg").css("color", "#001A41");
                            $("#user_email_msg").html("이메일 형식을 아이디로 사용합니다");
                        } else if (!emailRegex.test($("#user_email").val())) {
                            $("#user_email_msg").css("display", "block");
                            $("#user_email_msg").css("color", "red");
                            $("#user_email_msg").html("이메일 형식을 확인해주세요");
                        } else {
	                        $("#user_email_msg").css("display", "block");
	                        $("#user_email_msg").css("color", "#001A41");
	                        $("#user_email_msg").html("사용 가능한 ID 입니다.");
                        }
                    }
                });
        	 
        	 
                
                
                
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
                        
                    } else if ( ($("#user_pw").val() != $("#user_pw_re").val()) && $("#user_pw, #user_pw_re").val() != "" ) {
                        $("#user_pw_re_msg").css("display", "block");
                        $("#user_pw_re_msg").css("color", "red");
                        $("#user_pw_re_msg").html("동일한 비밀번호를 입력해주세요");

                    } else if ( ($("#user_pw").val() != $("#user_pw_re").val()) && $("#user_pw, #user_pw_re").val() == "" ) {
                        $("#user_pw_re_msg").css("display", "block");
                        $("#user_pw_re_msg").css("color", "red");
                        $("#user_pw_re_msg").html("위에 입력한 비밀번호와 일치하지않습니다");

                    } else {
                        $("#user_pw_re_msg").html("특수문자를 포함한 8~16자리 입력해주세요");
                        $("#user_pw_re_msg").css("color", "#001A41");
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
                    // wobble(($("#user_phone"))[0]); 
                    // $("#user_phone").focus();
                    $("#user_phone_msg").css("display", "block");
                    $("#user_phone_msg").css("color", "#001A41");
                    $("#user_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
                } else if (!phoneRegex.test($("#user_phone").val())) {
                    $("#user_phone_msg").css("display", "block");
                    $("#user_phone_msg").css("color", "red");
                    $("#user_phone_msg").html("옳바른 번호 형식을 입력해주세요");
                } else {
                    $("#user_phone_msg").css("display", "none");
                    $("#user_phone_msg").css("color", "#001A41");
                    $("#user_phone_msg").html("연락처는 - 를 제외한 숫자만 입력해주세요");
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
    </main>
</body>

</html>