<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="css/regist.css?v=3">
<script type="text/javascript" src="js/regist.js"></script>
</head>
<body> <!-- email 형식 (직접입력),select로 목록 보여주기 -->
<form action="registSave.do" method="POST" class="joinForm" onsubmit="return regist_check()"> <!-- submit했을때 PW 일치하는지 체크 -->
      <h2>회원가입</h2>
      <input type="hidden" name="kakaoId" value="${kakaoId}" />
      <div class="textForm">
        <input name="id" type="text" class="id" placeholder="아이디" id="id" value="${id}" onclick = "idCheck()" required readonly>
      </div>
      <div class="textForm">
      	<div class = "sText">비밀번호는 영문자+숫자+특수문자 조합 8~16자로 사용해야 합니다.</div>
        <input name="pw" type="password" class="pw" placeholder="비밀번호" id="pw1" required>
      </div>
       <div class="textForm">
        <input name="pwCheck" type="password" class="pw" placeholder="비밀번호 확인" id="pw2" required>
      </div>
      <div class="textForm">
        <input name="name" type="text" class="name" placeholder="이름" value="${kakaoName}" required>
      </div>
       <div class="textForm">
        <input name="email" type="email" class="email" id="email" placeholder="이메일"  value="${kakaoEmail}" required >
      </div>
      <input type="submit" class="btn" value="회원가입" />
    	<div>이미 계정이 있으신가요? <a href="login.do" style="color: grey;">로그인</a></div>
    </form>

</body>
</html>

