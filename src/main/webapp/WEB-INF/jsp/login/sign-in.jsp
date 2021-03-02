<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

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
  		
  	.card {
  		display:inline-block;
  		margin:10px 10px;
  		width:290px;
  	}
  	
  	.card-img-top {
  		width:290px;
  		height:290px;
  		object-fit:cover
  	}
  	
  	.card-body > h4 {
  		font-size: 12px;
  		font-weight: bold;
  	}
	.scrapBtn {
		height:25px; 
		width:25px;
		cursor:pointer;
		transform: translate(20%,20%);
		position: absolute;
		z-index: 1;
		margin-top: 10px;
		margin-left: -40px
	}
	
	 #list {
	 	width:100%; 
	 	position: relative;
	 }
	 
	 #list .button {
	 	position: absolute; 
	 	display: inline-block; 
	 	height: 200px; 
	 	width: 300px; 
	 	margin-left: 50px; 
	 	margin-bottom: 30px;
	 }
	 
	 .scrapBtn:hover {
	 	-webkit-filter: opacity(.5) drop-shadow(0 0 0 gray);
	 	filter: opacity(.5) drop-shadow(0 0 0 gray);
	 }
		 			
	 .sort, .hashtags, #pagination {
	 	text-align: center;
	 }
	 
	 i{
	 	margin-left:5px;
	 }
	 
	 .todays {
	 	text-align: center;
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

	.section{
	    width: max-content;
	    height: max-content;
	    margin: auto;
	    margin-top: 70px;
	    margin-bottom: 70px;
	}
	
	.section>h1{
	    width: max-content;
	    height: max-content;
	    margin-left: auto;
	    margin-right: auto;
	    font-size: 3.0rem;
	    color: #685547;

	}
	
	.section>h2{
	    width: max-content;
	    height: max-content;
	    margin-left: auto;
	    margin-right: auto;
	    font-size: 1.5rem;	    
	    color: #685547;
	}
	
	#user_id_login {
	    height: 30px;
	    width: 400px;
	    margin-top: 80px;
	    font-size: 1rem;
	    border: 0px;
	    border-bottom: 1px solid black;
	    background-color: transparent;
	}
	
	#user_pw_login {
	    
	    height: 30px;
	    width: 400px;
	    margin-top: 20px;
	    font-size: 1rem;
	    border: 0px;
	    border-bottom: 1px solid black;
	    background-color: transparent;
	}
	
	#btn_login {
	    align-items: center;
	    width: 400px;
	    height: 40px;
	    background-color:  #fde982;
	    margin-top: 30px;
	    margin-bottom: 10px;
	    color: #685547;
	    font-size: 1.5rem;
	    font-style: bold;
	    border-color: transparent;
	}
	
	#btn_login:hover{
	    color: #f8f7e6;
	    background-color: #685547;
	}
	
	.join, .find{
		display:inline;
		text-align: center;
	}
	
	.join >a, .find >a {
		font-size: 1em;
		color: #685547;
	}
	    
	.join{
		margin-right:195px;
	}
	
	.find {
		margin-left:35px
	}
	
	a {
		text-decoration:none;
	}

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function login() { 
		
		$.ajax({ 
			url:'/sign-in', 
			method:'post',
			data: $('#login-form').serialize(),
			dataType:'text',
			success:function (res){
				if(res.trim()=='true'){
					alert("로그인에 성공했습니다.");
					location.href="/main/customized";
				}else {
					alert("로그인에 실패했습니다.")
					return false;
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

<div class="jumbotron text-center">
  <h1>My First Bootstrap Page</h1>
  <p>Resize this responsive page to see the effect!</p> 
</div>

<section class="section">
	<h1>LOGIN</h1>
	<h2>로그인</h2>
	<form id="login-form">
		<input type="email" name="email" id="user_id_login" size="40" placeholder="이메일 아이디" required><br>
		<input type="password" name="password" id="user_pw_login" size="40" placeholder="비밀번호" required><br>
		<div class="warning"></div>
		<div>
			<button type="button" id="btn_login" onclick="login();">LOGIN</button>
		</div>
		<div class="join">
			<a href="/sign-up">회원가입</a>
		</div>
		<div class="find"> 
			<a href="/findPw">비밀번호 찾기</a>
		</div>
	
	</form>	
</section>
</body>
</html>