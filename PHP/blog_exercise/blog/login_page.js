function validat()
	{
		var regExpBlank = /\s/;
		var regExpSpace = /^(.*\s*.+)+$/;
		var naam = document.getElementById('session_username');
		var pass = document.getElementById('session_password');
		var error1 = document.getElementById('error1');
		var error2 = document.getElementById('error2');
		document.getElementById('error3').innerHTML='';
		error1.innerHTML = ''; error2.innerHTML = '';
		var c;
		if (naam.value == '' || regExpBlank.test(naam.value)) {
			error1.innerHTML = '*this field cannot be blank';
			naam.focus();
			c=1;
		} 	
		if (pass.value == '' || regExpBlank.test(pass.value)) {
			error2.innerHTML = '*this field cannot be blank';
			pass.focus();
			c=1;
		}else if (pass.value.length < 4) {
			error2.innerHTML = '*password should be of atleast 4 characters';
			pass.focus();
			pass.value='';
			c=1;
		}
		if (c==1) {
			return false;
		}
	}
