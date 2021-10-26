<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/content.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css">
<title>Mypage</title>

</head>
<body>
<%@ include file="../header.jsp"%>
	<div class="mypage">
		<p><span><i class="far fa-user"></i>&nbsp;<strong>${user.name}(${user.email})</strong> 님의 Mypage</span><span class="pronum"><strong>나의 전문가번호</strong> : <c:forEach var="pr" items="${ulist}">${pr.proIdx}(${pr.name})</c:forEach></span></p>
		<div class="mlist_con">
			<div class="mywriting mycont">
				<h3>내가 작성한 글 목록</h3>
				<div class="mycont-div">
					<ul>
						<c:forEach var="vo" items="${wlist}"> 
							<li>
								<ul class="row">
									<li>${vo.idx }</li>
									<li><a href="detail.do?idx=${vo.idx}&page=${pno}" class="title">${vo.subject }</a>
								 	</li>
								</ul>
							</li>
					 	</c:forEach>
					 	
				 	</ul>
			 	</div>
		 	</div>
			<div class="myreply mycont">
				<h3>내가 답변한 글 목록</h3>
				<div class="mycont-div">
					<ul>
						<c:forEach var="cm" items="${clist}"> 
							<li>
								<ul class="row">
									<li>${cm.idx }</li>
									<li><a href="detail.do?idx=${cm.writingIdx}&page=${pno}" class="title">${cm.content }</a></li>
								</ul>
							</li>
					 	</c:forEach>
					 </ul>
				</div>
			</div>
			<div class="myjjim mycont">
				<h3>내가 찜한 상품 목록</h3>
				<div class="mycont-div">
					<ul>
						<c:forEach var="jj" items="${jlist}"> 
							<li>
								<ul class="row">
									<li>${jj.idx}
								 	</li>
									<li><a href="detail.do?idx=${jj.idx}&page=${pno}" class="title">${jj.subject}</a>
								 	</li>
								</ul>
							</li>
					 	</c:forEach>
				 	</ul>
				 </div>
			</div>
			<div class="myhelp mycont">
				<h3>나의 1:1 의견 목록</h3>
				<div class="mycont-div">
					<ul>
						<c:forEach var="hp" items="${hlist}"> 
							<li>
								<ul class="row">
									<li>
										${hp.idx}
								 	</li>
									<li>
										<a href="detail.do?idx=${hp.idx}&page=${pno}" class="title">${hp.subject}</a>
								 	</li>
								</ul>
							</li>
					 	</c:forEach>
				 	</ul>
			 	</div>
			</div>
		</div>
	</div>
<%@ include file="../bottom.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/mypage.js"></script>
</body>
</html>