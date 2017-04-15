<?php
	include ('connect.php');

	$mysqli = new mysqli($connect['mysql_server'], $connect['mysql_user'], $connect['mysql_password'], $connect['mysql_db']);
	 	if ($mysqli->connect_errno) {
		printf("Connection failed: %s \n", $mysqli->connect_error);
		exit();
	}

 	$mysqli->set_charset("utf8");

	 $string = $_GET["search"];

	 $myQuery = "SELECT * FROM `tbl_movies` WHERE `movies_title` like '%$string%' LIMIT 5";
	 $result = mysqli_query($mysqli, $myQuery);

	 if (strlen($string)>0) {
		 $liveSearch="";

		 foreach($result as $liveSearch){
			 echo "<li class='livesearch'>" . "<a href='?search=" . $liveSearch['movies_title'] . "' >" . $liveSearch['movies_title'] . "</a>" . "</li>";
		 }

		 if ($liveSearch=="") {
		  $response="<li class='livesearchNon'>no suggestions</li>";
		}

		echo $response;

	 }
?>
