<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
    <head>
        <title>photo</title>
        <meta charset="UTF-8">
       	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
       	<style>
       	
       	</style>
    </head>
    <body>
		<table id="replyt">
			<c:forEach items="${replyList}" var="reply">
				<tr>
					<td class="reid">${reply.replyUser_id}</td>
					<td class="recont">${reply.replyCont}</td>
					<td class="rebtn">
						<c:choose>
							<c:when test="${reply.replyUser_id eq sessionScope.id}">
								<button onclick="replyDelete('${reply.replyIdx}'); return false;">삭제</button>
							</c:when>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>