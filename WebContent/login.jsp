<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

		
<html>
    <head>
        <meta charset="UTF-8">
        <title>login</title> 
        <style>
            
            #miniimg{
                display: inline-block;
                position: absolute;
                top: 10%;
                left: 23%;
                width: 20%;
                height: 80%;
                border: 1px solid black;
            }
            #loginbox{
                display: inline-block;
                position: absolute;
                top: 13%;
                left: 45%;
                width: 25%;
                height: 65%;
                border: 1px solid black;
            }
            #cyworld{
                margin-top: 5%;
                text-align: center;
                position: relative;
                width: 100%;
                height: 30%;

            }
            #id{
                text-align: center;
                width: 100%;
                height: 25%;
            }
            #ps{
                text-align: center;
                width: 100%;
                height: 25%;
                background-color: chocolate;
            }
            #loginbutton{
                text-align: center;
                width: 100%;
                height: 20%;
            }
            form{
                text-align: center;
            }

        </style>
    </head>
    <body>
        <div id="miniimg"></div>
        <div id="loginbox">
        <div id="cyworld"><img src="images/cyworld_logo.png" alt=""></div>
            <form action="post">
                <div id="id">
                    <input type="text" placeholder="싸이계정(이메일 또는 전화번호)
                    " name="" style="width:80%; height:50px; border-right:0px; border-top:0px; border-left:0px;" /><br/><br/><br/>
                    <input type="text" placeholder="비밀번호
                    " name="" style="width:80%; height:50px; border-right:0px; border-top:0px; border-left:0px;"; /><br/>
                </div>
                <div id="loginbutton">
                    <input type="submit" value="로그인" style="margin-top: 50px; width:300px; height:50px; background-color: black; color: white; border-radius: 15px;";><br/>
                </div>
               
               <div style="position: relative; width: 30%; left: 70%; font-size: 22px; text-align: center; top: 30px;">회원가입</div>
            </form>
        </div>
    </body>
</html>