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
            
            
        </style>
    </head>
    <body>
        <div id="phli">
            <h4>${msg}</h4>       
            <table>
                <tr>
                    <td>
                        <img id="ph1" width="100%" height="100%" src="" alt="">
                        <div id="ph11" style="top: 2.6%; left: 2.3%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph2" width="100%" height="100%" src="" alt="">
                        <div id="ph12" style="top: 2.6%; left: 31.6%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph3" width="100%" height="100%" src="" alt="">
                        <div id="ph13" style="top: 2.6%; left: 61%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img id="ph4" width="100%" height="100%" src="" alt="">
                        <div id="ph21" style="top: 33%; left: 2.3%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph5" width="100%" height="100%" src="" alt="">
                        <div id="ph22" style="top: 33%; left: 31.6%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph6" width="100%" height="100%" src="" alt="">
                        <div id="ph23" style="top: 33%; left: 61%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img id="ph7" width="100%" height="100%" src="" alt="">
                        <div id="ph31" style="top: 63.5%; left: 2.3%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph8" width="100%" height="100%" src="" alt="">
                        <div id="ph32" style="top: 63.5%; left: 31.6%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                    <td>
                        <img id="ph9" width="100%" height="100%" src="" alt="">
                        <div id="ph33" style="top: 63.5%; left: 61%; position: absolute; background-color: gray; opacity: 0.5;z-index: 10; width : 171px; height :170px;"></div>
                    </td>
                </tr>
            </table>
            <div id="button">
                <a href="#"><span>이전</span></a>
                <span><b>1</b></span>
                <a href="#"><span>다음</span></a>
            </div>
        </div>


    </body>
    <script>
    albumlistCall();
    function albumlistCall(){
    	$.ajax({
    		type:"post",
    		url:"albumlist",
    		data:{},
    		dataType:"JSON",
    		success:function(data){
    			albumList(data.list);
    		},error:function(e){
    			console.log(e);
    		}
    	});
    	
    }
    
    function albumList(list){
    	
    	
    }
        
        

    </script>
</html>