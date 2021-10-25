function findId(){ //아이디 찾기 
 	let _width = '650';
    let _height = '380';

    // 팝업을 가운데 위치시키기 위해 아래와 같이 값 구하기

    let _left = (document.body.offsetWidth / 2) - (_width / 2);
    let _top =  (window.screen.height / 2) - (_height / 2); 
    _left += window.screenLeft;//듀얼모니터 경우 추가

	window.open("findId.do", "findId",
			'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top); 
}
function findPw(){//비밀번호 찾기  
 	let _width = '650';
    let _height = '380';
    
    let _left = (document.body.offsetWidth / 2) - (_width / 2);
    let _top =  (window.screen.height / 2) - (_height / 2);
    _left += window.screenLeft;//듀얼모니터 경우 추가

	window.open("findPw.do", "findPw",
			'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top); 
}