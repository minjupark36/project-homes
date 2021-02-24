<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Board</title>
<style>	
 	input,textarea{border:none}
 	#btn{margin-left:85%}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script>
function insertBoard(){

	var form = $('#form')[0];
    var formData = new FormData(form);
	
	$.ajax({
		url : '/admin/board/insert',
		method : "post",
		enctype: 'multipart/form-data',
		processData: false,
		contentType: false,
		data : formData,
		dataType : 'text',
		success : function(res) {
			if(res != null){
				alert("게시글 등록 완료");
				location.href = "/admin/board";			
			}else{
				alert("게시글 등록 실패");
				return false;
			}
		},
		error:function(xhr, status, err){
			alert(status+', '+err);
		}
	});
}
</script>
</head>
<body>

<div>
<form enctype="multipart/form-data" id="form">
	<table  class="table table-hover">
		<tr>
			<td>제목</td><td><input type="text" name="title"></td>
		</tr>
		<tr>
			<td>작성자</td><td><input type="text" name="membersId" class="form-control" value="${sessionScope.user.id}" readonly></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td>
				<select name="categoriesId">
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
	<button type="button" onclick="insertBoard()" class="btn btn-raised btn-primary btn-round waves-effect">작성완료</button>
</form>
<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/admin/board'">취소</button>
</div>
</body>
</html>