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
            	box-sizing: border-box;
                margin-left: auto;
                margin-right: auto;
                margin-top: 10px;
                border: 1px solid black;
                width: 400px;
                height: 500px;
                padding: 50px 25px 0 25px;
            }
            #joinbutton{
                border-radius: 30px;
                background-color: black;
                color: blanchedalmond;
                width: 200px;
                height: 40px;
                margin: 35px;
            }
            #jointitle{
                font-size: 20px;
                margin-left: auto;
                margin-right: auto;
                margin-top: 100px;
                width: 300px;
                height: 150px;
            }
            #joinchild{
                font-size: 20px;
                width: 310px;
                height: 300px;
               	margin-left: auto;
               	margin-right: auto;
            }
           
            #sidelogo{
                position: absolute;
                top: 30%;
                left: 1%;
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
            #makeJoinbuttonCenter{
            	width: 300px;
            	height: 50px;
         		text-align: center;
            }
        </style>
    </head>
    <body>
        <div id="sidelogo"><img  src="images/로고.png" /></div>
            <!-- <img id="x" src="images/x.png"> -->
			<div id="jointitle" style="font-size: 40px;"><h2>회원가입</h2></div>
	        <form action="join" method="post">
	            <div id="join">
	                <!--아이디 부분은 중복확인을 위해 따로 데이터전송을 해줘야하므로
	                    그 부분은 추후에 추가-->
		            <div id="joinchild">                      
	                    아이디<br/>
	                    <input type="text" placeholder="아이디" value="${checkingId}" name="id" style="width:190px; height:30px" ;/>
	                    <input type="button" id="idCheck" value="중복확인" style="text-align:center; width:100px; height:30px";/><br/> 
	                    비밀번호<br/>
	                    <input type="password" placeholder="비밀번호(8~32자리)" name="pw" style="width:298px; height:30px"; /><br/>
	                    전화번호<br/>
	                    <input type="text" placeholder="10-0000-0000" name="phone" style="width:298px; height:30px";/><br/>
	                    이름<br/>
	                    <input type="text" placeholder="이름을 입력해주세요" name="name" style="width:298px; height:30px";/><br/>
	                    이메일<br/>
	                    <input type="text" placeholder="이메일을 입력해주세요" name="email" style="width:298px; height:30px";/><br/> 
	                    <div id="makeJoinbuttonCenter">                
	                    	<input id="joinbutton" type="submit" value="회원가입"> 
	                    </div> 
                    </div>                 
	            </div>
	        </form>
    </body>
    <script>
    $(document).ready(function(){ 	
		$("#idCheck").click(function(){
			var id=$("input[name='id']").val();
			console.log(id);
			$.ajax({
				type:"get",
				url:"idCheck",
				data:{"id":id},
				dataType:"JSON",
				success:function(data){
					console.log(data);
					if(id==""){
						alert("아이디를 입력하세요.");
						$id.focus();
						console.log("아이디 미입력");
					}else if(data.idCheck){
						alert("이미 사용 중인 아이디입니다.");
						$("input[name='id']").val("");
					}else{
						alert("사용 가능한 아이디입니다.");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		});
    });

    </script>
</html>