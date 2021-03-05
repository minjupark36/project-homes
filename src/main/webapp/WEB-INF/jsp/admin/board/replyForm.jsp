<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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

<script>

	function writeReply(){
		// 폼데이터로 파일 업로드
		let form = $('#form')[0];
	
	    // FormData 객체 생성
	    let formData = new FormData(form);
		
		$.ajax({
			url : '/admin/board/reply',
			method : "post",	
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data : formData,
			dataType : 'text',
			success : function(res) {
				if(res.trim()=="true"){
					alert("게시글이 등록되었습니다");
					location.href="/admin/board";
					
				}else{
					alert("게시글 등록 실패");
					
				}
			}
		})
	}
	
	$(document).ready(function() {
	    $('#content').on('keyup', function() {
	        $('#content_cnt').html("("+$(this).val().length+" / 300)");
	 
	        if($(this).val().length > 300) {
	            $(this).val($(this).val().substring(0, 300));
	            $('#content_cnt').html("(300 / 300)");
	            alert("300자 이내로 입력해주세요")
	        }
	    });
	});
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
	<h2>답글작성</h2>
</div>

<form method="post" action="/admin/board/reply" enctype="multipart/form-data" id="form" >
	
	<input type="hidden" value="${id}" name="id" id="id"/> 
	<input type="hidden" value="${groupOrder}" name="groupOrder" id="groupOrder"/> 
	<input type="hidden" value="${depth}" name="depth" id="depth"/> 
	<input type="hidden" value="${categoriesId}" name="categoriesId" id="categoriesId"/> 
	
<table  class="table">
	<tr>
		<td>제목</td><td><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요"></td>
	</tr>
	<tr>
		<td>작성자</td><td><input type="hidden" name="membersId" class="form-control" value="${sessionScope.user.id}" readonly>관리자</td>
	</tr>
	<tr>
		<td colspan=2>
		<textarea  id="content" name="content" rows="10" cols="80" placeholder="내용을 입력해주세요(300자 이내)" class="form-control"></textarea>
		<div id="content_cnt">(0 / 300)</div>
		</td>
	</tr>
	
	<tr>
		<td colspan=2>
		<input type="file" name="files" multiple="multiple">
	</tr> 	
</table>
<button type="button" class="btn btn-warning" onclick="writeReply()">작성완료</button>
<button type="button" class="btn btn-warning" onclick="location.href='/admin/board'">취소</button>
</form>
</div>
</div>
</body>
</html>