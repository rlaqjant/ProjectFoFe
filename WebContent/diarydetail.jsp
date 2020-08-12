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
                margin-bottom: 2%; 
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
            	<input type="hidden" value="${diary.id}" name="homephost"/>
                <tr class="a1">
                    <td id="index">${diary.diaryidx}</td>
                    <td id="date">${diary.diaryreg_date}</td>
                    <td id="hit">${diary.diarybhit}</td>
                    <td id="update" ><a id="detailUpdate" href="./diaryUpdate?idx=${diary.diaryidx}">수정</a></td><!--컨트롤러탈때 idx값 넣어보내기  -->
                    <td id="delete"><a id="detailDelete" href="./diaryDetailDelete?idx=${diary.diaryidx}">삭제</a></td>
                </tr>
                <tr class="a2">
                    <td id="subject" colspan="5"><h3>${diary.diarysubject}</h3></td>
                </tr>
                <tr class="a3">
                    <td class="detail" colspan="5">
                        <textarea id="detail" readonly>${diary.diarycontent}</textarea>
                    </td>
                </tr>
            </table>
            <div class="list">
                <!-- <input type="button" name="list" value="목록보기" onclick="location.href='./diaryList.jsp'"> -->
                <button><a href="diaryList?homephost=${diary.id}">목록보기</a></button>
            </div>
        </div>
</body>
<script>
var homephostId = $("input[name='homephost']").val();
minihomeCheck();//미니홈피 주인 확인
	function minihomeCheck() {
		$.ajax({
		type:"get",
		url:"minihomeCheck",
		data:{"homephostId": homephostId},
		dataType:"JSON",
		success:function(data){ 		
			if(data.result){ //미니홈피 주인이 맞다면
				
			}else{
				$("#detailUpdate").css({"display":"none"});
				$("#detailDelete").css({"display":"none"});
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}

</script>
</html>