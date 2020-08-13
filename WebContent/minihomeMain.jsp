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
				width: 620px;
                height: 580px;
				background-color: yellow;
				}
			#newDiaryList{
				position: absolute;
				width: 300px;
                height: 180px;
                top: 15px;
                left: 5px;
                background-color: coral;
			}
			#newDiaryList a{
			color: black;
			}
			#bbsList{
				position: absolute;
				width: 300px;
                height: 180px;
                top: 15px;
                left: 315px;
                background-color: green;
			}
			#mainPhoto{
				position: absolute;
				width: 610px;
                height: 345px;
                top: 220px;
                left: 5px;
                background-color: red;
                text-align: center;
			}
		</style>
	</head>
	<body>
		<div id="homeView">
             <div id="newDiaryList"><table id="newDiaryListTable"></table></div>
             <div id="bbsList"></div>
             <div id="mainPhoto"><img alt="" src="/profilePhoto/${mainphoto}" height="345px"></div>
         </div>
         <input type="hidden" name="homephost" value="${homephostId}">
	</body>
	<script>
		var homephostId = $("input[name='homephost']").val();
		console.log(homephostId);
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
	</script>
</html>
