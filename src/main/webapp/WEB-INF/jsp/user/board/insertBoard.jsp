<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
</style>
<script>
	function writeBoard(){
		// 폼데이터로 파일 업로드
		let form = $('#form')[0];
	
	    // FormData 객체 생성
	    let formData = new FormData(form);
		
		$.ajax({
			url : '/user/board/insert',
			method : "post",
	
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data : formData,
			dataType : 'text',
			success : function(res) {
				if(res.trim()=="true"){
					alert("게시글이 등록되었습니다");
					location.href="/user/board";
					
				}else{
					alert("게시글 등록 실패");
					
				}
			}
		})
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
<div>
<form action="/user/board/insert" method="post" enctype="multipart/form-data" id="form" name="form">
		
	<table  class="table">
		<tr>
			<td>제목</td><td><input type="text" name="title" class="form-control" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td> 
				<select name="categoriesId" class="form-control">
					<option value=1>자유게시판</option>
					<option value=2>FAQ</option>
					<option value=3>공지사항</option>
				</select>
    		</td>
		</tr>

		<tr>
			<td colspan=2>
			<textarea  name="content" rows="10" cols="80" placeholder="내용을 입력해주세요" class="form-control"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>
   	
</table>
<button type="button" id="btn" class="btn btn-outline-secondary" onclick="writeBoard();">작성 완료</button>

</form>
<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board'">취소</button>

</div>
</body>
</html>