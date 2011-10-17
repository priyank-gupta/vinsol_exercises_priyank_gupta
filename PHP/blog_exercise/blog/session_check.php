<?php
if(!isset($_SESSION['user_id'])) {
	header("Location: /blog/index.php");
	exit();
}
$user_id = $_SESSION['user_id'];
if(!isset($_SESSION['name'])) {
	$query = "select name from users where id='$user_id'" ;
	$result = mysql_query($query);
	while($row = mysql_fetch_array($result)) {
		$name = ucfirst($row[0]);
		$_SESSION['name'] = $name;
	}
} else {
	$name = ucfirst($_SESSION['name']);
}

?>
