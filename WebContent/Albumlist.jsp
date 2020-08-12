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
                height: 610px;
               left: 5%;
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
            
            
        </style>
    </head>
    <body>
        <div id="phli">
            <table>
                
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
 	
 	
    function albumlistCall(){
    	$('b').html(page);
    	$.ajax({
    		type:"post",
    		url:"albumlist",
    		data:{"page":page},
    		dataType:"JSON",
    		success:function(data){
    			console.log(data);
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
    	$('b').html(page);
    	
    });
    
    
    
    function albumList(list){
    	$('table').empty();
    	for(i=0; i<list.length;i++){
    		if(i==0 || i==3 || i ==6){
    			$('table').append("<tr></tr>");
    		}
    		console.log(list[i].albumidx);
    		console.log(list[i].albumNewFileName);
    		$('tr').last().append(
    			"<td><img id='"+list[i].albumidx+"' src='/Photo/"+list[i].albumNewFileName+"'></td>"		
    		);
    	}
    }
        
        

    </script>
</html>