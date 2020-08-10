    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
    <head>
        <meta charset="">
        <title></title>
        <style>
            #background{
                width: 100%;
                height: 33%;
                position: relative;
                background-color: crimson;
            }
            #photo{
                width: 100%;
                height: 33%;
                position: relative;
                background-color: cornflowerblue;
                
            }
            #music{
                width: 100%;
                height: 33%;
                position: relative;
                background-color: brown;
            }
            .inputbox{
                width: 80%;
                height: 80%;
                position: relative;
                margin-left: 10%;
            }
            header{
                font-size: 18px;
                padding: 1%;
                padding-left: 10%;
                font-weight: bold;
                
            }
            .input{
                
                width: 50%;
                height: 100%;
                background-color: skyblue;
                position: absolute;
            }
            .input1{
                
                width: 50%;
                height: 100%;
                background-color: darkkhaki;
                position: absolute;
                left: 50%;
            }
            #choice{
                position: absolute;
                top: 10%;
                left: 10%;
                width: 80%;
                height: 80%;
            }
            .color{
                font-size: 16px;
			    margin: 4%;
                padding: 4%;
            }
            .preveal{
                width: 50%;
                height: 50%;
                border: 1px solid gray;
                margin-top: 5%;
                margin-left: auto;
                margin-right: auto;
            }
            .information{
                width: 100%;
                height: 50%;
            }
        </style>
    </head>
    <body>
        <div id="background">
            <header>꾸미기</header>
            <div class="inputbox">
                <div class="input">

                </div>
                <div class="input1">
                    <div id="choice">
                        <div class="color"><input name="background" type="radio" value="#cf1b1b"/>빨강</div>
                        <div class="color"><input name="background" type="radio" value="#fbd46d"/>노랑</div>
                        <div class="color"><input name="background" type="radio" value="#0f4c75"/>파랑</div>
                        <div class="color"><input name="background" type="radio" value="#206a5d"/>초록</div>
                    </div>
                </div>
                
            </div>
            
        </div>
        <div id="photo">
            <header>프로필 & 대문사진 변경</header>
            <div class="inputbox">
                <div class="input">
                        <div class="preveal">
                            <img src="" width="100%" height="100%">
                        </div>
                        <div class="information">
                            <span>${msg}</span>
                            <form action="manageUpload" method="POST" enctype="multipart/form-data">
                                <input type="text" name="title"/>
                                <input type="file" name="profile"/>
                                <input type="submit" value="업로드"/>
                            </form>
                        </div>
                </div>
                <div class="input1">
                    <div class="preveal">
                        <img src="" width="100%" height="100%">
                    </div>
                    <div class="information">
                        <span>${msg}</span>
                        <form action="manageUpload1" method="POST" enctype="multipart/form-data">
                            <input type="text" name="title"/>
                            <input type="file" name="profile1"/>
                            <input type="submit" value="업로드"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div id="music">
            <header>BGM 변경</header>
            <div class="inputbox">
                <div class="input">

                </div>
                <div class="input1">
                    <div class="information">
                        <span>${msg}</span>
                        <form action="manageUpload2" method="POST" enctype="multipart/form-data">
                            <input type="text" name="title"/>
                            <input type="file" name="profile2"/>
                            <input type="submit" value="업로드"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </body>
    <script>

    </script>
</html>