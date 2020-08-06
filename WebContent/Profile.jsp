<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>프로필</title>
       
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style TYPE="text/css">
            #profile{
                position: relative;
                border: 1px solid black;
                width: 640px;
                height: 600px;
                
            }
            #posi{
                position: absolute;
                top: 10%;
                left: 13%;
                border: 1px solid black;
                font-size: 25px;
                width: 470px;
                height: 470px;
                
                line-height: 210%;
                
            }
            #chart{
                position: absolute;
                top: 0%;
                left: 0%;
                font-size: 24px;
                width: 470px;
                height: 470px;
                padding: 8px;
                line-height: 190%;

            }
            #write{
                position: absolute;
                top: 90%;
                left: 78%;
                
            }
           
            #update{
                position: absolute;
                top: 90%;
                left: 71%;

            }
           
           

        </style>
    </head>
    <body>
        <div id="profile">
            My Profile
            <hr style="width: 640px;"><br/>
            <div id="posi">
            <table id="chart">
            <tr><td>이름:</td></tr>&nbsp;<td>${profile.nickname}</td><br/>
            <tr><td>생일:</td></tr>&nbsp;<td>${profile.myBirth}</td><br/>
            <tr><td>혈액형:</td></tr>&nbsp;<td>${profile.blood}</td><br/>
            <tr><td>주소:</td></tr>&nbsp;<td>${profile.addr}</td><br/>
           
            <tr><td>전공:</td></tr>&nbsp;<td>${profile.major}</td><br/>
            <tr><td>나만의 이성유혹법:</td></tr>&nbsp;<td>${profile.seduWay}</td><br/>
            <tr><td>좌우명:</td></tr>&nbsp;<td>${profile.motto}</td><br/>
            <tr><td>인생영화:</td></tr>&nbsp;<td>${profile.fMovie}</td><br/>
            </table>
            
            </div>

            <input id="write" type="button" value="글쓰기" onclick="location.href='ProfileWrite.jsp'"/>
            <input id="update" type="button" value="수정" onclick="location.href='ProfileUpdate.jsp'"/>
            
    
    
    
            </div>





    </body>
    <script>
	    var msg="${msg}";
	    if(msg!=""){
	    	alert(msg);
	    }
        
        $("#write").click(function(){
            location.href="#";
        });




    </script>
</html>