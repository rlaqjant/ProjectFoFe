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
            body{width: 640px; height: 600px;}
            .diary{
                position: relative;
                top: 1%;
                left: 3%;
                width: 600px;
                height: 590px;
                margin: 0px;
            }
            .list{
                width: 590px;
                border-top: solid 1px black; 
                border-bottom: solid 1px black;
                margin: auto;
                height: auto;
                margin-top: 15px;
            }
            .page{
                margin-left: auto;
                margin-right: auto;
                text-align: center;
                font-size: 15pt;
            }
            .check{width: 15%; text-align: center;}
            .subject{width: 35%;}
            .user{width: 15%; text-align: center;}
            .date{width: 25%; text-align: center;}
            .hit{width: 10%; text-align: center;}
            tr{height: 70px; margin: 0px;}
            .btn{margin-top: 7px;}
            .wr{text-align: right;}
        </style>
</head>
<body>
	<div class="diary">
            <table class="list">
                <tr>
                    <th class="check">체크</th>
                    <th class="subject">제목</th>
                    <th class="user">작성자</th>
                    <th class="date">작성일</th>
                    <th class="hit">조회</th>
                </tr>
                <tr>
                    <td class="check"><input type="checkbox">241</td>
                    <td class="subject"><a href="./diarydetail.html">[스크랩]너는 내 운명</a></td>
                    <td class="user">김예예</td>
                    <td class="date">2007.07.27</td>
                    <td class="hit">22</td>
                </tr>
            </table>
            <div>
                <div class="wr">
                    <span><input class="btn" type="button" value="삭제"></span>
                    <span><input class="btn" type="button" value="글쓰기" onclick="location.href='./diarywrite.jsp'"></span>
                </div>
                <div class="page">
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