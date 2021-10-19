/**
 * 회원가입시 유효성 검사및 id중복검사창 띄우기
	이메일 셀렉트박스(구현예정)
 */
function regist_check() {
	var pw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 유효 체크 정규식
	if (!pw.test(document.getElementById('pw1').value)) {
		alert('비밀번호가 영문자+숫자+특수문자 조합  8~16자 이내로 사용해야 합니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if (document.getElementById('pw1').value != document.getElementById('pw2').value) {
		alert('비밀번호가 일치하지 않습니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if (document.getElementById('pw1').value.length < 8) {
		alert('비밀번호 길이가 너무 짧습니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if (document.getElementById('pw1').value.length > 16) {
		alert('비밀번호 길이가 너무 깁니다.');
		document.getElementById('pw2').focus();
		return false;
	}
}

function idCheck() { //새창 만들기 
	window.name = "regist"; //현재 열려있는 페이지 이름(부모창)
	var _width = '650';
	var _height = '380';
	// 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기
	var _left = Math.ceil((window.screen.width - _width) / 2);
	var _top = Math.ceil((window.screen.height - _height) / 2);
	window.open("idCheck.do", "idCheck", 'width=' + _width + ', height=' + _height + ', left=' + _left + ', top=' + _top);

}