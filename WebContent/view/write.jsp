<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
</head>
<link rel="stylesheet" href="css/write.css?v=3">
<body>
	<%@ include file="../header.jsp"%>
	<section>


		<form name="frm1" action="save.do" method="post" enctype="multipart/form-data">

			<div id="all">

				<div id="category">
					<select name="category" id="select">
						<option value="1">의류/악세서리</option>
						<option value="2">스포츠/레저</option>
						<option value="3">음악/미술</option>
						<option value="4">가구/인테리어</option>
						<option value="5">디지털/가전</option>
						<option value="6">뷰티/미용</option>
						<option value="etc" selected>기타</option>
					</select>
				</div>

				<div class="subject_c">
					<input id="subject" type="text" name="subject" placeholder="제목"
						required>
				</div>

				<div class="userId_c">
					<input id="userId" type="text" name="userId" readonly
						value="${sessionScope.user.id}" placeholder="작성자">
				</div>

				<div class="content_c">
					<textarea id="content" rows="20" name="content" placeholder="작성하실 내용을 입력해주세요." required></textarea>
				</div>

				<div class="fileName_c">
					<input type="file" name="fileName" accept="image/*" multiple>
				</div>

				<div class="button">
					<input type="submit" value="등록" class="btn"> 
					<input type="reset" value="초기화" class="btn2">
				</div>
			</div>
		</form>
		
	</section>
	<%@ include file="../bottom.jsp"%>
</body>

</html>