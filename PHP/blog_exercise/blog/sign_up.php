<?php session_start();
if(IsSet($_POST['commit']) && $_POST['commit'] == 'Sign up') {
	if (IsSet($_POST['session_username']) && IsSet($_POST['session_password']) && IsSet($_POST['session_name']) && IsSet($_POST['session_email']) && IsSet($_POST['session_gender'])) {
		$name = $_POST['session_name'];
		$usr_name = $_POST['session_username'];
		$pwd = $_POST['session_password'];
		$email = $_POST['session_password'];
		$gender = $_POST['session_gender'];
		mysql_connect('localhost','priyank','priyank');
		mysql_select_db('blog');
		$query = "select username from users where username='$usr_name'" ;
		$result = mysql_query($query);
		if (mysql_num_rows($result) == 0) {
			$query = "insert into users(username,password,name,email,gender) values('$usr_name','$pwd','$name','$email','$gender')";
			$result = mysql_query($query);
			if ((($_FILES["file"]["type"] == "image/gif") || ($_FILES["file"]["type"] == "image/jpeg") || ($_FILES["file"]["type"] == "image/pjpeg") || ($_FILES["file"]["type"] == "image/png") || ($_FILES["file"]["type"] == "image/jpg")) && ($_FILES["file"]["size"] < 2000000))  {
				if ($_FILES["file"]["error"] > 0) {
					echo "Return Code: " . $_FILES["file"]["error"] . "<br />";
				} else {
					$type = substr($_FILES["file"]["name"], strrpos($_FILES["file"]["name"],"."));
					$_FILES["file"]["name"] = $usr_name.$type;
					$image_type = $_FILES["file"]["type"];
					echo $image_type;
					$image_size = ($_FILES["file"]["size"] / 1024) . " Kb";
					echo $image_size;
					$image_name = $_FILES["file"]["name"];
					echo $image_name;
					move_uploaded_file($_FILES["file"]["tmp_name"],"upload/".$_FILES['file']['name']);
					$sql = "insert into image(username,image_type,image_size,image_name) values('$usr_name','$image_type','$image_size','$image_name')";
					$upload_query = mysql_query($sql);
					echo mysql_affected_rows();
				}
			} else {
			echo "Invalid file";
			}
			$_SESSION['usr_name'] = $usr_name;
			header("Location: /blog/welcome/home.php");
			exit;
		} else {
			$message = '*Username already exist';
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
.field {
	padding-bottom: 15px;
}
.actions {
	float: right;
	margin-top:-15px;
}
</style>
</head>
<body id='main'>
	<div>
	<h1><span style="color: #700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">e</span><span style="color:#9b4f4f">r</span><span style="color:#9b4f4f">-</span><span style="color:#700404">O</span><span style="color:#9b4f4f">-</span><span style="color:#700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">a</span><span style="color:#9b4f4f">y</span><span style="color:#a96868">a</span><span style="color:#b88282">r</span><span style="color:#c69b9b">i</span></h1>
		<div id ="container"> 
		  <div> 
				<form accept-charset="UTF-8" action="sign_up.php" method="post" enctype="multipart/form-data">  
					<fieldset>
						<legend>Sign Up</legend> 
						<span class='error' id='error3'><?php echo $message; ?></span>
						<div class="field" id="name"> 
						  <label for="session_name">*Name</label><br/>
						  <input id='session_name' name="session_name" size="30" type="text" /><span class='error' id='error4'></span>
						</div> 
						<div class="field" id="email">
						  <label for="session_email">*Email ID</label><br/>
						  <input id="session_email" name="session_email" size="30" type="text" /><span class='error' id='error6'></span>
						</div>
						<div class="field" id="gender"> 
							<label for='gender'>*Gender</label><br/>
						  <input checked type='radio' name='session_gender' id='male' value='m' />&nbsp;<label for="male">Male</label><br/>
						  <input type='radio' name='session_gender' id='female' value='f' />&nbsp;<label for="female">Female</label>
						</div>
						<div class="field" id="username">
						  <label for="session_username">*UserName</label><br/>
						  <input id="session_username" name="session_username" size="30" type="text" /><span class='error' id='error1'></span>
						</div> 
						<div class="field" id="password">
						  <label for="session_password">*Password</label><br/> 
						  <input id="session_password" name="session_password" size="30" type="password" /><span class='error' id='error2'></span>
						</div>
						<div class="field">
						  <label for="conf_password">*Confirm Password</label><br/> 
						  <input id="conf_password" name="conf_password" size="30" type="password" /><span class='error' id='error5'></span>
						</div>
						<div class="field">
						  <label for="file">Profile image</label><br/> 
						  <input id="file" name="file" type="file" />
						</div><br/>
					  <span class="actions">
					    <input id="session_submit" name="commit" type="submit" value="Sign up" onclick="return validat()"/><span style='clear:both;'></span>
					  </span>
					  <span class='actions' style='float:left'>
							<a href="/blog/login_page.php" id="sign_in">Sign In</a>
						</span> 
					</fieldset> 
				</form>
			</div> 
		</div>
	</div>
	<script type='text/javascript' src='sign_up.js'>
	</script>	
</body>
</html>

