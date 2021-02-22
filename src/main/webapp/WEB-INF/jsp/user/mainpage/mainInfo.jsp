<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

  
<style type="text/css">
	.tag{
		display:inline
	}
	#home-icon {
		width:30px;
		height:30px;
	}
	
	.search-form {
		text-align: center;
		margin: 30px;
		background-color: whitesmoke;
		height: 200px;
		padding-top: 40px;
	}
	
	h2 {
		font-weight: bold;
	}
	
	.search-form input {
		width:500px;
		background-image: url("");
		background-repeat: no-repeat;
		background-position: 5px center;
  		height: 30px;	
	}
	
	.container {		
		margin-top: 20px;
		width: 900px;		
	}
	
	.info-list {
		width:900px;		
		border-top-style: dashed;
		padding-top:15px;
	}
	
	
	a {
		text-decoration: none;
		color:black;
	}
	
	.images {
		width: 120px;
		height: 120px;
		
	}
	
	.image-wrap {
		display: inline-block;
		margin-top:-20px;
		padding-left:20px;
		width: 120px;
		height: 120px;
	}

	.titles {
		width:730px;
		display: inline-block;
		font-size: 20px;
		font-weight: bold;
		padding-left:20px;
	}
	
	.text {
		width:730px;
		display: inline-block;
		font-size: 12px;
		margin-top: 10px;
		padding-left:20px;
	}
	

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>

</script>
</head>
<body>

<!-- 메인 메뉴바 -->
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <ul class="navbar-nav">
    <li class="nav-item active">
      <a class="nav-link" href="/main"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
    </li>
    <c:choose>
    <c:when test="${sessionScope.user.role eq 'user'}">
	    <li class="nav-item">
	      <a class="nav-link" href="/user/board">| 커뮤니티</a>
	    </li>
     </c:when>
     <c:otherwise>
     	<li class="nav-item">
	      <a class="nav-link" href="/admin/board">| 커뮤니티</a>
	    </li>
     </c:otherwise>
    </c:choose>
  
	    <li class="nav-item">
	      <a class="nav-link" href="/main/store">| 스토어</a>
	    </li>
   
    <li class="nav-item">
      <a class="nav-link" href="/user/scrap">| 내 스크랩</a>
    </li>
  </ul>
</nav>

<!-------- 하위 메뉴바 ------->
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

<!-------- 검색하기 --------->
<div class="search-form">
	<h2>정보 검색하기</h2>
	<p>인테리어 관련된 팁을 얻어가세요!</p>
	<form action="/main/info" method="post">
		<input type="text" name="search" id="search" placeholder="궁금한 것을 검색해보세요." value="${searchAs}">		
	</form>
</div>

<!-------- 메인리스트 --------->
<c:forEach var="info" items="${infoList}">
<div class="container">
<div class="info-list">
	<a class="info-list-link" href="${info.url}">
		<div class="titles">${info.title}</div>	
		<div class="text">${info.text}</div>
	</a>
	<div class="image-wrap">
		<img class="images rounded-circle" src="${info.imageUrl}">	
	</div>	
</div>
</div>
</c:forEach>
</body>
</html>