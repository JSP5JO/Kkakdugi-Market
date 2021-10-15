const navbar = document.querySelector(".navbar__menu"),
    menu = document.querySelector(".navbar__menu"),
    icon = document.querySelector(".navbar__icon")
    hamburgerBtn = document.querySelector(".navbar__hamburger");

/*햄버거 버튼 토글*/
function showBtn() {
    menu.classList.toggle("active");
    icon.classList.toggle("active");
}

/*햄버거 버튼 클릭 이벤트*/
hamburgerBtn.addEventListener('click', showBtn);


	$("#searchOption").on('change',function(){
		let state = $("#searchOption option:selected").val();
		if(state == "subject"){
			$("#subject").css("display","block");
			$("#userId").css("display","none");
			$("#content").css("display","none");
		}else if(state == "userId"){
			$("#subject").css("display","none");
			$("#userId").css("display","block");
			$("#content").css("display","none");
		}else if(state == "content"){
			$("#subject").css("display","none");
			$("#userId").css("display","none");
			$("#content").css("display","block");
		}	
	});
