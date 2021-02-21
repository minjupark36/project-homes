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
		
	.container.main-login{	
	    margin-top: 100px;  
	    text-align: center;
	}
	
	.container.main-login > h1 {
	    font-size: 4.0rem;
	    color: #685547;
	}
	
	.container.main-login > h2 {
	    font-size: 2.0rem;
	    margin-top: 20px;
	    color: #685547;
	}
	
	#user_id_login {
	    height: 30px;
	    width: 400px;
	    margin-top: 80px;
	    font-size: 1.5rem;
	    border: 0px;
	    border-bottom: 1px solid black;
	    background-color: transparent;
	}
	
	#user_pw_login {
	    
	    height: 30px;
	    width: 400px;
	    margin-top: 20px;
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

</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<script>	

	function login() {			
		$("#login-form").submit();			
	}	
	
	</script>
</head>
<body>

<div id="main">
<div class="container main-login">
	<h1>Login</h1>
	<h2>로그인</h2>
	<form id="login-form">
		<input type="email" name="email" id="user_id_login" size="40" placeholder="이메일 아이디" required><br>
		<input type="password" name="password" id="user_pw_login" size="40" placeholder="비밀번호" required><br>
		<div class="warning"></div>
		<div>
			<button type="button" id="btn_login">LOGIN</button>
		</div>
	
	</form>
</div>
</div>
</body>
</html>