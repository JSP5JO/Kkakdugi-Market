<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css?v=3">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css?v=3">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="${pageContext.request.contextPath}/main.js" defer></script>
<script src="https://kit.fontawesome.com/a9b46edd75.js" crossorigin="anonymous"></script>
<header>
	<!-- 메인 로고 -->
	<nav class="navbar">
		<ul class="navbar__logo">
			<!-- <li><i class="fab fa-apple"></i></li> -->
			<li><img src="/Kkakdugi-Market/img/logo.png" alt="logo" width="30px"></li>
			<li><a href="index.do">Kkakdugi-Market</a></li>
		</ul>

		<!-- 네비게이션 항목 -->
		<ul class="navbar__menu">
			<li><a href="category.do">카테고리</a></li>
			<li><a href="">전문분야 등록</a></li>
			<li><a href="write.do">글쓰기</a></li>
			<li><a href="">고객센터</a></li>

		</ul>

		<!-- 로그인 및 마이페이지 아이콘 -->
		<ul class="navbar__icon">
			<!-- 종합 검색 -->
			<li>
				<form action="${pageContext.request.contextPath}/view/search.do" method="get">
					<select id="searchOption" name="searchOption">
						<option value="subject" selected>제목</option>
		       			<option value="userId">작성자</option>
						<option value="content">내용</option>
				    </select>
					<input id="testbox" type="text" name="subject">
					<input type="submit" value="검색">
				</form>
			</li>
			<c:if test="${sessionScope.user == null}">
				<li><a href="login.do"><i class="fas fa-sign-in-alt"></i></a></li>
			</c:if>
			<c:if test="${sessionScope.user != null}">
				<!-- 로그인 상태 -->
				<li>${user.name}(${user.email})님
				<li>
				<li id="mypage"><a href="mypage.do">마이페이지</a></li>
				<li><a href="logout.do"><i class="fas fa-sign-out-alt"></i></a></li>
			</c:if>
		</ul>

		<!-- 반응형 햄버거 로고 -->
		<a href="javascript:void(0)" class="navbar__hamburger"> <i class="fas fa-bars"></i>
		</a>
	</nav>
</header>
