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


$("#searchOption").on('change',function(){
	let state = $("#searchOption option:selected").val();
	$("#testbox").attr("name", state);
});

$('.cate').mouseover(function() {
	$('.navbar').addClass("height");
});
$('.cate').mouseleave(function() {
	$('.navbar').removeClass("height");
});