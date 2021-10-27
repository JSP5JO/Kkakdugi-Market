//글 삭제
function deleteSet(idx, categoryIdx, page) {
	const yn = confirm("게시글을 삭제하시겠습니까?");
	if (yn) {
		location.href = 'delete.do?&idx=' + idx + '&cate='+ categoryIdx +  "&page=" + page;
	} else {
		alert('게시글 삭제를 취소하셨습니다.');
	}
}
// 댓글 삭제
function deleteCmt(cmtIdx, idx, page) {
	const yn = confirm('댓글을 삭제하시겠습니까?');
	if (yn) {
		location.href = 'comment.do?del=true&cmtIdx=' + cmtIdx + "&idx=" + idx + "&page=" + page;
	} else {
		alert('댓글 삭제 취소합니다.');
	}

}

// 찜 버튼 기능
function jjimOn(idx, categoryIdx, jjim)  {
	if (jjim == true) {
		document.getElementById("heart").src = "img/heart_r.png";
	} else {
		document.getElementById("heart").src = "img/heart.png";
	}

	location.href = 'jjim.do?idx=' + idx + '&categoryIdx=' + categoryIdx + '&jjim=' + jjim;
}	