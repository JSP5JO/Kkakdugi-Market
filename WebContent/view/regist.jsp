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
			<input type="text" name="name" placeholder="이름을 입력해주세요." required>
			<input type="text" name="id" placeholder="id를 입력해주세요." required>
			<input type="password" name="pw" placeholder="비밀번호를 입력해주세요." required>
			<input type="text" name="email" placeholder="email을 입력해주세요." required>
			
			<input type="submit" value="회원가입">
			<input type="reset" value="초기화">
		</form>
		<div>이미 계정이 있으신가요?<a href="login.do">로그인</a></div>
	</div>
</body>
</html>