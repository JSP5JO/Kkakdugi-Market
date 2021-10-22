/**
 * 회원가입시 유효성 검사및 id중복검사창 띄우기
 */
function regist_check() {
	var pw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/; //비밀번호 유효 체크 정규식
	if(!pw.test(document.getElementById('pw1').value)){
		alert('비밀번호가 영문자+숫자+특수문자 조합  8~16자 이내로 사용해야 합니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if(document.getElementById('pw1').value != document.getElementById('pw2').value){
		alert('비밀번호가 일치하지 않습니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if(document.getElementById('pw1').value.length < 8){
		alert('비밀번호 길이가 너무 짧습니다.');
		document.getElementById('pw2').focus();
		return false;
	}
	if(document.getElementById('pw1').value.length > 16){
		alert('비밀번호 길이가 너무 깁니다.');
		document.getElementById('pw2').focus();
		return false;
	}
}

function idCheck(){ //새창 만들기 
	let _width = '650';
    let _height = '380';
    
    let _left = (document.body.offsetWidth / 2) - (_width / 2);
    let _top =  (window.screen.height / 2) - (_height / 2);
    _left += window.screenLeft;//듀얼모니터 경우 추가

	window.open("/backup/view/idCheck.jsp", "idCheck",'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top); 
}
