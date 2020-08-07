<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <link rel="icon" href="images/icon_ff.png">
        <title>포플</title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            /*로그인, 회원가입*/
            .login{min-height:80px; font-size: 10pt;}
            .login_box{text-align: right; margin-right: 15px; margin-top: 25px;}
            .login :link{color: #5aad01; text-decoration:none;}
            .login :visited{color: #5aad01;}
            .login :hover{color: #3b7200;}
            .login :active{color: #5aad01;}

            /*로고*/
            .logo{min-width:1230px; height:260px; text-align:center;}

            /*검색창*/
            .search{min-width:1230px; text-align:center;}
            #srch{width:400px; height:50px; padding:5px; border-radius:30px; color:#5aad01; font-size: 12pt; font-weight: bold; box-shadow:0px 3px 3px 2px #d3fdb8;
            border: 1px solid #d6ffab; background-image:url(); background-repeat: no-repeat; padding: 5px;}
            #srch:focus {outline:none;}
            #srch:hover {border: 4px solid #d3fdb8;}
            #srch::placeholder {color: #9bdf53; text-align:center;}

            /*친구목록*/
            .friends_po{width: 100%; min-width:1230px; text-align: center;}
            .friends{width: 100%; height:300px; text-align: center; border-collapse: collapse;}
            .friendsPhoto{width: 300px; height: 300px; text-align:center;}
            .ImgRadius{max-width: 300px; max-height: 300px; border-radius:30px;}
            td{max-width: 300px; max-height: 300px;}
            .friendName :link{color: #5aad01; text-decoration:none;}
            .friendName :visited{color: #5aad01;}
            .friendName :hover{color: #3b7200;}
            .friendName :active{color: #5aad01;}
            .photo{cursor: pointer;}

            /*웹폰트 : 적용은 안됨. 추후 시간나면 하려고 형식만 일단 가져옴.*/
            @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
            body { font: 17px 'Nanum Gothic', sans-serif; }

            /*더보기 버튼*/
            #button{position: absolute; width:70px; height:30px; left: 48%; top: 96%; cursor: pointer;
            border: 1px solid #86d356; border-radius:30px; background-color: #86d356; font-size: 12pt; color: white;}
            
        </style>
    </head>
    <body >
        <!--1페이지-->
        <div style="width: 100%; height: 100%; padding: 0; margin: 0; border: 0;">
            <div>
                <!--로그인, 회원가입-->
                <div class="login">
                    <div class="login_box">
                    <span><a href="login.jsp">로그인</a></span>
                    <span><a href="joinForm.jsp">회원가입</a></span>
                    </div>
                </div>

                <!--로고-->
                <div class="logo">
                    <a href="#"><img src="images/logo_fofriends.png" width="300px"></a>
                </div>

                <!--내 프로필-->
                <div></div>

                <!--검색창-->

                <div class="search">
                		<input id="srch" type="text" name="srchName" placeholder="포플 친구를 검색하세요!"/>
                		<input type="button" id="srchBtn" value="검색"/>
                		<table id="searchResult">
                		</table>
                </div>               
            </div>
        </div>


        

    </body>
    <script>
    	//친구 검색, 불러오기
    	$("#srchBtn").click(function () {
    		var srchName = $("input[name='srchName']").val();
    		console.log("srchName : "+srchName);
    		
    		$.ajax({
    			type:"get",
    			url:"memberSearch",
    			data:{"srchName":srchName},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data);
    				if(!data.result){
    					alert("친구가 없어요");
    				}else{
    					$("#searchResult").empty();
    					for (var i = 0; i < data.arrList.length; i++) {
        					var id = data.arrList[i].id;
        					var name = data.arrList[i].name;
        					
        					$("#searchResult").append("<tr>"
        				            +"<td><a href='loadMinihome?id="+id+"'>"+id+"</a></td>"
        				            +"<td>"+name+"</td>"
        				            +"</tr>");
        				}
    				}
    					
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
    	})
    	//로고 클릭시 검색창 없어짐
    	$(".logo").click(function () {
    		$("#searchResult").empty();
		})
		
    </script>
</html>
