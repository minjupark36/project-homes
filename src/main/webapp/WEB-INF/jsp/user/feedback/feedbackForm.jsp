<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  
<style type="text/css">

	.main-visual{
		width:100%;
		height:500px;
		
		
	}
	
	.main-container {
		width:100%;
		margin: 0 0;
		padding: 0 30px;
		
		
	}

	.visual-container {
		height:500px;
		background-image: url("https://webstockreview.net/images/furniture-clipart-interior-design.png");
		background-repeat:no-repeat;
		background-position: center bottom;
	}
	
	#login, #logout {
		width:800px;
		color:white;
		text-align: right;
		font-weight: bolder;
		font-size: 1.5em;
		text-decoration: none;
	}
	
	a {
		text-decoration: none;
		color:white;
	}
	
	.tag{
		display:inline
	}
	
	.tags{
		display:inline
	}
	
	#home-icon {
		width:30px;
		height:30px;
	}
	.header {
		width: 100%;
		height:300px;
		background-image: "https://images.unsplash.com/photo-1504253163759-c23fccaebb55?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";
		
	}
	
	
	.container {
		margin-left:0px;
	}
	.main-container {
		width: 1320px;
  		margin: auto auto;
  		padding: 0 15px;	 		
  	}
  	
	 
	 i{
	 	margin-left:5px;
	 }
	 
	 .todays {
	 	text-align: center;
	 	margin-top: 30px;
	 }
	 
	 .comment {
	 	margin-left:1100px
	 }
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
	
	.sideBanner {
	  position: absolute;
	  width: 150px;
	  height: 200px;
	  left:1800px;
	  top: 400px;
	  background-color: white;
	  color: black;
	  font-size:25px
	}
	
	.media-body {
		display:inline;
	}
	
	.image-wrap, h4{
		display:inline;
	}
	 
</style>
<script>

	function addFeedback(){

			$.ajax({ 
				url:'/add/feedback', 
				method:'post',
				data: $("#feedback").serialize(),
				dataType:'text',
				success:function(res){
					if(res.trim()=='true'){
						alert("고객님의 소중한 피드백이 전달되었습니다")
						location.href = "/main"
					}
					else{
						alert("피드백 전송에 실패했습니다")
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

<!-- 메인 메뉴바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
  <c:choose>
    <c:when test="${sessionScope.loginCheck eq true}">
	    <li class="nav-item active">
	      <a class="nav-link" href="/mainRecommendation?userId=${sessionScope.user.id}"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
	    </li>
    </c:when>
    <c:otherwise>
	    <li class="nav-item active">
	      <a class="nav-link" href="/main"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
	    </li>
    </c:otherwise>
    </c:choose>
    
    
     <c:choose>
    <c:when test="${sessionScope.user.role eq 'ADMIN'}">
	    <li class="nav-item">
	      <a class="nav-link" href="/admin/board">| 커뮤니티</a>
	    </li>
     </c:when>
     <c:otherwise>
     	<li class="nav-item">
	      <a class="nav-link" href="/user/board">| 커뮤니티</a>
	    </li>
     </c:otherwise>
    </c:choose>
    <c:choose>
    <c:when test="${sessionScope.loginCheck eq true}">
    <li class="nav-item">
      <a class="nav-link" href="/user/scrap">| 내 스크랩</a>
    </li>   
    </c:when>
    <c:otherwise>
    <li class="nav-item">
      <a class="nav-link" href="javascript:callFunction();">| 내 스크랩</a>
    </li>  
    </c:otherwise>
    </c:choose> 
    <c:choose>
    <c:when test="${sessionScope.user.role eq 'ADMIN'}">
    <li class="nav-item">
    	<a class="nav-link" href="/admin/manage">| 사이트관리</a>
    </li>
    </c:when>
    </c:choose>
  </ul>
  <c:choose>
  <c:when test="${sessionScope.loginCheck eq true}">
	  <span id="logout">
	  		<a href="/log-out">로그아웃</a>   
	   </span>
  </c:when>
  <c:otherwise>
 	<span id="login">
 		<a href="/sign-in">로그인</a>    	
    </span>
  </c:otherwise>
  </c:choose>
   
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

<div class="main-visual">
<div class="main-container visual-container"></div>

<div class="main-container">
<h2 class="todays">홈즈에 대한 후기를 남겨주세요</h2><br>
<div>
	<form id="feedback" method="post">
	<input name="writer" type="hidden" value="${sessionScope.user.name}">
	<textarea name="content" rows="5" style="width: 1200px"></textarea>
	<button type="button" onclick="addFeedback();" class="btn btn-warning btn-sm" style="margin-bottom: 20px">저장</button>
	</form>
</div><br>

<div class="feedback">
	<c:forEach var="feedback" items="${feedback}">
	<div class="image-wrap">
		<img src="https://www.w3schools.com/bootstrap4/img_avatar4.png" class="rounded-circle" id="feedback-img" style="width:60px;">
	</div>
	<div class="media-body">
	    <h4>${feedback.writer} <small><i>Posted on ${feedback.createDate}</i></small></h4>
	    <p><i class='fas fa-quote-left' style='font-size:20px'></i>${feedback.content}<i class='fas fa-quote-right' style='font-size:20px'></i></p>
 	</div>
 	</c:forEach>
</div>
</div>

<a id="TopButton" class="ScrollButton"><img src="https://www.iconpacks.net/icons/1/free-icon-arrow-856.png"></a>
</body>
</html>