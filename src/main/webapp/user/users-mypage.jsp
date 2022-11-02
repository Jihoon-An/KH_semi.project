<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>




		<%@ include file="/layout/header.jsp" %>

			<style>
				#users-mypage div{
					box-sizing: border-box;
					border: 1px solid black;
				}

				#users-mypage #user-img{
					width: 159px;
					height: 159px;
					border-radius: 100%;
				}
			</style>
			<div class="main_margin_155"></div>
			<!-- Site Main -->
			<main class="container containerbox" id="users-mypage">
				<div class="row text-center text_title">
					<span>마이페이지</span>
				</div>
				<div class="row pt-3" id="user-info">
					<div class="col-3 pt-5 text-center"">
						<img id="user-img" src="/resource/duck.ico" alt="">
					</div>
				</div>
			</main>

			<%@ include file="/layout/footer.jsp" %>