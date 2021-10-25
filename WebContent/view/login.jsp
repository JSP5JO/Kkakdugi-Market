<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="js/login.js" defer></script>
<link rel="stylesheet" type="text/css" href="./css/login.css?v=3">
</head>
<body>
	<!-- 기본 로그인 form 태그 -->
 <form action="signIn.do" method="post" class="loginForm">
      <h2>로그인</h2>
      <div class="idForm">
        <input type="text" name="id" class="id" placeholder="아이디" required>
      </div>
      <div class="passForm">
        <input type="password" name="pw" class="pw" placeholder="비밀번호" required>
      </div>
      <input type="submit" class="btn" value="로그인">
      <div class="bottomText">
       <a href="regist.do" >회원 가입</a>  |  <a href='javascript:void(0);' onclick="findId()" >아이디 찾기</a>  |  
       <a href='javascript:void(0);' onclick="findPw()" >비밀번호 찾기</a>
      </div>
	      <!-- 카카오 로그인 -->
	  <div class="kakaoLogo">
	      <a href="https://kauth.kakao.com/oauth/authorize?client_id=d2b3ba824e744e5c470824907863b20b&redirect_uri=http://localhost:8087/backup/kakaoLogin.do&response_type=code">
	      <img src="./img/login_btn_ka.png" alt="카카오톡" >
	      </a>
	  </div>
	      <!-- <a href="logout.do">로그아웃</a> -->
    </form>
</body>
</html>