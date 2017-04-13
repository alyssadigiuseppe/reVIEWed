-- phpMyAdmin SQL Dump
-- version 4.6.5.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 13, 2017 at 04:39 AM
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
  `movies_trailers` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_movies`
--

INSERT INTO `tbl_movies` (`movies_id`, `movies_thumb`, `movies_title`, `movies_genre`, `movies_trailers`) VALUES
(1, 'beautyBeast.jpg', 'Beauty and the Beast', 'Family', 'beautyAndTheBeast_trailer.mp4'),
(2, 'proposal.jpg', 'The Proposal', 'Romance', 'theProposal_trailer.mp4'),
(3, 'easyA.jpg', 'Easy A', 'Comedy', 'easyA_trailer.mp4'),
(4, 'badMoms.jpg', 'Bad Moms', 'Comedy', 'badMoms_trailer.mp4'),
(5, 'shesTheMan.jpg', 'She\'s the Man', 'Romance', 'shesTheMan_trailer.mp4'),
(6, 'up.jpg', 'Up', 'Family', 'up_trailer.mp4'),
(7, 'insideOut.jpg', 'Inside Out', 'Family', 'insideOut_trailer.mp4'),
(8, 'theHeat.jpg', 'The Heat', 'Comedy', 'theHeat_trailer.mp4'),
(9, 'theBoss.jpg', 'The Boss', 'Comedy', 'theBoss_trailer.mp4'),
(10, 'zombieland.jpg', 'Zombieland', 'Action', 'zombieland_trailer.mp4');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_reviews`
--

