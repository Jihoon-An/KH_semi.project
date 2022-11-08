<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="loginModal" class="loginModal-overlay" align="center">
	<div class="window">

		<div class="col-12 text-end close-area" onclick=hideLoginModal()>
			<a><i class="fa-solid fa-x" style="color: #808080"></i></a>
		</div>

		<div class="text_title title">회원 로그인</div>

		<!-- 로그인 폼 -->
		<form id="form_login">
			<div class="row justify-content-center mt-3">
				<div class="col-12 gy-3">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">이메일</span>
					</div>
					<input type="text" name="login_id" id="login_id"
						placeholder="이메일을 입력하세요." maxlength="40">
				</div>
				<div class="col-12 gy-4">
					<div class="text-start" style="width: 250px">
						<span style="color: #808080; font-size: x-small">비밀번호</span>
					</div>
					<input type="password" name="login_pw" id="login_pw"
						placeholder="비밀번호를 입력하세요." maxlength="20">
				</div>
				<div class="col-12 gy-4">
					<button type="button" class="btn_base" id="btn_login">로그인</button>
				</div>
				<div class="col-12 gy-1">
					<input class="form-check-input" type="checkbox" id="chk_bs">
					<label class="form-check-label" for="chk_bs"
						style="color: #404040; font-size: 14px; letter-spacing: -1px;">운영자
						로그인</label>
				</div>
				<div class="col-12 gy-4" style="letter-spacing: -1px;">
					<span style="color: #404040;">계정이 없으신가요?</span> <a href="#"
						onclick="showSignupModal(); return false;">회원가입</a>
				</div>
				<div class="col-12 gy-1"
					style="color: #808080; font-size: small; letter-spacing: -1px;">
					<a onclick="showSearch()">아이디 찾기</a> <span>/</span> <a
						onclick="showSearch()">비밀번호 찾기</a>
				</div>
			</div>
		</form>
		<!-- 아이디 찾기 폼 -->
		<form class="search" id="form_searchId">
			<div class="row justify-content-center mt-4">
				<div class="col-12 gy-4">
					<input type="text" name="name" id="searchId_name" placeholder="이름"
						maxlength="10">
					<div class="text-start mt-1 mb-2" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							이름을 입력하세요.</span>
					</div>
				</div>
				<div class="col-12 gy-4">
					<input type="text" name="phone" id="searchId_phone"
						placeholder="핸드폰 번호" maxlength="14">
					<div class="text-start mt-1 mb-2" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							핸드폰 번호를 입력하세요.</span>
					</div>
				</div>
				<div class="col-12 gy-4">
					<button class="btn_base mb-3" type="button" id="btn_searchId">찾기</button>
				</div>
				<div class="col-12" style="margin-top: 30px">
					<a style="color: #808080" onclick="toBackward()">Back</a>
				</div>
			</div>
		</form>
		<!-- 비밀번호 찾기 폼 -->
		<form class="search" id="form_searchPw">
			<div class="row justify-content-center mt-4">
				<div class="col-12 gy-4">
					<input type="text" name="email" id="searchPw_email"
						placeholder="이메일" maxlength="40">
					<div class="text-start mt-1 mb-2" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							이메일을 입력하세요.</span>
					</div>
				</div>
				<div class="col-12 gy-4">
					<input type="text" name="phone" id="searchPw_phone"
						placeholder="핸드폰 번호" maxlength="14">
					<div class="text-start mt-1 mb-2" style="width: 250px">
						<span style="color: #808080; font-size: x-small">회원 가입시 사용한
							핸드폰 번호를 입력하세요.</span>
					</div>
				</div>
				<div class="col-12 gy-4">
					<button class="btn_base mb-3" type="button" id="btn_searchPw">찾기</button>
				</div>
				<div class="col-12" style="margin-top: 30px">
					<a style="color: #808080" onclick="toBackward()">Back</a>
				</div>
			</div>
		</form>
	</div>
