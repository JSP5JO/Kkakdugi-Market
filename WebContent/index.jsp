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
			<ol>
				<c:forEach var="vo" items="${hotList}">
					<li>
						<p>
							<a href="detail.do?idx=${vo.idx}&page=1">${vo.subject}(${vo.readCount})</a>
						</p>
					</li>
				</c:forEach>
			</ol>
		</div>

		<div>
			<h3>내 전문분야의 글</h3>
			<c:if test="${sessionScope.user != null}">
				<ol>
					<c:forEach var="vo" items="${myFieldList}">
						<li>
							<p>
								<a href="detail.do?page=1&idx=${vo.idx}">${vo.subject}</a>
							</p>
						</li>
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
						<li>
							<p>
								<a href="#">${vo.subject}</a>
							</p>
						</li>
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