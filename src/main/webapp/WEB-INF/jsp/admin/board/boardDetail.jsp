<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>

</style>
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
			<th>카테고리</th><td>${b.categoriesId}</td>
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
	<button type="button" class="btn btn-warning" onclick="location.href='/admin/board'">목록</button>
	<button type="button" class="btn btn-warning" onclick="location.href='/admin/board/reply?pid=${b.groupNo}&groupOrder=${b.groupOrder}&depth=${b.depth}&categoriesId=${b.categoriesId}'">답글</button>
</div>
</body>
</html>