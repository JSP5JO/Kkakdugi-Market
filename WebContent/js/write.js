document.getElementById("select").addEventListener("change", function() {
	if (this.value == "기타") {
		document.getElementById("category_etc").style.display = "inline-block"; //화면에 보임
		document.getElementById("category_etc").disabled = false;
	} else {
		document.getElementById("category_etc").style.display = "none"; //화면에 안보임
		document.getElementById("category_etc").disabled = true;
	}
});