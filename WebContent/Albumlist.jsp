<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <title>photo</title>
        <meta charset="UTF-8">
       	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <style>
            #phli {
			    position: relative;
			    width: 1000px;
			    height: 755px;
			    left: 50%;
			    margin-left: -500px;
			}
            #dark {
			    width: 1095px;
			    height: 755px;
			    background: rgba(0,0,0,0.4);
			    position: absolute;
			    top: 0;
			    left: -50px;
			    display: none;
			}
            #popup {
			    box-sizing: border-box;
			    width: 90%;
			    height: 93%;
			    background-color: snow;
			    margin-left: -500px;
			    /* margin-right: auto; */
			    margin-top: 15px;
			    z-index: 5;
			    position: fixed;
			    left: 50%;
			}
            #album_photo {
			    box-sizing: border-box;
			    width: 65%;
			    height: 100%;
			    border-right: 1px solid gray;
			    float: left;
			}
            #album_text {
			    box-sizing: border-box;
			    width: 35%;
			    min-height: 20%;
			    border-bottom: 1px solid gray;
			    float: left;
			    max-height: 35%;
			}
	         #x_close {
			    position: fixed;
			    top: 1px;
			    left: 1045px;
			    width: 45px;
			    height: 45px;
			    color: black;
			    font-size: 40px;
			    background-color: transparent;
			    border: none;
			}
			#write_close {
			    position: fixed;
			    top: 1px;
			    left: 1045px;
			    width: 45px;
			    height: 45px;
			    color: black;
			    font-size: 40px;
			    background-color: transparent;
			    border: none;
			    z-index: 10;
			}
	         #album_reply {
			    box-sizing: border-box;
			    width: 35%;
			    max-height: 65%;
			    float: left;
			}
            table{
/*                 border-spacing: 15px 15px; */
            }
            tr, td{
                border: 1px solid black;
            }
            td {
			    padding: 0px;
			    width: 318px;
			    height: 205px;
			}
            #button {
			    width: 1000px;
			    text-align: center;
			    font-size: 15px;
			}
            img{
            	width: 100%;
            	height: 100%;
            	cursor: pointer;
            }
            #layer{
            	background-color: black;
            	width: 640px;
            	height: 600px;
            	opacity: 0.5;
            	z-index: 3;
            	display: none;
            	position: absolute;
            }
            #del {
			    position: absolute;
			    margin-top: 10px;
			    left: 495px;
			    top: 700px;
			}
            #gray{
                position: absolute;
			    width: 1095px;
			    height: 755px;
			    background-color: black;
			    opacity: 0.3;
			    z-index: 9;
			    display: none;
			    top: 0;
			    left: -50px;
			   
            }
            #upload{
                border-radius: 30px;
                position: absolute;
                background-color: white;
                width: 80%;
                height: 80%;
                top: 11%;
                left: 11%;
                z-index: 10;
                display: none;
            }
            #upload2{
                font-size: 17px;
                position: relative;
                height: 10%;
                padding-top: 10px;
                padding-left: 10px;

                
            }
            #submit{
                width: 200px;
                height: 50px;
            }
            .filebox{
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
                margin-top: 43%
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
                }
         	 input{
         	 	outline: none;
         	 }
         	 #page a{
         	 	margin: 5px;
         	 }
         	 .replyCont {
			    margin-left: 15px;
			    padding-left: 10px;
			    padding-right: 10px;
			    width: 65%;
			}
			#replyt{
				border-spacing: 4px;
			}
         	.replyBtn {
			    float: right;
			    margin-right: 25px;
			}
			#replyt td{
				height: 10px;
				border: none;
				word-break: break-all;
			}
			#replyt tr{
				
			}
			.reid{
				width: 17%;
			}
			.recont{
				width: 70%;
			}
			.rebtn{
				width: 20%;
			}
			tr, td:hover{
				border: 2px solid black;
			}
			a { text-decoration:none }
        </style>
    </head>
    <body>
    <input type="hidden" name="homephost" value="${homephost}">
        <div id="phli">
        	<div id="dark">
				<button id="x_close">x</button>
	            <div id="popup">
	                <div id="album_photo"></div>
	                <div id="album_text"></div>
	                <div id="album_reply">
		                 </br>
		                <!-- 게시 버튼 -->
		                <div style="position: fixed; bottom: 49px; width: 340px;">
			                <input id="replyCont" name="replyCont" type="text" placeholder="댓글 달기.."/>
			                <input id="replyBtn" type="button" value="게시"/>
			            </div>
		                	<div id="replyDiv"></div>
	                </div>
	                <input id="del" type="button" value="삭제" onclick="del()"/>
	            </div>
	            <button style="top: 0; position: fixed; z-index: 1; width: 101%; height: 101%; border: none; background-color: transparent;" id="any_close"></button>
	        </div>
	           <table id="">
	               
	           </table>
	           <input type="button" value="게시글 작성" id="writeclick"/>
	           <div id="button">
	               <a name="prev" href='#' onclick="prev(this)"><span>이전</span></a>
	               <span id=page></span>
	               <a name="next" href='#' onclick="next(this)"><span>다음</span></a>
	           </div>
	            <div id="gray"></div><!-- 팝업뒷창 -->
	            <button id="write_close" style="display: none;">x</button>
		        <div id="upload">
		            <div>
		                <div style="padding-top:5px; border-bottom: 1px solid black; font-size: 25px; text-align: center; padding: 10px 0px; width: 100%; height: 10%;" >게시물만들기</div> 
		                <div id="upload2">
		                    <img style="width: 99%;" src=""/><!--주인프로필사진업로드-->
		                    <td>${homephost}</td><br/><!--주인이름-->
		                </div>
		
		        		<form action="albumupload?homephost=${homephost}" method="post" enctype="multipart/form-data">
		
		        			<textarea style="position: absolute; left: 4px; width: 99%; height: 52%; border: none; resize: none; outline: none;" name="content" placeholder='${homephost}님 무슨 생각을 하고계신가요?'></textarea>
		                    <div class="filebox"> <label for="uploadFile">사진 가져오기</label> <input type="file" id="uploadFile" name="uploadFile"></div>
		                    <div class="filebox"><input style="width: 88%; height: 13%;" type="submit" name="업로드" value="게시" /></div>
		                </form>
		            </div>
        		</div>
        </div>
    </body>
    <script>
    var homephost = $("input[name='homephost']").val();
    console.log(homephost)
    var page=1;//현재 페이지
 	var allcnt=0;//총페이지
 	var startpage=1;//시작페이지
 	var endpage=0 ;//마지막 페이지
 	$(document).ready(function(){
 		albumlistCall(page);
 	});
 	var albumidx = 0;
 	
 	//$("textarea[name='content']").
 	
    function albumlistCall(page){
    	$.ajax({
    		type:"post",
    		url:"albumlist",
    		data:{"page":page,
    			  "homephost":homephost},
    		dataType:"JSON",
    		success:function(data){
    			if(data.curpage < 1){
    				alert("첫번째 페이지 입니다.");
    			}else if(data.curpage > data.allcnt){
    				alert("마지막 페이지 입니다.");
    			}else{
    				albumList(data.list,data.allcnt, data.curpage);
    			}
    		},error:function(e){
    			console.log(e);
    		},
    	});
    }

    function albumList(list, allcnt, curpage){
    	var pagecnt = 5; 
    	$('table').empty();
    	for(i=0; i<list.length;i++){
    		if(i==0 || i==3 || i ==6){
    			$('table').append("<tr></tr>");
    		}
    		$('tr').last().append("<td><img id='"+list[i].albumidx+"' src='/Photo/"+list[i].albumNewFileName+"' onclick='detail(this)'></td>");	
    	}
    	
    	if(curpage%pagecnt==1){
    		$('#page').empty();
    		startpage = curpage;
    		endpage = curpage+4;
    		if(endpage >=allcnt){
    			endpage = allcnt;
    		}
    		for(var i = startpage; i<=endpage; i++){
        		$('#page').append("<a href='#' onclick='albumlistCall("+i+")'>"+i+"</a>");
        	}
    	}else if(curpage%pagecnt==0){
    		$('#page').empty();
    		endpage = curpage;
    		startpage = curpage - 4;
    		if(endpage >=allcnt){
    			endpage = allcnt;
    		}
    		for(var i = startpage; i<=endpage; i++){
        		$('#page').append("<a href='#' onclick='albumlistCall("+i+")'>"+i+"</a>");
        	}
    	}
    	
    	
    	$("a[name='prev']").attr("id", curpage-1);
    	$("a[name='next']").attr("id", curpage+1);
    }
    
    function prev(e){
    	var page = e.id;
    	albumlistCall(page);
    }
    
    function next(e){
    	var page = e.id;
    	albumlistCall(page);
    }
    
    
    
    
    function detail(e){
    	$('#dark').show();
    	$('#album_photo').empty();
    	$('#album_text').empty();
    	var albumidx = e.id;
    	console.log(e.id);
    	$.ajax({
    		type:"post",
    		url:"albumdetail",
    		data:{"albumidx":albumidx},
    		dataType:"JSON",
    		success:function(data){
    			console.log(data);
    			albumdetail(data.list);
    			ReplyList();
    		},
    		error:function(e){console.log(e);}
    	});
    }
    
    $("#writeclick").click(function(){
    	$('#gray').show();
    	$('#upload').show();
    	$('#write_close').show();
    });
   	
    $('#write_close').click(function(){
    	$('#gray').css("display","none");
    	$('#upload').css("display","none");
    	$('#write_close').css("display","none");
    });

    
    $("#replyBtn").click(function(){
    		var replyCont = $('#replyCont').val();
    		$.ajax({
    			type:'get',
    			url:'albumReply',
    			data: {"replyCont":replyCont, "albumIdx":albumidx},
    			dataType:'HTML',
    			success:function(result){
    				console.log(result);
    				ReplyList();
    			},error:function(error){
    				console.log(error);
    			}
    		});
    	});
    
    function ReplyList(){
    	$.ajax({
    		type:'get',
    		url:'replyList',
    		data:{"albumIdx":albumidx},
    		dataType:'HTML',
  			success:function(result){
  				console.log("댓글 리스트 조회 성공");
  				$("#replyDiv").html(result);
  			},error:function(error){
  				console.log("댓글 리스트 조회 에러");
  				console.log(error);
  			}
    	});
    }
    
    function replyDelete(replyIdx){
    	console.log(replyIdx);
		$.ajax({
			type:'get',
			url:'replyDel',
			data: {
				"replyIdx": replyIdx
			},
			dataType:'HTML',
			success:function(result){
				// 댓글 리스트 갱신
				ReplyList();
			},
			error:function(error){
				console.log(error);
			}
		});
	}
    
    function albumdetail(list){
    	albumidx = list[0].albumidx;
    	$('#album_photo').append("<img src='/Photo/"+list[0].albumNewFileName+"'/>");
		$('#album_text').append("<p>"+list[0].albumcontent+"</p>");
		//$('#dark').append("<input id='del' type='button' value='삭제' onclick='location.href=albumdel?albumidx="+list[0].albumidx+"'/>");
		//$('#del').attr('onclick','location.href=albumdel?albumidx='+list[0].albumidx+'');
    }
    
    function del(){
    	console.log(albumidx);
    	location.href="albumdel?albumidx="+albumidx+"&&homephost="+homephost;
    }
    $("#x_close").click(function(){
		$("#dark").css("display","none");
	});
    
    $("#any_close").click(function(){
    	$("#dark").css("display","none");
    });
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
    
    </script>
</html>