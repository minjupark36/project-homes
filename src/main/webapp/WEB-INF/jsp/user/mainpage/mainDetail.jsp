<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css" >
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<style>
	#home-icon {
			width:30px;
			height:30px;
	}
	.tag{
		display:inline
	}
	.deco{display:inline-block;border-radius:30%;width:120px;height:120px}
	.imageDetail{margin:auto;width:500px;height:300px}
	.comments{margin-left:40%;width:500px;height:80px}
	.commentslist{margin-left:40%;width:500px;height:300px}
	.tag{display:inline-block}
	table{border-collapse: separate}
	.next{
		display:inline;
		margin-left:1800px;
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
	  	  bottom: 10px;        
	}
	.count{
		  border-radius: 20px
	}
	.comment:read-only {
	  background-color: white;
	}
	.comment{
		border-radius: 20px
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
	.myScrap:hover{
		 text-decoration: none;
	}
	.content{
		text-align:center
	}
	.Btn{
		text-decoration: none;
		color:black
		
	}
	.delImgBtn{
		margin-left:1600px;
	}
	.Button{
		border-radius:30px
	}
	.userName{
		font-weight:bolder
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
<script>
	function nextDetail(id,page){
		$.ajax({
			url:'/main/detail',
			method:'post',
			data:{'id': id,
					'page':page},    
			dataType:'text',
			success:function(res){
				location.href="/main/detail?id="+res;
			},
			error:function(xhr, status, err){
				
					alert("다음 게시물이 없습니다");
					window.location.reload();
			}
		});   
		
	}
	function preDetail(id,page){
		$.ajax({
			url:'/main/detail',
			method:'post',
			data:{'id': id,
					'page':page},    
			dataType:'text',
			success:function(res){
				location.href="/main/detail?id="+res;
			},
			error:function(xhr, status, err){
				
					alert("이전 게시물이 없습니다");
					window.location.reload();
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
	
	  $(document).ready(function () {
	
		    $('.bxslider').bxSlider({ // 클래스명 주의!
	
		        auto: true, // 자동으로 애니메이션 시작
	
		        speed: 1000,  // 애니메이션 속도
	
		        pause: 2000,  // 애니메이션 유지 시간 (1000은 1초)
	
		        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
	
		        autoControls: true, // 시작 및 중지버튼 보여짐
	
		        pager: true, // 페이지 표시 보여짐
	
		        captions: true, // 이미지 위에 텍스트를 넣을 수 있음
		        maxSlides: 5,
		        minSlides:5,
		        slideWidth: 120,
		        touchEnabled : (navigator.maxTouchPoints > 0),
		        slideMargin : 10,
		        pagerType:'short'
		    });
	
		});
	  
	  function deleteComment(id){
		  
		  $.ajax({
				url:'/comment/delete',
				method:'delete',
				data:{'id':id},    
				dataType:'text',
				success:function(res){
					if(confirm("댓글을 삭제하시겠습니까?")){
						alert("삭제되었습니다")
						location.reload();
					} 	
				},
				error:function(xhr, status, err){		
				}
			});   
	  }
	  function editForm(index){
		  document.getElementById("content"+index).readOnly = false;
		  $("#editedbtn"+index).removeAttr("style");
		  document.getElementById("editbtn"+index).style.display="none";
		  
		  
	  }
	  function editComment(index){
		  console.log(index);
		  $.ajax({
				url:'/comment/edit',
				method:'post',
				data : {
					'id' : $("#id"+index).val(),
					'content' : $("#content"+index).val()			
				},   
				dataType:'text',
				success:function(res){
					alert("수정이 완료되었습니다");
					location.reload();
				},
				error:function(xhr, status, err){		
				}
			});   
	  }
	  
	  function replyForm(index){
		  $("#replytd"+index).removeAttr("style");
			
		  
	  }
		
	  
	  function replyComment(index){
		  $.ajax({
				url:'/comment/reply',
				method:'post',
				data : {
					'groupNo' : $("#groupNo"+index).val(),
					'content' : $("#reply"+index).val(),
					'imageId' : $("#imageId").val(),
					'groupOrder':$("#groupOrder"+index).val(),
					'depth':$("#depth"+index).val(),
				},   
				dataType:'text',
				success:function(res){
					location.reload();
				},
				error:function(xhr, status, err){		
				}
			});   
	  }
	  
	  function login(){
		  alert("로그인이 필요한 서비스입니다");
		  location.href="/sign-in";
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
<c:choose>
<c:when test="${sessionScope.user.role eq 'ADMIN'}">
<div>
<button onclick="deleteInteriorImage(${interior.id})" class="delImgBtn btn btn-outline-secondary">사진 삭제</button>
</div>
</c:when>
</c:choose>	
<form>
	
	<c:set var="interior" value="${interiorImage}"></c:set>		
	<table class="imageDetail">
		<tr><%--인테리어사진 --%>
			<td><img src="${interior.filepath}" class="interior"></td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
			<%--소품사진 / 사진 클릭 시 구매 사이트로--%>	
				
					<ul class="bxslider">	
					<c:forEach var="deco" items="${decoImage}">	
					<a href="${deco.url}"><img class="deco" src="${deco.filepath}"></a>
					</c:forEach>
					</ul>		
			</td>
		</tr>
		<tr><td></td></tr>
		<tr><td></td></tr>
		<tr>
			<td>
				<%--이미지 관련 태그 --%>
				<%--클릭하면 관려 태그 포함된 사진 리스트 가지고 메인으로 --%>
				<c:forEach var="hashtagsNames" items="${tagList}">
					<div class="tag">
						<button type="button" class="btn btn-outline-secondary Button" onclick="location.href='/main/tag?hashtagsNames=${hashtagsNames}'">#${hashtagsNames}</button>
						
					</div>		
				</c:forEach>
			</td>
		</tr>
	</table>
</form>
<div class="content">${interior.content}</div>
	<form action="/comment/insert" method="post">
	<input type="hidden" value="${interior.id}" name="imageId" id="imageId">
	<input type="hidden" value="${sessionScope.user.id}" name="membersId">
		<table class="comments">
			<tr>
			<c:choose>
				<c:when test="${sessionScope.loginCheck eq true}">
				<td><input type="text" name="content" id="content" class="form-control"></td><td><button type="submit" class="btn btn-outline-secondary">댓글 등록</button></td>
				</c:when>
				<c:otherwise>
				<td><input type="text" name="content" id="content" class="form-control"></td><td><button type="button" onclick="login()" class="btn btn-outline-secondary">댓글 등록</button></td>
				</c:otherwise>
			</c:choose>
			</tr>
		</table>
	</form>
	<form action="/comment/reply" method="post">
		<table class="commentslist">
			<tr><td><button type="button" class="btn btn-outline-secondary count">댓글${countComment}</button></td></tr>
			<c:forEach var="comment" items="${commentsList}" varStatus="status">
			<input type="hidden" value="${comment.groupNo}" name="groupNo" id="groupNo${status.index}">
			<input type="hidden" value="${comment.groupOrder}" name="groupOrder" id="groupOrder${status.index}">
			<input type="hidden" value="${comment.depth}" name="depth" id="depth${status.index}">
			<input type="hidden" value="${comment.id}" name="id" id="id${status.index}">
			
				<tr>
				<td class="userName">${comment.memberDto.name}</td>
				<td><input type="text" value="${comment.content}" name="content" id="content${status.index}" class="form-control comment" readonly ></td>
				<td><a href="javascript:deleteComment(${comment.id});"><i class="material-icons" style="color:black">delete</i></a></td>
				<td><a href="javascript:editForm(${status.index});" id="editbtn${status.index}"><i class="material-icons" style="color:black">edit</i></a></td>
				<td><a href="javascript:replyForm(${status.index})" id="${status.index}"><i class="fa fa-paper-plane" style="color:black"></i></a></td>
				</tr>
				<tr class="com">	
					<td><button style="display: none" class="btn btn-outline-secondary Button" type="button" onclick="editComment(${status.index});" id="editedbtn${status.index}">수정완료</button></td>
					<td id="replytd${status.index}" style="display: none"><input type="text" name="reply" id="reply${status.index}">
					<button type="button" class="btn btn-outline-secondary" onclick="replyComment(${status.index})">답글 작성완료</button></td>
				</tr>		
			</c:forEach>
			
		</table>
	</form>
</div>
<a id="TopButton" class="ScrollButton"><i class="material-icons" style="font-size:50px">vertical_align_top</i></a>
<div class="sideBanner">
	<ul class="navbar-nav">
		<li class="nav-item active"><a href="/user/scrap" class="Btn myScrap">My Scrap</a></li>
		<li><br></li>
		<li class="nav-item active"><a href="javascript:addScrap(${interior.id});" class="Btn"><i class='far fa-bookmark' style='font-size:36px'></i></a> ${interior.scrap}</li>
		<li><br></li>
		<li class="nav-item active"><i class='far fa-eye' style='font-size:36px'></i> ${interior.view}</li>
		<li><br></li>
		<li class="nav-item active"><a href="javascript:fnMove();" class="Btn"><i class='far fa-comment-dots' style='font-size:36px'></i></a> ${countComment}</li>
		<li><br></li>
		<li class="nav-item active"><a href="javascript:preDetail(${interior.id},1);" class="Btn"><i class="material-icons" style="font-size:36px">skip_previous</i></a> PRE</li>
		<li><br></li>
		<li class="nav-item active"><a href="javascript:nextDetail(${interior.id},2);" class="Btn"><i class="material-icons" style="font-size:36px">skip_next</i></a> NEXT</li>
	</ul>
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
	
	function fnMove(){
        var offset = $(".comments").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
	
	function addScrap(id){
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
	function deleteInteriorImage(id){
		$.ajax({ 
			url:'/admin/image/delete', 
			method:'delete',
			data: {'id':id },
			dataType:'text',
			success:function(res){
				if(confirm("사진을 삭제하시겠습니까?")){
					alert("삭제되었습니다")
					location.href="/main";
				} 
			},
			error:function(xhr, status, err){
				alert(status+', '+err);
			}
		
		});	
		
	}

</script>
</html>