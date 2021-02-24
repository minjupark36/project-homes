<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>
	#home-icon {
			width:30px;
			height:30px;
	}
	
	td,th{
		text-align:center
	}
	table{
		margin-left:400px;
		height:600px;
		width:1200px
	}
	.add{
		margin-left:1500px
	}
</style>
<script>
	function editTag(id){
	
	}
	function deleteTag(id){
		$.ajax({
			url:'/admin/hashtag/delete',
			method:'delete',
			data:{'id': id},    
			dataType:'text',
			success:function(res){
				if(confirm("태그를 삭제하시겠습니까?")){
					alert("삭제되었습니다")
					location.href="/admin/hashtag";
				}else{
					return false;
				} 				
			},
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
		});   
	}
</script>
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
<a href="javascript:addTag()" class="add">태그 추가</a>
<form>
	<table class="table-striped">
		<tr>
			<th>번호</th><th>태그명</th><th>수정</th><th>삭제</th>
		</tr>
		<c:forEach var="tag" items="${tagList}" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${tag.name}</td>
				<td><a href="javascript:editTag(${tag.id})">수정</a></td>
				<td><a href="javascript:deleteTag(${tag.id})">X</a></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>