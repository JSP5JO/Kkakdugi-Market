<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 상세보기</title>
</head>
<body>

<section>

	<h3>글 목록</h3>
	<hr>
	<div style="width: 80%; margin: auto;max-width: 700px;">
	<ul id="main">
		<li>
			<ul class="row">
				<li>제목</li>
				<li>${bean.subject}</li>
				<li>사용자id</li>
				<li>${bean.userId}</li>
			</ul>
			
			<ul class="row">
					<li>카테고리</li>
					<li>${bean.categoryIdx}</li>
					<li>작성날짜</li>
					<li><fmt:formatDate value="${bean.wdate }" type="both"/></li>
					<!-- pattern="yyyy-MM-dd HH:mm:ss , type= date,time,both -->
				</ul>
			</li>
			
			<li id="content">
				<ul>
					<li>내용</li>				
					<li>
						<pre>${bean.content}</pre>
					</li>				
				</ul>
	
				<ul class="row">
					<li>조회수</li>
					<li>${bean.readCount}</li>
				</ul>
	</ul>
	<div style="text-align: center;margin-bottom: 10px;">
		<a class="button" onclick="deleteSet()">삭제</a>
		<a class="button" href="list.do?page=${page}">목록</a>
	</div>
	<!-- 메인글 끝 -->
	<!-- 댓글 시작 -->
	<form action="comment.do?page=${page }" method="post" name="frmCmt">
	<input type="hidden" name="mref" value="${bean.idx }">
		<hr class="line">
		<div>
			<span>댓글</span>
			<span>[{$bean.commentCount}]</span>
			<span></span>
		</div>
		<hr class="line">
		<ul id="main">
			<li>
				<ul class="row">
					<li>작성자</li>
					<li><input type="text" name="name" class="input" value="${sessionScope.userId}"></li>
				</ul>
			</li>
			<li>
				<ul class="row2">
					<li>
					<textarea rows="5" cols="80" name="context" style="resize: none;"
							  placeholder="댓글을 작성하세요." class="input" required></textarea>
					</li>
					<li>
						<input type="submit" value="저장" class="button small">
						<input type="reset" value="취소" class="button small">
					</li>
				</ul>
			</li>
			
			<c:forEach var="cmt" items="${cmtlist}">
			<li>
				<ul>
					<li>${cmt.userId }</li>
					<li>${cmt.wdate }</li>
					<li><a href="javascript:deleteCmt('${cmt.idx }','${bean.idx }','${page }')">삭제</a></li>
				</ul>
			</li>
			<li>
				<pre>${cmt.content }</pre>
			</li>
				</c:forEach>
			</ul>
		</form>
</div>
	<!-- 댓글 작성자만 수정, 삭제가 가능하도록 -->
	<c:if test="${cmt.userId == sessionScope.userId}">
		<a href="#">수정</a>
		<a href="javascript:deleteCmt('${cmt.idx }','${bean.idx }','${page }')">삭제</a>
	</c:if>
</section>

<script type="text/javascript">

function deleteSet(){
	document.getElementById('myModal').style.display='block';		
}

// 댓글 삭제
function deleteCmt(cmtidx,idx,page){
		console.log(cmtidx);console.log(idx);
		const yn = confirm('댓글을 삭제하시겠습니까?');
		if(yn){
			location.href='comment.do?del=&cmtidx=' + cmtidx + "&idx=" + idx + "&page="+page;
		}else {
			alert('댓글 삭제 취소합니다.');
		}
	}
</script>


</body>
</html>