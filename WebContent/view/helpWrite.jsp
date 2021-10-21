<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>helpWrite</title>
<link rel="stylesheet" href="css/helpWrite.css?v=3">
<script src="js/helpWrite.js" defer>
	
</script>
</head>
<body>
	<%@ include file="../header.jsp"%>
	<section>
		<div class="help">
			<form action="helpSave.do" method="post" onsubmit="return validCheck()" name="frm">
			<input type="hidden" name="userId" value="${sessionScope.user.id}" readonly>
			<input name="categoryIdx" type="hidden" value="HELP">
				<table>
					<tr>
						<td>작성자: ${sessionScope.user.id}</td>
					</tr>
					<tr>
						<td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
					</tr>
					<tr>
						<td><textarea rows="20" cols="50" name="content" placeholder="내용을 입력하세요."
								onkeyup="checkByte(this)"></textarea></td>
					</tr>
					<tr>
						<td style='text-align: right;'>글자수(<span id="nowLen">0</span>/500자리)
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