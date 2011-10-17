function validat()
	{
		var regExpBlank = /\s/;
		var regExpSpace = /^(.*\s*.+)+$/;
		var regExpMail = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w{2,4}$/;
		var comp_name = document.getElementById('session_name');
		var naam = document.getElementById('session_username');
		var pass = document.getElementById('session_password');
		var conf_pass = document.getElementById('conf_password');
		var email = document.getElementById('session_email');
		var error1 = document.getElementById('error1');
		var error2 = document.getElementById('error2');
		var error4 = document.getElementById('error4');
		var error5 = document.getElementById('error5');
		var error6 = document.getElementById('error6');
		document.getElementById('error3').innerHTML='';
		error1.innerHTML = ''; error2.innerHTML = ''; error4.innerHTML='';error5.innerHTML='';error6.innerHTML='';
		var c;
		if (comp_name.value == '' || !regExpSpace.test(comp_name.value)) {
			error4.innerHTML = '*this field cannot be blank';
			comp_name.focus();
			c=1;
		}
		if (email.value == '' || !regExpSpace.test(email.value)) {
			error6.innerHTML = '*this field cannot be blank';
			email.focus();
			c=1;
		} else if (!regExpMail.test(email.value)) {
			error6.innerHTML = '*email not valid';
		}
		if (naam.value == '' || regExpBlank.test(naam.value)) {
			error1.innerHTML = "*this field cannot be blank";
			naam.focus();
			c=1;
		} 	
		if (conf_pass.value == '' || regExpBlank.test(conf_pass.value)) {
			error5.innerHTML = '*this field cannot be blank';
			conf_pass.focus();
			c=1;
		}
		if (pass.value == '' || regExpBlank.test(pass.value)) {
			error2.innerHTML = "*this field cannot be blank";
			pass.focus();
			c=1;
		} else if (pass.value.length < 4) {
			error2.innerHTML = '*password should be of atleast 4 characters';
			pass.focus();
			pass.value='';
			c=1;
		} else if (pass.value != conf_pass.value) {
			error2.innerHTML = '*password does not match confirm password';
			pass.value='';
			conf_pass.value='';
			pass.focus();
			c=1;
		}
		if (c==1) {
			return false;
		}
	}
