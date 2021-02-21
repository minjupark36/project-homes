<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	div{
		border:1px solid transparent;		
		}
		
	.container.main-join{	
	    margin-top: 100px;  
	    text-align: center;
	}
	
	.container.main-join > h1 {
	    font-size: 4.0rem;
	    color: #685547;
	}
	
	.container.main-join > h2 {
	    font-size: 2.0rem;
	    margin-top: 20px;
	    color: #685547;
	}

	#user_id_login, #user_name_login {
	    height: 30px;
	    width: 400px;	    
	    font-size: 1.5rem;
	    border: 0px;
	    border-bottom: 1px solid black;
	    background-color: transparent;
	}
	
	#user_pw_login {
	    
	    height: 30px;
	    width: 400px;
	    font-size: 1.5rem;
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
	.join, .find{
	    display: inline;
	    text-align: center;
	}
	.join{
	    margin-right: 195px;
	}
	.join > a, .find > a{
	    font-size: 1.5rem;
	    color: #685547;
	    font-style: bold;    
	}
	
	.join > a:hover, .find > a:hover{
	    border-bottom: 1px solid black;
	}
	
	.join-member > hr {
	    color: #685547;
	}
  	
  	.section{
    width: max-content;
    height: max-content;
    margin: auto;
    /* background-color: red; */
    margin-top: 300px;
	}
	.section>h1{
	    width: max-content;
	    height: max-content;
	    margin-left: auto;
	    margin-right: auto;
	}
	.check-section{
		margin-top:10px;
		display:flex;
	}
	.check-section>span{
		margin-left:15px;
		color:red;
	}
	.compare{
		width:70%;
	}
	form>input{
	    margin-top: 10px;
	    border:0px;
	    border-bottom: 1px solid black;
	}
	.value{
	    width: 100%;
	}
  	
</style>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
$(function() {
	var isCertification = false;
	var key = "";
	$(".sendMail").click(function() {// 메일 입력 유효성 검사
		var mail = $(".mail").val(); // 사용자의 이메일 입력값.

		if (mail == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			mail = mail + "@" + $(".domain").val(); // 셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/Meg/CheckMail',
				dataType : 'json',
				async : "false",
				data : {
					mail : mail
				},
				success : function(data) {
					console.log(data.key);
					key = data.key;
				}
			});
			alert("이메일을 확인하시기 바랍니다.");
			$(".compare").css("display", "block");
			$(".compare-text").css("display", "block");
		}
	});
	
	$(".compare").on("propertychange change keyup paste input", function() {
		if ($(".compare").val() == key) {
			$(".compare-text").text("인증 성공!").css("color", "black");
			isCertification = true;
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false;
		}
	});

});
	
	function checkMail(){
		
		var email = $("#email").val();
		
		if (email == "") {
			alert("메일 주소가 입력되지 않았습니다.");
		} else {
			email = email+"@"+$(".domain").val(); //셀렉트 박스에 @뒤 값들을 더함.
			$.ajax({
				type : 'post',
				url : '/Meg/CheckMail',
				data : {email:email},
				dataType :'json',

			});
			alert("인증번호가 전송되었습니다.") 
			isCertification=true; //추후 인증 여부를 알기위한 값
		}
	}
	
	$(".emailKey").on("propertychange change keyup paste input", function() {
		var currval = $(".emailKey").val()
		if (currval == key) {   //인증 키 값을 비교를 위해 텍스트인풋과 벨류를 비교
			$(".compare-text").text("인증 성공!").css("color", "green");
			isCertification = true;  //인증 성공여부 check
		} else {
			$(".compare-text").text("불일치!").css("color", "red");
			isCertification = false; //인증 실패
		}
	});
	
</script>
</head>
<body>

<div id="main">
<div class="container main-join">
	<h2>JOIN</h2>
	<div class="login-wrap">
	<form method="post" id="join">
		<label for="email">EMAIL</label><br>
		<input type="text" name="email" id="email" required>@
		<select class="domain" name="domain">
			<option value="gmail.com">gmail.com
			<option value="naver.com">naver.com
			<option value="hanmail.net">hanmail.net
		</select>		
		<button type="button" onclick="checkMail();">인증</button><br>	
		<input type="text" name="emailKey" class="emailKey" placeholder="인증번호를 입력하세요" required>	
		<span class="compare-text" style="display: none">불일치</span><br>
		<label for="name">이름</label><br>
		<input type="text" name="name" id="name" required><br>
		<label for="gender">성별</label><br>
		<input type="radio" name="gender" value="남성" checked>남성 
		<input type="radio" name="gender" value="여성">여성 <br> 
		<button type="submit">가입</button>				
	</form>
	</div>
</div>
</div>

</body>
</html>