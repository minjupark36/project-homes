<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function search(num){
		$("#searchNum").val(num);
		$("#search-form").submit();
	}
</script>
<style>
	#home-icon {
			width:30px;
			height:30px;
	}
	
</style>
</head>
<body>
<!-- 메인 메뉴바 -->
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="/main"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/user/board">| 커뮤니티</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/main/store">| 스토어</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/user/scrap">| 내 스크랩</a>
	    </li>
	  </ul>
	</nav>
	
	<!-- 하위 메뉴바 -->
	<nav class="navbar navbar-expand-sm bg-light navbar-light">
	  <ul class="navbar-nav">
	    <li class="nav-item active">
	      <a class="nav-link" href="/main">홈</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/main/images">사진</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" href="/main/info">정보</a>
	    </li>
	  </ul>
	</nav>
	
	<div class="jumbotron text-center">
	  <h1>My First Bootstrap Page</h1>
	  <p>Resize this responsive page to see the effect!</p> 
	</div>
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
<div class="category">
	<a href="/user/board/1">자유게시판</a>
	<a href="/user/board/2">FAQ</a>
	<a href="/user/board/3">공지사항</a>
</div>
<div id="post">
	<a href="/user/board/insert">게시판 작성</a>
</div>
<div id="paging">
<ul id="pagination" class="pagination">
	<li class="page-item"><a class="page-link" href="javascript:search(1);">&lt&lt</a></li>
	<c:if test="${pageInfo.hasPreviousPage}">
			<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.prePage});">pre</a></li>
	</c:if>
	<c:forEach var="p" items="${pageInfo.navigatepageNums}" >
		
		<c:choose>
			
			<c:when test="${p==pageInfo.pageNum}">
				<li class="page-item active"><a class="page-link" href="javascript:void(0);"
				style="font-weight: bolder;">${p}</a></li>
			</c:when>
			<c:otherwise >
				<li class="page-item"><a class="page-link" href="javascript:search(${p});">${p}</a></li>
			</c:otherwise>
			
		</c:choose>
		
	</c:forEach>
	
	<c:if test="${pageInfo.hasNextPage}">
			<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.nextPage});">next</a></li>
	</c:if>
	<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.pages});">&gt&gt</a></li>
	</ul>
</div>
<div>
	<form id="search-form" action="/user/board/${categoriesId}" method="get">
		<input type="hidden" name="num" id="searchNum" value="1">
		
		<div class="d-flex clearfix col-12">
			<div class="col-2">
				<select name="searchAs" id="searchAs" class="form-control">
					<option value="title" <c:if test="${searchMap.searchAs == 'title'}">selected</c:if>>title</option>
					<option value="writer" <c:if test="${searchMap.searchAs == 'writer'}">selected</c:if>>writer</option>
				</select>
			</div>
			<div class="input-group col-8">
				<input type="text" name="search" id="search" class="form-control" value="${searchMap.search}">
			</div>
			<div class="col-2">
				<button type="button" onclick="search(1);" class="btn btn-outline-secondary">Search</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>