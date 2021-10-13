<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyField</title>
<link rel="stylesheet" href="css/myField.css?v=3">
<script src="https://kit.fontawesome.com/a9b46edd75.js"
	crossorigin="anonymous"></script>
<script src="main.js" defer></script>
<script>
let email = false

/* form 전송 체크 */
	function validCheck() {
		const frm = document.fieldRegist;
		if (frm.field.value == "") {
			alert('전문분야를 선택해주세요.');
			return false;
		} else if (frm.field.value == "기타") {
			if (frm.etc.value == "") {
				alert('기타 입력 칸을 채워주세요.');
				return false
			}
		}
		
		if(email == false) {
			alert('이메일 인증을 먼저 해주세요.')
			return false;
		}
		return true;
	}
	
// 	이메일 인증 여부
	function emailCheck() {
		return false
	}
	
</script>
</head>
<body>

	<!-- header -->
	<%@ include file="../header.jsp"%>

	<div class="field">
		<form action="" method="post" name="fieldRegist" 
			onsubmit="return validCheck()">
			<!-- 본문 content -->
			<table>
				<tr>
					<!-- 분야 선택 리스트 -->
					<td><select name="field" required>
							<!-- option 태그 안에 문자열 : 화면, value : 서버 전송 값 -->
							<!-- selected 옵션은 기본선택 -->
							<option value="" selected>분야 선택</option>
							<option value="예시1">예시1</option>
							<option value="예시2">예시2</option>
							<option value="기타">기타</option>
					</select></td>
				</tr>

				<tr>
					<!-- 기타 선택 -->
					<td><input type="text" class="etc" name="etc"
						placeholder="기타 입력" disabled></td>
				</tr>
			</table>

			<table>
				<tr>
					<td><input type="text" placeholder="회사 이메일을 입력하세요"></td>
					<td><input type="button" value="전송"></td>
				</tr>
				
				<tr>
					<td><input type="text" placeholder="인증번호 입력"></td>
					<td><input type="button" value="확인"></td>
				</tr>
			</table>

			<input type=submit>
		</form>
	</div>
	
	<%@ include file="../bottom.jsp"%>
</body>

<script type="text/javascript">
	document.fieldRegist.field.addEventListener("click", function() {
		if (this.value == "기타") {
			document.fieldRegist.etc.disabled = false;
		} else {
			document.fieldRegist.etc.disabled = true;
		}
		console.log(this);
	});
</script>
</html>