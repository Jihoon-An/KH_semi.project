
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ include file="/layout/header.jsp"%>


<main id="gym-detail">
	<div style="height: 70px;"></div>
	<div class="containerbox" style="overflow: hidden">
		<div class="lcontents">
			<div class="placebox1">
				<div>
					<div class="placename">
						<h1>${gymList.gym_name}</h1>
					</div>

					<c:if test="${bsSeq !=null }">
						<div class="bs_modify">
							<button type="button" class="btn btn-outline-secondary">수정하기</button>
						</div>
					</c:if>
					<!-- 사업자 회원 로그인시 수정하기 버튼 jstl 추후 추가 예정 -->

					<div class="icon1">
						<c:if test="${userSeq !=null}">
							<!-- list사용자 로그인만 보이게끔 -->
							<i class="fa-solid fa-heart" id="heart"></i>

						</c:if>
						<span class="button gray medium"> <a
							onclick="clip(); return false;" class="shareicon"> <i
								class="fa-sharp fa-solid fa-share-nodes" title="클릭시 URL 복사"
								style="cursor: pointer;" aria-hidden="true"></i></a></span>
					</div>
				</div>
				<div class="place">
					<dt class="text_normal">위치</dt>
					<dd>${gymList.gym_location}</dd>
				</div>

				<div class="place">
					<dt class="text_normal">연락처</dt>
					<dd>${gymList.gym_phone}</dd>
				</div>

				<div class="placemap" id="map"></div>

				<script>
              var mapContainer = document.getElementById("map"), // 지도를 표시할 div
                mapOption = {
                  center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
                  level: 3, // 지도의 확대 레벨
                };

              // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
              var map = new kakao.maps.Map(mapContainer, mapOption);
            </script>


				<div class="placeprice shadow-none p-3 mb-3 bg-light rounded">
					<dt>
						<p class="text_normal">시설가격</p>
					</dt>
					<dd>${gymList.gym_price }</dd>
				</div>
			</div>

			<div class="reviewbox">
				<div class="reviewn">
					<p class="text_title">리뷰</p>
				</div>
				<div class="reviewr">
					<button type="button" class="btn btn_base" id="reviewbtn"
						type="button">리뷰작성</button>
				</div>

				<c:choose>
					<c:when test="${not empty reviewList }">
						<!-- 리스트가 비어있지않다면 -->
						<c:forEach var="r" items="${reviewList }">
							<div class="review2">


								<div
									class="recontents shadow p-3 mb-5 bg-body rounded text_normal">

									<div class="authmark">
										<i class="fa-solid fa-user-shield"></i>
									</div>
									<div class="ranwriter">${r.review.review_writer}</div>
									<div class="writerd">${r.review.formDate}</div>
									<div class="starc">
										<input type="hidden" name="review_seq" class="star"
											value="${r.review.review_star}">

									</div>

									<c:if test="${userSeq !=null}">
										<div class="reviewlike">
											<input type="hidden" name="review_seq" class="rseq"
												value="${r.review.review_seq}"> <input type="hidden"
												name="gym_seq" class="gym" value="${r.review.gym_seq}">
											<input type="hidden" name="review_like" class="rlike"
												value="${r.review.review_like}"> <i
												class="relike fa-solid fa-thumbs-up"></i>
											<c:if test="${r.liked ==userSeq}">
												<script>
												$(".relike").attr("style", "color:#001A41")
												</script>
											</c:if>
										</div>

									</c:if>


									<div class="reviewcon">${r.review.review_contents }</div>
								</div>

							</div>

						</c:forEach>
						<div class="newmore">
							<a href="#" class="btn btn_outline" data-bs-toggle="button"
								id="load">NEW MORE</a>
						</div>
					</c:when>
					<c:otherwise>
						<div class="other">작성된 리뷰가 없습니다</div>
					</c:otherwise>
				</c:choose>





			</div>
		</div>





		<div class="rcontents">
			<div class="chart1">
				<canvas id="myChart"></canvas>
			</div>
			<div class="gym_info_open">
				<span>OPEN : ${gymList.gym_open}</span><br /> <span>CLOSE :
					${gymList.gym_close}</span>
			</div>


			<div class="gym_info_tagBox">

				<c:choose>
					<c:when test="${gymFilter.open == 'true'}">
						<div class="gym_info_tag open">#24시간</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${gymFilter.locker == 'true'}">
						<div class="gym_info_tag locker">#라커</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${gymFilter.shower == 'true'}">
						<div class="gym_info_tag shower">#샤워실</div>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${gymFilter.park == 'true'}">
						<div class="gym_info_tag park">#주차장</div>
					</c:when>
				</c:choose>
			</div>


			<div class="infopicture">
				<figure class="figure">
					<img src="/resource/health.png"
						class="figure-img img-fluid rounded" alt="..." />
					<figcaption class="figure-caption"></figcaption>
				</figure>
				<figure class="figure">
					<img src="/resource/health.png"
						class="figure-img img-fluid rounded" alt="" />
					<figcaption class="figure-caption"></figcaption>
				</figure>
			</div>
		</div>
	</div>



	<script>
	
	
	$(document).ready(function() {
			if($(".star").val()==1){
				$(".starc").html("★")
			}if($(".star").val()==2){
				$(".starc").html("★★")
			}if($(".star").val()==3){
				$(".starc").html("★★★")
			}
			if($(".star").val()==4){
				$(".starc").html("★★★★")
			}
			if($(".star").val()==5){
				$(".starc").html("★★★★★")
			}
			
	})

	$(".relike").on("click", function(){
	
		if($(this).css("color")=="rgb(143, 149, 154)" ){

			$.ajax({
				url:"/reviewLikeAdd.gym",
				data:{
					"review_seq":$(this).closest(".reviewlike").find(".rseq").val(),
					"gym_seq":$(this).closest(".reviewlike").find(".gym").val(),
					"review_like":$(this).closest(".reviewlike").find(".rlike").val()
					
				},
				type:"post",
				success:()=> {$(this).css("color", "#001A41")
					
					console.log($(this).closest(".reviewlike").find(".gym").val())
					console.log($(this).closest(".reviewlike").find(".rlike").val())
					console.log("좋아요 추가")}
				
			})
		} else {

			$.ajax({
				url:"/reviewLikeDel.gym",
				
				data:{
					"review_seq":$(this).closest(".reviewlike").find(".rseq").val(),
					"gym_seq":$(this).closest(".reviewlike").find(".gym").val(),
					"review_like":$(this).closest(".reviewlike").find(".rlike").val()
						},	
				type:"post",
				success:()=> {$(this).css("color", "#8f959a")
					console.log("좋아요 취소")}
			})
		}
	})

	


	// 즐겨찾기 아이콘 트루면 빨강, 아니면 회색
	$(document).ready(function() {

	    if(${favresult}!== "check"){
	    	if(${favresult}){
		    	$("#heart").css("color", "#CF0C00");
		    }else{
		    	$("#heart").css("color", "#8f959a")
		    }
	    }
	});
	


	
	$("#heart").on("click", function(){
		
		if($("#heart").css("color")=="rgb(143, 149, 154)" ){
			$("#heart").css("color", "#CF0C00");
			console.log("즐찾추가")
			$.ajax({
				url:"/favoriteadd.gym?gym_seq="+${gymList.gym_seq},
				type:"get"
			})
		} else {
			$("#heart").css("color", "#8f959a")
			console.log("즐찾삭제")
			$.ajax({
				url:"/favoriteremove.gym?gym_seq="+${gymList.gym_seq},
				type:"get"
			})
		}
	})
	
	</script>
	<script type="text/javascript">

			

          $(".shareicon").on("click", function(){
            var url = '';
            var textarea = document.createElement("textarea");
            document.body.appendChild(textarea);
            url = window.document.location.href;
            textarea.value = url;
            textarea.select();
            document.execCommand("copy");
            document.body.removeChild(textarea);
           $(".fa-sharp fa-solid fa-share-nodes").tooltip();  //URL 주소 복사 가능 TOOLTIP
          })//아이콘 클릭시 주소복사 버튼
        </script>

	<script>
       

        $(function () {
          $(".review2").slice(0, 1).show(); // 초기갯수
         
          $("#load").click(function (e) {
            // 클릭시 more
            e.preventDefault();
            $(".review2:hidden").slice(0, 2).show(); // 클릭시 추가 갯수 지정
          if ($(".review2:hidden").length == 0) {
              // 컨텐츠 남아있는지 확인
        		$("#load").css("display","none")
           }
          });
        });  //게시글 더 보기 기능  
      </script>

	<script>
        const data = {
          labels: ["친절", "청결", "시설", "기구", "편리"],
          datasets: [
            {
              label: "My Second Dataset",
              data: [50, 30, 55, 50, 50],
              fill: true,
              backgroundColor: "rgba(54, 162, 235, 0.2)",
              borderColor: "rgb(54, 162, 235)",
              pointBackgroundColor: "rgb(54, 162, 235)",
              pointBorderColor: "#fff",
              pointHoverBackgroundColor: "#fff",
              pointHoverBorderColor: "rgb(54, 162, 235)",
            },
          ],
        };

        const config = {
          type: "radar",
          data: data,
          options: {
            elements: {
              line: {
                borderWidth: 3,
              },
            },
          },
        };   
        	//chart.js
      </script>

	<script>
        const myChart = new Chart(document.getElementById("myChart"), config);
      </script>

	<script>
      
      $("#reviewbtn").on("click", function () {
          location.href = "/reviewWrite.gym?gym_seq=${gymList.gym_seq}";
        }); //리뷰작성 이동
      </script>


</main>

<%@ include file="/layout/footer.jsp"%>