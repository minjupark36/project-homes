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
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='/admin/board/reply?pid=${b.groupNo}&groupOrder=${b.groupOrder}&depth=${b.depth}&categoriesId=${b.categoriesId}'">답글</button>
</div>
</body>
</html>