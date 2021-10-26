//글 삭제
function deleteSet(idx, page) {
	console.log(idx);
	const n = confirm("게시글을 삭제하시겠습니까?");
	if(n == 1){
		location.href = 'delete.do?=&idx' + idx + "&page="+page;
	}else{
		alert('게시글 삭제를 취소하셨습니다.');
	}
}
// 댓글 삭제
function deleteCmt(cmtidx, idx, page) {
	console.log(cmtidx);
	console.log(idx);
	const yn = confirm('댓글을 삭제하시겠습니까?');
	if (yn) {
		location.href = 'comment.do?del=&cmtidx=' + cmtidx+ "&idx=" + idx + "&page=" + page;
	} else {
		alert('댓글 삭제 취소합니다.');
	}

}	
 	const state=1;
    const img = document.getElementById('heart');
    const onoff = document.getElementById('state');
    function jjim(){
        if(state==1){
            jjimOff();
            state=0;
        }else{    
            jjim();
            state=1;
        }
    }

function jjimOn(){
	$("#heart").toggleClass("on");
    img.src='img/heart.png';
    if($("#heart").hasClass("on")){
    	 img.src='img/heart.png';
    }else{
    	 img.src='img/heart_r.png';
    }
}
