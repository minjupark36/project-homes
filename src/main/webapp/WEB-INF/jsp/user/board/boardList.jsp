<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
<table class="table table-hover">
<tr><th>No</th><th>Title</th><th>Date</th><th>View</th></tr>
<c:forEach var="b" items="${pageInfo.list}" varStatus="status">	
	<tr onclick="location.href='/user/board/detail?id=${b.id}&categoriesId=${b.categoriesId}'">
		<td>${status.count}</td>
		<td>${b.title}</td>
		<td>${b.createDate}</td>
		<td>${b.view}</td>    
	</tr>	
</c:forEach>
</table>
</div>
<div>
	<a href="/user/board/1">자유게시판</a>
	<a href="/user/board/2">FAQ</a>
	<a href="/user/board/3">공지사항</a>
</div>

</body>
</html>