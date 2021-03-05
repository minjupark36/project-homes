<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script>
function editBoard(){
	
	var form = $('#form')[0];
    var formData = new FormData(form);
	
	$.ajax({
		url : '/admin/board/edit',
		method : "post",
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		data : formData,
		dataType : 'text',
		success : function(res) {
			if(res.trim()=="true"){
				alert("게시글이 수정되었습니다");
				history.back();			
			}else{
				alert("게시글 수정 실패");
				return false;
			}
		},
		error:function(xhr, status, err){
			alert(status+', '+err);
		}
	})
}

</script>
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
	<h2>글 수정페이지</h2>
</div>
<c:set var="b" value="${board}"></c:set>
<div>
<form enctype="multipart/form-data" id="form">
	<input type="hidden" value="${b.id}" name="id"/>
	<table  class="table">
		<tr>
			<td>제목</td><td><input type="text" name="title" value="${b.title}" class="form-control"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<select name="categoriesId" class="form-control">
					<option value=3>공지사항</option>
				</select>
    		</td>
		</tr>
		<tr>
			<td colspan=2>
			<textarea  name="content" rows="10" cols="80" class="form-control">${b.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>
   	
</table>
<button type="button" onclick="editBoard();" class="btn btn-raised btn-warning btn-round waves-effect">수정완료</button>
<button type="button" class="btn btn-raised btn-warning btn-round waves-effect" onclick="location.href='/admin/board/detail?id=${id}&categoriesId=${categoriesId}'">취소</button>
</form>

</div>
</div>
</div>
</body>
</html>