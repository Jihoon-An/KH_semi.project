<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>
<!-- Search main -->
  <main id="host-user">
<div class="main_margin_155"></div>
     <form action="" id="frm">
    <div class="containerbox" style="overflow:hidden">
    <div class="board">
    <form action="" id="frm">
        <div class="title">
            <div class="userm text_title">일반회원</div> 

            <div class="selectuser text_title">선택</div>
            <div class="user-seq text_title">회원번호</div>
            <div class="user-email text_title">회원 이메일</div>
            <div class="user-name text_title">이름</div>
            <div class="user-phone text_title">연락처</div>
            <div class="user-birth text_title">생년월일</div>
            <div class="sign-date text_title">가입일</div>
            <div class="user-gender text_title">성별</div>
            
        </div>
	
    
   
        <c:choose>
				<c:when test="${not empty list}">
			    <!-- 리스트가 비어있지않다면 -->
				<c:forEach  var="u" items="${list}" >
        <div class="title"> 
            <div class="selectuser text_normal"> <input type="checkbox" name="user" >선택 </div>
            <div class="user-seq text_normal">${u.seq}</div>
            <div class="user-email text_normal">${u.email}</div>
            <div class="user-name text_normal">${u.name}</div>
            <div class="user-phone text_normal">${u.phone}</div>
            <div class="user-birth text_normal">${u.birthday}</div>
            <div class="sign-date text_normal">${u.signup}</div>
            <div class="user-gender text_normal">${u.sex}</div>
        </div>

           </c:forEach>
                   </c:when>
                  <c:otherwise>

                    <div class="other text_normal">등록된 회원이 없습니다</div>    
              </c:otherwise>
           </c:choose>
            <div class="textsearch"><input type="text" name="inputT" id="inputText" placeholder="이름 검색">
          <button type="submit" id="btn_search">SEARCH</button>
          </div>
         <div class="btn_div"><button class="btn_base deleteuser" id="btn_del">삭제하기</button></div>
    
    </div>
    </div>
    </form>

    <script>
    
    
    $("#btn_search").on("click", function(){
  	  let input = $("#inputText").val();
  	  
  	  if(input==""){
  		  alert("입력된 내용이 없습니다");
  		  return false;
  	  }else{

    		$("#frm").attr("action", "/userSearch.host")
    		$("#frm").submit();
  	  }
  		
  	})	
    
    
        $(".deleteuser").on("click", function(){
            
        })
    </script>
    </main>

</body>
</html>