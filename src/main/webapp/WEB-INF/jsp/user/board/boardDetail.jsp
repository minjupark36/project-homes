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
<style>
	.ScrollButton {
		  position: fixed;   /* 버튼의 위치 고정 */
		  right: 10px;       /* x 위치 입력 */
		  cursor: pointer;   /* 호버링 했을 때 커서 모양 변경 */
		  z-index: 10;       /* 다른 태그에 가려지지 않게 우선순위 변경 */
		  display: none;     /* 스크롤 위치에 상관없이 보이게 하려면 생략 */
		  font-size:20px		}
			/* 두 태그에 각각 y 위치 입력 */
	#TopButton {
	  bottom: 108px;        
	}
	#home-icon {
			width:30px;
			height:30px;
	}
</style>
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
	function showNextBoard(id,page){
		$.ajax({
			url:'/user/board/detail',
			method:'post',
			data:{'id': id,
					'page':page},    
			dataType:'text',
			success:function(data){
				data.trim();
				next=data.split(",");
				var info1=next[0];
				var info2=next[1];
				location.href="/user/board/detail?id="+info1+"&categoriesId="+info2;
			},
			error:function(xhr, status, err){
				
					alert("다음 게시물이 없습니다");
					window.location.reload();
			}
		});   
		
	}
	function showPreBoard(id,page){
		$.ajax({
			url:'/user/board/detail',
			method:'post',
			data:{'id': id,
				'page':page},      
			dataType:'text',
			success:function(data){
				data.trim();
				pre=data.split(",");
				var info1=pre[0];
				var info2=pre[1];
				location.href="/user/board/detail?id="+info1+"&categoriesId="+info2;
			},
			error:function(xhr, status, err){
					alert("이전 게시물이 없습니다");
					window.location.reload();
			}
		});   
	}
	
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 10) {
	            $('.ScrollButton').fadeIn();
	        } else {
	            $('.ScrollButton').fadeOut();
	        }
	    });
	        
	    $("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
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
	<button type="button" class="btn btn-outline-secondary" onclick="deleteBoard(${d.id})">글 삭제</button>
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board/edit/?id=${d.id}&categoriesId=${d.categoriesId}'">수정</button>
	<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board'">게시판</button>
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
	<button type="button" class="btn btn-outline-danger" onclick="showPreBoard(${d.id},1)">이전글</button>
	<button type="button" id="nextBoard" class="btn btn-outline-danger" onclick="showNextBoard(${d.id},2)">다음글</button>
</div>
<div>
<button type="button" class="btn btn-outline-secondary" onclick="location.href='/user/board/reply?pid=${d.groupNo}&groupOrder=${d.groupOrder}&depth=${d.depth}&categoriesId=${d.categoriesId}'">답글</button>	
</div>
<div>
	<table class="table table-hover">	
	<c:forEach var="r" items="${replyList}">		
		<tr onclick="location.href='/user/board/detail?id=${r.id}&categoriesId=${r.categoriesId}'">
			<th>제목</th>
			<td>${r.title}</td>
		</tr>		
	</c:forEach>
	</table>
</div>
<a id="TopButton" class="ScrollButton"><img src="https://www.iconpacks.net/icons/1/free-icon-arrow-856.png"></a>
<a id="footer"></a>
</body>
</html>