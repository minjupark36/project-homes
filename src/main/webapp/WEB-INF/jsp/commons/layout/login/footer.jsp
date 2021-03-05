<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<style>
	.footer-category > ul {
		list-style: none;
		margin-top:30px;
	}
	
	.footer-category > ul > li {
		display: inline-block;
	}
	
	.footer-category > a {
		text-decoration: none;
		font-color: black;
	}
	.footer-container{
		width:100vw;
		height:300px;
		background-color: whitesmoke;
		padding-top:30px;
		margin-top:30px;
	}
	
	.footer-contents {
		width: 1320px;
		margin: auto auto;
	}
	
	a {
		text-decoration: none;
		color:orange;
	}
	
	a:hover {
		text-decoration: none;
		color:orange;
	}
	
	.footer-category{
		margin-left:-40px;
		width: 700px;		
	}
	
	.footer-sns {
		width:200px;
		height: 100px;
		float: right;
		margin-top:-100px;
		margin-right: -650px;
	}
	
	.footer-info {
		margin: 20px 40px;
	}
	
	.side-inner-btn{
		width:60px;
		height:60px;
		border-radius:100%;
		background-color:#685547;
		position: relative;
		text-align: center;	
		margin-bottom: 20px;	
	}
	
	.home-btn, .search-btn, .top-btn, .scrap-btn{
		color: #faec8e;
		font-size: 35px;
		padding-top: 12px;
		padding-right: 5px;
	}
	
	.sideBanner {
	  position: absolute;
	  width: 150px;
	  height: 200px;
	  right:30px;
	  top: 400px;
	  color: black;
	  font-size:25px
	}

</style>
</head>
<body>
<div class="footer-container">
<div class="footer-contents">
<h3 class="footer-logo">구해줘 홈즈</h3>
<div class="footer-category">
	<ul>
		<li><a href="">홈즈스토리 | </a></li>
		<li><a href="">자주 묻는 질문 | </a></li>
		<li><a href="/user/terms/conditions">이용약관 | </a></li>
		<li><a href="/user/terms/privacy">개인정보처리방침</a></li>
	</ul>
	<div class="footer-sns">	
		<a href=""><i class="fab fa-twitter fa-3x"></i></a>
		<a href=""><i class="fab fa-instagram fa-3x"></i></a>
		<a href=""><i class="fab fa-facebook-f fa-3x"></i></a>
	</div>
	<div class="footer-info">제휴문의 homes@homes.com</div>
	<div class="footer-info">서울특별시 종로구 수표로 105 육의전빌딩 8,9층 TEL: 02-766-8367</div>
	<div class="footer-info">©2020 homes</div>	
</div>
</div>
</div>

<div class="sideBanner">
	<c:choose>
		<c:when test="${sessionScope.user != null}">
			<div class="side-inner-btn"><a href="/main/customized"><i class="fas fa-home fa-2x home-btn"></i></a></div>
		</c:when>
		<c:otherwise>
			<div class="side-inner-btn"><a href="/main"><i class="fas fa-home fa-2x home-btn"></i></a></div>
		</c:otherwise>
	</c:choose>
	<div class="side-inner-btn"><a href="/main/info"><i class='fas fa-search fa-2x search-btn'></i></a></div>
	<div class="side-inner-btn"><a href="/user/scrap"><i class='far fa-bookmark fa-2x scrap-btn'></i></a></div>		
	<div class="side-inner-btn"><a id="TopButton" class="ScrollButton"><i class='fas fa-angle-up fa-2x top-btn'></i></a></div>
</div>
</body>
<script>
	var floatPosition = parseInt($(".sideBanner").css('top'))
	
	//scroll 인식
	$(window).scroll(function() {
	
		 // 현재 스크롤 위치
		 var currentTop = $(window).scrollTop();
		 var bannerTop = currentTop + floatPosition + "px";
	
		 //이동 애니메이션
		 $(".sideBanner").stop().animate({
		   "top" : bannerTop
		 }, 500);
	
	}).scroll();
</script>
</html>