-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 10, 2017 at 03:39 PM
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
-- Table structure for table `tbl_movies`
--

CREATE TABLE `tbl_movies` (
  `movies_id` smallint(6) NOT NULL,
  `movies_thumb` varchar(20) NOT NULL,
  `movies_title` varchar(40) NOT NULL,
  `movies_genre` varchar(10) NOT NULL,
  `movies_trailers` varchar(50) NOT NULL,
  `movies_reviews` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_thumb`, `movies_title`, `movies_genre`, `movies_trailers`, `movies_reviews`) VALUES
(1, 'beautyBeast.jpg', 'Beauty and the Beast', 'Family', 'beautyAndTheBeast_trailer.mp4', ''),
(2, 'proposal.jpg', 'The Proposal', 'Romance', 'theProposal_trailer.mp4', ''),
(3, 'easyA.jpg', 'Easy A', 'Comedy', 'easyA_trailer.mp4', ''),
(4, 'badMoms.jpg', 'Bad Moms', 'Comedy', 'badMoms_trailer.mp4', ''),
(5, 'shesTheMan.jpg', 'She\'s the Man', 'Romance', 'shesTheMan_trailer.mp4', ''),
(6, 'up.jpg', 'Up', 'Family', 'up_trailer.mp4', ''),
(7, 'insideOut.jpg', 'Inside Out', 'Family', 'insideOut_trailer.mp4', ''),
(8, 'theHeat.jpg', 'The Heat', 'Comedy', 'theHeat_trailer.mp4', ''),
(9, 'theBoss.jpg', 'The Boss', 'Comedy', 'theBoss_trailer.mp4', ''),
(10, 'zombieland.jpg', 'Zombieland', 'Action', 'zombieland_trailer.mp4', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
