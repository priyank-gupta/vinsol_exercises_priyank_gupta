
document.getElementById("color").addEventListener('click', check, false);
document.getElementById("movie").addEventListener('click', check, false);
document.getElementById("drink").addEventListener('click', check, false);
document.getElementById("bike").addEventListener('click', check, false);

function check() {
	var list = this.parentNode.childNodes[5];
	if(this.checked == true) {
		list.style.display = "block";
		this.scrollIntoView();
	}
	else {
		list.style.display = "none";
	}
}


