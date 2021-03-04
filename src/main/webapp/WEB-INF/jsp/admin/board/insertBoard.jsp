<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Board</title>
<style>	
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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
			<td>제목</td><td><input type="text" name="title" class="form-control"></td>
		</tr>
		<tr>
			<td>작성자</td><td><input type="hidden" name="membersId" class="form-control" value="${sessionScope.user.id}" readonly>관리자</td>
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
			<textarea  name="content" rows="10" cols="80" class="form-control"></textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>   	
	</table>
	<button type="button" onclick="insertBoard()" class="btn btn-raised btn-warning btn-round waves-effect">작성완료</button>
	<button type="button" class="btn btn-raised btn-warning btn-round waves-effect" onclick="location.href='/admin/board'">취소</button>
</form><br>

</div>
</body>
</html>