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
            .check{width: 15%; text-align: center;}
            #subject{width: 35%;}
            #user{width: 15%; text-align: center;}
            #date{width: 25%; text-align: center;}
            #hit{width: 10%; text-align: center;}
            tr{height: 70px; margin: 0px;}
            #btn{margin-top: 7px;}
            #wr{text-align: right;}
            
            body{
            width:600px;
            height:640px;
            }
            #wr{
            margin:3px;
            }
            table{
        
            background-image: url(images/simple.jpg);
            background-size: 600px 600px;
            
            }
        </style>
</head>
<body>
	
	 <form action="diaryDelete" method="get"><!-- 폼태그로 보내야...파라미터를받겠지? 근데 버튼으로안주고 보낼수가잇나? 일단 컨트롤러는 action으로 탈수있는데..아니다 꼭 form을 써야하나... -->
            <table id="list">
                <tr>
                    <th class="check">삭제</th>
                    <th id="subject">제목</th>
                <!--     <th id="user">작성자</th> -->
                    <th id="date">작성일</th>
                    <th id="hit">조회수</th>
                </tr>
               
                <c:forEach items="${list}" var="diary">
                		<tr>
		                    <td class="check"><input type="checkbox" name="check" value="${diary.diaryidx}"></td><!--list안에있는 diaryidx를 가져올거야.  -->
		                    <td id="subject"><a href="./diaryDetail?idx=${diary.diaryidx}" style="text-decoration: none;color: black;">${diary.diarysubject}</a></td><!--제목누르는순간 컨트롤러탄다.  -->
		                    <!--  <a href="detail?idx=${bbs.idx}"> 얘는 list의  idx값을 idx안에 넣어준거다?  -->
		                    <%-- <td id="user">${diary.id}</td> --%>
		                    <td id="date">${diary.diaryreg_date}</td>
		                    <td id="hit">${diary.diarybhit}</td>
	                    </tr>
                    </c:forEach>
               		 
            </table>
          
                <div id="wr">
                    <span><input id="deletBtn" type="submit" value="삭제"></span>
                    <button id="writeBtn" ><a href="diaryWriteForm?homephost=${homephost}" style="text-decoration: none;color: black;">글쓰기</a></button>
                    <input type="hidden" value="${homephost}" name="homephost"/>
                </div>
              </form>  
                <div id="page">
                    <a href="./diaryList?page=${currPage-1}&&homephost=${homephost}"><span>PREV</span></a>
                    <span><b>${currPage}</b></span>
                    <a href="./diaryList?page=${currPage+1}&&homephost=${homephost}"><span>NEXT</span></a>
                </div>
            </div>
        </div>
</body>
<script>
 	var msg ="${msg}";//msg보낸거 띄워야되는데...어떻게 띄우더라.
	if(msg!=""){
		alert(msg);
	}
 	
	var homephostId = $("input[name='homephost']").val();
	minihomeCheck();//미니홈피 주인 확인 메서드
		function minihomeCheck() {
			$.ajax({
			type:"get",
			url:"minihomeCheck",
			data:{"homephostId": homephostId},
			dataType:"JSON",
			success:function(data){ 		
				if(data.result){ //미니홈피 주인이 맞다면
				}else{
					$("#deletBtn").css({"display":"none"});
					$("#writeBtn").css({"display":"none"});
					$(".check").css({"display":"none"});
				}
			},
			error:function(e){
				console.log(e);
			}
		});
	}
 	
 
</script>
</html>