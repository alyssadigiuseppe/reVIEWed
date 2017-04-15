<?php

	require("connect.php");

		$id = $_GET['id'];
		$comment = addslashes(trim($_GET['comment']) ? : '');

	// sending comment to db
	if(!empty($comment)){
	$commentstring = "INSERT INTO tbl_comments VALUES(NULL, '{$id}', '{$comment}')";
	$commentquery = mysqli_query($link, $commentstring);
	}

	if($commentquery){
		echo 'Done';
	}else {
		$message = "Oops, there was a problem posting your comment...";
		return $message;
	}
	mysqli_close($link);
?>
