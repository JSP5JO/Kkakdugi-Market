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
pre {
	white-space: pre-wrap;
}

li {
	list-style: none;
}

p {
	text-align: right;
}

.gallery {
	width: 100%;
	height: 100%;
}
</style>
</head>
<link rel="stylesheet" href="css/detail.css?v=3">
<body>
	<%@ include file="../header.jsp"%>
	<section>

		<div style="width: 80%; margin: auto; max-width: 700px;">

			<div id="all">
				<ul id="main" style="-webkit-padding-start: 0px;">
					<!-- ul태그가 좌측에 자동으로 여백을 가지고 있기 때문에 없애기 위해 사용 -->
					<li>
						<ul class="row">
							<div class="container" style="float: right;">
							<c:if test="${jjim eq false}">
								<img src="img/heart_r.png" alt="light" style="width: 22px; cursor: pointer;" id="heart" onclick="jjimOn('${bean.idx}', '${bean.categoryIdx}', '${jjim}')">
							</c:if>
							<c:if test="${jjim eq true}">
								<img src="img/heart.png" alt="light" style="width: 22px; cursor: pointer;" id="heart" onclick="jjimOn('${bean.idx}', '${bean.categoryIdx}', '${jjim}')">
							</c:if>
							</div>

							<h2>${bean.subject}</h2>
							<h5>${bean.name}</h5>
							<li>작성자 : ${bean.userId}</li>

						</ul>
					</li>
					<hr>
					<li id="content">
						<ul>
							<li><pre>${bean.content}</pre></li>
						</ul>

						<ul>
							<c:forEach var="item" items="${gList}">
								<img class="gallery " alt="gallery"
									src="/upload/${item.fileName }">
							</c:forEach>
						</ul>
				</ul>

				<p>
					<time class="time">
						작성날짜 :
						<fmt:formatDate value="${bean.wdate}" type="both" />
					</time>
				</p>
				<div style="text-align: center; margin-bottom: 10px;">
					<div style="float: left;">
						<li class="readcount">조회수 ${bean.readCount}</li>
					</div>

					<a class="btn" onclick="deleteSet(${bean.idx}, ${page})">삭제</a> <a class="button1"
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
								<ul class="row" style="-webkit-padding-start: 0px;">
									<li>댓글</li>
									<li><input type="text" name="name" class="input1" readonly
										value="${sessionScope.user.id}"></li>
								</ul>
							</li>
							<li>
								<ul class="row2" style="-webkit-padding-start: 0px;">
									<li><textarea rows="5" cols="70" name="content"
											style="resize: none;" placeholder="댓글을 작성하세요." class="input2"
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
						<br>
						<span>댓글 작성은 로그인 후 이용 가능 합니다.</span>
					</c:if>
				</div>
				<div>
					<ul style="-webkit-padding-start: 2px;">
						<c:forEach var="cmt" items="${cmtlist}">
							<li>
								<ul>
									<li class="id">${cmt.userId}</li>
									<li class="content"><pre>${cmt.content}</pre></li>
									<li>
										<!-- 댓글 작성자만 수정, 삭제가 가능하도록 --> <c:if
											test="${cmt.userId eq sessionScope.user.id}">
											<a class="button2"
												onclick="deleteCmt(${cmt.idx}, ${bean.idx}, ${page})">삭제</a>
										</c:if>
									</li>
								</ul>
							</li>
						</c:forEach>
					</ul>
				</div>

			</div>
		</div>
	</section>

	<script type="text/javascript" defer>
		//글 삭제
		function deleteSet(idx, page) {
			console.log(idx);
			const n = confirm("게시글을 삭제하시겠습니까?");
			if(n == 1){
				location.href = 'delete.do?=&idx' + idx + "&page="+page;
			}else{
				alert('게시글 삭제를 취소하셨습니다.');
			}
		}
		// 댓글 삭제
		function deleteCmt(cmtidx, idx, page) {
			const yn = confirm('댓글을 삭제하시겠습니까?');
			if (yn) {
				location.href = 'comment.do?del=&cmtidx=' + cmtidx+ "&idx=" + idx + "&page=" + page;
			} else {
				alert('댓글 삭제 취소합니다.');
			}
		
		}	
		 	const state=1;
		    const img = document.getElementById('heart');
		    const onoff = document.getElementById('state');
		    function jjim(){
		        if(state==1){
		            jjimOff();
		            state=0;
		        }else{    
		            jjim();
		            state=1;
		        }
		    }
		
		function jjimOn(idx, categoryIdx, jjim){
			if(jjim == true) {
				img.src = 'img/heart_r.png';
			} else {
				img.src = 'img/heart.png';
				alert('찜 했습니다.');
			}
  	        location.href='jjim.do?idx='+ idx + '&categoryIdx='+categoryIdx + '&jjim='+jjim;
		}		
	</script>
	<%@ include file="../bottom.jsp"%>
</body>
</html>