<?php

ini_set('display_errors',1);
	error_reporting(E_ALL);

require_once('admin/phpscripts/init.php');

//filtering
if(isset($_GET['filter'])) {
	$tbl1 = "tbl_movies";
	$tbl2 = "tbl_cat";
	$tbl3 = "tbl_l_mc";
	$col1 = "movies_id";
	$col2 = "cat_id";
	$col3 = "cat_name";
	$filter = $_GET['filter'];
	$getMovies = filterType($tbl1, $tbl2, $tbl3, $col1, $col2, $col3, $filter);
}else{
	$tbl = "tbl_movies";
	$getMovies = getAll($tbl);
}



//submitting comment
/*if(isset($_POST['submit'])) {
	// we need $movieID to tell input it into the db on what movie it's for
	$movieID = ;
	$comment = trim($_POST['comment']);

	if(empty($level)) {
		$message = "Please fill in the comment area.";

	}else{
		$result = createComment($movieID, $comment);
		$message = $result;
	}
}*/

?>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" name="viewport" content="width=device-width"/>
<title>reVIEWed</title>
<link href="favicon.ico" rel="shortcut icon">
<link href="http://fonts.googleapis.com/css?family=Mystery+Quest" rel="stylesheet" type="text/css">
<!--<link href="css/foundation.css" rel="stylesheet" type="text/css">
<link href="css/foundation.min.css" rel="stylesheet" type="text/css"> Needed for data interchange that isnt working-->
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>

<body>
<h1 class="hidden">reVIEWed - movie review site</h1>
<div id="siteCon"> <!--Start of site Container-->
		<nav id="mainNav">
			<div id="sideBar">
			<h2 class="hidden">Main navigation</h2>
					<a href="index.php">
						<img src="images/logo.png" id="logo" alt="reVIEWed Logo">
						<img src="images/genreArrow.png" alt="genre select" id="genreArrow">
					</a>
					<ul>
						<form> <!-- action="/action_page.php" -->
								<select onchange="this.form.submit();" name="filter" placeholder="Search by genre">
									<option value="select"><?php if(isset($_GET['filter'])){ echo $filter; }else{ echo "Select genre";} ?></option>
									<option value="action">Action</option>
									<option value="comedy">Comedy</option>
									<option value="family">Family</option>
									<option value="romance">Romance</option>
									<option value="all movies">All Movies</option>
								</select>
								<img src="images/searchIcon.png" alt="Search Button" id="searchButton">
								<br>
								<input class="search" type="text" placeholder="Search by name" name="name" onkeyup="showResult(this.value)" autocomplete="off">
								<div id="livesearch"></div>
						</form>
						<h6 id="copyright">Copyright © 2017</h6>
					</ul>
				</div>
		</nav>


		<section id="page">
	<div id="pageCon" class="welcomePage">
		<div class="tableCon">
			<div class="vertCon">
		<h1 class="home"><?php if(isset($_GET['filter'])){ echo $filter; }else{ echo "Welcome!";} ?></h1>
		<p id="paraphrase">
		</p>
		<div id="content"> <!-- dynamicContent goes in here -->
			<!-- welcome page -->
			<p id="welcomeText"> <?php if(isset($_GET['filter'])){ echo ""; }else{ echo "Here you can search for movies by name or genre, watch trailers and read or write reviews.";} ?></p>

			<!-- movie search-->
			<ul class="movieCon">
			<?php

				if(isset($_GET['filter']) AND $filter == "all movies"){
						$tbl = "tbl_movies";
						$getMovies = getAll($tbl);
						while($row = mysqli_fetch_array($getMovies)){
						echo "
						<li class=\"movieThumbs\">
							<img src=\"images/thumbs/{$row['movies_thumb']}\" alt=\"{$row['movies_title']}\" id=\"{$row['movies_id']}\">
						</li>";
					}
				}

				if(isset($_GET['filter'])){
					while($row = mysqli_fetch_array($getMovies)){
						echo "
						<li class=\"movieThumbs\">
							<img src=\"images/thumbs/{$row['movies_thumb']}\" alt=\"{$row['movies_title']}\" id=\"{$row['movies_id']}\">
						</li>";
					}
				}else{
					echo "<p></p>";
				}
			?>
		</ul>
	</div>
</div>

		<div id="pop">
		  <img src="images/closeButton.svg" alt="close full image button" id="closeButton" title="esc key">

			<div id="movieTrailer">
		    <video id="mainImg" alt="Full selected photo" controls>
					<source src="images/trailers/badMoms_trailer.mp4" type="video/mp4">
				</video>

				<div class="controls hideMe">
		        <input type="image" class="pPause" src="images/play.png">
		        <span id="curtimetext">00:00</span>
		        <input id="seekslider" type="range" min="0" max="100" value="0" step="1">
		        <span id="durtimetext">00:00</span>
		        <input type="image" id="volMute" src="images/mute.png">
			        <div id="vol">
			          <input id="volumeslider" type="range" min="0" max="100" value="100" step="1">
			        </div>
	      </div>

		    <p id="desc"></p>
		    <p id="cred"></p>
				<section id="commentViewer">
					<h2 class="hidden">Comment Section</h2>
					<ul>

						<?php
						$commentTbl = "tbl_comments";
						$getComment = getAll($commentTbl);

						while($row = mysqli_fetch_array($getComment)){
							echo "
							<li id=\"{$row['comment_movie']}\">
								<p class=\"comment\">{$row['comment_text']}
							</li>";
							}
						 ?>

					</ul>
				<textarea class="review" type="text" placeholder="add your comment here..." name="comment"></textarea>
				<br>
				<input type="submit" value="Submit" class="submit">
				</section>

		  </div>

			<div id="nextGallButton" title="Right arrow key">
 			 <img src="images/rightArrow.png" alt="right arrow key" id="arrowRight">
 		 </div>
 		 <div id="prevGallButton" title="Left arrow key">
 			 <img src="images/leftArrow.png" alt="left arrow key" id="arrowLeft">
 		 </div>
 	 </div>

		</div><!-- dynamicContent Finishes -->
	</div>

</section>
</div><!--End of site container-->

<script src="script/videoControls.js"></script>
<script src="script/videoPop.js"></script>
<script src="script/liveSearch.js"></script>
<!--<script src="script/jsObject.js"></script>
<script src="greensock/src/minified/TimelineLite.min.js"></script>
<script src="script/TweenMax.min.js"></script>
<script src="greensock/src/minified/TweenLite.min.js"></script>-->
</body>
</html>
