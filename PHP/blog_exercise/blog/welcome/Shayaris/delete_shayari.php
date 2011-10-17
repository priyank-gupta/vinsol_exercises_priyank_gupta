<?php session_start();
$user_id = $_SESSION['user_id'];
include "../../db_connect.php";
if (isset($_POST['shayari_id'])) {
	$id_shayari = $_POST['shayari_id'];
	$query = "delete from shayari where shayari_id = '$id_shayari'";
	$result = mysql_query($query);
	$query = "delete from comment where shayari_id = '$id_shayari'";
	$result = mysql_query($query);
}
?>

