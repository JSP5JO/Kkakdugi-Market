const maxLen = 500;
let text_len = 0;

function checkByte(obj) {
	text_len = obj.value.length;

	document.getElementById("nowLen").innerText = text_len;
	if (totalByte <= maxLen) {
		document.getElementById("nowLen").style.color = 'green';
	} else {
		document.getElementById("nowLen").style.color = 'red';
	}
}

function validCheck() {
	if (text_len <= maxLen) {
		alert('제출되었습니다.');
	} else {
		alert('글자수 초과되었습니다.')
	}
}