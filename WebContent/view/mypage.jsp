<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css?v=3"></link>


<title>Mypage</title>

</head>
<body>
<%@ include file="../header.jsp"%>

	<div class="mypage">
		<div class="mywriting mycont">
			<h3>내가 작성한 글 목록</h3>
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
		<div class="myreply mycont">
		<h3>내가 답변한 글 목록</h3>
			<ul>
				<c:forEach var="cm" items="${clist}"> 
					<li>
						<ul class="row">
							<li>${cm.idx }</li>
							<li><a href="detail.do?idx=${cm.writingIdx}&page=${pno}" class="title">${cm.content }</a></li>
							<li>${cm.userId }
						 	</li>	
						</ul>
					</li>
			 	</c:forEach>
			 </ul>
		</div>
		<div class="myjjim mycont">
			<h3>내가 찜한 상품 목록</h3>
			<ul>
				<c:forEach var="jj" items="${jlist}"> 
					<li>
						<ul class="row">
							<LI>${jj.categoryIdx }</LI>
							<li>${jj.userId }</li>
							<li><a href="detail.do?idx=${jj.wrtingIdx}&page=${pno}" class="title">제목</a>
						 	</li>
						</ul>
					</li>
			 	</c:forEach>
		 	</ul>
		</div>
	</div>
<%@ include file="../bottom.jsp"%>
</body>
</html>