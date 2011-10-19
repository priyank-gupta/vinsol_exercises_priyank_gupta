<?php
if (isset($_POST['logout']) && $_POST['logout'] == 'logout') {
	unset($_SESSION['user_id']);
	session_destroy();
	header("Location: /blog/index.php");
	exit();
}
?>
