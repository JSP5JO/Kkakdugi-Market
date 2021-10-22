//let email = false
let email = true

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

	if (email == false) {
		alert('이메일 인증을 먼저 해주세요.')
		return false;
	}
	return true;
}

// 	이메일 인증 여부
function emailCheck() {
	return false
}


document.fieldRegist.field.addEventListener("click", function() {
	if (this.value == "기타") {
		document.fieldRegist.etc.disabled = false;
	} else {
		document.fieldRegist.etc.disabled = true;
	}
});