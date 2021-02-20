<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
					location.href="/user/board/"+categoriesId;
					
				}else{
					alert("게시글 등록 실패");
					
				}
			}
		})
	}
</script>
</head>
<body>
<div>
<form action="/user/board/insert" method="post" enctype="multipart/form-data" id="form" name="form">
		
	<table  class="table table-hover">
		<tr>
			<td>제목</td><td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td> 
				<select name="categoriesId">
					<option value=1>자유게시판</option>
					<option value=2>FAQ</option>
					<option value=3>공지사항</option>
				</select>
    		</td>
		</tr>

		<tr>
			<td colspan=2>
			<textarea  name="content" rows="10" cols="80"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>
   	
</table>
<button type="button" id="btn" 
class="btn btn-raised btn-primary btn-round waves-effect" onclick="writeBoard();">작성 완료</button>

</form>
<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/user/board'">취소</button>

</div>
</body>
</html>