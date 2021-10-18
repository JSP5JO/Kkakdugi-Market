<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/idCheck.css">
<script type="text/javascript" src="idCheck.js"></script>
</head>
<body>
<div style="text-align: center"> 
<h3>아이디 중복확인</h3> 
<form method="post" action="/backup/idCheck.do" onsubmit="return Check(this)"> <!-- 절대경로 사용 -->
<input type="text" id = "id" name="id" maxlength="16" autofocus placeholder="아이디" value="${id}">
<input type="submit" value="중복확인">

<c:if test="${result == 0}" > <!-- 중복된 아이디가 없을 때 -->
<div style="color:#707ae8; margin-top: 20px;">사용가능한 아이디입니다.
<input type = "button" value = "사용하기" onclick = "apply()">
</div>
</c:if>

<c:if test="${result == 1}" > <!-- 중복된 아이디가 있을 때 -->
<div style="color: red; margin-top: 20px;">사용할 수 없는 아이디입니다.</div>
</c:if>

</form> 
</div> 

</body>
</html>