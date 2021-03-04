<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.btnList{
		margin-left:35%;
		width:500px
	}
	
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

</head>
<body>
<div class="btn-group btn-group-lg btnList">
  <button type="button" class="btn btn-outline-primary" onclick="location.href='/admin/image'">이미지 관리</button>
  <button type="button" class="btn btn-outline-info" onclick="location.href='/admin/hashtag'">해시태그 관리</button>
</div>
</body>
</html>