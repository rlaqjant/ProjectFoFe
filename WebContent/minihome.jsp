<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Insert title here</title>
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <style>
      body{
                background-color: lightcoral;
                padding: 20px;
            }
            #whole{
                width: 1300px;
                height: 750px;
            }
            #back{
                width: 1000px;
                height: 700px;
                background-color: crimson;
                float: left;
                border-radius: 20px;
                margin-right: 20px;
                padding: 20px;
            }
            #dotted_line{
                width: 100%;
                height: 100%;
                border: 2px dotted white;
                border-radius: 20px;
            }
            #minihome{
                width: 96%;
                height: 94%;
                background-color: peachpuff;
                margin-left: auto;
                margin-right: auto;
                margin-top: 1%;
                border-radius: 15px;
                padding: 10px;
                font-size: 30px;
            }
            #minihome a{
                text-decoration: none;
                color: black;
            }
            #top{
                width: 1000px;
                height: 50px;
                float: left;
            }
            #minihome_name{
                width: 400px;
                height: 40px;
                margin-bottom: 10px;
                margin-right: 120px;
                background-color: transparent;
                border: 1px solid white;
                float: left;
            }
            #top_menu{
                width: 400px;
                height: 50px;
                border: 1px solid white;
                float: left;
            }
            .top_menu{
                width: 60px;
                height: 40px;
                font-size: 11px;
                background-color: pink;
                border: 1px solid snow;
            }
            #side_menu{
            	
                box-sizing: border-box;
                width: 300px;
                height: 600px;
                background-color: snow;
                border-radius: 10px;
                border: 2px solid gray;
                float: left;
                margin-right: 20px;
            }
            #profile_image{
                width: 240px;
                height: 240px;
                margin: 30px;
                border: 1px solid gray;
                background-image: url("http://blogfiles.naver.net/MjAyMDAyMTBfMTA3/MDAxNTgxMjY5MDAxNDIw.VoXLiKsE_xVCpNzMacA6G3WtyYWSxbE015qUUcb8Tt8g.D-CiU-TmNEylK818HUowj9WniDj0OUXSngh8-il7r_Ug.GIF.o2oo_o/1581265188597.gif");
                background-size: cover;
                background-position: 50%;
            }
            #profile_message{
                width: 240px;
                height: 100px;
                margin-left: 30px;
                border: 1px solid gray;
                font-size: 15px;
            }
            #email{
                width: 240px;
                height: 50px;
                margin-left: 30px;
                margin-top: 40px;
                border: 1px solid gray;
                font-size: 15px;
            }
            #changer{
                box-sizing: border-box;
                width: 640px;
                height: 600px;
                background-color: snow;
                border-radius: 10px;
                border: 2px solid gray;
                float: left;
            }
            #assist{
                width: 200px;
                height: 400px;
                background-color: transparent;
                border: 1px solid white;
                float: left;
            }
            audio{
                width: 150px;
                height: 30px;
                margin: 20px 70px;
            }
   </style>
   </head>
   <body>
      <div id="whole">
            <div id="back">
                <div id="dotted_line">
                    <div id="minihome">
                        <div id="top">
                            <div id="minihome_name"><!--최상단의 미니홈피 이름 구역-->
                                <a href="#" target="_parent">오늘의 볼 미니홈피</a>
                            </div>
                            <div id="top-menu">
                                <button class="top_menu">홈</button>
                                <button class="top_menu">프로필</button>
                               <button class="top_menu" >다이어리</button>
                                <button class="top_menu">사진첩</button>
                                <button class="top_menu">방명록</button>
                                <button class="top_menu">관리</button>
                            </div>
                        </div>
                        <div id="center">
                            <div id="side_menu">
                                <div id="profile_image"></div>
                                <div id="profile_message">볼리자베스의 미니홈피</br>0000 0000</div>
                                <audio autoplay controls loop>
						               <source src="C:\Users\gd\Desktop\project UI\싹쓰리.mp3" type="audio/mp3">
						        </audio>
                                <div id="email">조회수</br>bentory@world.com</div>
                            </div>
                            <div id="changer">
                                <!--관리, 다이어리, 사진첩 등 들어갈 곳. 가로 640, 세로 600(순수 흰 구역) 설계시 마진 필요! -->
                        <jsp:include page="albumDetail.jsp"></jsp:include><!-- :인클루드는 편의상 사용함. 나중에 아이프레임으로 바꿀 때 삭제-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="assist">
            
            </div>
        </div>
   </body>
   <script>
   $(document).ready(function(){});
      
   </script>
</html>