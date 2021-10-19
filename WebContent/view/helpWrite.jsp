<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpWrite</title>
<link rel="stylesheet" href="css/helpWrite.css?v=3">
</head>
<body>
	<%@ include file="../header.jsp"%>
	여기는 1:1 상담 글을 남기는 공간
	<section>
		<div class="help">
			<form action="">
				<table>
					<tr>
						<td><select name="category">
								<option value="" selected>카테고리 선택</option>
						</select></td>
					</tr>
					<tr>

						<td><input type="text" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="50" placeholder="내용을 입력하세요."></textarea>
						</td>
					</tr>
				</table>
				<input type="submit" value="제출">
			</form>
		</div>
	</section>
	<%@ include file="../bottom.jsp"%>
</body>
</html>