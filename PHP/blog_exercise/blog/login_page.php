<?php session_start();
if(isset($_SESSION['usr_name'])) {
	session_destroy();
}
if(IsSet($_POST['commit']) && $_POST['commit'] == 'Sign in') {
	if (IsSet($_POST['session_username']) && IsSet($_POST['session_password'])) {
		$usr_name = $_POST['session_username'];
		$pwd = $_POST['session_password'];
		mysql_connect('localhost','priyank','priyank');
		mysql_select_db('blog');
		$query = "select username, password from users where username='$usr_name' and password='$pwd'" ;
		$result = mysql_query($query);
		if (mysql_num_rows($result) == 1) {
			$_SESSION['usr_name'] = $usr_name;
			header("Location: /blog/welcome/home.php");
			exit;
		} else {
			$message = '*Username/Password incorrect';
		}
	} else {
		die("Something Went Wrong. Please Try Again");
	}
}
?>
<html>
<head>
<title> SHER-O-SHAYARI Login</title>
<LINK href="/blog/blog_all.css" rel="stylesheet" type="text/css">
<style type='text/css'>
#container > div {
	margin:auto;
	width:25%;
}
.error {
	font-size: 12px;
	color: #b88282;
}
#username {
	padding-bottom: 15px;
}
.actions {
	float: right;
}

</style>
</head>
<body id='main'>
	<div>
		<h1><span style="color: #700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">e</span><span style="color:#9b4f4f">r</span><span style="color:#9b4f4f">-</span><span style="color:#700404">O</span><span style="color:#9b4f4f">-</span><span style="color:#700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">a</span><span style="color:#9b4f4f">y</span><span style="color:#a96868">a</span><span style="color:#b88282">r</span><span style="color:#c69b9b">i</span></h1>
		<div id ="container"> 
		  <div> 
				<form accept-charset="UTF-8" action="login_page.php" method="post">  
					<fieldset>
						<legend>Sign in</legend> 
						<span class='error' id='error3'><?php echo $message; ?></span>
						<div class="field" id="username"> 
						  <label for="session_username">UserName</label><br/>
						  <input id="session_username" name="session_username" size="30" type="text" /><span class='error' id='error1'></span>
						</div> 
						<div class="field" id="password">
						  <label for="session_password">Password</label><br/> 
						  <input id="session_password" name="session_password" size="30" type="password" /><span class='error' id='error2'></span>
						</div><br/>
					  <span class="actions"> 
					    <input id="session_submit" name="commit" type="submit" value="Sign in" onclick="return validat()"/><span style='clear:both;'></span>
					  </span>
						<div>
							<a href="/blog/sign_up.php" id="sign_up">Sign Up</a>
						</div> 
					</fieldset> 
				</form>
				<input type='hidden' id='session_name' value='notvalid' />
			</div> 
		</div>
	</div>
	<script type='text/javascript' src='login_page.js'>
	</script>	
</body>
</html>

