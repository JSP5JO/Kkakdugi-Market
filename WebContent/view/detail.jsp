<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
<style type="text/css">
pre{
	white-space: pre-wrap;	
}
li {
	list-style: none;
}
p {
	text-align: right;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>

		<h3>글 목록</h3>
		<hr>
		<div style="width: 80%; margin: auto; max-width: 700px;">
			<ul id="main">
				<li>
						<h3>카테고리: ${bean.name}</h3>
						<p>
						<time>작성날짜 : <fmt:formatDate value="${bean.wdate}" type="both" /></time>
						</p>
						<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
					
					<ul class="row">
						<li>제목</li>
						<li>${bean.subject}</li>
						<li>사용자id</li>
						<li>${bean.userId}</li>
					</ul>
				</li>

				<li id="content">
					<ul>
						<li>내용</li>
						<li><pre>${bean.content}</pre></li>
					</ul>

					<ul class="row">
						<li>조회수</li>
						<li>${bean.readCount}</li>
					</ul>
			</ul>
			<div style="text-align: center; margin-bottom: 10px;">
				<a class="button" onclick="deleteSet()">삭제</a> <a class="button"
					href="list.do?cate=${bean.categoryIdx}page=${page}">목록</a>
			</div>
			<!-- 메인글 끝 -->

			<!-- 댓글 작성 -->
			<c:if test="${sessionScope.user != null}">
				<form action="comment.do?page=${page}" method="post" name="frmCmt">
					<input type="hidden" name="writingIdx" value="${bean.idx}">
					<input type="hidden" name="userId" value="${bean.userId}">

					<hr class="line">
					<ul id="main">
						<li>
							<ul class="row">
								<li>작성자</li>
								<li><input type="text" name="name" class="input" readonly
									value="${sessionScope.user.id}"></li>
							</ul>
						</li>
						<li>
							<ul class="row2">
								<li><textarea rows="5" cols="80" name="content"
										style="resize: none;" placeholder="댓글을 작성하세요." class="input"
										required></textarea></li>
								<li><input type="submit" value="저장" class="button small">
									<input type="reset" value="취소" class="button small"></li>
							</ul>
						</li>
					</ul>
				</form>
			</c:if>

			<!-- 작성된 댓글 목록 -->
			<hr class="line">
			<div>
				<span>댓글</span> <span>[${bean.commentCount}]</span> 
				<c:if test="${sessionScope.user == null}">
					<br><span>댓글 작성은 로그인 후 이용 가능 합니다.</span>
				</c:if>
			</div>
			<div>
				<ul>
					<c:forEach var="cmt" items="${cmtlist}">
						<li>
							<ul>
								<li>${cmt.userId}</li>
								<li>
									<!-- 댓글 작성자만 수정, 삭제가 가능하도록 --> 
									<c:if test="${cmt.userId eq sessionScope.user.id}">
										<a onclick="deleteCmt(${cmt.idx}, ${bean.idx}, ${page})">삭제</a>
									</c:if>
								</li>
							</ul>
						</li>
						<li><pre>${cmt.content}</pre></li>
					</c:forEach>
				</ul>
			</div>

		</div>

	</section>

	<script type="text/javascript">
		function deleteSet() {
			alert('삭제 클릭');
		}

		// 댓글 삭제
		function deleteCmt(cmtIdx, writingIdx, page) {
			const yn = confirm('댓글을 삭제하시겠습니까?');
			if (yn) {
				location.href = 'comment.do?del=&cmtIdx=' + cmtIdx
						+ "&writingIdx=" + writingIdx + "&page=" + page;
			} else {
				alert('댓글 삭제 취소합니다.');
			}
		}
	</script>
	<%@ include file="../bottom.jsp"%>
</body>
</html>