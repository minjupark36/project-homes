<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<style>

	td,th{
		text-align:center
	}
	.table{
		margin-left:400px;
		width:1200px
	}
	#name{
		width:300px
	}
	.tag:read-only{
		background-color:white
	}
	.delBtn{
		color:red
	}
	
	.insert{
		margin-left:45%
	}
	
	
	
</style>
<script>
	function editForm(index){
		document.getElementById("editForm"+index).readOnly = false;
		$("#editedBtn"+index).removeAttr("style");
		document.getElementById("editBtn"+index).style.display = "none";
		
	}
	function editTag(index){
		$.ajax({
			url:'/admin/hashtag/edit',
			method:'post',
			data:{'id' : $("#id"+index).val(),
				'name' : $("#editForm"+index).val()},    
			dataType:'text',
			success:function(res){
				alert("수정이 완료되었습니다");
				location.reload();				
			},
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
		});   
	}
	function deleteTag(id){
		$.ajax({
			url:'/admin/hashtag/delete',
			method:'delete',
			data:{'id': id},    
			dataType:'text',
			success:function(res){
				if(confirm("태그를 삭제하시겠습니까?")){
					alert("삭제되었습니다")
					location.href="/admin/hashtag";
				}else{
					return false;
				} 				
			},
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
		});   
	}
	function addTag(){
		$.ajax({
			url:'/admin/hashtag/insert',
			method:'post',
			data:{'name':$('#name').val()},    
			dataType:'text',
			success:function(res){
				alert("태그가 추가되었습니다");
				location.reload();
				
			},
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
		});   
	}
</script>
</head>
<body>
<div class="insert">
<input type="text" placeholder="추가할 태그를 입력해주세요." name="name" id="name" class="form-control">
<br>
<a href="javascript:addTag()" class="btn btn-outline-secondary">태그 추가</a>
</div>
<br>
<form>
	<table class="table">
		<tr>
			<th>번호</th><th>태그명</th><th>수정</th><th>삭제</th>
		</tr>
		<c:forEach var="tag" items="${tagList}" varStatus="status">
			<input type="hidden" value="${tag.id}" id="id${status.count}">
			<tr>	
				<td>${status.count}</td>
				<td><input type="text" value="${tag.name}" id="editForm${status.count}" class="form-control tag" readonly></td>
				<td>
					<div id="editBtn${status.count}"><a href="javascript:editForm(${status.count})" class="btn btn-outline-secondary">수정</a></div>
					<div style="display:none" id="editedBtn${status.count}"><a href="javascript:editTag(${status.count})" class="btn btn-outline-secondary">수정완료</a></div>
				</td>
				<td><a href="javascript:deleteTag(${tag.id})" class="delBtn">X</a></td>
			</tr>
		</c:forEach>
	</table>
</form>
</body>
</html>