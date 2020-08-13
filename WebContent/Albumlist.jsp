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
            #phli{
                position: relative;
                width: 640px;
                height: 600px;
                left: 5%;
            }
            #dark{
                width: 640px;
                height: 600px;
                background: rgba(0,0,0,0.4);
                position: absolute;
                top: 0;
                left: 0;
                display: none;
            }
            #popup{
             box-sizing: border-box;
             width: 90%;
             height: 90%;
             background-color: snow;
             margin-left: auto;
             margin-right: auto;
             margin-top: 15px;
            }
            #album_photo{
             box-sizing: border-box;
             width: 320px;
             height: 540px;
             border-right: 1px solid gray;
             float: left;
             }
            #album_text{
             box-sizing: border-box;
             width: 256px;
             height: 200px;
             border-bottom: 1px solid gray;
             float: left;
	         }
	         #x_close{
	         	position: fixed;
	         	top: 2px;
	         	left: 673px;
	         	width: 45px;
	         	height:45px;
	         	color: black;
	         	font-size: 40px;
	         	background-color: transparent;
	         	border: none;
	         }
	         #album_reply{
	             box-sizing: border-box;
	             width: 256px;
	             height: 340px;
	             float: left;
	         }
            table{
                border-spacing: 15px 15px;
            }
            tr, td{
                border: 1px solid black;
            }
            td{
                padding: 0px;
                width: 170px;
                height: 170px;
            }
            #button{
                width: 576px;
                text-align: center;
                font-size: 13px;
            }
            #ph11, #ph12, #ph13, #ph21, #ph22, #ph23, #ph31, #ph32, #ph33{
                display: none;
            }
            img{
            	width: 100%;
            	height: 100%;
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
            #del{
            	position: absolute;
            	margin-top: 10px;
            	left: 300px;
            	top: 555px;
            }
        </style>
    </head>
    <body>
        <div id="phli">
        	<div id="dark">
				<button id="x_close">x</button>
	            <div id="popup">
	                <div id="album_photo"></div>
	                <div id="album_text"></div>
	                <div id="album_reply">
		                 </br>
		                <!-- 게시 버튼 -->
			                <input id="replyCont" name="replyCont" type="text" placeholder="댓글 달기.."/>
			                <input id="replyBtn" type="button" value="게시"/>
		                	<div id="replyDiv"></div>
	                </div>
	                <input id="del" type="button" value="삭제" onclick="del()"/>
	            </div>
	        </div>
	           <table id="">
	               
	           </table>
	           <div id="button">
	               <a id="prev"><span>이전</span></a>
	               <span><b></b></span>
	               <a id="next"><span>다음</span></a>
	           </div>
        </div>
    </body>
    <script>
    var page = 1;
 	var allcnt = 0;
 	$(document).ready(function(){
 		albumlistCall();
 	});
 	var albumidx = 0;
 	
 	
    function albumlistCall(){
    	$('b').html(page);
    	$.ajax({
    		type:"post",
    		url:"albumlist",
    		data:{"page":page},
    		dataType:"JSON",
    		success:function(data){
    			albumList(data.list);
    		},error:function(e){
    			console.log(e);
    		}
    	});
    }
    
    $('#next').click(function(){
    	if(allcnt > page){
    		page = page+1;
        	$.ajax({
        		type:"post",
        		url:"albumlist",
        		data:{"page":page},
        		dataType:"JSON",
        		success:function(data){
        			albumList(data.list);
        		},error:function(e){
        			console.log(e);
        		}
        	});
    	}else{
    		alert('마지막 페이지 입니다.');
    	}
    	$('b').html(page);
    });
    
    $('#prev').click(function(){
    	if(page > 1){
    		page = page-1;
        	$.ajax({
        		type:"post",
        		url:"albumlist",
        		data:{"page":page},
        		dataType:"JSON",
        		success:function(data){
        			albumList(data.list);
        		},error:function(e){
        			console.log(e);
        		}
        	});
    	}else{
    		alert('첫번째 페이지입니다.');
    	}
    	$('b').text('page');
    });
    
    
    
    function albumList(list){
    	$('table').empty();
    	for(i=0; i<list.length;i++){
    		if(i==0 || i==3 || i ==6){
    			$('table').append("<tr></tr>");
    		}
    		$('tr').last().append("<td><img id='"+list[i].albumidx+"' src='/Photo/"+list[i].albumNewFileName+"' onclick='detail(this)'></td>");	
    	}
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
    	location.href="albumdel?albumidx="+albumidx;
    }
    $("#x_close").click(function(){
		$("#dark").css("display","none");
	});
    
    var msg = "${msg}";
    if(msg != ""){
    	alert(msg);
    }
    
    </script>
</html>