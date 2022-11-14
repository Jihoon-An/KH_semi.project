<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2022-11-14
  Time: 오후 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <title>404 HTML Template by Colorlib</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Kanit:200" rel="stylesheet">

    <!-- Font Awesome Icon -->
    <link type="text/css" rel="stylesheet" href="css/font-awesome.min.css" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<style>
    * {
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    body {
        padding: 0;
        margin: 0;
    }

    #notfound {
        position: relative;
        height: 100vh;
    }

    #notfound .notfound {
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
    }

    .notfound {
        max-width: 767px;
        width: 100%;
        line-height: 1.4;
        text-align: center;
        padding: 15px;
    }

    .notfound .notfound-404 {
        position: relative;
        height: 220px;
    }

    .notfound .notfound-404 h1 {
        font-family: 'Kanit', sans-serif;
        position: absolute;
        left: 50%;
        top: 50%;
        -webkit-transform: translate(-50%, -50%);
        -ms-transform: translate(-50%, -50%);
        transform: translate(-50%, -50%);
        font-size: 186px;
        font-weight: 200;
        margin: 0px;
        background: linear-gradient(130deg, #C7D3DC, #001A41);
        color:transparent;
        -webkit-background-clip: text;
        background-clip: text;
        text-transform: uppercase;
    }

    .notfound h2 {
        font-family: 'Kanit', sans-serif;
        font-size: 33px;
        font-weight: 200;
        text-transform: uppercase;
        margin-top: 0px;
        margin-bottom: 25px;
        letter-spacing: 3px;
    }


    .notfound p {
        font-family: 'Kanit', sans-serif;
        font-size: 16px;
        font-weight: 200;
        margin-top: 0px;
        margin-bottom: 25px;
    }


    .notfound a {
        font-family: 'Kanit', sans-serif;
        color: #003584;
        font-weight: 200;
        text-decoration: none;
        border-bottom: 1px dashed #003584;
        border-radius: 2px;
    }

    .notfound-social>a {
        display: inline-block;
        height: 40px;
        line-height: 40px;
        width: 40px;
        font-size: 14px;
        color: #003584;
        border: 1px solid #efefef;
        border-radius: 50%;
        margin: 3px;
        -webkit-transition: 0.2s all;
        transition: 0.2s all;
    }
    .notfound-social>a:hover {
        color: #fff;
        background-color: #003584;
        border-color: #003584;
    }

    @media only screen and (max-width: 480px) {
        .notfound .notfound-404 {
            position: relative;
            height: 168px;
        }

        .notfound .notfound-404 h1 {
            font-size: 142px;
        }

        .notfound h2 {
            font-size: 22px;
        }
    }

</style>





<body>

<div id="notfound">
    <div class="notfound">
        <div class="notfound-404">
            <h1>404</h1>
        </div>
        <h2>Oops! Nothing was found</h2>
        <p>빠른 시일내에 정상 복구하도록 하겠습니다.  <a href="/">Return to homepage</a></p>
    </div>
</div>

</body>

</html>
