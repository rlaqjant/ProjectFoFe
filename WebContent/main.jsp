<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
    <head>
    	<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	   	<meta http-equiv="Pragma" content="no-cache" />
	   	<meta http-equiv="Expires" content="0" />
        <meta charset="utf-8">
        <link rel="icon" href="icon_ff.png">
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
            #MyProfile{width: 50px; height: 50px; border-radius: 50%; border: 0px; padding: 0; margin: 0; vertical-align: middle;}

            /*로고*/
            .logo{min-width:1230px; height:260px; text-align:center;}
			
			/*내 미니홈피 가기*/
			#myhome{
				width: 100px;
				height: 100px;
				background-color: lightgreen;
				position: relative;
				margin: 0 auto;
			}
			#myhome{
				cursor: pointer;
			}
			
            /*검색창*/
            .search{min-width:1230px; text-align:center;}
            #srch{width:400px; padding:5px; border-radius:30px; color:#5aad01; font-size: 12pt; font-weight: bold; box-shadow:0px 3px 3px 2px #d3fdb8;
            border: 1px solid #d6ffab; background-image:url(); background-repeat: no-repeat; padding: 5px;}
            #srch:focus {outline:none;}
            #srch:hover {border: 4px solid #d3fdb8;}
            #srch::placeholder {color: #9bdf53; text-align:center;}

            /*친구목록*/
            .friends_po{position: relative; top: 10px; width: 500px;  margin: 0 auto;}
            .followingFriends{position: absolute; border: 1px solid; width: 500px; top: 40px; display: block;}
            .followerFriends{position: absolute; border: 1px solid; width: 500px; top: 40px; display: none;}
            .ImgRadius{max-width: 300px; max-height: 300px; border-radius:30px;}
            td{max-width: 300px; max-height: 300px;}
            .photo{cursor: pointer;}
			#following{
			position: absolute;
			height: 30px;
			width: 200px;
			background-color: green;
			font-weight: 700;
			}
			#follower{
			position: absolute;
			height: 30px;
			width: 200px;
			background-color: green;
			left: 300px;
			font-weight: 400;
			}
            /*웹폰트 : 적용은 안됨. 추후 시간나면 하려고 형식만 일단 가져옴.*/
            @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic');
            body { font: 17px 'Nanum Gothic', sans-serif; }

            /*더보기 버튼*/
            #button{position: absolute; width:70px; height:30px; left: 48%; top: 96%; cursor: pointer;
            border: 1px solid #86d356; border-radius:30px; background-color: #86d356; font-size: 12pt; color: white;}
            
        </style>
    </head>
    <body >
    	<input type="hidden" name="loginId" value="${loginId}"/> <!-- 로그인된 아이디 확인용 히든 -->
        <!--전체 감싸기-->
        <!--1페이지-->
        <div style="width: 100%; height: 100%; padding: 0; margin: 0; border: 0;">
            <div>
                <!--로그인, 회원가입-->
                <div class="login">
                    <div class="login_box">
                    <span><a href="logout">로그아웃</a></span>
                    <span><a href=""><img id="MyProfile" src="images/pengsoo.jpg"></a></span>
                    </div>
                </div>
				<a href="profileDetail?id=${Profile.id}">프로필 테스트 중. 추후 지울 링크</a>
                <!--로고-->
                <div class="logo">
                    <a href="#"><img src="images/logo_fofriends.png" width="300px"></a>
                </div>

                <!--내 미니홈피 가기-->
                <div id="myhome" onclick="goMyHome()"><a href='loadMinihome?id=${loginId}' target='_blank'>내 미니홈피</a></div>

                <!--검색창-->
                <div class="search">
                		<input id="srch" type="text" name="srchName" placeholder="포플 친구를 검색하세요!"/>
                		<input type="button" id="srchBtn" value="검색"/>
                		<table id="searchResult">
                		</table>
                </div>    

                <!--친구목록-->
                <div class="friends_po">
                	<div id="following" onclick="followingView()">팔로잉</div><div id="follower" onclick="followerView()">팔로워</div>
                    <table class="followingFriends">

                    </table>
                    <table class="followerFriends">

                    </table>
                </div>

                <!--더보기 버튼-->
                <div>
                    <a id="button" href="#ScreenB" style="text-align: center;">▼</a>
                </div>
            </div>
        </div>


    </body>
    <script>
    	loadFollowList ();
    	loadFollowerList();
    	function loadFollowList () { //팔로우 리스트 불러오기
    		var loginId = $("input[name='loginId']").val();
    		$.ajax({
    			type:"get",
    			url:"loadFollowList",
    			data:{"loginId":loginId},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data);
    				$(".followingFriends").empty();
    				for (var i = 0; i < data.arrList.length; i++) {
    					var id = data.arrList[i].id;
    					var name = data.arrList[i].name;
    					
    					$(".followingFriends").append("<tr>"
    				            +"<td><a href='loadMinihome?id="+id+"' target='_blank'>"+id+"</a></td>"
    				            +"<td>"+name+"</td>"
    				            +"</tr>");
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
    	function loadFollowerList () { //팔로워 리스트 불러오기
    		var loginId = $("input[name='loginId']").val();
    		$.ajax({
    			type:"get",
    			url:"loadFollowerList",
    			data:{"loginId":loginId},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data);
    				$(".followerFriends").empty();
    				for (var i = 0; i < data.arrList.length; i++) {
    					var id = data.arrList[i].id;
    					var name = data.arrList[i].name;
    					
    					$(".followerFriends").append("<tr>"
    				            +"<td><a href='loadMinihome?id="+id+"' target='_blank'>"+id+"</a></td>"
    				            +"<td>"+name+"</td>"
    				            +"<td><input type='button' value='"+id+"' class='unfollowBtn'/></td>"
    				            +"</tr>");
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
    	
    	function followingView() {//팔로우 목록 보기
    		$(".followingFriends").css({"display":"block"});
    		$(".followerFriends").css({"display":"none"});
    		$("#following").css({"font-weight":"700"});
    		$("#follower").css({"font-weight":"400"});
		}
		function followerView() {//팔로워 목록 보기
			$(".followingFriends").css({"display":"none"});
    		$(".followerFriends").css({"display":"block"});
    		$("#following").css({"font-weight":"400"});
    		$("#follower").css({"font-weight":"700"});
		}

		$(".unfollowBtn").click(function () {
			var a = $(this);
			console.log(a);
		})

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
        							+"<td><img src='/profilePhoto/"+id+"profilephoto.jpg' class='profileImg'/></td>"
        				            +"<td><a href='loadMinihome?id="+id+"' target='_blank'>"+id+"</a></td>"
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
		
		var msg="${msg}";
		if(msg!=""){
			alert(msg);	
		}
		
    </script>
</html>
