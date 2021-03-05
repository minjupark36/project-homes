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
	 
	 i{
	 	margin-left:5px;
	 }
	 
	 .todays {
	 	text-align: center;
	 	margin-top: 2rem;
	 	font-weight: bold;
	 }
	 
	 .notice {
	 	text-align: center;
	 	font-size: 1rem;
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
		width:1200px;
		padding-top: 20px;
		padding-left: 20px;
		border: whitesmoke 1px solid;
		box-shadow: whitesmoke 3px 3px;
		border-radius: 10px; 
		margin-bottom: 20px;
	}
	

</style>
<script>

	function addFeedback(){

			$.ajax({ 
				url:'/add/feedback', 
				method:'post',
				data: $("#feedback").serialize(),
				dataType:'text',
				success:function(res){
					if(res.trim()=='true'){
						alert("고객님의 소중한 피드백이 전달되었습니다")
						location.href = "/main"
					}
					else{
						alert("피드백 전송에 실패했습니다")
					}
				},
				error:function(xhr, status, err){
					alert(status+', '+err);
				}
			
			});	
		}
	
	function alert(num){
		if(num==1){
			alert("로그인 후 사용가능한 기능입니다. 로그인하시겠습니까?");
			location.href = "/sign-in";
		}else{
			return false;
		}
		
	}
	
	$(document).ready(function() {
	    $('#content').on('keyup', function() {
	        $('#cnt_letters').html("("+$(this).val().length+" / 100)");
	 
	        if($(this).val().length > 100) {
	            $(this).val($(this).val().substring(0, 100));
	            $('#cnt_letters').html("(100 / 100)");
	        }
	    });
	});
	
</script>	
</head>
<body>

<div class="main-container visual-container"></div>

<div class="main-container">
<h2 class="todays">소중한 후기를 남겨주세요</h2>
<div class="notice"><i class='fas fa-bullhorn' style='font-size:24px'></i> 매주 추첨을 통해 소정의 상품을 드립니다. 당첨자는 공지사항에서 확인하실 수 있습니다.</div><br>
<div>
	<form id="feedback" method="post">
	<input name="writer" type="hidden" value="${sessionScope.user.name}">
	<textarea name="content" id="content" rows="5" style="width: 1200px" placeholder="홈즈를 이용하면서 느낀점을 적어주세요(100자 이내)"></textarea>	
	<c:choose>
		<c:when test="${sessionScope.loginCheck eq true}">
			<button type="button" onclick="addFeedback();" class="btn btn-warning btn-sm" style="margin-bottom: 20px; display: inline;">저장</button>
		</c:when>
		<c:otherwise>
			<button type="button" onclick="alert(1);" class="btn btn-warning btn-sm" style="margin-bottom: 20px; display: inline;">저장</button>
		</c:otherwise>
	</c:choose>
	<div id="cnt_letters">(0 / 100)</div>
	</form>
	
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