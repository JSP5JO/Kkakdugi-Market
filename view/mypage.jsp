<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
</head>
<body>
	<c:forEach var="vo" items="${list}"> 
	<li class="mywriting">
		<ul  class="row">
			<li>${vo.idx }</li>
			<li><a href="detail.do?idx=${vo.idx}&page=${pno}" class="title">${vo.subject }</a>
		 		...<span style="color:orange;font-size: 80%;">(${vo.commentCount })
		 		</span></li>
			<li>${vo.name }</li>
			<li>${vo.readCount }</li>
			<li>
			<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate"/>
			<!-- 오늘 작성한 글은 시간으로 표시 -->
			<c:if test='${wdate == today}'>
			<fmt:formatDate value="${vo.wdate }" type="time"/>
			</c:if>
			<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
			<c:if test='${wdate != today}'>
			<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd"/>
			</c:if>
			</li>
			
		</ul>
	</li>
 	</c:forEach>
	</div>
	<div class="myreply">
	
	</div>
	<div class="myjjim">
	
	</div>
</body>
</html>