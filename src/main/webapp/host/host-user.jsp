<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ include file="/host/host-header.jsp" %>
<!-- Search main -->
<main id="host-user" style="margin: 0 auto">

    <form action="" id="frm">
        <input type="hidden" value="1" name="cpage">
        <div id="search_box">
            <div style="margin: auto; width: 1010px; position: relative; left: 6px">
                <!-- 검색분류 -->
                <select name="type" id="select" class="select_box">
                    <option value="board_title" selected>이름검색</option>
                </select>

                <input type="text" placeholder="검색어를 입력해주세요" name="inputName" id="inputText" value="${searchText}">
                <button class="btn_search" role="button" type="button" id="btn_searchh">검색</button>
            </div>
        </div>


        <div class="btn_function_box">
            <button class="btn_function" role="button" type="button" id="btn_dell">삭제하기
            </button>
        </div>


        <div class="board_list containerbox">
            <div class="board_title_row d-flex flex-row">
                <div class="checkbox p-1"><input type="checkbox" name="userchkAll" id="allcheck"
                                                   onclick="checkAll();"></div>
                <div class="user-seq p-1">회원번호</div>
                <div class="user-email p-1">회원이메일</div>
                <div class="user-name p-1">이름</div>
                <div class="user-phone p-1">연락처</div>
                <div class="user-birth p-1">생년월일</div>
                <div class="sign-date p-1">가입일</div>
                <div class="user-gender p-1">성별</div>
            </div>

            <c:choose>
                <c:when test="${not empty userList}">
                    <c:forEach var="u" items="${userList}">
                        <div class="board_row d-flex flex-row">
                            <div class="checkbox p-1"><input type="checkbox" name="user" value="${u.seq}"
                                                               class="check"></div>
                            <div class="user-seq p-1">
                                <span class="position-relative">
                                    ${u.seq}
                                        <!-- 날짜 계산 -->
                                    <jsp:useBean id="now" class="java.util.Date"/>
                                    <fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true"
                                                     var="nowfmtTime" scope="request"/>
                                    <fmt:parseNumber value="${u.signup.time / (1000*60*60*24)}" integerOnly="true"
                                                     var="dbDtParse" scope="request"/>
                                    <c:if test="${(dbDtParse - nowfmtTime)==0}">
                                    <span style="font-size:8px; font-weight: 300; width:30px; height: 15px; position: absolute; top: -3px; left: 40px"
                                          class="translate-middle badge rounded-pill bg-danger animate__animated animate__flash animate__infinite">
                                        <span style="position: absolute; top: 2px; left: 4px">NEW</span>
                                    </span>
                                </c:if>
                                </span>
                            </div>
                            <div class="user-email p-1">${u.email}</div>
                            <div class="user-name p-1">${u.name}</div>
                            <div class="user-phone p-1">${u.phone}</div>
                            <div class="user-birth p-1">${u.birthday}</div>
                            <div class="sign-date p-1">
                                <fmt:formatDate value="${u.signup}" type="both" dateStyle="short" timeStyle="short" />
                            </div>
                            <div class="user-gender p-1">
                                <c:if test="${u.sex == 'W'}">여성</c:if>
                                <c:if test="${u.sex == 'M'}">남성</c:if>
                            </div>
                        </div>

                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="width: 1200px; height: 400px; text-align: center">
                        <h2 style="margin:50px">등록된 회원이 없습니다</h2>
                    </div>
                </c:otherwise>
            </c:choose>

            <div style="margin-top: 20px">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        ${userNavi}
                    </ul>
                </nav>
            </div>
        </div>

    </form>
</main>

<script>
    // 페이지 선택 확인용
    $(function(){
        $("#li_user").css("color","#ffe92d")
    });


    // 엔터 = 버튼 클릭
    $("#inputText").on("keydown",function(e){
        if (e.keyCode == 13) {
            $("#btn_searchh").trigger("click");
            return false;
        }
    });


    // 전체 선택, 해제
    function checkAll() {
        if ($("#allcheck").is(':checked')) {
            $("input[name=user]").prop("checked", true);
        } else {
            $("input[name=user]").prop("checked", false);
        }
    }


    // 전체 체크중 하나 체크 취소하면 전체체크 풀림
    $(document).on("click", "input:checkbox[name=user]", function (e) {

        var chks = document.getElementsByName("user");
        var chksChecked = 0;

        for (var i = 0; i < chks.length; i++) {
            var cbox = chks[i];

            if (cbox.checked) {
                chksChecked++;
            }
        }

        if (chks.length == chksChecked) {
            $("#allcheck").prop("checked", true);
        } else {
            $("#allcheck").prop("checked", false);
        }

    });


    //유저삭제
    $("#btn_dell").on("click", function () {
        var userseq = [];

        console.log(document.querySelectorAll(".check:checked")[0].value)

        let a = document.querySelectorAll(".check:checked")
        for (let i = 0; i < a.length; i++) {
            console.log(a[i]);
            userseq.push(a[i].value);

        }
        console.log(userseq)

        $.ajax({
            url: "/usersDel.host",
            type: "post",

            data: {"userseq": JSON.stringify(userseq)},
            success: function (data) {
                location.reload();
            }

        })
    })


    //검색기능
    $("#btn_searchh").on("click", function click () {
        let input = $("#inputText").val();
        console.log(input);
        if (input == "") {
            Swal.fire({
                icon: 'error',
                title: '검색어 누락',
                text: '입력된 내용이 없습니다',
                confirmButtonText: '확인'
            })
            return false;
        } else {
            $("#frm").attr("action", "/userSearch.host");
            $("#frm").submit();
        }
    })


</script>

<%@ include file="/host/host-footer.jsp" %>