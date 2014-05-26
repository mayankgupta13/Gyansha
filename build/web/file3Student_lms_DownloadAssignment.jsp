-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 29, 2014 at 08:01 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `final_teacher`
--
CREATE DATABASE IF NOT EXISTS `final_teacher` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `final_teacher`;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_options`
--

CREATE TABLE IF NOT EXISTS `assignment_options` (
  `Option _Id` int(11) NOT NULL AUTO_INCREMENT,
  `Questions_Id` int(11) NOT NULL,
  `Options` text NOT NULL,
  `Correct_Ans` tinyint(1) NOT NULL,
  `Explanation` text NOT NULL,
  PRIMARY KEY (`Option _Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_questions`
--

CREATE TABLE IF NOT EXISTS `assignment_questions` (
  `Question_Id` int(11) NOT NULL,
  `Assignment_Id` int(11) NOT NULL,
  `Assignment_Question` text NOT NULL,
  `Question_Type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `assignment_solutions`
--

CREATE TABLE IF NOT EXISTS `assignment_solutions` (
  `Solution_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Assignment_Id` int(11) NOT NULL,
  `File_Name` varchar(100) NOT NULL,
  `Upload_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Solution_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chapter_added`
--

CREATE TABLE IF NOT EXISTS `chapter_added` (
  `Chapter_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_Id` int(11) NOT NULL,
  `Subject_Id` int(11) NOT NULL,
  `Class_Id` int(11) NOT NULL,
  PRIMARY KEY (`Chapter_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chapter_assignment`
--

CREATE TABLE IF NOT EXISTS `chapter_assignment` (
  `Assignment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_Id` int(11) NOT NULL,
  `Chapter_Id` int(11) NOT NULL,
  PRIMARY KEY (`Assignment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `chapter_test`
--

CREATE TABLE IF NOT EXISTS `chapter_test` (
  `Test_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Chapter_Id` int(11) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  PRIMARY KEY (`Test_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE IF NOT EXISTS `class` (
  `Class_Id` int(11) NOT NULL,
  `Teacher_Id` int(11) NOT NULL,
  `No_of_Students` int(11) NOT NULL,
  `Class_Duration` time NOT NULL,
  `Starting_Topic` varchar(200) NOT NULL,
  `Ending_Topic` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `create_assignment`
--

CREATE TABLE IF NOT EXISTS `create_assignment` (
  `Assignment_Id` int(11) NOT NULL AUTO_INCREMENT,
  `File_Name` varchar(100) NOT NULL,
  `Assignment_Type` varchar(100) NOT NULL,
  `Upload_Date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Assignment_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `create_test`
--

CREATE TABLE IF NOT EXISTS `create_test` (
  `Test_Id` int(11) NOT NULL,
  `Test_Name` varchar(200) NOT NULL,
  `Test_Time` time NOT NULL,
  `No_of_section` int(11) NOT NULL,
  `Created_Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `new_chapter`
--

CREATE TABLE IF NOT EXISTS `new_chapter` (
  `Chapter_Id` int(11) NOT NULL,
  `Chapter_Name` varchar(200) NOT NULL,
  `Descriptions` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `subjects`
--

CREATE TABLE IF NOT EXISTS `subjects` (
  `Subject_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Teacher_Id` int(11) NOT NULL COMMENT 'FK',
  `Subject_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Subject_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_login`
--

CREATE TABLE IF NOT EXISTS `teacher_login` (
  `Teacher_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(100) NOT NULL,
  `Teacher_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Teacher_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `teacher_login`
--

INSERT INTO `teacher_login` (`Teacher_Id`, `Password`, `Teacher_Name`) VALUES
(13, 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `test_options`
--

CREATE TABLE IF NOT EXISTS `test_options` (
  `Option _Id` int(11) NOT NULL AUTO_INCREMENT,
  `Question_Id` int(11) NOT NULL,
  `Test_Options` text NOT NULL,
  `Correct_Ans` tinyint(1) NOT NULL,
  PRIMARY KEY (`Option _Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `test_questions`
--

CREATE TABLE IF NOT EXISTS `test_questions` (
  `Test_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Test_Questions` text NOT NULL,
  `Section_No` int(11) NOT NULL,
  `Question_Type` varchar(100) NOT NULL,
  PRIMARY KEY (`Question_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
