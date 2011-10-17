<?php session_start();
include "../../db_connect.php";
include "../../session_check.php";
include "../../image_display.php";
include "../../logout.php";
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
			<div id='logout'><form method='post' action='profile.php'><input type='hidden' name='logout' value='logout'/><input type='image' src='/blog/pictures/logout.jpg' alt='Logout'/></form></div>
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
