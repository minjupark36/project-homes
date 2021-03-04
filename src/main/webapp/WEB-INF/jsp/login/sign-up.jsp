<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
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
	    width: 400px;
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
	
	.title {
		margin-top:20px;
	}
	
	.check-section{
		margin-top:10px;
		display:flex;
	}
	.check-section>div{
		margin-left:15px;
		color:red;
	}
	
	.compare {
		width:70%;
	}
	
	.pw-compare, .compare-text {
		font-size: 5px;
		color:red;
	}

	form>input {
	    margin-top: 20px;
	    border:0px;
	    border-bottom: 1px solid #685547;
	}
	
	.gender {
		font-size:5px
	}
	
	.value {
	    width: 100%;
	}
	
	#btn_login {
	    align-items: center;
	    width: 400px;
	    height: 40px;
	    background-color:  #fde982;
	    margin-top: 30px;
	    margin-bottom: 30px;
	    color: #685547;
	    font-size: 1.5rem;
	    font-style: bold;
	    border-color: transparent;
	}
	
	#btn_login:hover{
	    color: #f8f7e6;
	    background-color: #685547;
	}  
	
	.hashtags {
		display:inline;
		border-radius:1em;
		background-color : rgb(253, 249, 169);
		font-size:1em;
		padding:5px 10px 5px 10px;
		margin-bottom:20px;
		border: solid 1px;

		box-sizing: border-box;
	}
	
	.on {
		color :#f8f7e6;
		background-color : #685547;
	}

  	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function() {
	var isCertification = false;
	var key = "";
     
    $(".hashtags").click(function(e){
        var obj = $(e.target);
        obj.toggleClass("on");
        
    });
		
	$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var email = $(".email").val(); // 사용자의 이메일 입력값.

		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			email = email + "@" + $(".domain").val(); // 셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/sendMail',
				dataType : 'text',
				async : "false",
				data : {
					email : email
				},
				success : function(data) {
					console.log(data);
					key = data;
				}
			});
			alert("이메일을 확인하시기 바랍니다.");
			$(".compare").css("display", "block");
			$(".compare-text").css("display", "block");
		}
	});
	
	$(".compare").on("propertychange change keyup paste input", function() {
		if ($(".compare").val() == key) {
			$(".compare-text").text("인증완료!").css("color", "black");
			isCertification = true;
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false;
		}
	});
	
	$("#pwCheck").on("propertychange change keyup paste input", function() {
		if ($("#password").val() == $("#pwCheck").val()) {
			$(".pw-compare").text("사용가능한 비밀번호입니다.").css("display", "block");
		
		} else {
			$(".pw-compare").text("비밀번호가 일치하지 않습니다.").css("display", "block");
			
		}
	});

});

	function signUp(){
		
		var email = $(".email").val();
		email = email + "@" + $(".domain").val()
		
		var password = $('#password').val();
		var name = $('#name').val();		
		var gender = $(":input:radio[name=gender]:checked").val();
		var pwQuestion = $('#pwQuestion').val();
		var pwAnswer = $("#pwAnswer").val();
		var hashtagPreference = new Array();
		var hashtag = new Array();
		var hashtagVal = new Array();
		
		$.each($('.hashtags'),function(item){		
            if($(this).hasClass("on") === true){
            	hashtag.push($(this).text());
  				$("#hashtagPreference").val(hashtag);
        	}                    
            
   		 });
		
		hashtagPreference = $('#hashtagPreference').val();
		
		var formData = {
				email : email,
				password : password,
				name : name,
				gender: gender ,
				pwQuestion : pwQuestion,
				pwAnswer : pwAnswer,
				hashtagPreference : hashtagPreference
		}
		
		console.log(formData);
		
		$.ajax({ 
			url:'/sign-up', 
			method:'post',
			data: formData,
			dataType:'text',
			success:function (res){
				if(res.trim()=='true'){
					alert("회원가입에 성공했습니다.")
					location.href = "/main"
				}else {
					alert("회원가입에 실패했습니다.")
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
<section class="section">
	<h1>JOIN US</h1>
	<h2>회원가입</h2>
	<form action="/sign-up" method="post">
		<div class="title">이메일</div>
		<input type="text" placeholder="E-Mail" name="email" class="email" id="email">@ 
		<select name="domain" class="domain">
			<option value="gmail.com">gmail.com</option>
			<option value="naver.com">naver.com</option>
		</select> 
		<button type="button" class="sendMail">인증</button><br>
		<section class="check-section">
			<input type="text" placeholder="인증번호를 입력해주세요." style="display: none;"class="compare">
			<div class="compare-text" style="display: none"></div>
		</section>
		
		<div class="title">비밀번호</div>
		<input type="password" placeholder="비밀번호를 입력하세요." name="password" class="value" id="password"><br>
		<input type="password" placeholder="비밀번호를 확인해주세요." class="value" id="pwCheck">
		<div class="pw-compare" style="display: none">비밀번호가 일치하지 않습니다.</div><br> 
		
		<div class="title">이름</div>
		<input type="text" placeholder="이름을 입력하세요." name="name" class="value" id="name"><br> 
		
		<div class="title">성별</div>
		<input type="radio" name="gender" value="남성" class="gender" checked>남성 
		<input type="radio" name="gender" value="여성" class="gender">여성<br>
		
		<div class="title">비밀번호 확인 질문</div>
		<select name="pwQuestion" id="pwQuestion" class="value" style="height:30px;margin-top:10px">
			<option value="1">자신의 인생 좌우명은?</option>
			<option value="2">가장 친한 친구이름은?</option>
			<option value="3">자신이 두번째로 존경하는 인물은?</option>
			<option value="4">자신의 보물 1호는?</option>
			<option value="5">가장 기억에 남는 선생님 성함은?</option>
		</select> <br>
		<input type="text" id="pwAnswer" name="pwAnswer" placeholder="답변을 입력해주세요" class="value">
				
		<div class="title">평소에 관심있는 인테리어 컨셉을 선택하세요.</div>	<br>
		<input type="hidden" name="hashtagPreference" id="hashtagPreference" value="all">
		<div class="hashtags-container">
			<div class="hashtags">빈티지</div>
			<div class="hashtags">화이트</div>
			<div class="hashtags">우드</div>
			<div class="hashtags">키덜트</div>
			<div class="hashtags">레트로</div><br><br>
			<div class="hashtags">하이틴</div>
			<div class="hashtags">홈카페</div>
			<div class="hashtags">라탄</div>
			<div class="hashtags">홈캉스</div>
			<div class="hashtags">복층</div>
			<div class="hashtags">원룸</div>
		</div>
		
		<div class="title">평소에 관심있는 인테리어 소품을 선택하세요.</div>	<br>
		<div class="hashtags-container">
			<div class="hashtags">조명</div>
			<div class="hashtags">포스터</div>
			<div class="hashtags">액자</div>
			<div class="hashtags">러그</div>
			<div class="hashtags">오브제</div>
			<div class="hashtags">쿠션</div><br><br>
			<div class="hashtags">쇼파</div>
			<div class="hashtags">테이블</div>
			<div class="hashtags">캔들</div>
			<div class="hashtags">화분</div>
			<div class="hashtags">벽난로</div>
			<div class="hashtags">커튼</div>
		</div>

		<div>
			<button type="button" id="btn_login" onclick="signUp();">JOIN</button>
		</div>
	</form>
</section>
</body>
</html>