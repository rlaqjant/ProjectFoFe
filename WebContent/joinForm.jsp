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
            #join{
                position: absolute;
                top: 23%;
                left: 38%;
                border: 1px solid black;
                width: 22%;
                height: 50%;
                
                
            }
            #joinbutton{
                border-radius: 30px;
                background-color: black;
                color: blanchedalmond;
                width: 40%;
                height: 5%;
                margin: 35px;
            }
            #jointitle{
                position: absolute;
                font-size: 20px;
                top: 5%;
                left: 39%;
                

            }
            #joinchild{
                position: absolute;
                top: 10%;
                left: 20%;
                font-size: 20px;
               
            }
           
            #sidelogo{
                position: absolute;
                top: 30%;
                left: 18%;
            }
            #background{
                position: relative;
                width: 100%;
                height: 100%;
                background-image: url(#);

            }
            #x{
                position: absolute;
                top: 25%;
                left: 58%;
                width: 30px;
                height: 20px;
            }

        </style>
    </head>
    <body>

        <div id="sidelogo"><img  src="로고자리.png" /></div>
        <form action="#" method="POST">
            <img id="x" src="x.png"></div>
            
            
            <div id="jointitle" style="font-size: 40px;"><h2>회원가입</h2></div>
            <div id="join">
                <!--아이디 부분은 중복확인을 위해 따로 데이터전송을 해줘야하므로
                    그 부분은 추후에 추가-->
                
              <div id="joinchild"> 
                   
                    아이디<br/>
                    <input type="text" placeholder="아이디" name="" style="width:190px; height:30px" ;/>
                    <input type="button" value="중복확인" style="text-align:center; width:100px; height:30px";/><br/>
                    
                    

                    비밀번호<br/>
                    <input type="text" placeholder="비밀번호(8~32자리)" name="" style="width:190px; height:30px"; /><br/>
                    전화번호<br/>
                    <input type="text" placeholder="10-0000-0000" name="" style="width:190px; height:30px";/><br/>
                    이름<br/>
                    <input type="text" placeholder="이름을 입력해주세요" name="" style="width:190px; height:30px";/><br/>
                    이메일<br/>
                    <input type="text" placeholder="이메일을 입력해주세요" name="" style="width:190px; height:30px";/><br/>

                  
                    <input id="joinbutton" type="submit" placeholder="회원가입" style="width:190px; height:30px";>
                  
              </div> 


            </div>

        </form>



    </body>
    <script>
        





    </script>
</html>