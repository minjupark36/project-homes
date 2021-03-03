<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="UTF-8">
<title>Board List</title>
<style>

	#home-icon {
		width:30px;
		height:30px;
	}
	
	.category{
		display:inline-block;
		width:250px;
		height:700px;
		float:left;
		margin-left:40px;		
		font-size: 10px;
		background-color: whitesmoke;		
	}
	
	.intro {
		width:100%;
		height: 140px;
		background-color: #aaaaaa	;
	}
	
	.intro > h3 {
		padding-top:40px;
		font-size: 2rem;
		text-align: center;
		color: white;
		opacity: 0.7
	}
	
	.intro > h4 {
		text-align: center;
		color: white;
	}
	
	.category-list > ul > li{
		height: 60px;
		border-bottom: 1px solid #d0cece;
		padding-left: 17px;	
	}
	
	.cate{
		 font-size:20px;
		 color:black;
		 font-family: sunflower;	
		 
	}
	
	.cate > i {
		margin-left: 90px;
		font-size: 30px;
		display: inline;
		color: #aaaaaa;
	}
	
	.navbar-nav {
		margin-bottom:30px;
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
	
	.main-container {
		width:1320px;
	}
	
	.list-container {
		width:1000px;
		display: inline;
		float: right;
		padding-right: 20px;
	}
	
	#paging{
		width:200px;
		margin: auto auto;
	}

	#writeBtn {
		margin-left:830px;
	}
	
	a:hover {
		text-decoration: none;
		color: black;
	}
	
	a {
		color : #FFB400;
	}
	
	.page-item.active .page-link {
		background-color : #f0ad4e;
		border-color: #f0ad4e;
	}
	
	.page-link {
		color : #FFB400;
		
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

	$(document).ready(function(){	
		
	    $("#selectAll").click(function() {	
	    	
	        var isChecked = $(this).prop("checked");	
	        $(".selectEach").prop("checked", isChecked);
		
	    });	
	    
		$(".selectEach").click(function(){
			$("#selectAll").prop("checked",false)
		})

    });

		
	function massiveDelete(){
		
		var confirm_val = confirm("정말 삭제하시겠습니까?");
		  
		  if(confirm_val) {
		   var idArr = new Array();
		   
		   $("input[class='selectEach']:checked").each(function(){
			   idArr.push($(this).attr("data-id"));
		   });
		   
		   $.ajax({
		    url : '/admin/board',
		    method : 'post',
		    data : { idArr : idArr },
		    dataType:'text',
		    success : function(res){
		    	if(res){
		    		alert("삭제되었습니다")
		    		location.reload();
		    	}else{
		    		alert("삭제 실패")
		    	}		    	
		    },
			error:function(xhr, status, err){
				alert(status+','+err);	
			}
			}); 
			
		}
				 
	}

 		
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
<!-------- category list --------->
<div class="main-container">
<div class="category">
	<div class="intro">
		<h3>Admin Board</h3>
		<h4>관리자 게시판</h4>
	</div>
<div class="category-list">
	<ul class="navbar-nav">
		<li class="nav-item active"><a href="/admin/board/1" class="nav-link cate">자유게시판<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
		<li class="nav-item active"><a href="/admin/board/2" class="nav-link cate">FAQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
		<li class="nav-item active"><a href="/admin/board/3" class="nav-link cate">공지사항&nbsp;&nbsp;&nbsp;<i class="fas fa-chevron-circle-right fa-2x"></i></a></li>
	</ul>
</div>	
</div>
<!-------- board list --------->
<div class="list-container">
	<table class="table table-hover">
		<tr>
			<th>
				<input type="checkbox" id="selectAll" name="selectAll">
			</th>
			<th>No</th>
			<th>Writer</th>
			<th>Title</th>
			<th>Date</th>
			<th>Views</th>
			<th>Edit</th>
			
		</tr>
	
		<c:forEach var="list" items="${pageInfo.list}">	
			<tr>
				<td>
					<input type="checkbox" class="selectEach" name="selectEach" data-id="${list.id}">
				</td>
				<td>${list.id}</td>
				<td>${list.memberDto.name}</td>
				<td>
					<a href ="/admin/board/detail?id=${list.id}&categoriesId=${list.categoriesId}" onclick="countView(${list.id});">
						${list.title}
					</a>		
				</td>
				<td>${list.createDate}</td>
				<td>${list.view}</td>    	
				<c:choose>
				<c:when test="${list.membersId eq 1}">
					<td><a href="/admin/board/edit?id=${list.id}&categoriesId=${list.categoriesId}">수정</a></td>
				</c:when>
				</c:choose>	
			</tr>	
		</c:forEach>
	
	</table>

<button type="button" id="massiveDeleteBtn" onclick="massiveDelete();" style="cursor: pointer;" class="btn btn-outline-primary">삭제</button>
<button type="button" id="writeBtn" onclick="location.href='/admin/board/insert'" style="cursor: pointer;" class="btn btn-warning ">글쓰기</button>	
<!-------- pagination --------->
<div id="paging">
<ul id="pagination" class="my pagination">
<c:choose> 
	<c:when test="${pageInfo.hasPreviousPage}">
		<li class="page-item"><a class="page-link" href="/admin/board/${pageInfo.pageNum-1}">&lt&lt</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="javascript:void()">&lt&lt</a></li>
	</c:otherwise>
</c:choose>
	<c:forEach var="p" items="${pageInfo.navigatepageNums}">
		<c:choose>
			<c:when test="${p==pageInfo.pageNum}">
				<li class="page-item active"> <a class="page-link" href="javascript:void()">${p}</a></li>
			</c:when>
			<c:otherwise>
			<li class="page-item"><a class="page-link" href="/admin/board/${p}">${p}</a></li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
<c:choose>
	<c:when test="${pageInfo.hasNextPage}">
		<li class="page-item"><a class="page-link" href="/admin/board/${pageInfo.pageNum+1}">&gt&gt</a></li>
	</c:when>
	<c:otherwise>
		<li class="page-item"><a class="page-link" href="javascript:void()">&gt&gt</a></li>
	</c:otherwise>
</c:choose>
</ul>
</div>

<!-------- search --------->
<div class="w-100">
	<form id="search-form" action="/admin/board" method="post">
		<div class="d-flex clearfix col-12">
			<div class="col-2">
				<select name="searchAs" id="searchAs" class="form-control">
					<option value="title" <c:if test="${searchMap.searchAs == 'title'}">selected</c:if>>제목</option>
					<option value="writer" <c:if test="${searchMap.searchAs == 'writer'}">selected</c:if>>작성자</option>
				</select>
			</div>
			<div class="input-group col-8">
				<input type="text" name="search" id="search" class="form-control" value="${searchMap.search }">
			</div>
			<div class="col-2">
				<button type="submit" class="btn btn-raised btn-warning btn-round waves-effect">검색</button>
			</div>
		</div>
	</form>
</div>
</div>
</div>
</body>
