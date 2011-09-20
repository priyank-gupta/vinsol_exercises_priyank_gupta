<?php session_start();
if(!isset($_SESSION['usr_name'])) {
	header("Location: /blog/login_page.php");
	exit();
}
mysql_connect('localhost','priyank','priyank');
mysql_select_db('blog');
$usr_name = $_SESSION['usr_name'];
if(!isset($_SESSION['name'])) {
	$query = "select name from users where username='$usr_name'" ;
	$result = mysql_query($query);
	while($row = mysql_fetch_array($result)) {
		$name = $row[0];
		$_SESSION['name'] = $name;
	}
} else {
	$name = $_SESSION['name'];
}
if (isset($_POST['title']) && isset($_POST['post_shayari']) && isset($_POST['category']) && isset($_POST['submit']) && $_POST['submit'] == 'Post') {
	$title = $_POST['title'];
	$post_shayari = mysql_real_escape_string($_POST['post_shayari']);
	$category = $_POST['category'];
	$query = "insert into shayari(title,shayari,category,username) values (\"$title\",\"$post_shayari\",\"$category\",\"$usr_name\")";
	$result = mysql_query($query);
	if($result == 1) {
		header("Location: /blog/welcome/Shayaris/My_Shayari.php");
	}
}
$sql = "select image_name from image where username='$usr_name'";
$res = mysql_query($sql);
if(mysql_num_rows($res) == 1) {
	$image_row = mysql_fetch_array($res);
	$image = $image_row['image_name'];
}
?>
<html>
<head>
<title> Post Your Shayari </title>
<LINK href="/blog//welcome/welcome_pages.css" rel="stylesheet" type="text/css">
<style type='text/css'>
textarea {
	resize: none;
	scroll: auto;
	font-family: arial narrow;
}
span.error {
	font-size: 12px;
	color: #F3444A;
}
div#float_left {
	float:left;
}
div#float_right {
	float:right;
}
h2 {
	margin-top:0;
	color: #8d3636;
}
div#rightside > form > div  {
	margin-bottom: 10px;
}
div#float_left >textarea {
	margin-right:20px;
}
</style>
</head>
<body id='main'>
	<div>
		<div id='maindiv'>
			<div id='logout'><a href='/blog/login_page.php' /><img src='/blog/pictures/logout.jpg' /></a></div>
			<h1><span style="color: #700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">e</span><span style="color:#9b4f4f">r</span><span style="color:#9b4f4f">-</span><span style="color:#700404">O</span><span style="color:#9b4f4f">-</span><span style="color:#700404">S</span><span style="color:#7e1d1d">h</span><span style="color:#8d3636">a</span><span style="color:#9b4f4f">y</span><span style="color:#a96868">a</span><span style="color:#b88282">r</span><span style="color:#c69b9b">i</span></h1>
			<p id='welcome'> Hi! <?php echo $name ?> </p><br/>
		</div>
		<div id='leftside'>
			<div id='pic'>
				<img src="/blog/upload/<?php echo $image ?>" />
			</div>
			<div id='links'>
				<div class='leftlink'><a href="/blog/welcome/profile/profile.php">Profile</a></div>
				<div class='leftlink' id='shayari'>
					<span id='waste'>Shayaris
					<ul id='to_hide'>
						<li><a href="/blog/welcome/Shayaris/My_Shayari.php">My Shayaris</a></li>
						<li><a href="/blog/welcome/Shayaris/All_Shayaris.php">All Shayaris</a></li>
					</ul></span>
				</div>
				<div class='leftlink'><a href="/blog/welcome/post_shayari/Post_Shayari.php">Post Shayari</a></div>
			</div>
		</div>
		<div id='rightside'>
			<h2>Rhyme Your Feelings</h2>
			<form method='post' action='Post_Shayari.php'>
				<div>
					<label for='title'>Title</label><br/>
					<input type='text' name='title' id='title' />&nbsp;&nbsp;<span class='error' id='error1'></span>
				</div>
				<div id="float_left">
					<label for='shayari'>Post Your Shayari Here--</label><br/>
					<textarea rows='15' cols='50' name='post_shayari' id='post_shayari' ></textarea><br/>
					<span class='error' id='error2'></span>
				</div>
				<div id="float_right">
					<span class='error' id='error3'></span><br/>
					<select  name='category' id='category' onclick='clr_error()'>
						<option selected value='0'>Select a category--</option>
						<option value='love'>Love</option>
						<option value='hatred'>Hatred</option>
						<option value='life'>Life</option>
						<option value='loneliness'>Loneliness</option>
						<option value='joy'>Joy</option>
					</select>
				</div><br/>
				<div>
					<input type='submit' name='submit' value='Post' onclick="return validat()" />
					<input type='button' name='clear' value='clear' onclick="clr()" />
				</div>
			</form>
		</div><br/>
	</div>
	<script style='text/javascript' src="Post_Shayari.js">
	</script>
</body>
</html>
