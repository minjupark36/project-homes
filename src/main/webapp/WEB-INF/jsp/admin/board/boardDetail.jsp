<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>

</head>
<body>
<c:set var="b" value="${board}"></c:set>
<div>
<input type="hidden" value="${b.id}" id="id"/> 
	<table class="table">
		<tr>
			<th>작성자</th><td>${b.membersId}</td>
		</tr>
		<tr>
			<th>카테고리</th><td>${category}</td>
		</tr>
		<tr>
			<th>제목</th><td>${b.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${b.content}</td>
		</tr>	
	</table>
</div>
<div>
	<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/admin/board'">목록</button>
</div>
</body>
</html>