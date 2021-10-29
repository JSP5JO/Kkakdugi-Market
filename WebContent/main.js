const	navcon = document.querySelector(".navbar"),
    menu = document.querySelector(".navbar__menu"),
    icon = document.querySelector(".navbar__icon")
    hamburgerBtn = document.querySelector(".navbar__hamburger");

/*햄버거 버튼 토글*/
function showBtn() {
	navcon.classList.toggle("active");
    menu.classList.toggle("active");
    icon.classList.toggle("active");
}

/*햄버거 버튼 클릭 이벤트*/
hamburgerBtn.addEventListener('click', showBtn);

/*검색 셀레트 값 변경시 인풋 네임 속성 변경*/
$("#searchOption").on('change',function(){
	let state = $("#searchOption option:selected").val();
	$("#testbox").attr("name", state);
});

/*헤더 마우스 오버시 클래스 추가*/
$('.cate').mouseover(function() {
	$('.navbar').addClass("height");
});
$('.cate').mouseleave(function() {
	$('.navbar').removeClass("height");
});

if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
	$(".navbar").addClass("ie");
}