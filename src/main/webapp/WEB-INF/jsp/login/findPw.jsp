<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/static/css/main.css" rel="stylesheet" type="text/css">
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
	    margin-bottom: 10px;
	    color: #685547;
	    font-size: 1.5rem;
	    font-style: bold;
	    border-color: transparent;
	}
	
	#btn_login:hover{
	    color: #f8f7e6;
	    background-color: #685547;
	}
	
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script src='https://code.jquery.com/jquery-3.5.1.min.js'></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function findPw() { 
		
		var email = $("#email").val();
		var pwQuestion = $('#pwQuestion').val();
		var pwAnswer = $("#pwAnswer").val();
		
		var formData = {
				email : email,
				pwQuestion : pwQuestion,
				pwAnswer : pwAnswer
		}
		
		$.ajax({ 
			url:'/findPw', 
			method:'post',
			data: formData,
			dataType:'text',
			success:function (res){
				if(res.trim()=='true'){
					alert("비밀번호를 이메일로 전송해드렸습니다. 이메일을 확인해주세요.");
					location.href="/sign-in";
				}else {
					alert("이메일 전송에 실패했습니다.")
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
	<h1>FIND PW</h1>
	<h2>비밀번호 찾기</h2>
	<form id="login-form">
		<div class="title">가입당시 이메일을 입력해주세요.</div>
		<input type="text" placeholder="E-Mail" name="email" class="value" id="email" required="required">
		
		<div class="title">비밀번호 확인 질문</div>
		<select name="pwQuestion" id="pwQuestion" class="value" style="height:30px;margin-top:10px">
			<option value="1">자신의 인생 좌우명은?</option>
			<option value="2">가장 친한 친구이름은?</option>
			<option value="3">자신이 두번째로 존경하는 인물은?</option>
			<option value="4">자신의 보물 1호는?</option>
			<option value="5">가장 기억에 남는 선생님 성함은?</option>
		</select> <br>
		<input type="text" id="pwAnswer" name="pwAnswer" placeholder="답변을 입력해주세요" class="value">
			<div>
			<button type="button" id="btn_login" onclick="findPw();">SEND EMAIL</button>
		</div>
	
	</form>	
</section>
</body>
</html>