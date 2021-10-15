<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="css/header.css?v=3">
<link rel="stylesheet" href="css/content.css?v=3">

<script src="https://kit.fontawesome.com/a9b46edd75.js" crossorigin="anonymous"></script>

<script src="main.js" defer></script>
<header>
	<!-- 메인 로고 -->
	<nav class="navbar">
		<ul class="navbar__logo">
			<li><img src="img/logo.png" alt="logo" width="30px"></li>
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
				<form action="search.do" method="get">
					<select id="searchOption" name="searchOption">
						<option value="subject" selected>제목</option>
		       			<option value="userId">작성자</option>
						<option value="content">내용</option>
						<!--<c:if test="${map.search_option == 'user_id'}">selected</c:if>
						   >작성자</option>
						
						        <option value="title" 
						<c:if test="${map.search_option == 'title'}">selected</c:if>
						        >제목</option>
						
						        <option value="content" 
						<c:if test="${map.search_option == 'content'}">selected</c:if>
						        >내용</option>-->
				    </select>
					<input id="subject" type="text" name="subject">
					<input id="userId" type="text" name="userId" style="display:none;">
					<input id="content" type="text" name="content" style="display:none;">
					<button type="submit" class="search_button"><i class="fas fa-search"></i></button>
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
		<a href="#" class="navbar__hamburger"> <i class="fas fa-bars"></i>
		</a>
	</nav>
</header>
<script>
	$("#searchOption").on('change',function(){
		let state = $("#searchOption option:selected").val();
		if(state == "subject"){
			$("#subject").css("display","block");
			$("#userId").css("display","none");
			$("#content").css("display","none");
		}else if(state == "userId"){
			$("#subject").css("display","none");
			$("#userId").css("display","block");
			$("#content").css("display","none");
		}else if(state == "content"){
			$("#subject").css("display","none");
			$("#userId").css("display","none");
			$("#content").css("display","block");
		}	
	});
</script>