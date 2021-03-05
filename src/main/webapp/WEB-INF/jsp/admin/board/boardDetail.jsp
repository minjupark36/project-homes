<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Detail</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>
	.main-container {
		width:1320px;
		height:700px;
		margin: auto auto;
	}
	
	.form-container {
		width:1000px;
		display: inline;
		float: right;
		padding-right: 20px;
	}
	
	.category{
		display:inline-block;
		width:250px;
		height:700px;
		float:left;	
		font-size: 10px;
		background-color: whitesmoke;		
	}
	
	.intro {
		width:100%;
		height: 140px;
		background-color: #6c757d	;
	}
	
	.intro > h3 {
		padding-top:40px;
		font-size: 2rem;
		text-align: center;
		color: white;
		opacity: 0.7
	}
	
	.intro > h4 {
		text-align: center;
		color: white;
	}
	
	.category-list > ul > li{
		height: 60px;
		border-bottom: 1px solid #d0cece;
		padding-left: 17px;	
	}
	
	.cate{
		 font-size:20px;
		 color:black;
		 font-family: sunflower;	
		 
	}
	
	.cate > i {
		margin-left: 90px;
		font-size: 30px;
		display: inline;
		color: #6c757d;
	}
	
	.category-left{
		width:100%;
		height: 140px;
		border-bottom: solid 1px #6c757d;
	}
	
	.category-left > h2{
		padding-top: 50px;
	}
	
	.category-list > ul >li >a {
		text-decoration: none;
		color : black;
	}
</style>
</head>
<body>
<!-------- category list --------->
<div class="main-container">
<div class="category">
	<div class="intro">
		<h3>Admin Board</h3>
		<h4>관리자 게시판</h4>
	</div>
<div class="category-list">
	<ul class="navbar-nav">
		<li class="nav-item active"><a href="/admin/board/1" class="nav-link cate">자유게시판<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
		<li class="nav-item active"><a href="/admin/board/2" class="nav-link cate">FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
		<li class="nav-item active"><a href="/admin/board/3" class="nav-link cate">공지사항&nbsp;&nbsp;&nbsp;<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
	</ul>
</div>	
</div>

<!-- board form -->
<div class="form-container">
<div class="category-left">
	<h2>게시글 상세페이지</h2>
</div>
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
</div>
</div>
</body>
</html>