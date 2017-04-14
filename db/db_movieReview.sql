-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 14, 2017 at 10:32 AM
-- Server version: 5.6.34
-- PHP Version: 7.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_movieReview`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cat`
--

CREATE TABLE `tbl_cat` (
  `cat_id` smallint(4) UNSIGNED NOT NULL,
  `cat_name` varchar(30) NOT NULL,
  `cat_desc` varchar(245) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_cat`
--

INSERT INTO `tbl_cat` (`cat_id`, `cat_name`, `cat_desc`) VALUES
(1, 'action', 'Think of Chuck Norris'),
(2, 'comedy', 'Think of Eddie Murphy'),
(3, 'family', 'Think of Disney'),
(4, 'romance', 'Think of Borat in a bikini');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comments`
--

CREATE TABLE `tbl_comments` (
  `comment_id` int(10) UNSIGNED NOT NULL,
  `comment_movie` varchar(75) NOT NULL,
  `comment_text` varchar(750) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_comments`
--

INSERT INTO `tbl_comments` (`comment_id`, `comment_movie`, `comment_text`) VALUES
(1, '1', 'stuff'),
(2, '2', 'junk'),
(3, '3', 'boop'),
(4, '4', 'beep'),
(5, '5', 'bloop'),
(6, '6', 'bleep'),
(7, '7', 'bam'),
(8, '8', 'boom'),
(9, '9', 'boom'),
(10, '10', 'zoom');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_l_mc`
--

CREATE TABLE `tbl_l_mc` (
  `mc_id` smallint(4) UNSIGNED NOT NULL,
  `movies_id` smallint(4) NOT NULL,
  `cat_id` smallint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_l_mc`
--

INSERT INTO `tbl_l_mc` (`mc_id`, `movies_id`, `cat_id`) VALUES
(8, 1, 3),
(9, 2, 4),
(10, 3, 2),
(11, 4, 2),
(12, 5, 4),
(13, 6, 3),
(14, 7, 3),
(15, 8, 2),
(16, 9, 2),
(17, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` smallint(6) NOT NULL,
  `movies_thumb` varchar(20) NOT NULL,
  `movies_title` varchar(40) NOT NULL,
  `movies_year` varchar(10) NOT NULL,
  `movies_trailers` varchar(50) NOT NULL,
  `movies_reviews` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_thumb`, `movies_title`, `movies_year`, `movies_trailers`, `movies_reviews`) VALUES
(1, 'beautyBeast.jpg', 'Beauty and the Beast', '2017', 'beautyAndTheBeast_trailer.mp4', ''),
(2, 'proposal.jpg', 'The Proposal', '2009', 'theProposal_trailer.mp4', ''),
(3, 'easyA.jpg', 'Easy A', '2010', 'easyA_trailer.mp4', ''),
(4, 'badMoms.jpg', 'Bad Moms', '2016', 'badMoms_trailer.mp4', ''),
(5, 'shesTheMan.jpg', 'She\'s the Man', '2006', 'shesTheMan_trailer.mp4', ''),
(6, 'up.jpg', 'Up', '2009', 'up_trailer.mp4', ''),
(7, 'insideOut.jpg', 'Inside Out', '2015', 'insideOut_trailer.mp4', ''),
(8, 'theHeat.jpg', 'The Heat', '2013', 'theHeat_trailer.mp4', ''),
(9, 'theBoss.jpg', 'The Boss', '2016', 'theBoss_trailer.mp4', ''),
(10, 'zombieland.jpg', 'Zombieland', '2009', 'zombieland_trailer.mp4', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_cat`
--
ALTER TABLE `tbl_cat`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  ADD PRIMARY KEY (`comment_id`);

--
-- Indexes for table `tbl_l_mc`
--
ALTER TABLE `tbl_l_mc`
  ADD PRIMARY KEY (`mc_id`);

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_cat`
--
ALTER TABLE `tbl_cat`
  MODIFY `cat_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_comments`
--
ALTER TABLE `tbl_comments`
  MODIFY `comment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_l_mc`
--
ALTER TABLE `tbl_l_mc`
  MODIFY `mc_id` smallint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
