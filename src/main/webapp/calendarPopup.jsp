<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기록 추가</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
	<div class="group" id="popupGroup">
		<div class="group-head">
			<h3>기록 추가</h3>
		</div>
		<div class="group-body">
			<form id="scheduleData">
				<div class="top">
					<input type="text" class="subject" id="subject" name="subject"
						placeholder="제목을 입력해주세요.">
				</div>
				<div class="domain">
					<div class="domain">
						<h3>시작</h3>
					</div>
					<input type="text" class="date" id="startDate" name="startDate">
				</div>
				<div class="domain">
					<h3>종료</h3>
				</div>
				<div class="domain">
					<input type="text" class="date" id="endDate" name="endDate">
				</div>
				<div class="domain">
					<h3>메모</h3>
				</div>
				<div class="domain">
					<textarea name="memo" id="memo" cols="20" rows="5"
						placeholder="100글자까지 입력가능합니다."></textarea>
				</div>
			</form>
			<button class="ok-button" type="button" onclick="click_ok();">확인</button>
		</div>
	</div>
</body>
</html>