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
<style>
	#home-icon {
			width:30px;
			height:30px;
	}
	
</style>
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
<c:set var="d" value="${boardDetail}"></c:set>
<div>
<form action="/user/board/edit" method="post" enctype="multipart/form-data" id="form">
	<input type="hidden" value="${d.id}" name="id"/>
	
	<table class="table">
		<tr>
			<td>제목</td><td><input type="text" name="title" value="${d.title}" class="form-control"></td>
		</tr>
		<tr>
			<td>카테고리</td>
			<td> 
				<select name="categoriesId">
					<option value=1 <c:if test="${d.categoriesId==1}">selected</c:if>>자유게시판</option>
					<option value=2 <c:if test="${d.categoriesId==2}">selected</c:if>>FAQ</option>
					<option value=3 <c:if test="${d.categoriesId==3}">selected</c:if>>공지사항</option>
				</select>
    		</td>
		</tr>

		<tr>
			<td colspan=2>
			<textarea  id="content" name="content" rows="10" cols="80" class="form-control">${d.content}</textarea>
			<div id="content_cnt">(0 / 300)</div>
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
<button type="button" class="btn btn-outline-secondary" onclick="editBoard(${d.id},${d.categoriesId})">수정완료</button>

</form>
<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board/detail?id=${d.id}&categoriesId=${d.categoriesId}'">취소</button>
</div>
</body>
</html>