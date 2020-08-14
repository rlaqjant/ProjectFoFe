<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
   <head>
	   <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	   <meta http-equiv="Pragma" content="no-cache" />
	   <meta http-equiv="Expires" content="0" />
      <meta charset="UTF-8">
      <title>Forest Friends</title>
      <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
   <style>
   #whole{
      position: absolute;
      width: 1400px;
      height: 830px;
      background-color: grey transparent;
      float: left;
      border-radius: 20px;
      left: 50%;
      top: 50%;
      margin-left: -700px;
      margin-top: -415px;
   }

   #minihome{
      width: 100%;
      height: 100%;
      background-color: transparent;
      margin-left: auto;
      margin-right: auto;
      border-radius: 15px;
      font-size: 32px;
   }
   #top{
      width: 100%;
      height: 55px;
      float: left;
      padding: 0;
      margin: 0;
      background-color: transparent;
   }
   #top-menu{
      float: right;
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
   .top_menu {
      width: 115px;
      height: 56px;
      font-size: 11px;
      background-color: white;
      border: 1px solid white;
      border-radius: 3px;
      box-shadow: 0px 6px 21px 1px #d3d3d3;
   }
   #side_menu{
      
      box-sizing: border-box;
      width: 285px;
      height: 775px;
      background-color: #caebc7;
      border-radius: 10px;
      box-shadow: 4px 17px 55px 1px #d3d3d3;
      float: left;
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
      font-size: 32px;
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
   #changer {
      box-sizing: border-box;
      width: 1115px;
      height: 775px;
      background-color: snow;
      border-radius: 10px;
      box-shadow: 4px 17px 55px 1px #d3d3d3;
      /* border: 2px solid gray; */
      float: right;
   }
   /*
   #assist{
      width: 200px;
      height: 400px;
      background-color: transparent;
      border: 1px solid white;
      float: left;
   }*/
   audio{
      width: 150px;
      height: 30px;
      margin: 20px 70px;
   }
   iframe {
      width: 1095px;
      height: 755px;
      left: 50%;
      top: 50%;
      margin-left: 547.5px;
      margin-top: 377.5px;
   }
   #viewDetail{margin: 10px 0px 0px 10px;}
   </style>
   </head>
   <body style="background-color : ${minihome.backcolor}">
   <div style="background-color: #caebc7; width: 101%; height: 101%;">
      <div id="whole">
         <div id="minihome">
            <div id="top">
               <div id="minihome_name"><!--최상단의 미니홈피 이름 구역-->
                  <div id="minihome_nameDetail">${minihome.minihname}<input type="hidden" name="minihome_nameDetail" value="${minihome.minihname}"></div>
                  <div><input type="button" name="minihome_nameBtn" id="minihome_nameBtn" onclick="minihome_nameChange()" value="EDIT"></div>
               </div>
               <div id="top-menu">
                  <button class="top_menu" id="manageBtn" onclick='viewFrame("manage.jsp?homephost=${minihome.id}")'>관리</button>
                  <button class="top_menu" id="profileBtn" onclick='viewFrame("profileDetail?homephost=${minihome.id}")'>프로필</button>
                  <button class="top_menu" id="diaryBtn" onclick='viewFrame("diaryList?homephost=${minihome.id}")'>다이어리</button>
                  <button class="top_menu" id="albumBtn" onclick='viewFrame("giveAlbumlist?homephost=${minihome.id}")'>사진첩</button>
                  <button class="top_menu" id="guestBookBtn" onclick='viewFrame("guestBookList?homephost=${minihome.id}")'>방명록</button>
                  <button class="top_menu" id="homeBtn" onclick='viewFrame("minihomeMain?homephost=${minihome.id}")'>홈</button>
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
                        <source src="/profilePhoto/${minihome.mp3}" type="audio/mp3">
                  </audio>
                  <div id="email">조회수</br>${minihome.email}</div>
               </div>
               <div id="changer"><!-- 게시판 내용 나타나는 구역 homeView만 나타나있고 나머지는 메뉴버튼 클릭 시 나타남 -->
                  <iframe id="viewDetail"  src="minihomeMain?homephost=${minihome.id}" frameborder="0" marginwidth="0" marginheight="0"></iframe>
               </div>
            </div>
         </div>
               <!--
               <div id="assist">
               
               </div>
               -->
      </div>
         <input type="hidden" name="homephost" value="${minihome.id}"><!-- 현재 홈페이지 주인 확인용 hidden -->
   </div>
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

         function viewFrame(url) {
        	 $('#viewDetail').attr('src', url);
		}
   </script>
</html>