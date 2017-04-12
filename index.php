<?php

ini_set('display_errors',1);
	error_reporting(E_ALL);

require_once('admin/phpscripts/init.php');

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

?>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>reVIEWed</title>
<link href="http://fonts.googleapis.com/css?family=Mystery+Quest" rel="stylesheet" type="text/css">
<!--<link href="css/foundation.css" rel="stylesheet" type="text/css">
<link href="css/foundation.min.css" rel="stylesheet" type="text/css"> Needed for data interchange that isnt working-->
<link href="css/main.css" rel="stylesheet" type="text/css">
</head>

<body>
<h1 class="hidden">reVIEWed - movie review site</h1>
<div id="siteCon"> <!--Start of site Container-->
		<nav id="mainNav">
			<h2 class="hidden">Main navigation</h2>

					<img src="images/logo.png" id="logo" alt="reVIEWed Logo">
					<ul>
						<form> <!-- action="/action_page.php" -->
							  <input class="search" type="text" placeholder="search by name" name="name"><br>
								<select name="filter">
									<option value="select">search by genre</option>
									<option value="action">Action</option>
									<option value="comedy">Comedy</option>
									<option value="family">Family</option>
									<option value="romance">Romance</option>
									<option value="">All</option>
								</select>
								<br>
						  <input type="submit" value="Submit">
						</form>
						<h6 id="copyright">Copyright © 2017</h6>
					</ul>
		</nav>

		<section id="mobileNav">
			<h2 class="hidden">Mobile Navigation</h2>
			<div id="navMobileBackground">
			<img src="images/logo.png" id="mobileLogo" alt="reVIEWed logo">

					<img src="images/hamMenu.png" id="hamIcon" alt="Mobile Navigation">
				</div>
		</section>

		<nav id="navDropdown" class="hidden">
			<h2 class="hidden">Mobile navigation drop down menu</h2>
			<form> <!-- action="/action_page.php" -->
					<input class="search" type="text" placeholder="search by name" name="name"><br>
					<select name="filter">
						<option value="select">search by genre</option>
						<option value="action">Action</option>
						<option value="comedy">Comedy</option>
						<option value="family">Family</option>
						<option value="romance">Romance</option>
						<option value="">All</option>
					</select>
					<br>
				<input type="submit" value="Submit">
			</form>
		</nav>


		<section id="page">
	<div id="pageCon" class="welcomePage">
		<h1 class="home">Welcome!</h1>
		<p id="paraphrase"></p>
		<div id="content"> <!-- dynamicContent goes in here -->
			<!-- welcome page -->
			<p id="welcomeText">Here you can search for movies by name or genre, watch trailers and read or write reviews!</p>

			<!-- movie search-->
			<ul class="movieCon">
			<?php
				if(!is_string($getMovies)){
					while($row = mysqli_fetch_array($getMovies)){
						echo "
						<li class=\"movieThumbs\">
							<img src=\"images/thumbs/{$row['movies_thumb']}\" alt=\"{$row['movies_title']}\">
						</li>";
					}
				}else{
					echo "<p>{$getMovies}</p>";
				}
			?>
		</ul>

		<div id="pop">
		  <img src="images/closeButton.svg" alt="close full image button" id="closeButton" title="esc key">

		  <div id="fullPhotoInfo">
		    <img id="mainImg" alt="Full selected photo">
		    <p id="desc"></p>
		    <p id="cred">Photo Credit:</p>
		  </div>

		  <div id="nextGallButton" title="Right arrow key">
		    <div id="arrowRight"></div>
		  </div>
		  <div id="prevGallButton" title="Left arrow key">
		    <div id="arrowLeft"></div>
		  </div>
		</div>

		</div><!-- dynamicContent Finishes -->
	</div>

</section>
</div><!--End of site container-->
<script src="script/main.js"></script>
<!--<script src="script/jsObject.js"></script>
<script src="greensock/src/minified/TimelineLite.min.js"></script>
<script src="script/TweenMax.min.js"></script>
<script src="greensock/src/minified/TweenLite.min.js"></script>-->
</body>
</html>
