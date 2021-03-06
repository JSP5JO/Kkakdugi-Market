<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Kkakdigu-Market__nav</title>
<link rel="stylesheet" href="./css/stylesheet.css">
<script src="https://kit.fontawesome.com/a9b46edd75.js"
	crossorigin="anonymous"></script>
<script src="main.js" defer></script>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
</head>

<body>
	<!-- header -->
	<%@ include file="header.jsp"%>

	<!-- 본문 content -->
	<section class="main">
		<div data-aos="fade-up" data-aos-duration="1200">
			<h3>실시간 인기 상품</h3>
			<p>이곳에 리스트(hotList)를 삽입</p>
			<ul>
				<c:forEach var="vo" items="${hotList}">
					<li><a href="#">${hotList.subject}</a></li>
				</c:forEach>
			</ul>
		</div>

		<div data-aos="fade-up" data-aos-duration="1200" data-aos-delay="200">
			<h3>내 전문분야의 질문 글</h3>
			<p>이곳에 리스트(myField)를 삽입</p>
			<c:if test="${sessionScope.user != null}">
				<ul>
					<c:forEach var="vo" items="${myFieldList}">
						<li><a href="#">${myFieldList.subject}</a></li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

		<div data-aos="fade-up" data-aos-duration="1200" data-aos-delay="400">
			<h3>찜한 상품</h3>
			<p>이곳에 리스트(jjimList)를 삽입</p>
			<c:if test="${sessionScope.user != null}">
				<ul>
					<c:forEach var="vo" items="${jjimList}">
						<li><a href="#">${jjimList.subject}</a></li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

	</section>
<script>
  AOS.init();
</script>
</body>
</html>