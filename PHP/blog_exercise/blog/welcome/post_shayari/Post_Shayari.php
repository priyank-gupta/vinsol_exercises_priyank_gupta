<?php session_start();
include "../../db_connect.php";
include "../../session_check.php";
include "../../logout.php";

if (isset($_POST['edit']) && $_POST['edit'] = 'Edit' && isset($_POST['edit_del_s_id'])) {
	$shayari_id = $_POST['edit_del_s_id'];
	$query1 = "select title, shayari, category from shayari where shayari_id = '$shayari_id'";
	$result1 = mysql_query($query1);
	while($row = mysql_fetch_array($result1)) {
		$title = $row['title'];
		$shayari = $row['shayari'];
		$category = $row['category'];
	}
	$_SESSION['shayari_id'] = $_POST['edit_del_s_id'];
}

if (isset($_POST['title']) && isset($_POST['post_shayari']) && isset($_POST['category']) && isset($_POST['submit']) && $_POST['submit'] == 'Post') {
	$title = $_POST['title'];
	$title = filter_var($title, FILTER_SANITIZE_SPECIAL_CHARS);
	$post_shayari = $_POST['post_shayari'];
	$post_shayari = filter_var($post_shayari, FILTER_SANITIZE_SPECIAL_CHARS);
	$category = $_POST['category'];
	echo $_SESSION['shayari_id'];
	if (isset($_SESSION['shayari_id'])) {
		$shayari_id = $_SESSION['shayari_id'];
		$query = "update shayari set title = '$title', shayari = '$post_shayari', category = '$category', updated_on = now() where shayari_id = '$shayari_id'";
		$result = mysql_query($query);
		unset($_SESSION['shayari_id']);
	}
	else {
		$query = "insert into shayari(title,shayari,category,user_id,updated_on) values (\"$title\",\"$post_shayari\",\"$category\",\"$user_id\",now())";
		$result = mysql_query($query);
	}
	if($result == 1) {
		header("Location: /blog/welcome/Shayaris/My_Shayari.php");
	}
}
include "../../image_display.php";
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
<body id='main' <?php if(isset($category)) {echo "onload = set_category('".$category."')";}?> >
	<div>
		<div id='maindiv'>
			<div id='logout'><form method='post' action='Post_Shayari.php'><input type='hidden' name='logout' value='logout'/><input type='image' src='/blog/pictures/logout.jpg' alt='Logout'/></form></div>
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
					<input type='text' name='title' id='title' <?php if(isset($title)) {echo "value=".$title;}?> />&nbsp;&nbsp;<span class='error' id='error1'></span>
				</div>
				<div id="float_left">
					<label for='shayari'>Post Your Shayari Here--</label><br/>
					<textarea rows='15' cols='50' name='post_shayari' id='post_shayari' ><?php if(isset($shayari)) {echo $shayari;}?></textarea><br/>
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
