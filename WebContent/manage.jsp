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
			height: 210px;
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
		/* .filebox{
                margin: 10px;
                text-align: center;
            }
            .filebox input{
                text-align: center;
                display: inline-block; 
                padding: .5em .75em; 
                color: #999; 
                font-size: inherit; 
                line-height: normal; 
                vertical-align: middle;
                background-color: #fdfdfd; 
                cursor: pointer; 
                border: 1px solid #ebebeb;
                border-bottom-color: #e2e2e2; 
                border-radius: .25em;
                width: 80%;
            }
            .filebox label{ 
                text-align: center;
                display: inline-block; 
                padding: .5em .75em; 
                color: #999; 
                font-size: inherit; 
                line-height: normal; 
                vertical-align: middle;
                background-color: #fdfdfd; 
                cursor: pointer; 
                border: 1px solid #ebebeb;
                border-bottom-color: #e2e2e2; 
                border-radius: .25em;
                width: 80%;
                } 

            .filebox input[type="file"]{
                position: absolute; 
                width: 1px; 
                height: 1px;
                padding: 0; 
                margin: -1px; 
                overflow: hidden; 
                clip:rect(0,0,0,0);
                border: 0; 
                } */
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
			
				<div id="manage_profile_preveal"><img src="C:/upload/${newfilename}" width="100%" height="100%"></div><!-- 프로필 사진 -->
				 <!-- <form action="upload" method="POST" enctype="multipart/form-data"> -->
                    <!-- <div class="filebox"> <label for="ex_file">사진 가져오기</label> </div> -->
					<h4>${msg}</h4>
					<form action="manageUpload" method="POST" enctype="multipart/form-data"><!--파일 업로드의 method는 post로 설정한다./ enctype="multipart/form-data"반드시 있어야한다.-->
						<input type="text" name="title"/>
						<input type="file" name="profile"/>
						<input type="submit" value="업로드"/>
						
					</form>
			</div>
			
			<div class="manage_profile">
			
				<div id="manage_gate_preveal"></div><!-- 대문사진 -->
				<h4>${msg}</h4>
					<form action="manageUpload1" method="POST" enctype="multipart/form-data"><!--파일 업로드의 method는 post로 설정한다./ enctype="multipart/form-data"반드시 있어야한다.-->
						<input type="text" name="title"/>
						<input type="file" name="profile1"/>
						<input type="submit" value="업로드"/>
						
					</form>
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