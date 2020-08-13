    <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
    <head>
        <meta charset="UTF-8">
        <title></title>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
        	#color{
				box-sizing: border-box;
				width: 580px;
				height: 200px;
				margin-left: auto;
				margin-right: auto;
				border: 1px solid gray;
				margin-bottom: 5px;
			}
			p{
				font-size: 20px;
				font-weight: 800;
				margin: 5px 0 0 30px;
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
				background-color: green;
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
				height: 130px;
				border: 1px solid gray;
				margin-left: auto;
				margin-right: auto;
			}
			#manage_gate_preveal{
				width: 200px;
				height: 130px;
				border: 1px solid gray;
				margin-left: auto;
				margin-right: auto;
			}
            #music{
                box-sizing: border-box;
				width: 580px;
				height: 50px;
				padding: 10px;
				margin-left: auto;
				margin-right: auto;
				border: 1px solid gray;
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
				<img src="https://lh3.googleusercontent.com/proxy/AreEmtjsqgvbsF3A4FOPTzCjetmRv6p9WioPPfijSJ0i-VpNiVwceseNEgUrPIQP9LaKbNGBaBveM8fDU89xeV94DjdbIeG93pNHJKzNy3kEIWFiEaxa2JKJLw" width="250px" height="160px">
			</div>
		</div>
		
		<p>프로필 및 대문사진 변경</p>
		<div id="manage_photo">
			<div class="manage_profile">
				<div id="manage_profile_preveal"><img src="" width="100%" height="100%"></div>
				<div class="information">
                    <span>${msg}</span>
                    <span>${newfilename}</span>
                    <form action="profileUpload" method="POST" enctype="multipart/form-data">
                        <input type="text" name="title"/>
                        <input type="file" name="profile"/>
                        <input type="submit" value="업로드"/>
                    </form>
                </div>
			</div>
			<div class="manage_profile">
				<div id="manage_gate_preveal"><img src="" width="100%" height="100%"></div>
				<div class="information">
                     <span>${msg}</span>
                     <form action="mainPhotoUpload" method="POST" enctype="multipart/form-data">
                         <input type="text" name="title"/>
                         <input type="file" name="profile1"/>
                         <input type="submit" value="업로드"/>
                     </form>
                 </div>
			</div>
		</div>

		<p>BGM 변경</p>
        <div id="music">
             <span>${msg}</span>
             <form action="BgmUpload" method="POST" enctype="multipart/form-data">
                 <input type="text" name="title"/>
                 <input type="file" name="profile2"/>
                 <input type="submit" value="업로드"/>
             </form>
        </div>
    </body>
    <script>
	    $(document).ready(function(){});
		$("input[type='radio']").click(function(){
			$("#preveal").css({"background-color":$(this).val()});//미리보기 색상 변경
		});
    </script>
</html>