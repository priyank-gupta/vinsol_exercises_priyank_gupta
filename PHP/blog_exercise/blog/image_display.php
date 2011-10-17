<?php
$sql = "select image_name from image where user_id='$user_id'";
$res = mysql_query($sql);
if(mysql_num_rows($res) == 1) {
	$image_row = mysql_fetch_array($res);
	$image = $image_row['image_name'];
}
else {
	$image = "default.jpg";
}
?>
