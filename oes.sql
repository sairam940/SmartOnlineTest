-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Nov 18, 2018 at 06:37 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.5.37

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `oes`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `email`, `password`, `added_date`) VALUES
(1, 'Dharmesh', 'admin@gmail.com', '123', '2018-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `chat`
--

CREATE TABLE `chat` (
  `id` int(11) NOT NULL,
  `user_type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `user_comment` mediumtext NOT NULL,
  `comment_date` varchar(255) NOT NULL,
  `admin_reply` mediumtext NOT NULL,
  `reply_date` varchar(255) NOT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chat`
--

INSERT INTO `chat` (`id`, `user_type`, `name`, `email`, `phone`, `user_comment`, `comment_date`, `admin_reply`, `reply_date`, `added_date`) VALUES
(1, 'Student', 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', '8286847818', 'Hello Admin', '2018-11-12 00:33:40', '', '', '2018-11-12'),
(2, 'Student', 'Vinay SIngh', 'vinay123@gmail.com', '809731866', 'hi admin i have a issue with the profile. please help.', '2018-11-12 23:41:25', 'sure I will guide you. Need more details', '2018-11-12 23:43:31', '2018-11-12'),
(3, 'Student', 'Vinay SIngh', 'vinay123@gmail.com', '809731866', 'Thanks.', '2018-11-13 22:45:52', '', '', '2018-11-13'),
(4, 'Faculty', 'Dinesh Sharma', 'dinesh12@gmail.com', '1234567800', 'Hi', '2018-11-13 22:59:43', '', '', '2018-11-13');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` mediumtext NOT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `phone`, `message`, `added_date`) VALUES
(1, 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', '8286847818', 'Hello', '2018-11-12'),
(2, 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', '8286847818', 'Hello', '2018-11-12'),
(3, 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', '8097318667', 'hi', '2018-11-12'),
(4, 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', '1020304050', 'Hello', '2018-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `fname` varchar(50) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `qualification` varchar(50) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `confirm_password` varchar(50) NOT NULL,
  `added_date` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty`
--

INSERT INTO `faculty` (`id`, `fname`, `lname`, `email`, `qualification`, `phone`, `password`, `confirm_password`, `added_date`) VALUES
(1, 'John', 'Doe', 'john@gmail.com', 'MSC- IT', '1234567890', 'John@123', 'John@123', '2018-10-02'),
(2, 'Dharmesh', 'Mourya', 'dharmesh12@gmail.com', 'MSC-IT', '8097318667', 'Dharmya123', 'Dharmya12', '2018-10-14'),
(3, 'Dinesh', 'Sharma', 'dinesh12@gmail.com', 'B.Tech', '1234567800', 'Dinesh123', 'Dinesh123', '2018-10-25');

-- --------------------------------------------------------

--
-- Table structure for table `faculty_student`
--

CREATE TABLE `faculty_student` (
  `id` int(11) NOT NULL,
  `faculty_email` varchar(255) NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  `student_email` varchar(255) NOT NULL,
  `student_name` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `total_question` int(11) NOT NULL,
  `time_duration` varchar(255) NOT NULL,
  `total_marks` int(11) NOT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faculty_student`
--

INSERT INTO `faculty_student` (`id`, `faculty_email`, `faculty_name`, `student_email`, `student_name`, `subject`, `total_question`, `time_duration`, `total_marks`, `added_date`) VALUES
(1, 'john@gmail.com', 'John Doe', 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'CPP', 10, '10 minutes', 10, '2018-11-12'),
(2, 'john@gmail.com', 'John Doe', 'ashish002@gmail.com', 'Ashish Kumar', 'CPP', 10, '10 minutes', 10, '2018-11-12'),
(3, 'john@gmail.com', 'John Doe', 'vinay123@gmail.com', 'Vinay SIngh', 'CPP', 10, '10 minutes', 10, '2018-11-12'),
(4, 'dharmesh12@gmail.com', 'Dharmesh Mourya', 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'JAVA', 10, '10 minutes', 10, '2018-11-12'),
(5, 'dharmesh12@gmail.com', 'Dharmesh Mourya', 'ashish002@gmail.com', 'Ashish Kumar', 'JAVA', 10, '10 minutes', 10, '2018-11-12'),
(6, 'dharmesh12@gmail.com', 'Dharmesh Mourya', 'vinay123@gmail.com', 'Vinay SIngh', 'JAVA', 10, '10 minutes', 10, '2018-11-12'),
(7, 'dinesh12@gmail.com', 'Dinesh Sharma', 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'PHP', 10, '10 minutes', 10, '2018-11-12'),
(8, 'dinesh12@gmail.com', 'Dinesh Sharma', 'ashish002@gmail.com', 'Ashish Kumar', 'PHP', 10, '10 minutes', 10, '2018-11-12'),
(9, 'dinesh12@gmail.com', 'Dinesh Sharma', 'vinay123@gmail.com', 'Vinay SIngh', 'PHP', 10, '10 minutes', 10, '2018-11-12'),
(10, 'dharmesh12@gmail.com', 'Dharmesh Mourya', 'sai.ram940@gmail.com', 'Sai Ram Pullabhotla', 'CPP', 10, '10 minutes', 10, '2018-11-13'),
(12, 'john@gmail.com', 'John Doe', 'sai.ram940@gmail.com', 'Sai Ram Pullabhotla', 'JAVA', 10, '10 minutes', 10, '2018-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE `question` (
  `id` int(11) NOT NULL,
  `ques_number` int(11) NOT NULL,
  `sub_id` int(11) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `question` varchar(255) NOT NULL,
  `option1` varchar(255) DEFAULT NULL,
  `option2` varchar(255) DEFAULT NULL,
  `option3` varchar(255) DEFAULT NULL,
  `option4` varchar(255) DEFAULT NULL,
  `ques_set` varchar(255) NOT NULL,
  `answer` varchar(255) DEFAULT NULL,
  `ques_level` varchar(255) DEFAULT NULL,
  `faculty_name` varchar(255) NOT NULL,
  `added_date` varchar(255) DEFAULT NULL,
  `updated_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`id`, `ques_number`, `sub_id`, `sub_name`, `question`, `option1`, `option2`, `option3`, `option4`, `ques_set`, `answer`, `ques_level`, `faculty_name`, `added_date`, `updated_date`) VALUES
(1, 1, 1, 'JAVA', 'Which statement is true?', 'A try statement must have at least one corresponding catch block.	', 'Multiple catch statements can catch the same class of exception more than once.', 'An Error that might be thrown in a method must be declared as thrown by that method, or be handled within that method.', 'Except in case of VM shutdown, if a try block starts to execute, a corresponding finally block will always start to execute.', 'A', 'Except in case of VM shutdown, if a try block starts to execute, a corresponding finally block will always start to execute.', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(2, 2, 1, 'JAVA', 'What is the most restrictive access modifier that will allow members of one class to have access to members of another class in the same package?', 'public', 'protected', 'synchronized', 'default access', 'A', 'default access', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(3, 3, 1, 'JAVA', 'What is the numerical range of a char?', '0 to 65535', '-128 to 127', '-(215) to (215) - 1', '0 to 32767', 'A', '0 to 65535', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(4, 4, 1, 'JAVA', 'Which is a valid keyword in JAVA?', 'interface', 'string', 'Float', 'unsigned', 'A', 'interface', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(5, 5, 1, 'JAVA', 'Which one of the following will declare an array and initialize it with five numbers?', 'Array a = new Array(5);', 'int [] a = {23,22,21,20,19};', 'int a [] = new int[5];    ', 'int [5] array;', 'A', 'int [] a = {23,22,21,20,19};', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(6, 6, 1, 'JAVA', 'Which of the following would compile without error?', 'int a = Math.abs(-5);', 'int b = Math.abs(5.0);', 'int c = Math.abs(5.5F);', 'int d = Math.abs(5L);', 'A', 'int a = Math.abs(-5);', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(7, 7, 1, 'JAVA', 'Which is true about an anonymous inner class?', 'It can extend exactly one class and implement exactly one interface.', 'It can extend exactly one class and can implement multiple interfaces.', 'It can extend exactly one class or implement exactly one interface.', 'It can implement multiple interfaces regardless of whether it also extends a class.', 'A', 'It can extend exactly one class or implement exactly one interface.', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(8, 8, 1, 'JAVA', 'Which is true about a method-local inner class?', 'It must be marked final.', 'It can be marked abstract.', 'It can be marked public.', 'It can be marked static.', 'A', 'It can be marked abstract.', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(9, 9, 1, 'JAVA', 'Which statement is true about a static nested class?', 'You must have a reference to an instance of the enclosing class in order to instantiate it.', 'It does not have access to nonstatic members of the enclosing class.', 'It''s variables and methods must be static.', 'It must extend the enclosing class.', 'A', 'It does not have access to nonstatic members of the enclosing class.', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(10, 10, 1, 'JAVA', 'Which constructs an anonymous inner class instance?', 'Runnable r = new Runnable() { };', 'Runnable r = new Runnable(public void run() { });', 'Runnable r = new Runnable { public void run(){}};', 'System.out.println(new Runnable() {public void run() { }});', 'A', 'System.out.println(new Runnable() {public void run() { }});', 'Easy', 'Dharmesh Mourya', '2018-07-16', '2018-07-16'),
(11, 1, 2, 'CPP', 'A default catch block catches', 'all thrown objects', 'no thrown objects', 'any thrown object that has not been caught by an earlier catch block', 'all thrown objects that have been caught by an earlier catch block', 'A', 'any thrown object that has not been caught by an earlier catch block', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(12, 2, 2, 'CPP', 'Format flags may be combined using', 'the bitwise OR operator (|)', 'the logical OR operator (||)', 'the bitwise AND operator (&)', 'the logical AND operator (&&)', 'A', 'the bitwise OR operator (|)', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(13, 3, 2, 'CPP', 'To expose a data member to the program, you must declare the data member in the _____ section of the class', 'common', 'exposed', 'public', 'unrestricted', 'A', 'public', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(14, 4, 2, 'CPP', 'Which of the following are valid characters for a numeric literal constant?', 'a comma', 'a dollar sign ($)', 'a percent sign (%)', 'None of the above', 'A', 'None of the above', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(15, 5, 2, 'CPP', 'A function that changes the state of the cout object is called a(n) _____', 'member', 'adjuster', 'manipulator', 'operator', 'A', 'manipulator', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(16, 6, 2, 'CPP', 'A C++ program contains a function with the header int function(double d, char c). Which of the following function headers could be used within the same program?', 'char function(double d, char c)', 'int function(int d, char c)', 'both (a) and (b)', 'neither (a) nor (b)', 'A', 'int function(int d, char c)', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(17, 7, 2, 'CPP', 'When the compiler cannot differentiate between two overloaded constructors, they are called', 'overloaded', 'destructed', 'ambiguous', 'dubious', 'A', 'ambiguous', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(18, 8, 2, 'CPP', 'If you design a class that needs special initialization tasks, you will want to design a(n) _____', 'housekeeping routine', 'initializer', 'constructor', 'compiler', 'A', 'constructor', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(19, 9, 2, 'CPP', 'Which type of statement does not occur in computer programs?', 'sequence', 'loop', 'denial', 'selection', 'A', 'denial', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(20, 10, 2, 'CPP', 'The newline character is always included between', 'pair of parentheses', 'pair of curly braces', 'control string', '&', 'A', 'control string', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(21, 11, 2, 'CPP', 'To be called object-oriented, a programming language must allow', 'functions that return only a single value', '#include files', 'inheritance', 'All of the above', 'A', 'inheritance', 'Easy', 'John Doe', '2018-07-16', '2018-07-16'),
(22, 1, 3, 'PHP', 'Who is the father of PHP?', 'Rasmus Lerdorf', 'Willam Makepiece', 'Drek Kolkevi', 'List Barely', 'A', 'Rasmus Lerdorf', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-10-27'),
(23, 2, 3, 'PHP', 'PHP files have a default file extension of.', '.html', '.xml', '.php', '.ph', 'A', '.php', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(24, 3, 3, 'PHP', 'A PHP script should start with ___ and end with ___:', '< php >', '< ? php ?>', '< ? ? >', '< ?php ? >', 'A', '< ?php ? >', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(25, 4, 3, 'PHP', 'Which version of PHP introduced Try/catch Exception?', 'PHP 4', 'PHP 5', 'PHP 5.3', 'PHP 6', 'A', 'PHP 5', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(26, 5, 3, 'PHP', 'Which of the below symbols is a newline character?', '\\r', '\\n', '/n', ' /r', 'A', '\\n', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(27, 6, 3, 'PHP', 'If $a = 12 what will be returned when ($a == 12) ? 5 : 1 is executed?', '12', '1', 'Error', '5', 'A', '5', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(28, 7, 3, 'PHP', 'Which of the below statements is equivalent to $add += $add ?', '$add = $add', '$add = $add +$add', '$add = $add + 1', '$add = $add + $add + 1', 'A', '$add = $add +$add', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(29, 8, 3, 'PHP', 'Which statement will output $x on the screen?', 'echo “\\$x”;', 'echo “$$x”;', 'echo “/$x”;', 'echo “$x;', 'A', 'echo “\\$x”;', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(30, 9, 3, 'PHP', 'What PHP stands for?', 'Hypertext Preprocessor', 'Pre Hypertext Processor', 'Pre Hyper Processor', 'Pre Hypertext Process', 'A', 'Pre Hypertext Process', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16'),
(31, 10, 3, 'PHP', 'Variables always start with a ........ in PHP', 'Pond-sign', 'Yen-sign', 'Dollar-sign', 'Euro-sign', 'A', 'Dollar-sign', 'Easy', 'Dinesh Sharma', '2018-07-16', '2018-07-16');

-- --------------------------------------------------------

--
-- Table structure for table `result`
--

CREATE TABLE `result` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `sname` varchar(255) NOT NULL,
  `sub_name` varchar(255) NOT NULL,
  `faculty_email` varchar(255) NOT NULL,
  `total_question` int(11) DEFAULT NULL,
  `time_duration` varchar(255) DEFAULT NULL,
  `question_attended` int(11) DEFAULT NULL,
  `marks_obtained` int(11) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `percentage` float DEFAULT NULL,
  `ques_level` varchar(255) DEFAULT NULL,
  `ques_set` varchar(255) NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `added_date` varchar(255) DEFAULT NULL,
  `updated_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `result`
--

INSERT INTO `result` (`id`, `email`, `sname`, `sub_name`, `faculty_email`, `total_question`, `time_duration`, `question_attended`, `marks_obtained`, `total_marks`, `percentage`, `ques_level`, `ques_set`, `remarks`, `added_date`, `updated_date`) VALUES
(1, 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'CPP', 'dharmesh12@gmail.com', 10, '10 minutes', 8, 7, 10, 70, 'Easy', 'A', 'Pass', '2018-11-12', '2018-11-12'),
(2, 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'JAVA', 'john@gmail.com', 10, '10 minutes', 6, 4, 10, 40, 'Easy', 'A', 'Pass', '2018-11-12', '2018-11-12'),
(3, 'dharmeshmourya043@gmail.com', 'Dharmesh Mourya', 'PHP', 'dinesh12@gmail.com', 10, '10 minutes', 3, 1, 10, 10, 'Easy', 'A', 'Fail', '2018-11-12', '2018-11-12'),
(4, 'ashish002@gmail.com', 'Ashish Kumar', 'JAVA', 'john@gmail.com', 10, '10 minutes', 10, 6, 10, 60, 'Easy', 'A', 'Pass', '2018-11-12', '2018-11-12'),
(5, 'vinay123@gmail.com', 'Vinay SIngh', 'CPP', 'dharmesh12@gmail.com', 10, '10 minutes', 10, 7, 10, 70, 'Easy', 'A', 'Pass', '2018-11-12', '2018-11-12'),
(6, 'vinay123@gmail.com', 'Vinay SIngh', 'JAVA', 'john@gmail.com', 10, '10 minutes', 10, 4, 10, 40, 'Easy', 'A', 'Pass', '2018-11-12', '2018-11-12'),
(11, 'sai.ram940@gmail.com', 'Sai Ram Pullabhotla', 'CPP', 'john@gmail.com', 10, '10 minutes', 9, 7, 10, 70, 'Easy', 'A', 'Pass', '2018-11-17', '2018-11-17'),
(12, 'sai.ram940@gmail.com', 'Sai Ram Pullabhotla', 'JAVA', 'dharmesh12@gmail.com', 10, '10 minutes', 2, 2, 10, 20, 'Easy', 'A', 'Fail', '2018-11-18', '2018-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `photo` varchar(1000) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `cpass` varchar(255) NOT NULL,
  `added_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`id`, `fname`, `lname`, `email`, `photo`, `dob`, `age`, `gender`, `phone`, `pass`, `cpass`, `added_date`) VALUES
(1, 'Dharmesh', 'Mourya', 'dharmeshmourya043@gmail.com', 'resources/dharmesh1.jpg', '1996-01-04', '22', 'Male', '8286847818', 'Dharmesh123', 'Dharmesh123', '2018-11-13'),
(2, 'Ashish', 'Kumar', 'ashish002@gmail.com', 'resources/dharmesh1.jpg', '1996-11-08', '22', 'Male', '123456020', 'Ashish123', 'Ashish123', '2018-11-11'),
(3, 'Vinay', 'SIngh', 'vinay123@gmail.com', 'resources/dharmesh1.jpg', '1998-11-12', '20', 'Male', '809731866', 'Vinay123', 'Vinay123', '2018-11-11'),
(4, 'Sai Ram', 'Pullabhotla', 'sai.ram940@gmail.com', 'resources/dharmesh1.jpg', '1993-11-15', '24', 'Male', '8097000666', 'Sai123', 'Sai123', '2018-11-12');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `faculty_email` varchar(255) NOT NULL,
  `total_question` int(11) DEFAULT NULL,
  `time_duration` varchar(255) DEFAULT NULL,
  `total_marks` int(11) DEFAULT NULL,
  `added_date` varchar(255) DEFAULT NULL,
  `updated_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `faculty_email`, `total_question`, `time_duration`, `total_marks`, `added_date`, `updated_date`) VALUES
(1, 'JAVA', 'john@gmail.com', 10, '10 minutes', 10, '2018-11-12', '2018-11-12'),
(2, 'CPP', 'dharmesh12@gmail.com', 10, '10 minutes', 10, '2018-11-12', '2018-11-12'),
(3, 'PHP', 'dinesh12@gmail.com', 10, '10 minutes', 10, '2018-11-12', '2018-11-12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `faculty_student`
--
ALTER TABLE `faculty_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_id` (`sub_id`);

--
-- Indexes for table `result`
--
ALTER TABLE `result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sid` (`email`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `chat`
--
ALTER TABLE `chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `faculty_student`
--
ALTER TABLE `faculty_student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `result`
--
ALTER TABLE `result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`sub_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
