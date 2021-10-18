/**
 * 회원가입시 아이디 유효성검사,중복체크 하기 위한 파일 
 */
function Check(f){ 
		let id = f.id.value; id=id.trim();
	  
		if(id.length<5){
		alert("아이디는 5자 이상 입력해주십시오."); 
		return false;
		}//공백 x 체크
		
		id = /^[0-9a-z]+$/; // 아이디 유효 체크 정규식
		if(!id.test(document.getElementById('id').value)){
			alert('아이디는 숫자,영문만 가능합니다.');
			document.getElementById('id').focus();
			return false;
		}//한글 x 체크
		return true;
	}//Check() end 
	
	function apply(){ //중복확인 id를 부모창에 적용 //부모창 opener
		opener.document.getElementById('id').value = document.getElementById('id').value;
		//부모창(regist.jsp)에 id값에 자식창(idCheck.jsp)에 있는 중복검사된 id값 전달
		window.close(); //창닫기
	}//apply () end
