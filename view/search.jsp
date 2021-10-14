<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/search.css?v=3"><!-- url기준 -->
<title>검색결과</title>
</head>
<body>
<%@ include file="../header.jsp" %>  <!-- ../ 는 현재위치에서 한단계 위 상위폴더 -->
	<section>
		<h3>검색결과</h3>
		<hr>
		<div style="margin:auto;">
			<c:set var="pno" value="${pageDto.currentPage}"/>
			<c:if test="${param.searchOption == 'subject'}">
				<ul	class="s-main search-sbj">
					<li>
						<ul  class="row">
							<li>번호</li>
							<li>카테고리</li>
							<li>제목</li>
							<li>작성자</li>
						</ul>
					</li>
				 	<c:forEach var="sbj" items="${slist}"> 
						<li>
							<ul  class="row">
								<li>${sbj.idx }</li>
								<li>${sbj.categoryIdx }</li>
								<li>
									<a href="detail.do?idx=${sbj.idx}&page=${pno}" class="title">${sbj.subject }</a>
							 	</li>
								<li>${sbj.userId }</li>
							</ul>
						</li>
				 	</c:forEach>
				</ul>
			</c:if>
			<c:if test="${param.searchOption == 'userId'}">
				<ul class="s-main search-id">
					<li>
						<ul class="row">
							<li>번호</li>
							<li>카테고리</li>
							<li>제목</li>
							<li>작성자</li>
						</ul>
					</li>
				 	<c:forEach var="cont" items="${dlist}"> 
						<li>
							<ul  class="row">
								<li>${cont.idx }</li>
								<li>${cont.categoryIdx }</li>
								<li>
									<a href="detail.do?idx=${cont.idx}&page=${pno}" class="title">${cont.subject }</a>
							 	</li>
								<li>${cont.userId }</li>
							</ul>
						</li>
				 	</c:forEach>
				</ul>
			</c:if>
			<c:if test="${param.searchOption == 'content'}">
				<ul class="s-main search-cont">
					<li>
						<ul class="row">
							<li>번호</li>
							<li>카테고리</li>
							<li>제목</li>
							<li>작성자</li>
						</ul>
					</li>
				 	<c:forEach var="cont" items="${clist}"> 
						<li>
							<ul  class="row">
								<li>${cont.idx }</li>
								<li>${cont.categoryIdx }</li>
								<li>
									<a href="detail.do?idx=${cont.idx}&page=${pno}" class="title">${cont.subject }</a>
							 	</li>
								<li>${cont.userId }</li>
							</ul>
						</li>
				 	</c:forEach>
				</ul>
			</c:if>
			<div style="margin:auto;">
			 	Go!<a class="button" href="insert.do">글쓰기</a>&nbsp;&nbsp;
			 	<a class="button" href="${pageContext.request.contextPath }">홈 : ${pageContext.request.contextPath }
			 	</a>&nbsp;&nbsp;&nbsp;작성글 총 개수 : ${pageDto.totalCount }
			</div>
			<!-- 글목록 페이지 처리 : pagination -->
			<div style="text-align: center;">
				<hr>
				<!--  href="listAction.jsp?page=1"  요청 url 현재와 같을때 생략하고 ? 뒤에 파라미터값만 변경합니다. -->
				<c:if test="${pageDto.startPage !=1 }">
					<a class="pagenum" href="?page=1">&lt;&lt;</a>
					<a class="pagenum" href="?page=${pageDto.startPage-1}">&lt;</a>  
					<!-- 현재페이지를 startPage값에서 -1 로 변경하면 요청이 변경되면서 자동계산. -->
				</c:if>
				
				<c:forEach var="i" begin="${pageDto.startPage }" end="${pageDto.endPage }">
					<a class="pagenum  
						<c:if test="${pageDto.currentPage == i }">current</c:if>
					" href="?page=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${pageDto.endPage !=pageDto.totalPage }">
					<a class="pagenum" href="?page=${pageDto.endPage+1}">&gt;</a> 
				 	<!-- 현재페이지를 endPage값에서 +1 로 변경하면 요청이 변경되면서 자동계산. -->
				 
					<a class="pagenum" href="?page=${pageDto.totalPage }">&gt;&gt;</a>  <!-- 마지막페이지  -->
				</c:if>
			</div>	
		</div>
	</section>
<%@ include file="../bottom.jsp" %>
</body>
</html>
