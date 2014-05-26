-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 22, 2014 at 10:30 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `aptitude_test`
--
CREATE DATABASE IF NOT EXISTS `aptitude_test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `aptitude_test`;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `Book_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Book_Name` varchar(100) NOT NULL,
  `Course` varchar(100) NOT NULL,
  `Link` varchar(50) NOT NULL,
  `File` varchar(200) NOT NULL,
  PRIMARY KEY (`Book_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`Book_Id`, `Book_Name`, `Course`, `Link`, `File`) VALUES
(1, 'JAVA TPOINT', 'Java', 'www.javatpoint.com', 'dgibfiuvhbf');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `Notificaton_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Notification_Type` varchar(20) NOT NULL,
  `Notification_Date` date NOT NULL,
  `Notification` varchar(500) NOT NULL,
  PRIMARY KEY (`Notificaton_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`Notificaton_Id`, `Notification_Type`, `Notification_Date`, `Notification`) VALUES
(1, 'Assignment', '2014-04-30', 'All Student will submit resume till Date 5-05-2014'),
(2, 'Test', '2014-05-13', 'Online Aptitude Test');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE IF NOT EXISTS `options` (
  `Option_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Options` varchar(30) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Answer` tinyint(1) NOT NULL,
  `Test_Id` int(11) NOT NULL,
  PRIMARY KEY (`Option_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`Option_Id`, `Options`, `Question_Id`, `Answer`, `Test_Id`) VALUES
(4, '10', 1, 1, 1),
(5, '12', 1, 0, 1),
(6, '14', 1, 0, 1),
(7, '20', 1, 0, 1),
(8, '2', 2, 0, 1),
(9, '1', 2, 1, 1),
(10, '4', 2, 0, 1),
(11, '10', 2, 0, 1),
(12, 'Start Start Start', 3, 1, 1),
(13, 'Start Start Start Start ', 3, 0, 1),
(14, 'Start Start StartStart Start S', 3, 0, 1),
(15, 'Start', 3, 0, 1),
(16, '2 3', 4, 0, 1),
(17, '2 5', 4, 0, 1),
(18, '1 3', 4, 1, 1),
(19, '0 1', 4, 0, 1),
(20, '2 4', 5, 1, 1),
(21, '1 2', 5, 0, 1),
(22, '3 5', 5, 0, 1),
(23, '7 9', 5, 0, 1),
(28, '1', 6, 0, 1),
(29, '-1', 6, 1, 1),
(30, '-2', 6, 0, 1),
(31, '-3', 6, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `queryhandle`
--

CREATE TABLE IF NOT EXISTS `queryhandle` (
  `Student_Id` varchar(11) NOT NULL,
  `Notification` varchar(500) NOT NULL,
  `Query` varchar(500) NOT NULL,
  `Answer` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `queryhandle`
--

INSERT INTO `queryhandle` (`Student_Id`, `Notification`, `Query`, `Answer`) VALUES
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', ''),
('101', 'All', 'okay', '');

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE IF NOT EXISTS `questions` (
  `Question_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Questions` text NOT NULL,
  `Test_Id` int(11) NOT NULL,
  `Section_Id` int(11) NOT NULL,
  PRIMARY KEY (`Question_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=47 ;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`Question_Id`, `Questions`, `Test_Id`, `Section_Id`) VALUES
(1, 'Q1) What will be output of following c code?<br>\r\n<br>\r\n#include<stdio.h><br>\r\nextern int x;\r\nint main(){\r\n    do{\r\n        do{\r\n             printf("%o",x);\r\n         }\r\n         while(!-2);\r\n    }\r\n    while(0);\r\n    return 0;\r\n}\r\nint x=8;\r\n', 1, 1),
(2, 'Q2) What will be output of following c code?\r\n         \r\n#include<stdio.h>\r\nint main(){\r\n    int i=2,j=2;\r\n    while(i+1?--i:j++)\r\n         printf("%d",i);\r\n    return 0;\r\n}\r\n', 1, 1),
(3, 'what is ur name ?\r\n\r\n\r\n\r\n\r\n\r\n\r\n', 1, 1),
(4, 'Q4) #include<stdio.h>\r\nint main(){\r\n    int i,j;\r\n    i=j=2,3;\r\n    while(--i&&j++)\r\n         printf("%d %d",i,j);\r\n    return 0;\r\n}\r\n', 1, 1),
(5, '\r\nQ5) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nint main(){\r\n    static int i;\r\n    for(++i;++i;++i) {\r\n         printf("%d ",i);\r\n         if(i==4) break;\r\n    }\r\n    return 0;\r\n}\r\n', 1, 1),
(6, 'Q6) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nint main(){\r\n    int i=1;\r\n    for(i=0;i=-1;i=1) {\r\n         printf("%d ",i);\r\n         if(i!=1) break;\r\n    }\r\n    return 0;\r\n}\r\n', 1, 1),
(7, 'Q8) What will be output of following c code?\r\n         \r\n#include<stdio.h>\r\nint r();\r\nint main(){\r\n    for(r();r();r()) {\r\n         printf("%d ",r());\r\n    }\r\n    return 0;\r\n}\r\nint r(){\r\n    int static num=7;\r\n    return num--;\r\n}\r\n', 2, 1),
(8, 'Q9) What will be output of following c code?\r\n         \r\n#include<stdio.h>\r\n#define p(a,b) a##b\r\n#define call(x) #x\r\nint main(){\r\n    do{\r\n         int i=15,j=3;\r\n         printf("%d",p(i-+,+j));\r\n    }\r\n    while(*(call(625)+3));\r\n    return 0;\r\n}\r\n', 2, 1),
(9, '\r\nQ10) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nint main(){\r\n    int i;\r\n    for(i=0;i<=5;i++);\r\n    printf("%d",i)\r\n    return 0;\r\n}\r\n', 2, 1),
(10, 'Q11) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nint i=40;\r\nextern int i;\r\nint main(){\r\n    do{\r\n         printf("%d",i++);\r\n    }\r\n    while(5,4,3,2,1,0);\r\n    return 0;\r\n}\r\n', 2, 1),
(11, '\r\nQ12) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nchar _x_(int,...);\r\nint main(){\r\n    char (*p)(int,...)=&_x_;\r\n    for(;(*p)(0,1,2,3,4); )\r\n         printf("%d",!+2);\r\n    return 0;\r\n}\r\nchar _x_(int a,...){\r\n    static i=-1;\r\n    return i+++a;\r\n}\r\n', 2, 1),
(12, '\r\nQ13) What will be output of following c code?\r\n\r\n#include<stdio.h>\r\nint main(){\r\n    int i;\r\n    for(i=10;i<=15;i++){\r\n         while(i){\r\n             do{\r\n                 printf("%d ",1);\r\n                 if(i>>1)\r\n                      continue;\r\n             }while(0);\r\n             break;\r\n         }\r\n    }\r\n    return 0;\r\n}\r\n', 2, 1),
(13, 'Q14) How many times this loop will execute?\r\n\r\n#include<stdio.h>\r\nint main(){\r\n    char c=125;\r\n    do\r\n         printf("%d ",c);\r\n    while(c++);\r\n    return 0;\r\n}\r\n', 2, 1),
(14, 'Q15) What will be output of following c code?\r\n         \r\n#include<stdio.h>\r\nint main(){\r\n    int x=123;\r\n    int i={\r\n         printf("c" "++")\r\n    };\r\n    for(x=0;x<=i;x++){\r\n         printf("%x ",x);\r\n    }\r\n    return 0;\r\n}\r\n', 2, 1),
(15, 'what', 2, 2),
(16, 'what', 2, 2),
(17, 'what', 2, 2),
(18, 'what', 2, 2),
(19, 'what', 2, 2),
(20, 'what', 2, 2),
(21, 'what', 2, 2),
(22, 'what', 2, 2),
(23, 'what', 2, 2),
(24, 'what', 2, 2),
(25, 'what', 2, 2),
(26, 'what', 2, 2),
(27, 'what', 2, 2),
(28, 'what', 2, 2),
(31, 'what', 2, 2),
(32, 'what', 2, 2),
(33, 'what', 2, 2),
(34, 'what', 2, 2),
(35, 'what', 2, 2),
(36, 'what', 2, 2),
(37, 'what', 2, 2),
(38, 'what', 2, 2),
(39, 'what', 2, 2),
(40, 'what', 2, 2),
(41, 'what', 2, 2),
(42, 'what', 2, 2),
(43, 'what', 2, 2),
(44, 'what', 2, 2),
(45, 'what', 2, 2),
(46, 'what', 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `random_number`
--

CREATE TABLE IF NOT EXISTS `random_number` (
  `Random_Id` int(11) NOT NULL AUTO_INCREMENT,
  `RQuestion_No` int(11) NOT NULL,
  `Student_Id` int(11) NOT NULL,
  `Test_Id` int(11) NOT NULL,
  PRIMARY KEY (`Random_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `random_number`
--

INSERT INTO `random_number` (`Random_Id`, `RQuestion_No`, `Student_Id`, `Test_Id`) VALUES
(1, 2, 101, 1),
(2, 5, 101, 1),
(3, 5, 101, 1),
(4, 2, 101, 1),
(5, 3, 101, 1),
(6, 5, 101, 1),
(7, 5, 101, 1),
(8, 4, 101, 1),
(9, 5, 101, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sections`
--

CREATE TABLE IF NOT EXISTS `sections` (
  `Section_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Section_No` int(11) NOT NULL,
  `test_Id` int(11) NOT NULL,
  PRIMARY KEY (`Section_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `sections`
--

INSERT INTO `sections` (`Section_Id`, `Section_No`, `test_Id`) VALUES
(3, 2, 1),
(4, 3, 2);

-- --------------------------------------------------------

--
-- Table structure for table `student_login`
--

CREATE TABLE IF NOT EXISTS `student_login` (
  `Student_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_Name` varchar(30) NOT NULL,
  `Student_Password` varchar(30) NOT NULL,
  `Student_Subject` varchar(30) NOT NULL,
  PRIMARY KEY (`Student_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `student_login`
--

INSERT INTO `student_login` (`Student_Id`, `Student_Name`, `Student_Password`, `Student_Subject`) VALUES
(101, 'Prabhat', 'jain', 'Math'),
(102, 'Mayank', 'pass', 'English'),
(103, 'Jain', 'pass', 'Cyptography');

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE IF NOT EXISTS `student_marks` (
  `Student_Id` int(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Test_Id` int(11) NOT NULL,
  `Total_Marks` int(11) NOT NULL,
  `Marks_Obtain` int(11) NOT NULL,
  `Result_Date` date NOT NULL,
  `Subject` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_marks`
--

INSERT INTO `student_marks` (`Student_Id`, `Name`, `Test_Id`, `Total_Marks`, `Marks_Obtain`, `Result_Date`, `Subject`) VALUES
(101, 'Prabhat', 1, 100, 80, '2014-04-15', ''),
(102, 'Mayank', 1, 100, 85, '2014-04-22', ''),
(0, 'Lakshay', 1, 100, 75, '2014-04-15', ''),
(0, 'Sharma', 1, 100, 50, '2014-04-08', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_test`
--

CREATE TABLE IF NOT EXISTS `student_test` (
  `Student_Id` int(11) NOT NULL,
  `Test_Id` int(11) NOT NULL,
  `Question_Id` int(11) NOT NULL,
  `Option_Id` int(11) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  `Start_Time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_test`
--

INSERT INTO `student_test` (`Student_Id`, `Test_Id`, `Question_Id`, `Option_Id`, `Subject`, `Start_Time`) VALUES
(101, 1, 1, 101, 'Math', '2014-04-15 20:30:00'),
(101, 1, 1, 101, 'Math', '2014-04-15 20:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `stud_checkd_option`
--

CREATE TABLE IF NOT EXISTS `stud_checkd_option` (
  `Question_Id` int(11) NOT NULL,
  `Click` varchar(50) NOT NULL,
  `Student_Id` int(11) NOT NULL,
  `Test_Id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teacher_login`
--

CREATE TABLE IF NOT EXISTS `teacher_login` (
  `Teacher_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Password` varchar(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  PRIMARY KEY (`Teacher_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1003 ;

--
-- Dumping data for table `teacher_login`
--

INSERT INTO `teacher_login` (`Teacher_Id`, `Password`, `Name`, `Subject`) VALUES
(1001, 'pass', 'Mr. sharma', 'English'),
(1002, 'pass', 'Mr. Jain', 'English');

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `Test_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Time` time NOT NULL,
  `Date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Teacher_Id` int(11) NOT NULL,
  `Subject` varchar(30) NOT NULL,
  PRIMARY KEY (`Test_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`Test_Id`, `Time`, `Date`, `Teacher_Id`, `Subject`) VALUES
(1, '00:00:10', '2014-04-07 09:43:38', 1001, 'Math');

-- --------------------------------------------------------

--
-- Table structure for table `timer`
--

CREATE TABLE IF NOT EXISTS `timer` (
  `Student` int(11) NOT NULL,
  `Test_Id` int(11) NOT NULL,
  `min` varchar(11) NOT NULL,
  `sec` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `timer`
--

INSERT INTO `timer` (`Student`, `Test_Id`, `min`, `sec`) VALUES
(1, 2, '60', '1'),
(1, 2, '60', '1'),
(1, 2, '59', '58'),
(1, 2, '59', '59');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
