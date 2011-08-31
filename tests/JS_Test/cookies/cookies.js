
function Cookie() {
	this.s="hi";
	alert(this.s);
}

Cookie.prototype.setCookie = function(cookieName, cookieValue) {
	var sCookie = cookieName + "=" + encodeURIComponent(cookieValue);
	if(arguments[2]) {
		sCookie += "; expires=" + arguments[2].toGMTString();
  }
  document.cookie = sCookie;
	alert(document.cookie);
}

Cookie.prototype.getCookie = function(cookieName) {
	var Exp = "(?:; )?" + cookieName + "=([^;]*);?";
	var regExp = new RegExp(Exp);
	if (regExp.test(document.cookie)) {
		return(decodeURIComponent(RegExp["$1"]));
	} else {
		return(null);
	}
}

Cookie.prototype.clearCookie = function(cookieName) {
	var sCookie = cookieName + "=" + encodeURIComponent("");
	sCookie += "; expires=" + new Date(0).toGMTString();
  document.cookie = sCookie;
  alert(document.cookie);
}

Cookie.prototype.clearCookies = function() {
	var st = document.cookie.split(";");
	for(var i = 0; i < st.length;i++) {
		var cook = st[i].substr(0,st[i].indexOf("="));
		var sCookie = cook + "=" + encodeURIComponent("");
		sCookie += "; expires=" + new Date(0).toGMTString();
		document.cookie = sCookie;
	}
	alert(document.cookie);
}

var exeCookie = new Cookie();

function setting() {
	var cName = prompt("Cookie Name","");
	var cValue = prompt("Cookie Value","");
	exeCookie.setCookie(cName, cValue);
}

function getting() {
	var cName = prompt("Name of Cookie","");
	alert(exeCookie.getCookie(cName));
}
function clearing(){
	var cName = prompt("Name of Cookie","");
	exeCookie.clearCookie(cName);
}
function clearAll() {
 exeCookie.clearCookies();
}
document.getElementById("settin").addEventListener('click', setting, false);
document.getElementById("gettin").addEventListener('click', getting, false);
document.getElementById("clearin").addEventListener('click', clearing, false);
document.getElementById("clearAll").addEventListener('click', clearAll, false);
