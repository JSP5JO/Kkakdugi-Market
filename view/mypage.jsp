<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix ="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
<style>
	ul{
		padding-inline-start:0px; /*목록 들여쓰기 없애기*/
	}
	
	h3{
		text-align:center;
		color:#000;
	}
	.mypage{
		display:flex;
		list-style:none;
		justify-content:space-between;
	}
	.mycont{
		flex-basis:33.33%;
		margin:10px;
		border:1px solid #000;
		border-radius:3px;
		padding:5px 10px;
		box-sizing:border-box;
	}
	.row{
		display:flex;
		list-style:none;
		justify-content:space-between;
	}
	.row>li{
		flex-basis:33.33%;
		text-align:center;
	}
	.mycont li{
		list-style:none;
		color:#000;
	}
	.mycont li a{
		text-decoration:none;
		color:#000;
	}
	
@media screen and (max-width: 768px){
	.mypage {
	    flex-direction: column;
	}
	.mypage>div {
		flex-basis:100%;
	}
}
</style>
</head>
<body>
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
							<li>${vo.userId }</li>			
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
</body>
</html>