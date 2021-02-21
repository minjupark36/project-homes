<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
  	
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
	    margin-bottom: -20px;
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
	.check-section>span{
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
  	
</style>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function() {
	var isCertification = false;
	var key = "";
		
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
		
		var formData = {
				email : email,
				password : password,
				name : name,
				gender: gender 
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
		<input type="text" placeholder="E-Mail" name="email" class="email" id="email" required="required">@ 
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
		<input type="radio" name="gender" value="남성" class="gender">남성 
		<input type="radio" name="gender" value="여성" class="gender">여성<br>
		<div>
			<button type="button" id="btn_login" onclick="signUp();">JOIN</button>
		</div>
	</form>
</section>
</body>
</html>