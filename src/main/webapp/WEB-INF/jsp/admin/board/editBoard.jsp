<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Form</title>
<style> 	
 	input,textarea{border:none}
 	#btn{margin-left:85%}
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
<c:set var="b" value="${board}"></c:set>
<div>
<form enctype="multipart/form-data" id="form">
	<input type="hidden" value="${b.id}" name="id"/>
	<table  class="table">
		<tr>
			<td>제목</td><td><input type="text" name="title" value="${b.title}"></td>
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
			<textarea  name="content" rows="10" cols="80">${b.content}</textarea>
			</td>
		</tr>
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>
   	
</table>
<button type="button" onclick="editBoard();" class="btn btn-raised btn-primary btn-round waves-effect">수정완료</button>
</form>

<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/admin/board/detail?id=${id}&categoriesId=${categoriesId}'">취소</button>
</div>
</body>
</html>