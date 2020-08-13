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
                font-size: 24px;
            }
            #top{
                width: 1000px;
                height: 50px;
                float: left;
            }
            #minihome_name{
            	position: relative;
                width: 400px;
                height: 40px;
                margin-bottom: 10px;
                margin-right: 120px;
                background-color: transparent;
                border: 1px solid white;
                float: left;
            }
            #minihome_nameBtn{
            	position: absolute;
            	top: 20px;
            	left: 400px; 
            }
            #minihome_nameEdit{
            	position: absolute;
            	top: 20px;
            	left: 400px; 
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
                margin: 30px 30px 10px 30px;
                border: 1px solid white;
                background-size: cover;
                background-position: 50%;
            }
            /* 팔로우 영역-----------------------------------------------*/
            #followArea{
            	position: relative;
            	width: 240px;
            	height: 30px;
            	margin-left: 30px;
            	margin-bottom: 10px;
            	background-color: blue;
            }
            #follow{
            	background-color: white;
            	position: absolute;
            }
            #unFollow{
            	background-color: black;
            	color: white;
            	position: absolute;
            }
            /* 팔로우 영역----------------------------------------------- */
            #profile_message{
            	position: relative;
                width: 240px;
                height: 100px;
                margin-left: 30px;
                border: 1px solid gray;
                font-size: 15px;
            }
            #profile_messageBtn{
            	position: absolute;
            	left: 193px;
            	top: 100px;
            }
            input[name="minihome_nameEdit"]{
				width: 396px;
                height: 40px;
                font-size: 24px;
                border: none;
			}
            input[name="profile_messageEdit"]{
            	position: absolute;
            	left: 1px;
            	top: 2px;
				width: 240px;
                height: 100px;
                border: none;
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
            iframe {
				width: 620px;
                height: 580px;
			}
			#homeView{display: block; margin: 10px 0px 0px 10px;}
			#profileView{display: none; margin: 10px 0px 0px 10px;}
			#diaryView{display: none; margin: 10px 0px 0px 10px;}
			#albumView{display: none; margin: 10px 0px 0px 10px;}
			#guestBookView{display: none; margin: 10px 0px 0px 10px;}
			#manageView{display: none; margin: 10px 0px 0px 10px;}

   </style>
   </head>
   <body style="background-color : ${minihome.backcolor}">
      <div id="whole">
            <div id="back">
                <div id="dotted_line">
                    <div id="minihome">
                        <div id="top">
                            <div id="minihome_name"><!--최상단의 미니홈피 이름 구역-->
                                <div id="minihome_nameDetail">${minihome.minihname}<input type="hidden" name="minihome_nameDetail" value="${minihome.minihname}"></div>
                                <div><input type="button" name="minihome_nameBtn" id="minihome_nameBtn" onclick="minihome_nameChange()" value="EDIT"></div>
                            </div>
                            <div id="top-menu">
                                <button class="top_menu" id="homeBtn">홈</button>
                                <button class="top_menu" id="profileBtn">프로필</button>
                                <button class="top_menu" id="diaryBtn">다이어리</button>
                                <button class="top_menu" id="albumBtn">사진첩</button>
                                <button class="top_menu" id="guestBookBtn">방명록</button>
                                <button class="top_menu" id="manageBtn">관리</button>
                            </div>
                        </div>
                        <div id="center">
                            <div id="side_menu">
                                <div id="profile_image"><img alt="" src="/profilePhoto/${minihome.profilephoto}" width="240px" style="border-radius:50%" height="240px"></div>
                                <div id="followArea"><input type="button" name="followbtn" id="follow" onclick="follow()" value="팔로우"></div>
                                <div id="profile_message">
                                	<div id="profile_messageDetail">${minihome.minihintro}<input type="hidden" name="profile_messageDetail" value="${minihome.minihintro}"></div>
                                	<div><input type="button" name="profile_messageBtn" id="profile_messageBtn" onclick="profile_messageChange()" value="EDIT"></div>
                                </div>
                                <audio autoplay controls loop>
						               <source src="#" type="audio/mp3">
						        </audio>
                                <div id="email">조회수</br>${minihome.email}</div>
                            </div>
                            <div id="changer"><!-- 게시판 내용 나타나는 구역 homeView만 나타나있고 나머지는 메뉴버튼 클릭 시 나타남 -->
                            	<iframe id="homeView" src="minihomeMain?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            	<iframe id="profileView" src="profileDetail?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            	<iframe id="diaryView" src="diaryList?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            	<iframe id="albumView" src="giveAlbumlist?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            	<iframe id="guestBookView" src="guestBookList?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            	<iframe id="manageView" src="manage.jsp?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div id="assist">
            
            </div>
        </div>
        <input type="hidden" name="homephost" value="${minihome.id}"><!-- 현재 홈페이지 주인 확인용 hidden -->
   </body>
   <script>
   		var homephostId = $("input[name='homephost']").val();
   		
   		minihomeCheck();//미니홈피 주인 확인
   		function minihomeCheck() {
   			$.ajax({
    			type:"get",
    			url:"minihomeCheck",
    			data:{"homephostId": homephostId},
    			dataType:"JSON",
    			success:function(data){ 		
					if(data.result){ //미니홈피 주인이 맞다면
						$("#follow").css({"display":"none"});
					}else{
						followCheck();
						$("#minihome_nameBtn").css({"display":"none"});
						$("#manageBtn").css({"display":"none"});
						$("#profile_messageBtn").css({"display":"none"});
					}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
   		
   		function followCheck() {//팔로우중인지 확인
   			$.ajax({
    			type:"get",
    			url:"followCheck",
    			data:{"homephostId": homephostId},
    			dataType:"JSON",
    			success:function(data){ 		
    				if(data.result){
    					$("input[name='followbtn']").attr({"onclick":"unFollow()", "value":"팔로잉", "id":"unFollow"});
					}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
   		
   		function follow() {//팔로우 버튼
   			$.ajax({
    			type:"post",
    			url:"follow",
    			data:{"homephostId": homephostId},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data.result);    		
    				if(data.result){
    					alert("팔로우 완료.");
    					$("input[name='followbtn']").attr({"onclick":"unFollow()", "value":"팔로잉", "id":"unFollow"});
    					location.reload();
    				}else{
    					alert("로그인이 필요합니다.");
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
   		
   		function unFollow() {//팔로잉 버튼(팔로우 중에만 나타남)
   			$.ajax({
    			type:"post",
    			url:"unFollow",
    			data:{"homephostId": homephostId},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data.result);    		
    				if(data.result){
    					alert("팔로우를 취소했습니다.");
    					$("input[name='followbtn']").attr({"onclick":"follow()", "value":"팔로우", "id":"follow"});
    					location.reload();
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
   		}
   		
   		function minihome_nameChange() {//미니홈피 이름 수정 버튼(주인만 나타남)
   			var minihome_nameDetail = $("input[name='minihome_nameDetail']").val();
			$("#minihome_nameDetail").empty();
			$("#minihome_nameDetail").append("<input type='text' name='minihome_nameEdit' id='minihome_nameEditBox' value='"+minihome_nameDetail+"'/>");
			$("#minihome_nameEditBox").focus();
			$("input[name='minihome_nameBtn']").attr({"onclick":"minihome_nameEdit()", "value":"수정"});
		}
   		function minihome_nameEdit() {
   			var minihome_nameEdit = $("input[name='minihome_nameEdit']").val();
   			console.log(minihome_nameEdit);
   			$.ajax({
    			type:"post",
    			url:"minihomeNameEdit",
    			data:{
    				"homephostId": homephostId,
    				"minihome_nameEdit":minihome_nameEdit,
    			},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data.result);
    				if(data.result){
    					location.reload();
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}
   		function profile_messageChange() {//미니홈피 소개글 수정 버튼(주인만 나타남)
   			var profile_messageDetail = $("input[name='profile_messageDetail']").val();
			$("#profile_messageDetail").empty();
			$("#profile_messageDetail").append("<input type='text' name='profile_messageEdit' id='profile_messageEditBox' value='"+profile_messageDetail+"'/>");
			$("#profile_messageEditBox").focus();
			$("input[name='profile_messageBtn']").attr({"onclick":"profile_messageEdit()", "value":"수정"});
		}
   		function profile_messageEdit() {
   			var profile_messageEdit = $("input[name='profile_messageEdit']").val();
   			console.log(profile_messageEdit);
   			$.ajax({
    			type:"post",
    			url:"profileMessageEdit",
    			data:{
    				"homephostId": homephostId,
    				"profile_messageEdit":profile_messageEdit,
    			},
    			dataType:"JSON",
    			success:function(data){
    				console.log(data.result);
    				if(data.result){
    					location.reload();
    				}
    			},
    			error:function(e){
    				console.log(e);
    			}
    		});
		}

   		$("#homeBtn").click(function () {
   			location.reload();
			$("#homeView").css({"display": "block"});
			$("#profileView").css({"display": "none"});
			$("#diaryView").css({"display": "none"});
			$("#albumView").css({"display": "none"});
			$("#guestBookView").css({"display": "none"});
			$("#manageView").css({"display": "none"});
		});
   		$("#profileBtn").click(function () {
   			$('#profileView').attr('src', "profileDetail?homephost="+homephostId);
			$("#homeView").css({"display": "none"});
			$("#profileView").css({"display": "block"});
			$("#diaryView").css({"display": "none"});
			$("#albumView").css({"display": "none"});
			$("#guestBookView").css({"display": "none"});
			$("#manageView").css({"display": "none"});
		});
   		$("#diaryBtn").click(function () {
   			$('#diaryView').attr('src', "diaryList?homephost="+homephostId);
			$("#homeView").css({"display": "none"});
			$("#profileView").css({"display": "none"});
			$("#diaryView").css({"display": "block"});
			$("#albumView").css({"display": "none"});
			$("#guestBookView").css({"display": "none"});
			$("#manageView").css({"display": "none"});
		});
   		$("#albumBtn").click(function () {
			$("#homeView").css({"display": "none"});
			$("#profileView").css({"display": "none"});
			$("#diaryView").css({"display": "none"});
			$("#albumView").css({"display": "block"});
			$("#guestBookView").css({"display": "none"});
			$("#manageView").css({"display": "none"});
		});
   		$("#guestBookBtn").click(function () {
			$("#homeView").css({"display": "none"});
			$("#profileView").css({"display": "none"});
			$("#diaryView").css({"display": "none"});
			$("#albumView").css({"display": "none"});
			$("#guestBookView").css({"display": "block"});
			$("#manageView").css({"display": "none"});
		});
   		$("#manageBtn").click(function () {
			$("#homeView").css({"display": "none"});
			$("#profileView").css({"display": "none"});
			$("#diaryView").css({"display": "none"});
			$("#albumView").css({"display": "none"});
			$("#guestBookView").css({"display": "none"});
			$("#manageView").css({"display": "block"});
		});
   </script>
</html>