<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/search.css?v=3"><!-- url기준 -->
<title>검색결과</title>
</head>
<body>
<%@ include file="../header.jsp" %>  <!-- ../ 는 현재위치에서 한단계 위 상위폴더 -->
<section>
		<h3>검색결과</h3>
		<hr>
		<div style="margin:auto;">
			<c:set var="pno" value="${page.currentPage}"/>
			<c:if test="${!list.isEmpty()}">
				<ul	class="s-main search-sbj">
					<li>
						<ul  class="row">
							<li>번호</li>
							<li>카테고리</li>
							<li>제목</li>
							<li>작성자</li>
							<li>날짜</li>
							<li>조회수</li>
						</ul>
					</li>
					
					<!-- searchAction에서 전달 받은 list 출력 불러오기 -->
				 	<c:forEach var="vo" items="${list}"> 
						<li>
							<ul  class="row">
								<li>${vo.idx }</li>
								<li>${vo.name}</li>
								<li>
									<a href="detail.do?idx=${vo.idx}&page=${pno}" class="title">${vo.subject }<span>(${vo.commentCount})</span></a>
							 	</li>
								<li>${vo.userId }</li>
								<li>${vo.wdate}</li>
								<li>${vo.readCount}</li>
							</ul>
						</li>
				 	</c:forEach>
				</ul>
			</c:if>
			<c:if test="${list.isEmpty()}">
				<h4>검색 결과가 없습니다.</h4>
			</c:if>
			<!-- 글목록 페이지 처리 : pagination -->
			<div style="text-align: center;">
				<hr>
				<!--  href="listAction.jsp?page=1"  요청 url 현재와 같을때 생략하고 ? 뒤에 파라미터값만 변경합니다. -->
				<c:if test="${page.startPage !=1 }">
					<a class="pagenum" href="?searchOption=${param.searchOption}&${param.searchOption}=${param.subject}${param.userId}${param.content}&page=1">&lt;&lt;</a>
					<a class="pagenum" href="?searchOption=${param.searchOption}&${param.searchOption}=${param.subject}${param.userId}${param.content}&page=${page.startPage-1}">&lt;</a>  
					<!-- 현재페이지를 startPage값에서 -1 로 변경하면 요청이 변경되면서 자동계산. -->
				</c:if>
				
				<c:forEach var="i" begin="${page.startPage }" end="${page.endPage }">
					<a class="pagenum  
						<c:if test="${page.currentPage == i }">current</c:if>
					" href="?searchOption=${param.searchOption}&${param.searchOption}=${param.subject}${param.userId}${param.content}&page=${i }">${i }</a>
				</c:forEach>
				
				<c:if test="${page.endPage !=page.totalPage }">
					<a class="pagenum" href="?searchOption=${param.searchOption}&${param.searchOption}=${param.subject}${param.userId}${param.content}&page=${page.endPage+1}">&gt;</a> 
				 	<!-- 현재페이지를 endPage값에서 +1 로 변경하면 요청이 변경되면서 자동계산. -->
				 
					<a class="pagenum" href="?searchOption=?searchOption=${param.searchOption}&${param.searchOption}=${param.subject}${param.userId}${param.content}&page=${page.totalPage }">&gt;&gt;</a>  <!-- 마지막페이지  -->
				</c:if>
			</div>	
		</div>
	</section>
<%@ include file="../bottom.jsp" %>
</body>
</html>