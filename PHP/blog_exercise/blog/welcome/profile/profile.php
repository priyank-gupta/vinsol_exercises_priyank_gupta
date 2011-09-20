<?php session_start();
if(!isset($_SESSION['usr_name'])) {
	header("Location: /blog/login_page.php");
	exit();
}
$usr_name = $_SESSION['usr_name'];
mysql_connect('localhost','priyank','priyank');
mysql_select_db('blog');
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
$sql = "select image_name from image where username='$usr_name'";
$res = mysql_query($sql);
if(mysql_num_rows($res) == 1) {
	$image_row = mysql_fetch_array($res);
	$image = $image_row['image_name'];
}
?>
<html>
<head>
<title>Welcome to Sher-O-Shayari</title>
<LINK href="/blog//welcome/welcome_pages.css" rel="stylesheet" type="text/css">
<style type='text/css'>
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
		<h1>Page Comming Soon</h1>
		</div><br/>
	</div>
</body>
</html>
