<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<div>
		<form action="registSave.do" method="post">
			<input type="text" name="name">
			<input type="text" name="id">
			<input type="password" name="pw">
			<input type="text" name="email">
			
			<input type="submit" value="회원가입">
			<input type="reset" value="초기화">
		</form>
		<div>이미 계정이 있으신가요?<a href="login.do">로그인</a></div>
	</div>
</body>
</html>