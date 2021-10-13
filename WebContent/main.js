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

