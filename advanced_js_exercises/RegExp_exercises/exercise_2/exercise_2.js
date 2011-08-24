
function chk() {
	var num = document.getElementById("num");
	var result = document.getElementById("result");
	var regExpNum = /^\d\d*\d?$/;
	if(!regExpNum.test(num.value)) {
		result.value = "False";
		return false;
	}
	else {
		result.value = "True";
	}
}
