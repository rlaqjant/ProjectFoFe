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
		#dark{
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.4);
                position: absolute;
                top: 0;
                left: 0;
                display: none;
         }
         #popup{
             box-sizing: border-box;
             width: 500px;
             height: 300px;
             background-color: snow;
             margin-left: auto;
             margin-right: auto;
             margin-top: 300px;
         }
         #album_photo{
             box-sizing: border-box;
             width: 300px;
             height: 300px;
             border-right: 1px solid gray;
             float: left;
         }
         #album_text{
             box-sizing: border-box;
             width: 200px;
             height: 120px;
             border-bottom: 1px solid gray;
             float: left;
         }
         #x_close{
         	position: fixed;
         	top: 100px;
         	right: 100px;
         	width: 45px;
         	height:45px;
         	color: black;
         	font-size: 40px;
         	background-color: transparent;
         	border: none;
         }
         #album_reply{
             box-sizing: border-box;
             width: 200px;
             height: 180px;
             float: left;
         }
         #image1{/*이미지를 대용하는 버튼. 추후 삭제*/
         	width: 180px;
         	height: 180px;
         	background-color: #d3dbff;
         	font-size: 40px;
         	margin-left: 20px;
         	margin-top: 20px;
         }
	</style>
	</head>
	<body>
		<input type="button" value="이미지1" id="image1"/><!-- 이미지를 대신하는 버튼. 추후 삭제 -->
		<div id="dark">
			<button id="x_close">x</button>
            <div id="popup">
                <div id="album_photo">(해당 앨범 사진 영역)</div>
                <div id="album_text">(글 영역)</div>
                <div id="album_reply">
	                (댓글 영역) </br>
	                <!-- 게시 버튼 -->
	                <input id="reply" type="text"/>
	                <input id="replyBtn" type="button" value="게시"/>
                </div>
            </div>
        </div>
	</body>
	<script>
		$("#image1").click(function(){
			$("#dark").show();
		});
		$("#x_close").click(function(){
			$("#dark").css("display","none");
		});
		
		
		//댓글 작성
		$("#replyBtn").click(function(){
			var reply = $("#reply").val(); //댓글 내용
			console.log(reply);
			
			/* 여러개 받아오고 싶을 때
			var param ={};
			param.id = $id.val();
			param.pw = $pw.val();
			*/
			
			$.ajax({
				type:'get',
				url:'albumReply',
				data: reply,
				dataType:'JSON',//필수템
				
				success:function(result){
					console.log(result);
				},
				error:function(error){
					console.log(error);
				}
			});
		});
		
		//댓글목록 불러오기
	</script>
</html>