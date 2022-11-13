<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



<%@ include file="/host/host-header.jsp" %>


<main id="host">

    <div class="hostContainer">

        <div class="userBox articleBox">
            <div class="titleBox">신규 일반 회원</div>

            <div class="new_user listBox row">
                <div class="user_seq list_title col-2">회원번호</div>
                <div class="user_email list_title col-4">회원이메일</div>
                <div class="user_phone list_title col-3">연락처</div>
                <div class="sign_date list_title col-3">가입일</div>
            </div>

            <c:forEach var="users" items="${users}">

                <div class="new_user listBox row">
                    <div class="user_seq list_content col-2">${users.seq}</div>
                    <div class="user_email list_content col-4">${users.email}</div>
                    <div class="user_phone list_content col-3">${users.phone}</div>
                    <jsp:useBean id="now" class="java.util.Date"/>
                    <div class="sign_date list_content col-3">
                        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
                        <fmt:parseNumber value="${users.signup.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
                        <fmt:formatDate value="${users.signup}" type="both" dateStyle="short" timeStyle="short" />
                    </div>
                </div>

            </c:forEach>
        </div>

        <div class="bsUserBox articleBox">
            <div class="titleBox">신규 사업자 회원</div>

            <div class="new_bsUser listBox row">
                <div class="bsUser_seq list_title col-2">회원번호</div>
                <div class="bsUser_email list_title col-4">회원이메일</div>
                <div class="bsUser_phone list_title col-3">연락처</div>
                <div class="bsSign_date list_title col-3">가입일</div>
            </div>

            <c:forEach var="bsUsers" items="${bsUsers}">

                <div class="new_bsUser listBox row">
                    <div class="bsUser_seq list_content col-2">${bsUsers.bs_seq}</div>
                    <div class="bsUer_email list_content col-4">${bsUsers.bs_email}</div>
                    <div class="bsUser_phone list_content col-3">${bsUsers.bs_phone}</div>
                    <div class="bsSign_date list_content col-3">
                        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
                        <fmt:parseNumber value="${bsUsers.bs_signup.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
                        <fmt:formatDate value="${bsUsers.bs_signup}" type="both" dateStyle="short" timeStyle="short" />
                    </div>
                </div>

            </c:forEach>
        </div>

        <div class="gymBox articleBox">
            <div class="titleBox">신규 시설</div>

            <div class="new_gym listBox row">
                <div class="gym_seq list_title col-2">시설번호</div>
                <div class="gym_name list_title col-5">시설명</div>
                <div class="gym_phone list_title col-3">시설연락처</div>
                <div class="gym_bsSeq list_title col-2">담당자번호</div>
            </div>

            <c:forEach var="gym" items="${gym}">

                <div class="new_gym listBox row">
                    <div class="gym_seq list_content col-2">${gym.gym_seq}</div>
                    <div class="gym_name list_content col-5">${gym.gym_name}</div>
                    <div class="gym_phone list_content col-3">${gym.gym_phone}</div>
                    <div class="gym_bsSeq list_content col-2">${gym.bs_seq}</div>
                </div>

            </c:forEach>
        </div>

        <div class="reviewBox articleBox">
            <div class="titleBox">신규 리뷰</div>

            <div class="new_review listBox row">
                <div class="review_seq list_title col-2">리뷰번호</div>
                <div class="review_gym_name list_title col-4">시설명</div>
                <div class="review_bsSeq_email list_title col-3">회원이메일</div>
                <div class="sign_date list_title col-3">작성날짜</div>
            </div>

            <c:forEach var="review" items="${review}">

                <div class="new_review listBox row">
                    <div class="review_seq list_content col-2">${review.review_seq}</div>
                    <div class="review_gym_name list_content col-4">${review.gym_name}</div>
                    <div class="review_users_email list_content col-3">${review.users_email}</div>
                    <div class="sign_date list_content col-3">
                        <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
                        <fmt:parseNumber value="${review.review_writer_date.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
                        <fmt:formatDate value="${review.review_writer_date}" type="both" dateStyle="short" timeStyle="short" />
                    </div>
                </div>

            </c:forEach>
        </div>

    </div>

</main>

<script>
    // 페이지 선택 확인용
    $(function(){
        $("#adminText").css("color","#ffe92d")
    });
</script>

<%@ include file="/host/host-footer.jsp" %>
