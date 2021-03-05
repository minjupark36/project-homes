<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Abril Fatface" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function search(num){
		$("#searchNum").val(num);
		$("#search-form").submit();
	}
</script>
<style>
	.category{
		display:inline-block;
		width:140px;
		float:left;
		margin-left:50px
		
	}
	.detail{
		float:left;
		width:1400px;
		margin-left:140px
	}
	.post{
		clear:both;
		margin-left:90%;
	}
	
	#paging{
		margin-left:45%
	}
	.cate{
		 font-size:30px;
		 color:black;
		 font-family:sunflower
	}
	#write{
		color:black;
		font-size:20px;
		font-family:sunflower
	}
	#search-form{
		width:1000px;
		margin-left:400px
	}
	#paging { 
		font-family: "Roboto", sans-serif; 
	}
	#paging li a { 
		border-radius:0 !important; color:#333 !important; 
	}
	#paging li.active a { 
		color:#fff !important; background:#444 !important; border-color:#444 !important; 
	}
	.title{
		font-family:Abril Fatface;
		font-size:120px;
		margin-left:20px
	}

</style>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	function write(num) { 
		
		$.ajax({ 
			url:'/user/board/write', 
			method:'post',
			data: {'num' :num},
			dataType:'text',
			success:function (res){
				if(res.trim()=='true'){
					location.href="/user/board/insert"
				}else {
					alert("로그인 후, 글작성이 가능합니다.")
					location.href="/sign-in";
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
<div class="title">Community</div>
<br>
<div class="category">
	<ul class="navbar-nav">
		<li class="nav-item active"><a href="/user/board/1" class="nav-link cate">자유게시판</a></li>
		<li class="nav-item active"><a href="/user/board/2" class="nav-link cate">FAQ</a></li>
		<li class="nav-item active"><a href="/user/board/3" class="nav-link cate">공지사항</a></li>
	</ul>
</div>
<div class="detail">
<table class="table table-hover">
<tr><th>No</th><th>Writer</th><th>Title</th><th>Date</th><th>View</th></tr>
<c:forEach var="b" items="${pageInfo.list}" varStatus="status">	
	<tr onclick="location.href='/user/board/detail?id=${b.id}&categoriesId=${b.categoriesId}'">
		<td>${status.count}</td>
		<td>${b.memberDto.name}</td>
		<td>${b.title}</td>
		<td>${b.createDate}</td>
		<td>${b.view}</td>    
	</tr>	
</c:forEach>
</table>
</div>
<c:choose>
<c:when test="${sessionScope.loginCheck eq true}">
	<div class="post">
		<a id="write" href="javascript:write(1);">글쓰기</a>
	</div>
</c:when>
<c:otherwise>
	<div class="post">
		<a id="write" href="javascript:write(2);">글쓰기</a>
	</div>
</c:otherwise>
</c:choose>

<div id="paging">
<ul id="pagination" class="pagination">
	<li class="page-item"><a class="page-link" href="javascript:search(1);">&lt&lt</a></li>
	<c:if test="${pageInfo.hasPreviousPage}">
			<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.prePage});">pre</a></li>
	</c:if>
	<c:forEach var="p" items="${pageInfo.navigatepageNums}" >
		
		<c:choose>
			
			<c:when test="${p==pageInfo.pageNum}">
				<li class="page-item active"><a class="page-link" href="javascript:void(0);"
				style="font-weight: bolder;">${p}</a></li>
			</c:when>
			<c:otherwise >
				<li class="page-item"><a class="page-link" href="javascript:search(${p});">${p}</a></li>
			</c:otherwise>
			
		</c:choose>
		
	</c:forEach>
	
	<c:if test="${pageInfo.hasNextPage}">
			<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.nextPage});">next</a></li>
	</c:if>
	<li class="page-item"><a class="page-link" href="javascript:search(${pageInfo.pages});">&gt&gt</a></li>
	</ul>
</div>
<div>
	<form id="search-form" action="/user/board/${categoriesId}" method="get">
		<input type="hidden" name="num" id="searchNum" value="1">
		
		<div class="d-flex clearfix col-12">
			<div class="col-2">
				<select name="searchAs" id="searchAs" class="form-control">
					<option value="title" <c:if test="${searchMap.searchAs == 'title'}">selected</c:if>>title</option>
					<option value="writer" <c:if test="${searchMap.searchAs == 'writer'}">selected</c:if>>writer</option>
				</select>
			</div>
			<div class="input-group col-8">
				<input type="text" name="search" id="search" class="form-control" value="${searchMap.search}">
			</div>
			<div class="col-2">
				<button type="button" onclick="search(1);" class="btn btn-outline-secondary">Search</button>
			</div>
		</div>
	</form>
</div>
</body>
</html>