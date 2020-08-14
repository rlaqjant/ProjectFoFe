<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<style>
			#homeView{
				position: relative;
				display: block;
				width: 1095px;
     			height: 755px;
				background-color: yellow;
				}
			#newDiaryList{
				position: absolute;
				width: 610px;
			    height: 320px;
			    top: 40px;
                left: 10px;
                background-color: coral;
			}
			#newDiaryList a{
			color: black;
			}
			#bbsList{
				position: absolute;
				width: 400px;
			    height: 250px;
			    top: 75px;
			    left: 660px;
                background-color: green;
			}
			#mainPhoto{
				position: absolute;
				width: 610px;
                height: 345px;
                top: 400px;
                left: 10px;
                background-color: red;
                text-align: center;
			}
			#followerTalk{
				position: absolute;
			    width: 435px;
			    height: 370px;
			    top: 375px;
			    left: 640px;
                background-color: yellowgreen;
			}
			#followerTalkTxt{
			width: 380px;
			height: 20px;
			background-color: transparent;
			border: 1px solid;
			}
		</style>
	</head>
	<body>
		<div id="homeView">
             <div id="newDiaryList"><table id="newDiaryListTable"></table></div>
             <div id="bbsList"></div>
             <div id="followerTalk">
             		일촌평
	             <form action="followerTalkWrite" method="post">
	             	<input type="text" name="followerTalk" id="followerTalkTxt"><input type="submit" id="followerTalkWriteBtn" value="작성">
	             	<input type="hidden" name="homephost" value="${homephostId}">
	             </form>
	             <table id="followerTalkList"></table>
             </div>
             <div id="mainPhoto"><img alt="" src="/profilePhoto/${mainphoto}" height="345px"></div>
         </div>
	</body>
	<script>
		var msg="${msg}";
		if(msg!=""){
			alert(msg);	
		}
		var homephostId = $("input[name='homephost']").val();
		getNewDiaryList();//미니홈피 메인 다이어리 가져오기
		function getNewDiaryList() {
			$.ajax({
			type:"post",
			url:"getNewDiaryList",
			data:{
				"homephostId": homephostId
			},
			dataType:"JSON",
			success:function(data){
				console.log(data.list);
				$("#newDiaryListTable").empty();
				for (var i = 0; i < data.list.length; i++) {
					var diarysubject = data.list[i].diarysubject;
					var diaryidx = data.list[i].diaryidx;
					$("#newDiaryListTable").append("<tr>"
				            +"<td><a href='diaryDetail?idx="+diaryidx+"' target='_self'>"+diarysubject+"</a></td>"
				            +"</tr>");
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
		getfollowerTalkList();
		function getfollowerTalkList() {
			$.ajax({
				type:"post",
				url:"getfollowerTalkList",
				data:{
					"homephostId": homephostId
				},
				dataType:"JSON",
				success:function(data){
					console.log(data.list);
					$("#followerTalkList").empty();
					for (var i = 0; i < data.list.length; i++) {
						var followerTalkIdx = data.list[i].followerTalkIdx;
						var followerTalkUser_name = data.list[i].followerTalkUser_name;
						var followerTalkContent = data.list[i].followerTalkContent;
						$("#followerTalkList").append("<tr>"
					            +"<th><a href='loadMinihome?id="+followerTalkUser_name+"' target='_blank'>"+followerTalkUser_name+"</th>"
					            +"<td>"+followerTalkContent+"</td>"
					            +"<td><form action='followerTalkDelete' method='post'><input type='hidden' name='followerTalkIdx' value='"+followerTalkIdx+"'><input type='hidden' name='homephostId' value='"+homephostId+"'>"
					            +"<input type='submit' id='followerTalkDeleteBtn' value='삭제'></form></td>" 
					            +"</tr>");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
		
		followCheck();
		function followCheck() {//팔로우중인지 확인
				$.ajax({
				type:"get",
				url:"followCheck",
				data:{"homephostId": homephostId},
				dataType:"JSON",
				success:function(data){ 		
					if(data.result){
						
					}else{
						$("#followerTalkWriteBtn").css({"display":"none"});
						$("#followerTalkTxt").attr("disabled",true);
						$("#followerTalkTxt").val("팔로우를 맺으면 한줄평을 남길 수 있어요");
					}
				},
				error:function(e){
					console.log(e);
				}
			});
		}
	</script>
</html>
