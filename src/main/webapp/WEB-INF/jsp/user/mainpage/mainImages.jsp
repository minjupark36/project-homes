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
  		width:250px;

  	}
  	
  	.card-img-top {
  		width:250px;
  		height:250px;
  		object-fit:cover
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
	  left:1700px;
	  top: 400px;
	  background-color: white;
	  color: black;
	  font-size:25px
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

<!------------- 정렬필터 -------------->
<div class="container">
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

<div class="hashtags">	
	<c:forEach var="tags" items="${hashtagList}">
		<div class="tag">
			<button type="button" class="btn btn-outline-secondary" onclick="location.href='/main/tag?hashtagsNames=${tags.name}'">#${tags.name}</button>
		</div>		
	</c:forEach>
</div>
<br>
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
				<a href="/main/detail?id=${main.id}">
					<img class="card-img-top" src="${main.filepath}"/>
				</a>
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
			    <a href="/main/detail?id=${main.id}" class="btn btn-warning btn-sm" onclick="countView(${main.id});">+더보기</a>
			</div>
			</div>
			<c:if test="${i%j==j-1}">
		</div>	
		</c:if>		
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
	</div>	
<a id="TopButton" class="ScrollButton"><img src="https://www.iconpacks.net/icons/1/free-icon-arrow-856.png"></a>
<div class="sideBanner">
	<ul class="navbar-nav">
		<li class="nav-item active">2</li>
		<li class="nav-item active">3</li>
		<li class="nav-item active">4</li>
	</ul>
</div>
	
</body>
</html>