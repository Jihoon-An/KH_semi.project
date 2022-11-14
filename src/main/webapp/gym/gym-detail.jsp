
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
							<i class="fa-solid fa-heart" check="${favresult }" id="heart"></i>

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
					let gym_x = "${gymList.gym_x}";
					let gym_y = "${gymList.gym_y}";

					var mapContainer = document.getElementById("map"), // 지도를 표시할 div
						mapOption = {
						center: new kakao.maps.LatLng(gym_x, gym_y), // 지도의 중심좌표
						level: 3, // 지도의 확대 레벨
						};

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new kakao.maps.Map(mapContainer, mapOption);

					function createMarker(name, x, y){
						var positions =
							{
								content: "<div class=info><img src='/resource/fitneeds.ico'>"+name+"</div>", 
								latlng: new kakao.maps.LatLng(x, y)
							}
						
						// 마커 이미지의 이미지 주소입니다
						var imageSrc = "/resource/img/ping.png"; 
							
						// 마커 이미지의 이미지 크기 입니다
						var imageSize = new kakao.maps.Size(64, 69);
						
						// 마커 이미지를 생성합니다    
						var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);
						
						// 마커를 생성합니다
						var marker = new kakao.maps.Marker({
							map: map, // 마커를 표시할 지도
							position: positions.latlng, // 마커를 표시할 위치
							image : markerImage // 마커 이미지 
						});
						// 마커에 표시할 인포윈도우를 생성합니다 
						var infowindow = new kakao.maps.InfoWindow({
							content: positions.content // 인포윈도우에 표시할 내용
						});
						// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
						// 이벤트 리스너로는 클로저를 만들어 등록합니다 
						// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
						kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
						kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
					};
					// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
					function makeOverListener(map, marker, infowindow) {
						return function() {
							infowindow.open(map, marker);
						};
					}
					// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
					function makeOutListener(infowindow) {
						return function() {
							infowindow.close();
						};
					}

					createMarker("${gymList.gym_name}","${gymList.gym_x}","${gymList.gym_y}");
				</script>


				<div class="placeprice shadow-none p-3 mb-3 bg-light rounded">
					<dt>
						<p class="text_normal">이용료</p>
					</dt>
					<dd>${gymList.gym_price }</dd>
				</div>
			</div>

			<div class="reviewbox">
				<div class="reviewn">
					<p class="text_title">리뷰</p>
				</div>
				
					<div class="reviewr">
						<button type="button" class="btn_base" id="reviewbtn"
							type="button">리뷰작성</button>
					</div>
					
				

				<c:choose>
					<c:when test="${not empty reviewList }">
						<!-- 리스트가 비어있지않다면 -->
						<c:forEach var="r" items="${reviewList }">
							<div class="review2">

								<div
									class="recontents shadow p-3 mb-5 bg-body rounded text_normal">
							
									<div class="authmark" >
									
										<i class="fa-solid fa-user-shield auth" ></i>
									
										<c:if test="${r.review.review_photo != '인증완료'}">
										<script>
											$(".auth").attr("style", "display:none" )
										</script>	
										</c:if>
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
												<span class = "reviewcnt" id ="recnt"> ${r.review.review_like}</span>
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
						<c:if test="${reviewList !=null}">
							<div class="newmore">
								<a href="#" class="btn btn_outline" data-bs-toggle="button"
									id="load">NEW MORE</a>
							</div>
						</c:if>
					</c:when>
					<c:otherwise>
						<div class="other">작성된 리뷰가 없습니다</div>
					</c:otherwise>
				</c:choose>




			</div>
		</div>





		<div class="rcontents">
		<c:choose>

  			  <c:when test="${gymAvg !='' }">
			<div class="gymscore" id="gscore">
				${gymAvg.gymAvg }점
				</div>
		
			</c:when>
			<c:otherwise>
			등록된 평점이 없습니다
			</c:otherwise>
		</c:choose>
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
	
						
						
						<c:if test="${gymImg.gym_sysimg != null}">
  						  let sysimg = JSON.parse('${gymImg.gym_sysimg}');
   							 console.log(sysimg);
			
 									<div class="infopicture">

							<figure class="figure">
								<img src="/resource/img/${gymImg.gym_sysimg}"
									class="figure-img img-fluid rounded" alt="..." />
								<figcaption class="figure-caption"></figcaption>
							</figure>
						</div>
  						  </c:if>
						
				
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
					
					 location.reload();
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

					 location.reload();
					console.log("좋아요 취소")}
			})
		}
	})

	


	// 즐겨찾기 아이콘 트루면 빨강, 아니면 회색
	$(document).ready(function() {
		
		let fav = $("#heart").attr("check") == "true" ? true : false;
		
		console.log(fav);
		    	if(fav){
		    		console.log(fav + ": 빨강")
			    	$("#heart").css("color", "#CF0C00");
			    }else{
			    	console.log(fav + ": 회색")
			    	$("#heart").css("color", "#8f959a")
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
          labels: ["PT 만족도", "상담 만족도", "시설 규모", "기구 다양성", "시설 청결"],
          datasets: [
            {
              label: "My Second Dataset",
              data: [${checkList.check1},${checkList.check2},${checkList.check3},${checkList.check4},${checkList.check5}],
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
            scales: {
                r: {
                    suggestedMin: 0,
          

                    stepSize: 1
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
    	  if("${userSeq}"==""){
    		  Swal.fire({
    			  icon: 'error',
    			  title: 'Oops...',
    			  text: '로그인 사용자만 작성 가능합니다',
    			
    			})
    			return false;
    	  }else{
    		   location.href = "/reviewWrite.gym?gym_seq=${gymList.gym_seq}";
    	  }
       
        }); //리뷰작성 이동
      </script>


</main>

<%@ include file="/layout/footer.jsp"%>