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
    margin-top: 100px;
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
	}
	.value{
	    width: 100%;
	}
	
	
  	
</style>
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
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
				url : '/sendMail',
				dataType : 'text',
				async : "false",
				data : {
					mail : mail
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

});
</script>

</head>
<body>
<section class="section">
		<h1>회원 가입</h1>
		<form action="/sendMail" method="POST">
			<input type="text" placeholder="ID" name="id" class="value"><br>
			<input type="password" placeholder="비밀번호" name="pw" class="value"><br>
			<input type="password" placeholder="비밀번호 확인" name="pwCheck"
				class="value"><br> <input type="text" placeholder="이름"
				name="name" class="value"><br> <input type="text"
				placeholder="E-Mail" name="mail" class="mail">@ <select
				name="domain" class="domain">
				<option value="gmail.com">gmail.com</option>
				<option value="naver.com">naver.com</option>
			</select> <input type="button" value="인증" class="sendMail"> <br>
			<section class="check-section">
				<input type="text" placeholder="인증 키 입력" style="display: none;"
					class="compare"><span class="compare-text" style="display: none">불일치</span>
			</section>
			<input type="radio" name="sex" value="남성" checked>남성 
			<input type="radio" name="sex" value="여성">여성 <br> 
			<input type="submit" value="가입"> 
			<input type="reset" value="취소">
		</form>
	</section>
</body>
</html>