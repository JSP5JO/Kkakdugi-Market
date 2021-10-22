//css를 별도로 지정하기위해 ie 에서만 클래스 추가

var agent = navigator.userAgent.toLowerCase();

if ( (navigator.appName == 'Netscape' && navigator.userAgent.search('Trident') != -1) || (agent.indexOf("msie") != -1) ) {
	$(".mlist_con").addClass("ie");
}
