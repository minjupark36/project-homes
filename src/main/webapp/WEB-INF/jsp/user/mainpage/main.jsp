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
<script src='https://kit.fontawesome.com/a076d05399.js' crossorigin='anonymous'></script>

  
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
	
	#logout > a {
		text-decoration: none;
		color:white;
	}
	
	#login > a {
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
  		overflow:hidden;
  	}
  	
  	.card-img {
  		width:290px;
  		height:290px;
  		overflow:hidden;
  	}
  	
  	.card-img-top {
  		width:290px;
  		height:290px;
  		object-fit:cover;
  		overflow:hidden;

  	}
  	
  	.card-text {
  		text-align: center;
  		margin-top: 10px;
  	}
  	
  	.card-body > h4 {
  		font-size: 16px;
  		
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
	 	margin-top: 30px;
	 }
	 
	 .comment {
	 	margin-left:1100px
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
	
	.media-body {
		display:inline;
	}
	
	.media-body > p {
		margin-top: 10px;
		font-size: 20px;
	}
	
	.image-wrap, h4, .content_cnt{
		display:inline;
	}
	
	.feedback {
		width:1250px;
		padding-top: 20px;
		padding-left: 20px;
		border: whitesmoke 1px solid;
		box-shadow: whitesmoke 3px 3px;
		border-radius: 10px; 
		margin-bottom: 20px;
	}
</style>
<script>
	
	function addScrapList(id){
		
		console.log(id)
		
			$.ajax({ 
				url:'/scrap/add', 
				method:'post',
				data: {'imagesId':id },
				dataType:'text',
				success:function(res){
					if(res.trim()=='true'){
						alert("내 스크랩 페이지에 추가되었습니다")
					}
					else{
						alert("스크랩에 실패했습니다")
					}
				},
				error:function(xhr, status, err){
					alert(status+', '+err);
				}
			
			});	
		}
	
	function countView(id){
		
		$.ajax({ 
			url:'/main/countView', 
			method:'post',
			data: {'id':id },
			dataType:'text',
			success:function(res){
				if(res.trim()==true){
					
				}
			},
			error:function(xhr, status, err){
				
			}
		
		});	
	}
	
	$(function() {
	        
	    $("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
	    });	    
	});
	
	function callFunction(){
		alert("로그인이 필요한 서비스입니다.")
		location.href = "/sign-in"
	}
	
	function zoomIn(event) {
	    event.target.style.transform = "scale(1.1)";
	    event.target.style.zIndex = 1;
	    event.target.style.transition = "all 0.3s";
	  }

	 function zoomOut(event) {
	    event.target.style.transform = "scale(1)";
	    event.target.style.zIndex = 0;
	    event.target.style.transition = "all 0.3s";
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

<!-------회원가입시 선택한 hashtags--------------->
<c:choose>
<c:when test="${sessionScope.loginCheck eq true}">
<div class="hashtags">	
	<h2 class="todays">${sessionScope.user.name}님's hashtags</h2><br>
	<c:forEach var="tags" items="${tagList}">
		<div class="tags">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='/main/tag?hashtagsNames=${tags}'">#${tags}</button>
		</div>		
	</c:forEach>
</div><br>
</c:when>
<c:otherwise></c:otherwise>
</c:choose>


<h2 class="todays">오늘의 인테리어</h2><br>

<c:set var="i" value="0" />
<c:set var="j" value="4" />
<div class="main-container">
	<div id="list">
		<c:forEach var="interior" items="${interior}">
		<c:if test="${i%j==0}">
		<div class="listToChange">
		</c:if>
			<div class="button">
				<a href="javascript:void(0);" onclick="addScrapList(${interior.id})">
					<img class="scrapBtn" 
					src="https://pics.freeicons.io/uploads/icons/png/13732025981547546480-512.png">	
				</a>
			</div>
			<div class="card">
			<div class="card-img">
				<a href="/main/detail?id=${interior.id}">				
					<img class="card-img-top" 
					src="${interior.filepath}"
					onmouseenter="zoomIn(event)"
     				onmouseleave="zoomOut(event)"/>
     			
				</a>
			</div>	
			<div class="card-body">
				<c:choose>
					<c:when test="${fn:length(interior.hashtagsNames) > 43}">
						<h4 class="card-title">#${fn:substring(fn:replace(interior.hashtagsNames,"  ","#"),0,42)}..</h4>
					</c:when>
					<c:otherwise>
                    	<h4 class="card-title">#${fn:replace(interior.hashtagsNames,"  ","#")}</h4>
			        </c:otherwise>
			
				</c:choose>
			    <p class="card-text">
			    	<i class='fas fa-eye'></i> ${interior.view}
			    	<i class='fas fa-heart'> ${interior.scrap}</i> 
			    	<i class='fas fa-calendar-alt'> ${interior.createDate}</i> 
			    	
			    </p>
			    
			</div>
			</div>
			<c:if test="${i%j==j-1}">
		</div>	
		</c:if>		
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</div><br>
	
<h2 class="todays">오늘의 소품</h2><br>
	
<c:set var="i" value="0" />
<c:set var="j" value="4" />

<div id="list">
	<c:forEach var="deco" items="${deco}">
	<c:if test="${i%j==0}">
	<div class="listToChange">
	</c:if>
		<div class="button">
			<a href="javascript:void(0);" onclick="addScrapList(${deco.id})">
				<img class="scrapBtn" 
				src="https://pics.freeicons.io/uploads/icons/png/13732025981547546480-512.png">	
			</a>		
		</div>
		<div class="card">
		<div class="card-img">
			<a href="${deco.url}" onclick="countView(${deco.id})">
				<img class="card-img-top" 
				src="${deco.filepath}"
				onmouseenter="zoomIn(event)"
     			onmouseleave="zoomOut(event)"/>
			</a>
		</div>
		<div class="card-body">
			<h4 class="card-title">${deco.hashtagsNames} </h4>
		    <p class="card-text">
		    	<i class='fas fa-eye'></i>${deco.view}
		    	<i class='fas fa-heart'> ${deco.scrap}</i> 
		    	<i class='fas fa-calendar-alt'> ${deco.createDate}</i> 		    	
		    </p>		    
		</div>
		</div>
		<c:if test="${i%j==j-1}">
	</div>	
	</c:if>		
	<c:set var="i" value="${i+1}"/>
	</c:forEach>
</div><br>

<h2 class="todays">고객 코멘트</h2>
<div class="comment">
	<a href="/user/feedback" class="btn btn-warning btn-sm">코멘트 남기기</a>
</div><br>

<c:forEach var="feedback" items="${feedback}">
<div class="feedback">
	<div class="image-wrap">
		<img src="https://www.w3schools.com/bootstrap4/img_avatar4.png" class="rounded-circle" id="feedback-img" style="width:60px;">
	</div>
	<div class="media-body">
	    <h4>${feedback.writer} <small><i>Posted on ${feedback.createDate}</i></small></h4>
	    <p><i class='fas fa-quote-left' style='font-size:20px'></i>${feedback.content}<i class='fas fa-quote-right' style='font-size:20px'></i></p>
 	</div>
</div>
</c:forEach>

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