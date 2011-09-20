<?php session_start();
$usr_name = $_SESSION['usr_name'];
mysql_connect('localhost','priyank','priyank');
mysql_select_db('blog');
if(isset($_POST['shayari_id']) && isset($_POST['comment'])) {
$post_comment = $_POST['comment'];
$id_shayari = $_POST['shayari_id'];
$query1 = "insert into comment(comment, shayari_id,username) values('$post_comment','$id_shayari','$usr_name')";
$result1 = mysql_query($query1);
}
$query2 = "select username, comment from comment where shayari_id = '$id_shayari'";
$result2 = mysql_query($query2);
while ($row_comments = mysql_fetch_array($result2)) {
	$show_comment = $row_comments['comment'];
	$show_user = $row_comments['username'];
	echo "<p><b>".$show_user.":</b>&nbsp;&nbsp;".$show_comment."</p>";
}
?>
