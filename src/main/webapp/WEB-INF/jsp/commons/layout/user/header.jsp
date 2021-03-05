<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	#home-icon {
		width:30px;
		height:30px;
	}
	
	.header {
		width: 100%;
		height:300px;
		background-image: "https://images.unsplash.com/photo-1504253163759-c23fccaebb55?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80";		
	}
	
	#login, #logout {
		margin-left:100px;
		width:1320px;
		color:whitesmoke;
		text-align: right;
		font-weight: bolder;
		font-size: 1.5em;
		text-decoration: none;
	}
	#sign-up{
		margin-left:30px;
		color:whitesmoke;
		text-align: right;
		font-weight: bolder;
		font-size: 1.5em;
		text-decoration: none;
	}
	#logout > a {
		text-decoration: none;
		color:white;
	}
	
	#login > a {
		text-decoration: none;
		color:white;
	}
	#sign-up > a {
		text-decoration: none;
		color:white;
	}
	
</style>
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
     <span id="sign-up">
 		<a href="/sign-up">회원가입</a>    	
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
</body>
</html>