<?php
 include ('connect.php');

 $mysqli = new mysqli($connect['mysql_server'], $connect['mysql_user'], $connect['mysql_password'], $connect['mysql_db']);
	if ($mysqli->connect_errno) {
		printf("Connection failed: %s \n", $mysqli->connect_error);
		exit();
	}

	$mysqli->set_charset("utf8");

	$photos = $_GET["image"];

	$myQuery = "SELECT * FROM tbl_gallery WHERE gallery_id='$photos'";



	$result = mysqli_query($mysqli, $myQuery);

	//echo mysqli_num_rows($result);
	echo json_encode(mysqli_fetch_assoc($result));

 ?>
