<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>카테고리 전체보기</title>


<!-- css -->
<link rel="stylesheet" type="text/css" href="/css/board.css" />

</head>

<body>

<ul class="table-header">
		<li>번호</li>
		<li>제목</li>
		<li>사용자</li>
		<li>조회수</li>
		<li>작성일</li>
	</ul>
	<c:forEach var="vo" items="${Categorylist}">
		<ul class="table-body row">
			<li>${vo.idx }</li>
			<li><a href="Categorylist.do?idx=${vo.idx}&page=${pno}" class="title">${vo.subject }</a>
				<span style="color: orange; font-size: 80%;">(${vo.commentCount })
			</span></li>
			<li>${vo.userId }</li>
			<li>${vo.readCount }</li>
		</ul>
	</c:forEach>


	 <fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" var="wdate" />
	 
	<c:if test='${wdate == today}'>
		<fmt:formatDate value="${vo.wdate }" type="time" />
	</c:if>
	<!-- 오늘 이전에 작성한 글은 날짜로 표시 -->
	<c:if test='${wdate != today}'>
		<fmt:formatDate value="${vo.wdate }" pattern="yyyy-MM-dd" />
	</c:if>
	
	<div style="margin: auto;">
		 </a>&nbsp;&nbsp;&nbsp; 작성글 총 개수 : ${pageDto.totalCount }
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

		<c:forEach var="i" begin="${pageDto.startPage }"
			end="${pageDto.endPage }">
			<a
				class="pagenum  
			<c:if test="${pageDto.currentPage == i }">current</c:if>
		"
				href="?page=${i }">${i }</a>
		</c:forEach>

		<c:if test="${pageDto.endPage !=pageDto.totalPage }">
			<a class="pagenum" href="?page=${pageDto.endPage+1}">&gt;</a>
			<!-- 현재페이지를 endPage값에서 +1 로 변경하면 요청이 변경되면서 자동계산. -->

			<a class="pagenum" href="?page=${pageDto.totalPage }">&gt;&gt;</a>
			<!-- 마지막페이지  -->
		</c:if>
	</div>

	</div>
	</section> 
	

	
</body>
</html>
