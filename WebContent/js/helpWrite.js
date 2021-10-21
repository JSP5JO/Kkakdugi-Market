const MAX_LEN = 500;
let text_len = 0;

function checkByte(obj) {
	text_len = obj.value.length;

	document.getElementById("nowLen").innerText = text_len;
	
	if (text_len <= MAX_LEN) {
		document.getElementById("nowLen").style.color = 'green';
	} else {
		document.getElementById("nowLen").style.color = 'red';
	}
}

function validCheck() {
	text_len = document.frm.content.value.length;
	if (text_len <= MAX_LEN) {
		alert('제출되었습니다.');
		return true;
	} else {
		alert('글자수 초과되었습니다.')
		return false;
	}
}