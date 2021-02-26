<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
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
	.table{
		margin-left:400px;
		width:1200px
	}
	.uploadBtn{
		margin-left:1400px
	}
	.addForm{
		margin-left:600px;
		width:600px
	}
	#checkingImage{
		width:300px;
		height:300px;
		object-fit:cover
	}
	
</style>
<script>
	function addForm(){
		var clone = $("#decoForm").clone(true);
		clone.appendTo('#decoform');
	}
	
	function showImage(){
		$('#interiorImg').removeAttr('style');
	}
	
	function deleteInteriorImage(id){
		$.ajax({ 
			url:'/admin/image/delete', 
			method:'delete',
			data: {'id':id },
			dataType:'text',
			success:function(res){
				location.reload();
			},
			error:function(xhr, status, err){
				alert(status+', '+err);
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

<form action="/admin/image/insert" method="post">
	<table class="table">
		<tr>
			<td colspan=2>인테리어사진</td>
		</tr>
		<tr>
			<th>HashTag</th><td><input type="text" name="hashtagsNames" placeholder="태그를 입력해주세요(각 태그는 공백 두칸으로 구분해주세요)" class="form-control"></td>
		</tr>
		<tr>
			<th>Image</th><td><input type="text" name="filepath" placeholder="인테리어 사진의 filepath를 입력해주세요" class="form-control"></td>
		</tr>
		<tr>
			<th>Content</th><td><textarea name="content" placeholder="내용을 입력해주세요" class="form-control"></textarea></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-outline-secondary uploadBtn">인테리어 사진 업로드</button>
</form>
<button type="button" onclick="addForm()" class="btn btn-outline-secondary addForm">+</button>
<c:set var="img" value="${interiorImage}"/>
<div>
	<button type="button" onclick="showImage()">인테리어 사진 확인</button>
	<div id="interiorImg" style="display:none">
	<img src="${img.filepath}" id="checkingImage">
	<button onclick="deleteInteriorImage(${img.id})">X</button>
	</div>
</div>
<form id="decoForm" action="/admin/image/insertDeco" method="post">
<input type="hidden" name="id" value="${img.id}">
	<table class="table">
		<tr>
			<td colspan=2>소품사진</td>
		</tr>
		<tr>
			<th>Image</th><td><input type="text" name="filepath" placeholder="소품 사진의 filepath를 입력해주세요" class="form-control"></td>
		</tr>
		<tr>
			<th>Url</th><td><input type="text" name="url" placeholder="소품 구매 사이트 url을 연결해주세요" class="form-control"></td>
		</tr>
	</table>
	<button type="submit" class="btn btn-outline-secondary uploadBtn">소품 사진 업로드</button>
</form>
<div id="decoform">
</div>

</body>
</html>