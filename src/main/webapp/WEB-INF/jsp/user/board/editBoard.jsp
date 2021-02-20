<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function editBoard(id,categoriesId){
		// 폼데이터로 파일 업로드
		let form = $('#form')[0];
	
	    // FormData 객체 생성
	    let formData = new FormData(form);
		
		$.ajax({
			url : '/user/board/edit',
			method : "post",
	
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			data : formData,
			dataType : 'text',
			success : function(res) {
				if(res.trim()=="true"){
					alert("게시글이 수정되었습니다");
					location.href="/user/board/detail?id="+id+"&categoriesId="+categoriesId;
				}else{
					alert("게시글 수정 실패");
					
				}
			}
		})
	}
	function deleteAttach(id){
		$.ajax({
			url:'/user/board/attach',
			method:'delete',
			data:{'id': id},    
			dataType:'text',
			success:function(res){
				if(confirm("해당 첨부파일을 삭제하시겠습니까?")){
					alert("삭제되었습니다")
					location.reload();
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
<c:set var="d" value="${boardDetail}"></c:set>
<div>
<form action="/user/board/edit" method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" value="${d.id}" name="id"/>
	
	<table>
		<tr>
			<td>제목</td><td><input type="text" name="title" value="${d.title} "></td>
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
			<textarea  name="content" rows="10" cols="80">${d.content}</textarea>
			</td>
		</tr>
		<tr></tr>
		
		<c:forEach var="a" items="${attachList}">
			<tr>
				<td>
					${a.filename}
				</td>
				<td>
					<a href="javascript:deleteAttach(${a.id});">삭제</a>
				</td>
			</tr>
		</c:forEach>
		
		
		<tr>
			<td colspan=2>
			<input type="file" name="files" multiple="multiple">
		</tr>
   	
</table>
<br>
<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="editBoard(${d.id},${d.categoriesId})">수정완료</button>

</form>
<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/user/board/detail?id=${d.id}&categoriesId=${d.categoriesId}'">취소</button>
</div>
</body>
</html>