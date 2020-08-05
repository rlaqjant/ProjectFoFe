<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>포플</title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            .login{min-height:80px; text-align:right;}
            .logo{min-width:980px; height:260px; text-align:center;}
            .search{min-width:980px; text-align:center;}
            #srch{width:400px; height:50px; padding:5px; border-radius:30px; color:#5aad01; font-size: 12pt; font-weight: bold; box-shadow:0px 3px 3px 2px #d3fdb8;border: 1px solid #d6ffab;
            background-image:url(); background-repeat: no-repeat; padding: 5px; text-align: center;}
            #srch:focus {outline:none;}
            #srch:hover {border: 2px solid #b1f16c; }
            input::placeholder {color: #9bdf53; text-align: center;}
        </style>
    </head>
    <body >
        <!--전체 감싸기-->
        <div>
            <!--로그인, 회원가입-->
            <div class="login">
                <span><a href="index.html">로그아웃</a></span>
                <span><a href="joinForm.html">회원가입</a></span>
            </div>
            <!--로고-->
            <div class="logo">
                <a href=""><img src="images/logo_fofriends.png" width="300px"></a>
            </div>
            <!--내 프로필-->
            <div></div>
            <!--검색창-->
            <div class="search"><input id="srch" type="text" placeholder="당신의 포플을 찾아봐요"></div>
            <!--친구목록-->
            <div></div>
        </div>
    </body>
    <script>
        
    </script>
</html>

