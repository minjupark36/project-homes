<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script>
	function deleteBoard(id){
		$.ajax({
			url:'/user/board/detail',
			method:'delete',
			data:{'id': id},    
			dataType:'text',
			success:function(res){
				if(confirm("글을 삭제하시겠습니까?")){
					alert("삭제되었습니다")
					location.href="/user/board";
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
	<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="deleteBoard(${d.id})">글 삭제</button>
	<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/user/board/edit/?id=${d.id}&categoriesId=${d.categoriesId}'">수정</button>
	<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/user/board'">리스트로 이동</button>
</div>
<div>
<input type="hidden" value="${d.id}" name="id"/> 
	<table class="table table-hover">
		<tr>
			<th>작성자</th><td></td>
		</tr>
		
		<tr>
			<th>제목</th><td>${d.title}</td>
		</tr>
		<tr>
			<th>내용</th><td>${d.content}</td>
		</tr>	
	</table>
</div>
<div>
<button type="button" class="btn btn-raised btn-primary btn-round waves-effect" onclick="location.href='/user/board/reply?pid=${d.groupNo}&groupOrder=${d.groupOrder}&depth=${d.depth}&categoriesId=${d.categoriesId}'">답글</button>	
</div>
</body>
</html>