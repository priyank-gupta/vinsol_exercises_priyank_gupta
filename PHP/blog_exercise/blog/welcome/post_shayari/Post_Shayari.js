function validat()
	{
		var regExpBlank = /^(.*\s*.+)+$/;
		var title = document.getElementById('title');
		var shayari = document.getElementById('post_shayari');
		var category = document.getElementById('category');
		var error1 = document.getElementById('error1');
		var error2 = document.getElementById('error2');
		var error3 = document.getElementById('error3');
		error1.innerHTML = ''; error2.innerHTML = '';error3.innerHTML='';
		var c;
		if (title.value == '' || !regExpBlank.test(title.value)) {
			error1.innerHTML = '*this field cannot be blank';
			title.focus();
			c=1;
		} 	
		if (shayari.value == '' || !regExpBlank.test(shayari.value)) {
			error2.innerHTML = '*this field cannot be blank';
			shayari.focus();
			c=1;
		}
		if (category.value == '0') {
			error3.innerHTML = '*Please select a category';
			category.focus();
			c=1;
		}
		if (c==1) {
			return false;
		}
	}

function clr() {
	var shayari = document.getElementById('post_shayari');
	shayari.value = '';
	shayari.focus();
}
function clr_error() {
	var category = document.getElementById('category');
	var error3 = document.getElementById('error3');
	if (category.value != '0') {
		error3.innerHTML = '';
	}
}
