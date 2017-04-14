<?php
 include ('connect.php');

 $mysqli = new mysqli($connect['mysql_server'], $connect['mysql_user'], $connect['mysql_password'], $connect['mysql_db']);
	if ($mysqli->connect_errno) {
		printf("Connection failed: %s \n", $mysqli->connect_error);
		exit();
	}

	$mysqli->set_charset("utf8");

	$movie = $_GET["movie"];

	$myQuery = "SELECT tbl_movies.*, tbl_comments.comment_text FROM tbl_movies LEFT JOIN tbl_comments ON tbl_movies.movies_id = tbl_comments.comment_movie WHERE movies_id = {$movie}";

	$result = mysqli_query($mysqli, $myQuery);

	//echo mysqli_num_rows($result);
	echo json_encode(mysqli_fetch_all($result, MYSQLI_ASSOC));

 ?>
