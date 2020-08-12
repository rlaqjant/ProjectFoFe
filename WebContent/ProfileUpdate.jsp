<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>01_start.html</title>
        
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            #profilechan{
                position: relative;
                border: 1px solid black;
                width: 640px;
                height: 600px;
            }
            #chartChan{
                position: absolute;
                top: 10%;
                left: 13%;
                border: 1px solid black;
                font-size: 25px;
                width: 450px;
                height: 460px;
                padding: 10px;
                line-height: 210%;
            }
            #confirm{
                position: absolute;
                top: 92%;
                left: 80%;
            }
        </style>
    </head>
    <body>
        <div id="profilechan">
            My Profile
            <hr style="width: 640px;"><br/>
            <form action="profileUpdate" method="post">
                <div id="chartChan">
                이름:&nbsp;<input type="text" name="nickname" value="${Profile.nickname}" style="width:190px; height:30px"><br/>
                생일:&nbsp;<input type="text"  name="myBirth" value="${Profile.myBirth}" style="width:190px; height:30px"><br/>
                혈액형:&nbsp;<input type="text" name="blood" value="${Profile.blood}" style="width:165px; height:30px"><br/>
                주소:&nbsp;<input type="text" name="addr" value="${Profile.addr}" style="width:190px; height:30px"><br/>
            
                전공:&nbsp;<input type="text" name="major" value="${Profile.major}" style="width:190px; height:30px"><br/>
                나만의 이성유혹법:&nbsp;<input type="text" name="seduWay" value="${Profile.seduWay}" style="width:335px; height:30px"><br/>
                좌우명:&nbsp;<input type="text" name="motto" value="${Profile.motto}" style="width:255px; height:30px"><br/>
                인생영화:&nbsp;<input type="text" name="fMovie" value="${Profile.fMovie}" style="width:230px; height:30px"><br/>

                
                </div>
            	<input type="hidden" name="homephost" value="${Profile.id}">
                <input id="confirm" type="submit" value="완료" />
            </form>
    
    
    
            </div>
    </body>
    <script>
        
    </script>
</html>