<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/host/host-header.jsp"%>

<!-- Search main -->
   <main id="host-bsuser">
<div class="main_margin_155">

    <div class="main_margin_155" style="text-align: center; font-size: 30px; padding: 30px;">
        회원관리 (
        <a href="/usersList.host?cpage=1">일반회원관리</a> /
        <a href="/bsUserList.host?cpage=1">사업자회원관리</a> )<br>
        <a href="#">리뷰관리</a> /
        <a href="#">시설관리</a> /
        <a href="#">광고관리</a>
    </div>

</div>
     <form action="" id="frm">
    <div class="containerbox" style="overflow:hidden">
    <div class="board">
    
    
        <div class="title">
            <div class="userm text_title">사업자 회원</div> 

             <div class="selectuser text_title"><input type="checkbox" name="userchkAll"  id="allcheck" onclick="checkAll();" >ALL</div>
            <div class="user-seq text_title">회원번호</div>
            <div class="user-email text_title">회원 이메일</div>
            <div class="user-name text_title">이름</div>
            <div class="user-phone text_title">연락처</div>
            <div class="gym-count text_title">시설갯수</div>
            <div class="sign-date text_title">가입일</div>
     
            
        </div>
	
    
   
        <c:choose>
				<c:when test="${not empty bsUserList}">
			    <!-- 리스트가 비어있지않다면 -->
				<c:forEach  var="u" items="${bsUserList}" >
        <div class="title"> 
            <div class="selectuser text_normal"> <input type="checkbox" name="bsuser"  class="check" value="${u.bs_seq}" >선택 </div>
            <div class="user-seq text_normal">${u.bs_seq }</div>
            <div class="user-email text_normal">${u.bs_email }</div>
            <div class="user-name text_normal">${u.bs_name}</div>
            <div class="user-phone text_normal">${u.bs_phone }</div>
             <div class="gym-count text_normal">시설갯수</div>
            <div class="sign-date text_normal">${u.bs_signup }</div>
    
        </div>

           </c:forEach>
                   </c:when>
                  <c:otherwise>

                    <div class="other text_normal">등록된 사업자 회원이 없습니다</div>    
              </c:otherwise>
           </c:choose>
           <div class="navi">
                            <nav aria-label="Page navigation example">
  							<ul class="pagination justify-content-center">
  							${bsUserNavi}
						  </ul>
						</nav>
								
                        </div>
                        
          <div class="textsearch"><input type="text" name="inputT" id="inputText" placeholder="이름 검색">
          <button type="submit" id="btn_searchh">SEARCH</button>
          </div>
         <div class="btn_div"><button type="button" class="btn_base deleteuser" id="btn_dell">삭제하기</button></div>
    
    </div>
    </div>
    </form>
    

    <script>
    <!-- 전체 선택, 해제 -->
    function checkAll() {
    	if($("#allcheck").is(':checked')) {
    		$("input[name=bsuser]").prop("checked", true);
    	} else {
    		$("input[name=bsuser]").prop("checked", false);
    	}
    }
    
    <!-- 전체 체크중 하나 체크 취소하면 전체체크 풀림-->
    $(document).on("click", "input:checkbox[name=bsuser]", function(e) {
    	
    	var chks = document.getElementsByName("bsuser");
    	var chksChecked = 0;
    	
    	for(var i=0; i<chks.length; i++) {
    		var cbox = chks[i];
    		
    		if(cbox.checked) {
    			chksChecked++;
    		}
    	}
    	
    	if(chks.length == chksChecked){
    		$("#allcheck").prop("checked", true);
    	}else{
    		$("#allcheck").prop("checked",false);
    	}
    	
    });
    
    
    <!-- 사업자 회원 검샏-->
    	$("#btn_searchh").on("click", function(){
    	  let input = $("#inputText").val();
    	  
    	  if(input==""){
    		  alert("입력된 내용이 없습니다");
    		  return false;
    	  }else{

      		$("#frm").attr("action", "/bsUserSearch.host")
      		$("#frm").submit();
    	  }
    		
    	})	
    	
    
    
        //사업자 회원 삭제
          $("#btn_dell").on("click", function(){
    	var userseq = [];
    
    	console.log(document.querySelectorAll(".check:checked")[0].value)
    	
    	let a = document.querySelectorAll(".check:checked")
    	for(let i = 0; i<a.length; i++){
    		console.log(a[i]);
    		userseq.push(a[i].value);
    		
    		}
    	console.log(userseq)
    	
    	$.ajax({
    		url : "/bsUsersDel.host",
    		type:"post",
    	
    		data:{"userseq":JSON.stringify(userseq)},
    		  success: function (data){
    			  location.reload();
    		  }
    	
    	})
    })
    </script>
    </main>
 <%@ include file="/host/host-footer.jsp"%>