<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css2?family=Abril Fatface" rel="stylesheet">
<style>
	#form{
		width:1400px;
		margin-left:13%
	}
	.title{
		font-family:Abril Fatface;
		font-size:120px;
		margin-left:20px
	}
	
</style>
<script>
	function writeReply(){
		// 폼데이터로 파일 업로드
		let form = $('#form')[0];
	
	    // FormData 객체 생성
	    let formData = new FormData(form);
		
		$.ajax({
			url : '/user/board/reply',
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
<div class="title">Community</div>
<br><br><br>
<div>
<form method="post" action="/user/board/reply" enctype="multipart/form-data" id="form" >
	<input name="membersId" type="hidden" value="${sessionScope.user.id}">	
	<input type="hidden" value="${id}" name="id" id="id"/> 
	<input type="hidden" value="${groupOrder}" name="groupOrder" id="groupOrder"/> 
	<input type="hidden" value="${depth}" name="depth" id="depth"/> 
	<input type="hidden" value="${categoriesId}" name="categoriesId" id="categoriesId"/> 
	
	<table  class="table">
		<tr>
			<td>제목</td><td><input type="text" name="title" id="title" class="form-control" placeholder="제목을 입력해주세요"></td>
		</tr>
		<tr>
			<td>작성자</td><td><input type="text" name="name" class="form-control" value="${sessionScope.user.name}" readonly></td>
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

<button type="button" class="btn btn-outline-secondary" onclick="writeReply()">작성완료</button>
<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board'">취소</button>
</form>
</div>
</body>
</html>