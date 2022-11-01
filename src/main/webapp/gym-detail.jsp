<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- CSS only -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <!-- JavaScript Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
        crossorigin="anonymous"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />


    <style>
        * {
            box-sizing: border-box;
        }
        div{
            border: 1px solid black;
            /* padding :5px; */
        }
    
        .contents {
            margin: auto;
            width: 1200px;
            height: 100%;
            overflow: hidden;
        }
        .lcontents{
            width: 80%;
            height: 1000px;
            float: left;
        }
        .rcontents{
            width: 20%;
            height: 800px;
            float: right;
        }

        .placebox1{
            height: 50%;
        }
        .reviewbox{
            height: 50%;
        }
        .placename{
            width: 80%;
            height: 10%;
            float: left;
       

        }
        .icon1{
            width: 20%;
            height: 10%;
            float: left;
        }
       
        .place{
            width: 100%;
            height: 10%;
            float: left;
        }
     
    
        .placemap{
            width: 100%;
            height: 50%;
            float: left;
        }

      
        .machine_info{
            width: 100%;
            height: 10%;
            float: left;
        }
        .placeprice{
            width: 100%;
            height: 10%;
             float: left;
        }

        .reviewn{
            width: 80%;
            height: 50px;
            float: left;
        }
        .reviewr{
            width: 20%;
            height: 50px;
            float: left;
        }
        .review2{
            width: 100%;
     
        }
        .authmark{
            width: 10%;
            height: 30px;
            float: left;
        }
        .ranwriter{
            width: 40%;
            height: 30px;
             float: left;
        }
        .writerd{
            width: 40%;
             height: 30px;
             float: left;
        }
        .starc{
            width: 10%;
         height: 30px;
            float: left;
        }
        .recontents{
            width: 100%;
            height: 50%;
            float: left;
        }

        .chart1{
            width: 100%;
            height: 30%;
        }
        .infotag{
            width: 100%;
      
        }

        .infotag2{
            width: 100%;
            height: 30px;
        }
        .infopicture{
            width: 100%;
            height: 50px;
        }
    </style>

</head>
    
<body>
            <div class="contents">
                <div class="lcontents"> 
                    <div class="placebox1">
                        <div class="placename">시설명   </div>
                        <div class="icon1"> 아이콘</div>
                        <div class="place">위치</div>
                        <div class="place">연락처</div>
                        <div class="placemap">지도</div>
                        <div class="machine_info">기구정보</div>
                        <div class="placeprice">가격정보</div>
                    </div>

                    <div class="reviewbox">
                        <div class="reviewn">리뷰 
                        </div>
                        <div class="reviewr"><button type="button" id="addreview">리뷰작성</button></div>
                        <div class ="review2">
                            <div class="authmark">인증마크</div> 
                            <div class="ranwriter">writer</div>
                            <div class="writerd">writer_date</div>
                            <div class="starc">star</div>
                            <div class="recontents">contents</div>
                        </div>
                    </div>
                </div>
                <div class="rcontents">
                    <div class="chart1">chartjs</div>
                    <div class="infotag"> 
                        <div class="infotag2">운영시간</div>
                        <div class="infotag2">휴무일</div>
                        <div class="infotag2">시설정보1</div>
                        <div class="infotag2">시설정보2</div>
                    </div>
                    <div class="infopicture"> 사진</div>
                </div>
            </div>
</body>
</html>