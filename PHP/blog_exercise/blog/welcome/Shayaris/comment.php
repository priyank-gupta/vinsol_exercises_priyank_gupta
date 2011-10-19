<?php session_start();
$user_id = $_SESSION['user_id'];
include "../../db_connect.php";
if(isset($_POST['shayari_id']) && isset($_POST['comment'])) {
$post_comment = filter_var($_POST['comment'], FILTER_SANITIZE_SPECIAL_CHARS);
$id_shayari = $_POST['shayari_id'];
$query1 = "insert into comment(comment, shayari_id,user_id) values('$post_comment','$id_shayari','$user_id')";
$result1 = mysql_query($query1);
}
$query2 = "select user_id, comment from comment where shayari_id = '$id_shayari'";
$result2 = mysql_query($query2);
while ($row_comments = mysql_fetch_array($result2)) {
	$show_comment = $row_comments['comment'];
	$u_id = $row_comments['user_id'];
	$u_name_query = "select username from users where id = '$u_id'";
	$u_name_result = mysql_query($u_name_query);
	$row1 = mysql_fetch_array($u_name_result);
	echo "<p><b>".$row1[0].":</b>&nbsp;&nbsp;".$show_comment."</p>";
}
?>
