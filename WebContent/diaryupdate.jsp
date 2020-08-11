<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
		.write{
                width: 600px;
                height: 590px;
                margin: 0px;
                border: solid 1px black;
                border-radius: 10px;
            }
            table{
                font-size: 20pt;
                text-align: center;
                width: 100%;
                height: 87%;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 4%;
                padding: 0px;
            }
            tr{
                border: solid 1px black; 
            }
            .a1{height: 20%;}
            .a2{height: 80%;}
            .complete{text-align: right; }
			
			#subject{
				width: 75%; height: 40%; font-size: 20pt
			}
			#content{
				width: 90%; height: 100%; resize: none
			}
			#com{
			style="width: 70px; height: 30px; margin-right: 30px
			}
			
	</style>
</head>
<body>
우웅${diary}<!--테이블이 불러와졌나 확인해본다.  -->
	<div class="write">
		<form action="diaryComplete" method="post">
            <table>
            	<tr>글번호</tr>
            		<th>${diary.diaryidx}</th>
            		<input type="hidden" name="idx" value="${diary.diaryidx}"/><!-- 받아올 값 유일한 pk 서버엔 전송o사용자에겐 안보임 -->
            		<!-- 파라미터보내서 나중에 ?대응하는 애 -->
            		
                <tr class="a1">
                    <th>제목:</th>
                    <td>
                        <input type="text" id="subject" name="diarysubject" value="${diary.diarysubject}" />
                    </td>
                </tr>
                <tr class="a2">
                    <td>
                        <input type="text" id="content" name="diarycontent" value="${diary.diarycontent}" />
                    </td>
                </tr>
                <div class="complete">
                <input type="hidden" name="homephost" value="${diary.id}"/>
                <input type="submit" id="com" value="완료"/></a>
                <!-- 완료는 글쓰기 컨트롤러 그대로 타면 안되나?  안된당..ㅎㅎ-->
            	</div>
             </table>
            </form>
            
        </div>
</body>
<script></script>
</html>