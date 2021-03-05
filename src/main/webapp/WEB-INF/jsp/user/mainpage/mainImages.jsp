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

	.main-visual{
		width:100vw;
		min-height:500px;	
	}
	
	.wholeScreen {
		width:100vw;		
	}
	
	.tag{
		display:inline
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
	
	.images-container {
		width:1320px;
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

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	$(function() {
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
<div class="main-visual">
<div class="wholeScreen">
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