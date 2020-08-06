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
		
	</style>
</head>
<body>
	<div class="write">
            <table>
                <tr class="a1">
                    <td style="width: 90%;">
                        <input type="text" id="subject" style="width: 90%; height: 40%; font-size: 20pt;" placeholder="제목을 수정 해주세요.">
                    </td>
                </tr>
                <tr class="a2">
                    <td>
                        <textarea id="content" style="width: 90%; height: 100%; resize: none;" placeholder="내용을 수정 해주세요."></textarea>
                    </td>
                </tr>
            </table>
            <div class="complete">
                <input type="button" name="com" value="완료" style="width: 70px; height: 30px; margin-right: 30px;">
            </div>
        </div>
</body>
<script></script>
</html>