</div>
<script>
			// 로그인 loginModal 열기
			function showLoginModal() {
				$("#loginModal").attr("style", "display:inline-flex");
			}

			// 로그인 loginModal 닫기
			function hideLoginModal() {
				$("#loginModal").attr("style", "display:none");
				toBackward();
			}

			// 아이디 / 비밀번호 찾기 페이지 처리
			function showSearch() {
				let text = event.target.innerText;
				$("#form_login").attr("style", "display:none"); $("#form_search" + (text == '아이디 찾기' ? 'Id' : 'Pw')).attr("style", "display:inline");
				$("#loginModal .title").text(text);
			}

			// 뒤로가기 처리
			function toBackward() {
				$(".search").attr("style", "display:none");
				$("#loginModal input:not([type='checkbox']").val("");
				$("#loginModal .title").text("회원 로그인");
				$("#form_login").attr("style", "display:inline");
			}

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
					if(elements[i].value == "") { 
						wobble(elements[i]);
						elements[i].focus();
						return false; 
					}
				}
				return true;
			}

			// 로그인 함수
			function tryLogin() {
				$.post($("#chk_bs").is(":checked") ? "/login.bs" : "/login.user", $("#form_login").serialize())
					.done((res) => {
						if (res == "true") {
							Swal.fire({ title: "Success!", icon: "success", text: "로그인에 성공했습니다." })
								.then((result) => {
									if (result.isConfirmed) { location.reload(); }
								});
						} else {
							Swal.fire({ title: "Error", icon: "error", text: "ID가 등록되지 않았거나 비밀번호가 올바르지 않습니다." });
						}
					});
			}

			// 아이디 찾기 함수
			function trySearchId() {
				console.log($("#form_searchId").serialize())
				$.get("/searchId.user", $("#form_searchId").serialize())
					.done((res => {
						if (res != "null") {
							Swal.fire({ title: "Success!", icon: "success", html: "회원님의 아이디는 다음과 같습니다.<br><Strong>\'" + res + "\'</Strong>" });
						} else {
							Swal.fire({ title: "Error", icon: "error", text: "등록된 가입 정보가 없습니다." });
						}
					}))
			}

			// 비밀번호 찾기 함수
			function trySearchPw() {
				console.log($("#form_searchPw").serialize())
				$.get("/searchPw.user", $("#form_searchPw").serialize())
					.done((res => {
						if (res == "true") {
							// Fake Alert
							Swal.fire({ title: "Success!", icon: "success", html: "등록된 이메일 주소로<br>비밀번호 설정 링크가 발송되었습니다.<br>" })
						} else {
							Swal.fire({ title: "Error", icon: "error", text: "등록된 가입 정보가 없습니다." });
						}
					}))
			}

			// ESC 누르면 Modal 닫기
			$(window).on("keyup", e => {
				if ($("#loginModal")[0].style.display == "inline-flex" && e.keyCode == 27) { hideLoginModal(); }
			});

			// 창 바깥쪽 클릭하면 Modal 닫기
			// $("#loginModal").on("click", e => {
			// 	if (e.target.classList.contains("loginModal-overlay")) { hideLoginModal(); }
			// });

			// 버튼 이벤트
			$("#btn_login").on("click", () => {
				if (isFilled($("#login_id, #login_pw"))) { tryLogin(); }
			});

			$("#btn_searchId").on("click", () => {
				if (isFilled($("#searchId_name, #searchId_phone"))) { trySearchId(); }
			});

			$("#btn_searchPw").on("click", () => {
				if (isFilled($("#searchPw_email, #searchPw_phone"))) { trySearchPw(); }
			});

			// 엔터 = 버튼 클릭
			$("#login_id, #login_pw").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_login").click() } });
			$("#searchId_name, #searchId_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchId").click() } });
			$("#searchPw_email, #searchPw_phone").on("keyup", (e) => { if (e.keyCode == 13) { $("#btn_searchPw").click() } });
		</script>