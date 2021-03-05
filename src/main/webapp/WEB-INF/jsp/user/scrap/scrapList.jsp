<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" href="/favicon.ico" type="image/x-icon">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta charset="UTF-8">
<title>My Scrap Page</title>
<style>

	h4 {
		text-align: center;
		margin-top: 100px;
		font-size: 30px
	}
	
	.spinner {
		text-align: center;
	}
	
	.scrapImage {
		height: 250px; 
		width: 250px; 
		margin-left: 50px; 
		margin-bottom: 30px;
		object-fit:cover;
		border-radius: 10px; 
	}
	
	.scrapBtn {
		height: 30px; 
		width:30px;
		cursor:pointer;
		transform: translate(20%,20%);
	}
	 
	 #list {
	 	width:90%; 
	 	position: relative;
	 }
	 
	 #list .image {
	 	display: inline-block;
	 }
	 
	 #list .button {
	 	position: absolute; 
	 	display: inline-block; 
	 	height: 200px; 
	 	width: 300px; 
	 	margin-left: 50px; 
	 	margin-bottom: 30px;
	 }
	 
	 .scrapBtn:hover{
	 	filter: opacity(.5) drop-shadow(0 0 0 gray);
	 }
	 			
	 .sort {
	 	text-align: center;
	 	margin-top: 50px;
	 	margin-left: 20px;
	 }
	 
	 #pagination {
	 	text-align: center;
	 }
	 
	 table {
	 	margin-left: -8%
	 }

	.btn-circle.btn-sm { 
        width: 100px; 
        height: 50px; 
        padding: 3px 0px; 
        border-radius: 20px; 
        text-align: center; 
        margin-right: 20px;
        font-size: 20px;
     } 
      
     .scrap-container {
     	width:1100px;
     	margin: auto auto;
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
	
	.snsList {
		list-style: none;
		font-size: 30px;
		text-align: center;
		margin-left: -20px
	}
	
	.snsList >li {
		display: inline-block;
		margin-right: 20px		
	}
	
	.snsList > li> a {
		text-decoration: none;
		color: black;		
	}
	
	.userName, .count{
		font-size: 50px;
	}
	
	.sns-title{
		text-align: center;
		font-size: 20px;
	}
	
	.sns-container {
		width:500px;
		border: whitesmoke 1px solid;
		box-shadow: whitesmoke 3px 3px;
		border-radius: 20px;
		margin: auto auto;
		padding-top: 20px
	}
		 
	</style>
<script>
	
	function deleteScrap(id){
		$.ajax({ 
			url:'/user/scrap', 
			method:'delete',
			data: {'id':id},
			dataType:'text',
			success:function(res){
				if(confirm("스크랩 목록에서 삭제하시겠습니까?")){
					location.reload();
				}
				else{
					return false;
				}
			},
			error:function(xhr, status, err){
				alert(status+', '+err);
			}
		
		});	
	}

	function showList(sort){
		
		$.ajax({ 
			url:'/user/scrap', 
			method:'post',
			data: {'sort':sort}, /*all, interior, deco 中*/
			dataType:'text',
			cache: false
	    }).done(function(res) {
	    	var html = jQuery('<div>').html(res);
	    	var contents = html.find('div#list').html();   		    	
	        $("#list").html(contents);
	        $('#sort').val(sort);
	        
	    }).fail(function (xhr, status, err){
			alert(status+', '+err);
			});
	}	
	
	$(document).ready(function(){
		  $('[data-toggle="tooltip"]').tooltip();
		});
	
	$(function() {
        
	    $("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
	    });	    
	});
	
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
	 
	 $(window).ready(function(){ 
  
        $(".snsList li a").click(function(){
  
            shareAct(this);
  
        });
  
	});
  
	function shareAct(a){
	  
	    var snsCode = $(a).attr('id');
	      
	    var cUrl = "localhost:8080/user/scrap";
	
	    switch(snsCode){
	
	        case"vIconTw"://트위터
	            cUrl = 'https://twitter.com/intent/tweet?text=페이지제목:&url='+cUrl;
	        break;
	
	        case"vIconTg"://텔레그램
	            cUrl = 'https://telegram.me/share/url?url='+cUrl;
	        break;
	              
	        case"vIconFb"://페이스북
	            cUrl = 'http://www.facebook.com/sharer/sharer.php?u='+cUrl;
	        break;
	
	        case"vIconIg"://인스타그램
	            cUrl = 'https://www.instagram.com//share?url='+cUrl;
	        break;  
	    }
	
	    window.open(cUrl,'','width=600,height=300,top=100,left=100,scrollbars=yes');
	
	}	
	
</script>

</head>
<body>

<!-- personal info -->
<h4><span class="userName">${sessionScope.user.name}</span>님이 스크랩한 이미지<br>총 <span class="count">${scrapCount}</span>개</h4>
<br>
<div class="sns-container">
<div class="sns-title">SNS에서 공유하기</div>
<ul class="snsList"> 
    <li><a href="#" id="vIconTw" onclick="return false;"><i class="fab fa-twitter"></i></a></li>  
    <li><a href="#" id="vIconIg" onclick="return false;"><i class="fab fa-instagram"></i></a></li> 
    <li><a href="#" id="vIconFb" onclick="return false;"><i class="fab fa-facebook-square"></i></a></li> 
    <li><a href="#" id="vIconTg" onclick="return false;"><i class="fab fa-telegram-plane"></i></a></li> 
</ul>
</div>
<!-- MyScarp sorting buttons -->
<div class="sort">
	<input type="hidden" id="sort" name="sort" value="all">
	<button type="button" data-sort="all" onclick="showList('all')" class="btn btn-warning btn-circle btn-sm">전체보기</button>
	<button type="button" data-sort="interior" onclick="showList('interior')" class="btn btn-warning btn-circle btn-sm">인테리어</button>
	<button type="button" data-sort="deco" onclick="showList('deco')" class="btn btn-warning btn-circle btn-sm">소품</button>
</div><br><br>
	
<!-- MyScrap images list -->
<div class="scrap-container">
<c:set var="i" value="0" />
<c:set var="j" value="4" />
	<div id="list">
		<table>			
		<c:forEach var="scrap" items="${scrapList}" varStatus="status">
		<c:if test="${i%j==0}">
		<tr class="listToChange">
		</c:if>
			<td class="scrolling" data-id="${scrap.id}">
			<div class="button">
				<a href="javascript:void(0);" onclick="deleteScrap(${scrap.id})">
					<img class="scrapBtn" 
					src="https://pics.freeicons.io/uploads/icons/png/13732025981547546480-512.png">	
				</a>		
			</div>
			<div class="image">
				<a href="${scrap.imageDto.filepath}">
					<img class="scrapImage" 
					src="${scrap.imageDto.filepath}" 
					data-toggle="tooltip" 
					title="${scrap.imageDto.hashtagsNames}"
					onmouseenter="zoomIn(event)"
     				onmouseleave="zoomOut(event)"/>
				</a>
			</div>
				
			</td>
			<c:if test="${i%j==j-1}">
		</tr>
		</c:if>
		<c:set var="i" value="${i+1}"/>
		</c:forEach>
		</table>
		<div><input type="hidden" id="lastRow" name="lastRow" value="4"></div>
	</div>	
</div>

<!-- 사이드배너 -->
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