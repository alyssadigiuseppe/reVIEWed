<?php

function createComment($movieID, $comment){
	require_once("connect.php");
	$ip = 0;

	// sending comment to db
	$commentstring = "INSERT INTO tbl_comments VALUES(NULL,'{$movieID}','{$comment}')";
	$commentquery = mysqli_query($link, $commentstring);

	if($commentquery){
		echo $commentquery;

	}else {
		$message = "Oops, there was a problem posting your comment...";
		return $message;
	}
	mysqli_close($link);
}
?>
