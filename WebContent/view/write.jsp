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
					<select name="Category" id="Category">
						<option value="CATE20">주방/가전</option>
						<option value="CATE12">IT/전자</option>
						<option value="패션/의류">패션/의류</option>
						<option value="세면/욕실">세면/욕실</option>
						<option value="기타" selected>기타</option>
					</select>
					 <span> 
					 	<input type="text" id="category_etc" name="category_etc" placeholder="원하시는 분류 항목을 입력해주세요.">
					</span>
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
					<input type="file" name="fileName" accept="image/*">
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

<script type="text/javascript">
	document.getElementById("Category").addEventListener("change", function() {
		if (this.value == "기타") {
			document.getElementById("category_etc").style.display = "inline-block"; //화면에 보임
			document.category_etc.disabled = false;
		} else {
			document.getElementById("category_etc").style.display = "none"; //화면에 안보임
			document.category_etc.disabled = true;
			}

		});
</script>
</html>


