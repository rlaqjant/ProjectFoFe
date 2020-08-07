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
		.diarydetail{
                width: 600px;
                height: 590px;
                margin: 0px;
            }
            table{
                font-size: 10pt;
                text-align: center;
                width: 100%;
                height: 90%;
                border-radius: 5px;
                margin-left: auto;
                margin-right: auto;
                margin-bottom: 4%;
                padding: 0px;
                border-spacing: 0px;
            }
            tr{
                border-radius: 5px;   
            }
            td{
                border: solid 0.5px gray;
            }
            #date{
                width: 45%;
            }
            #index{
                width: 15%;
                border-top-left-radius: 5px;
            }
            #hit{
                width: 10%;
            }
            #update{width: 15%;}
            
            #delete{
                width: 20%;
                border-top-right-radius: 5px;
            }
            .detail{
                border-bottom-left-radius: 5px;
                border-bottom-right-radius: 5px;
            }
            .a1{height: 5%;}

            .a2{height: 10%;}
            
            .a3{height: 85%;}
            textarea:focus{outline: none;}
            #detail{width: 99%; height: 99%; border: 0; resize: none;}
            .list{
                text-align: right;
            }
	</style>
</head>
<body>
	<div class="diarydetail">
            <table>
                <tr class="a1">
                    <td id="index">글번호m</td>
                    <td id="date">2020-08-04m</td>
                    <td id="hit">조회수m</td>
                    <td id="update"><a href="./diaryupdate.html">수정</a></td>
                    <td id="delete">삭제</td>
                </tr>
                <tr class="a2">
                    <td id="subject" colspan="5"><h3>제목m</h3></td>
                </tr>
                <tr class="a3">
                    <td class="detail" colspan="5">
                        <textarea id="detail" readonly>내용m</textarea>
                    </td>
                </tr>
            </table>
            <div class="list">
                <input type="button" name="list" value="목록보기" onclick="location.href='./diaryList.jsp'">
            </div>
        </div>
</body>
<script></script>
</html>