<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Kkakdigu-Market__nav</title>

</head>

<body>
	<!-- header -->
	<%@ include file="header.jsp"%>

	<!-- 본문 content -->
	<section class="main">
		<div>
			<h3>실시간 인기 상품</h3>
			<p>이곳에 리스트(hotList)를 삽입</p>
			<ul>
				<c:forEach var="vo" items="${hotList}">
					<li><a href="detail.do">${hotList.subject}</a></li>
				</c:forEach>
			</ul>
		</div>

		<div>
			<h3>내 전문분야의 글</h3>
			<c:if test="${sessionScope.user != null}">
				<ol>
					<c:forEach var="vo" items="${myFieldList}">
						<li><a href="detail.do?idx=${vo.idx}">${vo.subject}</a></li>
					</c:forEach>
				</ol>
			</c:if>
				<!-- 비 로그인 상태 -->
			<c:if test="${sessionScope.user == null}">
				<p>로그인 후에 이용 가능 합니다.</p>
			</c:if>
		</div>

		<div>
			<h3>찜한 상품</h3>
			<!-- 로그인 상태 -->
			<c:if test="${sessionScope.user != null}">
				<ol>
					<c:forEach var="vo" items="${jjimWritingList}">
						<li><a href="#">${vo.subject}</a></li>
					</c:forEach>
				</ol>
			</c:if>
			<!-- 비 로그인 상태 -->
			<c:if test="${sessionScope.user == null}">
				<p>로그인 후에 이용 가능 합니다.</p>
			</c:if>
		</div>
	</section>

	<!-- bottom -->
	<%@ include file="bottom.jsp"%>
</body>
</html>