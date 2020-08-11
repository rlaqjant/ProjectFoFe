<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<style>
            body{width: 640px; height: 600px;}
            #diary{
                position: relative;
                top: 1%;
                left: 3%;
                width: 600px;
                height: 590px;
                margin: 0px;
            }
            #list{
                width: 590px;
                border-top: solid 1px black; 
                border-bottom: solid 1px black;
                margin: auto;
                height: auto;
                margin-top: 15px;
            }
            #page{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                font-size: 15pt;
            }
            #check{width: 15%; text-align: center;}
            #subject{width: 35%;}
            #user{width: 15%; text-align: center;}
            #date{width: 25%; text-align: center;}
            #hit{width: 10%; text-align: center;}
            tr{height: 70px; margin: 0px;}
            #btn{margin-top: 7px;}
            #wr{text-align: right;}
        </style>
</head>
<body>
	
	 <form action="diaryDelete" method="get"><!-- 폼태그로 보내야...파라미터를받겠지? 근데 버튼으로안주고 보낼수가잇나? 일단 컨트롤러는 action으로 탈수있는데..아니다 꼭 form을 써야하나... -->
            <table id="list">
                <tr>
                    <th id="check">글번호</th>
                    <th id="subject">제목</th>
                    <th id="user">작성자</th>
                    <th id="date">작성일</th>
                    <th id="hit">조회수</th>
                </tr>
                <c:forEach items="${list}" var="diary">
                		<tr>
                	
		                    <td id="check"><input type="checkbox" name="check" value="${diary.diaryidx}">${diary.diaryidx}</td><!--list안에있는 diaryidx를 가져올거야.  -->
		                    <td id="subject"><a href="./diaryDetail?idx=${diary.diaryidx}">${diary.diarysubject}</a></td><!--제목누르는순간 컨트롤러탄다.  -->
		                    <!--  <a href="detail?idx=${bbs.idx}"> 얘는 list의  idx값을 idx안에 넣어준거다?  -->
		                    <td id="user">${diary.id}</td>
		                    <td id="date">${diary.diaryreg_date}</td>
		                    <td id="hit">${diary.diarybhit}</td>
	                    </tr>
                    </c:forEach>
               		 
            </table>
          
                <div id="wr">
                    <span><input id="btn" type="submit" value="삭제"></span>
                    <span><input id="btn" type="button" value="글쓰기" onclick="location.href='./diarywrite.jsp'"></span>
                </div>
              </form>  
                <div id="page">
                    <a href="./?page=${currPage-1}"><span>PREV</span></a>
                    <span><b>${currPage}</b></span>
                    <a href="./?page=${currPage+1}"><span>NEXT</span></a>
                </div>
            </div>
        </div>
</body>
<script>
 	var msg ="${msg}";//msg보낸거 띄워야되는데...어떻게 띄우더라.
	if(msg!=""){
		alert(msg);
	}
 
</script>
</html>