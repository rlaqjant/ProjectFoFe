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
		#color{
			box-sizing: border-box;
			width: 580px;
			height: 200px;
			margin-left: auto;
			margin-right: auto;
			border: 1px solid gray;
			margin-botton: 20px;
		}
		p{
			font-size: 20px;
			font-weight: 800;
			margin: 40px 0 0 30px;
			clear: left;
		}
		.color{
			font-size: 20px;
			margin: 15px;
		}
		#choice{
			width: 289px;
			height: 200px;
			float: left;			
		}
		#preveal{
			box-sizing: border-box;
			width: 289px;
			height: 198px;
			padding: 20px;
			float: left;
			background-color: transparent;
		}
		#manage_photo{
			box-sizing: border-box;
			width: 580px;
			height: 220px;
			margin-left: auto;
			margin-right: auto;
		}
		.manage_profile{
			width: 284px;
			height: 200px;
			border: 1px solid gray;
			float: left;
			margin: 2px;
			padding-top: 10px;
			text-align: center;
		}
		#manage_profile_preveal{
			width: 150px;
			height: 150px;
			border: 1px solid gray;
			margin-left: auto;
			margin-right: auto;
		}
		#manage_gate_preveal{
			width: 200px;
			height: 150px;
			border: 1px solid gray;
			margin-left: auto;
			margin-right: auto;
		}
		.manage_profile button{
			width: 100px;
			height: 25px;
		}
	</style>
	</head>
	<body>
		<p>배경색 변경</p>
		<div id="color">			
			<div id="choice">
				<div class="color"><input name="background" type="radio" value="#cf1b1b"/>빨강</div>
				<div class="color"><input name="background" type="radio" value="#fbd46d"/>노랑</div>
				<div class="color"><input name="background" type="radio" value="#0f4c75"/>파랑</div>
				<div class="color"><input name="background" type="radio" value="#206a5d"/>초록</div>
			</div>
			<div id="preveal">
				<img src="https://lh3.googleusercontent.com/proxy/PLL02Jmirww5Bjxy57_vq60wyW3v7WAuEn5psXvFKNEHavvQaS_5tB-a7smOuCstCXXG1COX7wFxFtfv4fKrTLzyAb28RAhUaVt_DlnX6LIrrjut" width="250px" height="160px">
			</div>
		</div>
		<p>프로필 및 대문사진 변경</p>
		<div id="manage_photo">
			<div class="manage_profile">
				<div id="manage_profile_preveal"></div>
				<button class="temporary">가져오기</button>
			</div>
			<div class="manage_profile">
				<div id="manage_gate_preveal"></div>
				<button class="temporary">가져오기</button>
			</div>
		</div>
	</body>
	<script>
	$(document).ready(function(){});
	$("input[type='radio']").click(function(){
		$("#preveal").css({"background-color":$(this).val()});//미리보기 색상 변경
		$("body").css({"background-color":$(this).val()});	//배경 색상 변경(이건 실험 삼아 해봤는데 작동해서 신기했던 기능. 뺄 것)
	});
	$(".temporary").click(function(){

	});
	</script>
</html>