CREATE TABLE `tbl_reviews` (
  `reviews_id` int(11) NOT NULL,
  `reviews_movie` varchar(60) NOT NULL,
  `reviews_text` varchar(1000) NOT NULL,
  `reviews_time` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_reviews`
--

INSERT INTO `tbl_reviews` (`reviews_id`, `reviews_movie`, `reviews_text`, `reviews_time`) VALUES
(1, 'Beauty and the Beast', 'Beauty and the Beast is Disney\'s live-action remake of the classic 1991 animated musical, with Emma Watson as book-loving, independent Belle and Dan Stevens as the Beast. Although the movie will appeal to even very young viewers, especially those familiar with the original, the remake\'s violent sequences can be very intense, with a few jump-worthy and upsetting moments (several involving snarling wolves, others guns) that leave characters bloodied, injured, and, in one case, dead. As always, the story encourages viewers to look beyond the superficial and to be compassionate, curious, humble, and generous. Director Bill Condon took care to make sure that this version had diverse supporting characters, including a gay LeFou (Josh Gad) -- Gaston\'s sidekick, who briefly dances with a man -- and people of color not represented in the animated version.', '9:55 PM'),
(2, 'The Proposal', 'Although the movie is predictable, like most romance comedies are, nevertheless it was sweet. Sure a bit unrealistic in terms of the time line of the whole plot takes place but this is why we have movies like this, so you can escape into the fantasy of romance and humor. If you are looking for realism then watch a 3 hour drama, but if you want to escape for awhile and just enjoy a movie you don\'t have to think too much about then it\'s worth your time. If you don\'t want to pay to go see it in the theater, then wait for it to come out on DVD. I saw it during a private screening as part of the ATL Film Festival, for close to two hours I thought of nothing else and laughed and even cried a bit. I would definitely see it again. It may not be the best romantic comedy I have seen but the movie still holds lots of charm.', '7:20 AM'),
(3, 'Easy A', 'This smart teen comedy inspired by Nathaniel Hawthorne\'s classic novel The Scarlet Letter centers on a straight-laced teen (Emma Stone) who gets caught up in the school rumor mill (partly thanks to gossip spreading via Facebook and texting) -- a situation that many teens will be able to identify with. Labeled promiscuous after she tells a white lie and, later, exacerbates that lie with another, she quickly loses control of the situation (though, because this is a movie, she manages to cope with poise and wit). Although little action is shown, the subject of sex permeates the whole film, and there are lots of innuendoes/references and situations (including talk about losing virginity), as well as incidents in which kids judge one another. There\'s also some swearing (including \"s--t\") and allusions to underage drinking.', '5:19 PM'),
(4, 'Bad Moms', 'Bad Moms is a raucous, if uneven, \"hard R\" comedy about motherhood, PTAs, sisterhood, and everything in between. It\'s in-your-face raunchy: Expect lewd jokes, scenes showing couples in bed and discussing sex positions, a man caught with his hands down his pants, and one moment when a woman is shown fully naked. There\'s also plenty of swearing (including \"f--k,\" \"s--t,\" and more), over-the-top drinking/partying, and some drug use (marijuana joints). Characters argue/yell at each other, and a woman is so distracted while driving and speeding that she nearly crashes into a car. While none of the characters is intended to be an outright role model, men in particular are stereotyped/objectified.', '11:32 PM'),
(5, 'She\'s the Man', 'Twelfth Night joins the growing list of Shakespeare plays updated for modern teens on the theory that they\'ll be led back to the Bard, which is like feeding someone Pringles and hoping he\'ll develop a taste for vichyssoise. In this version Viola (Amanda Bynes) is a high school soccer player who disguises herself as her twin brother and takes his place at his new boarding school to prove she can compete with the guys. Pursuing a PG-13, director Andy Fickman mostly soft-pedals the play\'s homosexual panic, generating a comedy that lacks both the verbal sophistication of its source and the sexual sophistication of its target audience. With Vinnie Jones, Julie Hagerty, and David Cross. 105 min.', '7:40 PM'),
(6, 'Up', 'The key to Pixar\'s success has always been the perfect blend of heart and humor -- and they\'ve certainly done it again here.', '6:34 PM'),
(7, 'Inside Out', 'Inside Out [is] a bold, gorgeous, sweet, funny, sometimes heartbreakingly sad, candy-colored adventure that deserves an Academy Award nomination for best picture.', '10:45 AM'),
(8, 'The Heat', 'The Heat stars Sandra Bullock as an uptight FBI agent who\'s forced to team up with an irritating Boston cop played by Melissa McCarthy to take down a mysterious drug lord. In this mismatched-buddy comedy directed by Bridesmaids\' Paul Feig, the duo must learn to work as a team despite their initial distrust and hostility. But messages about friendship and loyalty come with a heaping serving of crude, violent content, including sexual references, a cop beating helpless suspects, an execution, photos of dismembered bodies, and more. There\'s also tons of swearing (\"s--t,\" \"f--k,\" and more), as well as scenes with drug use (pot) and very heavy drinking. A character uses the word \"retarded\" to insult someone\'s intellect and there are jokes about albinism.', '12:30 PM'),
(9, 'The Boss', 'The Boss is a sometimes hard-edged comedy about a financial guru (Melissa McCarthy) with a hard-scrabble past who\'s thrown into jail and has a tough time working her way back to success after she gets out. Michelle Darnell is a pretty bawdy character: She swears at and in front of kids, freely dispenses sexual advice, and can\'t stay away from her sometimes-violent nemesis. She also has a take-no-prisoners attitude toward business. As such, much of the movie\'s material -- including frequent sexual innuendo/references, lots of swearing (including \"f--k\"), cocaine use, and an all-out rumble in which moms and kids rip one another\'s hair off, shove and toss each other around, and generally beat each other up -- is better suited for older teens and adults. That said, somewhere underneath all the mayhem are messages about redemption, friendship, and money not buying happiness.', '11:39 AM'),
(10, 'Zombieland', 'Keeping with its title, Zombieland is full of zombie violence, whether it\'s the zombies dispatching humans or being dispatched themselves. Although much of the mayhem is played for laughs and the film\'s overall tone is lighthearted, there\'s tons of gore (shootings, bludgeonings, stabbings, flesh eating, and more), as well as scary depictions of the end of the world. Also expect frequent strong language (including \"f--k\" and then some), some drinking, and one scene of drug use.', '2:36 AM');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  ADD PRIMARY KEY (`movies_id`);

--
-- Indexes for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  ADD PRIMARY KEY (`reviews_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_movies`
--
ALTER TABLE `tbl_movies`
  MODIFY `movies_id` smallint(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `tbl_reviews`
--
ALTER TABLE `tbl_reviews`
  MODIFY `reviews_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
