<html>
<head>
</head>
<body>
	<h3>Exercise Form</h3>
<?php
$str = <<< form
	<form method='post' action='exercise1.php' onsubmit="return validat()">
		<table>
			<tr>
				<td>Name</td>
				<td><input type='text' name='name' id='name' /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type='text' name='email' id='email' /></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type='password' name='password' id='password' /></td>
			</tr>
			<tr>
				<td>Confirm Password</td>
				<td><input type='password' name='conf_pass' id='conf_pass' /></td>
			</tr>
			<tr>
				<td colspan=2><input type='submit' name='submit' value='go'  /></td>
			</tr>
		</table>
	</form>
form;
echo $str;
?>
	<script type='text/javascript'>
	function validat()
	{
		var regExpBlank = /\s/;
		var regExpMail = /^(?:\w+\.?)*\w+@(?:\w+\.)*\w{2,4}$/;
		var naam = document.getElementById('name');
		var email = document.getElementById('email');
		var pass = document.getElementById('password');
		var conf = document.getElementById('conf_pass');
		var c;
		if (naam.value == '' || regExpBlank.test(naam.value)) {
			naam.focus();
			alert("name cannot be blank");
			c=1;
		} 	
		if (email.value == '' || regExpBlank.test(email.value)) {
			email.focus();
			alert("email cannot be blank");
			c=1;
		} else if(!regExpMail.test(email.value)) {
			email.focus();
			alert("enter a valid email");
			c=1;
		}
		if (pass.value == '' || regExpBlank.test(pass.value)) {
			pass.focus();
			alert("password cannot be blank");
			c=1;
		}else if (pass.value.length < 8) {
			pass.focus;
			alert ("password should be more than 8 characters");
			conf.value='';
			pass.value='';
			c=1;
		}else if (pass.value != conf.value) {
			conf.focus();
			alert("password doesn't match confirmation password");
			conf.value='';
			pass.value=''
			c=1;
		}
		if (c==1) {
			return false;
		}
	}
	</script>
</body>
</html>
