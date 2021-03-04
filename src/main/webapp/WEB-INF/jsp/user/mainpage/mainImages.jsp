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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

  
<style type="text/css">
	.tag{
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
	
	.sorting {
		width:1100px;
		margin: auto auto ;
	}

	.main-container {
		width: 1320px;
  		margin: auto auto; 			 		
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
	
	.images-container {
		width:1100px;
		margin: auto auto;
	}
	
	.hashtags {
		width:900px;
		margin-left: 180px;
	}
	
	.btn-circle.btn-sm { 
            width: 70px; 
            height: 30px; 
            padding: 3px 0px; 
            border-radius: 15px; 
            text-align: center; 
            color :gray;
        } 
        
     a:hover {
     	text-decoration: none;
     }
     
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
	
	a {
		text-decoration: none;
		color:orange;
	}
	
	a:hover {
		text-decoration: none;
		color:orange;
	}
	
	.footer-container{
		width:100%;
		height:300px;
		border-top: solid 1px black;
		padding-top:30px;
		margin-top:30px;
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
		margin-right: -680px;
	}
	
	.footer-info {
		margin: 20px 40px;
	}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	
	function tagCount(id){
		$.ajax({ 
			url:'/hashtag/click', 
			method:'post',
			data: {'id':id },
			dataType:'text',
			success:function(res){
				
			},
			error:function(xhr, status, err){
				alert(status+', '+err);
			}
		
		});	
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
    <li class="nav-item active">
      <a class="nav-link" href="/main"><img src="https://www.iconpacks.net/icons/1/free-home-icon-189-thumb.png" id="home-icon"> 구해줘 홈즈</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="/user/board">| 커뮤니티</a>
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

<!------------- 정렬필터 -------------->
<div class="sorting">
	<i class='fas fa-filter' style="font-size: 24px"></i>
  <div class="btn-group">
    <button type="button" class="btn btn-light">날짜</button>
    <button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="/main/images?order=recent">최신순</a>
      <a class="dropdown-item" href="/main/images?order=descent">오래된순</a>
    </div>
  </div>
  
  <div class="btn-group">
    <button type="button" class="btn btn-light">조회수</button>
    <button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="/main/images?order=highview">조회수 높은순</a>
      <a class="dropdown-item" href="/main/images?order=lowview">조회수 낮은순</a>
    </div>
  </div>

  <div class="btn-group">
    <button type="button" class="btn btn-light">스크랩</button>
    <button type="button" class="btn btn-light dropdown-toggle dropdown-toggle-split" data-toggle="dropdown">
    </button>
    <div class="dropdown-menu">
      <a class="dropdown-item" href="/main/images?order=highscrap">많은순</a>
      <a class="dropdown-item" href="/main/images?order=lowscrap">적은순</a>
    </div>
  </div>
</div>
<br>
<!------- hashtags ------->
<div class="images-container">
<div class="hashtags">	
	<c:forEach var="tags" items="${hashtagList}">
		<div class="tag">
			<a href="javascript:tagCount(${tags.id})">
				<button type="button" class="btn btn-outline-warning btn-circle btn-sm" onclick="location.href='/main/tag?hashtagsNames=${tags.name}'">#${tags.name}
				</button>
			</a>			
		</div>		
	</c:forEach>
</div><br>

<!------- 이미지카드 ------->
<c:set var="i" value="0" />
<c:set var="j" value="4" />
<div class="main-container">
	<div id="list">
		<c:forEach var="main" items="${mainpageList}">
		<c:if test="${i%j==0}">
		<div class="listToChange">
		</c:if>
			<div class="button">
				<a href="javascript:void(0);" onclick="addScrapList(${main.id});">
					<img class="scrapBtn" 
					src="https://pics.freeicons.io/uploads/icons/png/13732025981547546480-512.png">	
				</a>		
			</div>
			<div class="card">
			<div class="card-img">
				<a href="/main/detail?id=${main.id}">
					<img class="card-img-top" 
					src="${main.filepath}"
					onmouseenter="zoomIn(event)"
     				onmouseleave="zoomOut(event)"/>
				</a>
			</div>
		<div class="card-body" >			
			<c:choose>
				<c:when test="${fn:length(main.hashtagsNames) > 43}">
					<h4 class="card-title">#${fn:substring(fn:replace(main.hashtagsNames,"  ","#"),0,42)}..</h4>
				</c:when>
				<c:otherwise>
                   	<h4 class="card-title">#${fn:replace(main.hashtagsNames,"  ","#")}</h4>
		        </c:otherwise>		
			</c:choose>
		    <p class="card-text">
		    	<i class='fas fa-eye'></i> ${main.view}
		    	<i class='fas fa-heart'> ${main.scrap}</i> 
		    	<i class='fas fa-calendar-alt'> ${main.createDate}</i> 		    	
		    </p>		    
		</div>
		</div>
		<c:if test="${i%j==j-1}">
	</div>	
	</c:if>		
	<c:set var="i" value="${i+1}"/>
	</c:forEach>
</div>
<div class="footer-container">
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
<a id="TopButton" class="ScrollButton"><img src="https://www.iconpacks.net/icons/1/free-icon-arrow-856.png"></a>

</div>
	
</body>
</html>