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
            #body{
                position: static;
                width: 620px;
                height: 580px;
                background-color: coral;
            }
            #viewbox{
                position: relative;
                width: 620px;
                height: 440px;
                background-color: purple;
            }
            #viewDetail{
                position: absolute;
                width: 580px;
                height: 420px;
                top: 10px;
                left: 20px;
                text-align: center;
                background-color: teal;
                overflow:auto;
            }
            .viewDetail2 {
                position: relative;
                margin: 25px 0px;
            }
            .viewDetail2 table, th, td{
                border: 1px solid black;
                border-collapse: collapse;
                width: 530px;
        
            }
            .viewDetail2 table{
                margin: 20px 5px;
            }
            table div{
                float: left;
            }
            table img{
                width: 150px;
                height: 150px;
                border-radius: 50%;
            }
            .date{
                position: absolute;
                left: 195px;
            }
            .updateDelete{
                position: absolute;
                left: 448px;
            }
            input[type="button"]{
                border: none;
                background-color: white;
            }
            .GuestbookDetail{
                margin: 20px 20px;
            }
            #pageing{
                position: absolute;
                top: 460px;
                width: 620px;
                height: 40px;
                background-color: darkkhaki;
            }
            .pageArea{
                position: absolute;
                left: 239px;
            }
            #wrightBox{
                position: absolute;
                top: 10px;
                width: 620px;
                height: 80px;
                top: 500px;
                background-color: darkred;
            }
            #wrightBox div{
                position: absolute;
                left: 25px;
                top: 18px;
            }
            #wrightBox input[type="text"]{
                width: 505px;
                height: 40px;
            }
            #wrightBox input[type="submit"]{
                width: 60px;
                height: 40px;
            }
		</style>
	</head>
	<body>
		<div id="body"> <!-- 미니홈피 틀 크기 맞추기용 div영역 -->
            <div id="viewbox"> <!-- 방명록 글들 들어올 영영(다른 영역이랑 겹치지 않기용)-->
                <div id="viewDetail"> <!--방명록 글들 들어올 영역(스크롤용)-->
                    <div class="viewDetail2"><!--여기 영역 하나가 방명록 DB에서 불러올 부분-->
                        <table>
                            <tr>
                                <td>
                                    <div class="userName">USER NAME</div>
                                    <div class="date">2020.07.29 17:55:01</div>
                                    <div class="updateDelete"><input type="button" value="수정"/><input type="button" value="삭제"/></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                    <img src="https://d2ph5fj80uercy.cloudfront.net/04/cat2410.jpg" alt="userProfile" title="userName">
                                    </div>
                                    <div class="GuestbookDetail">
                                        GuestbookDetail
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="viewDetail2"><!--여기 영역 하나가 방명록 DB에서 불러올 부분-->
                        <table>
                            <tr>
                                <td>
                                    <div class="userName">USER NAME</div>
                                    <div class="date">2020.07.29 17:55:01</div>
                                    <div class="updateDelete"><input type="button" value="수정"/><input type="button" value="삭제"/></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                    <img src="https://d2ph5fj80uercy.cloudfront.net/04/cat2410.jpg" alt="userProfile" title="userName">
                                    </div>
                                    <div class="GuestbookDetail">
                                        GuestbookDetail
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="viewDetail2"><!--여기 영역 하나가 방명록 DB에서 불러올 부분-->
                        <table>
                            <tr>
                                <td>
                                    <div class="userName">USER NAME</div>
                                    <div class="date">2020.07.29 17:55:01</div>
                                    <div class="updateDelete"><input type="button" value="수정"/><input type="button" value="삭제"/></div>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div>
                                    <img src="https://d2ph5fj80uercy.cloudfront.net/04/cat2410.jpg" alt="userProfile" title="userName">
                                    </div>
                                    <div class="GuestbookDetail">
                                        GuestbookDetail
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div id="pageing"><!--페이징 영역-->
                <div class="pageArea">
                    <a href="./?page=${currPage-1}"><span><</span></a>
                    <span><b>${currPage}</b></span>
                    <a href="./?page=${currPage+1}"><span>></span></a>
                </div>
            </div>
            <div id="wrightBox"><!--방명록 작성 영역-->
                <div>
                    <form action="GuestbookWright" method="POST">
                        <input type="text" name="GuestbookWright" placeholder="메시지를 입력하세요"/>
                        <input type="submit" value="입력"/>
                    </form>
                </div>
            </div>
        </div>
	</body>
	<script>
	
	</script>
</html>
