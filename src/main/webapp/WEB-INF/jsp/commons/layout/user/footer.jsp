<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</body>
</html>