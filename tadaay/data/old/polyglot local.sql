-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2017 at 01:31 PM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `polyglot`
--

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_address`
--

CREATE TABLE `app_polyglot_address` (
  `id` int(11) NOT NULL,
  `address_line_1` varchar(50) NOT NULL,
  `address_line_2` varchar(50) DEFAULT NULL,
  `address_line_3` varchar(50) DEFAULT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  `zip_code` varchar(6) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_address`
--

INSERT INTO `app_polyglot_address` (`id`, `address_line_1`, `address_line_2`, `address_line_3`, `city`, `state`, `zip_code`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'Kondapur', 'Opposite Harsh toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-20 23:21:02'),
(2, 'Kondapur', 'Opposite Harsh toyota', 'Kondapur', 'Hyderabad', 'Andhra Pradesh', '500038', -1, '2017-03-21 19:40:49'),
(3, 'Kondapur', 'Opposite Harsh toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:40:44'),
(4, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-03-21 19:40:59'),
(5, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 18:56:03'),
(6, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 18:59:45'),
(7, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:01:01'),
(8, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:02:17'),
(9, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:02:34'),
(10, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:03:36'),
(11, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:04:01'),
(12, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:05:19'),
(13, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:05:38'),
(14, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:05:47'),
(15, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:06:15'),
(16, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:08:50'),
(17, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:09:30'),
(18, 'Kondapur', 'Opposite Harsha toyota', 'Kondapur', 'Hyderabad', 'Telangana', '500038', -1, '2017-03-21 19:14:40'),
(19, 'In Kondapy', 'No Apartment', 'Kukatpally', 'Hyderabad', 'Telangana', '500034', -1, '2017-03-29 22:26:52'),
(20, 'some address', 'HDFCbank', 'Miyapur', 'Hyderabad', 'Telangana', '500035', -1, '2017-03-26 16:38:36'),
(21, 'Flat No 604', 'Buddha heights', 'Miyapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-04-08 20:45:16'),
(22, '604', 'Buddha heights', 'Miyapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-07-26 15:51:15'),
(23, 'New Address', '104', 'Miyapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-09-02 15:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_batch`
--

CREATE TABLE `app_polyglot_batch` (
  `batch_id` int(11) NOT NULL,
  `ply_batch_no` varchar(50) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `schedule` varchar(30) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `branch_name` varchar(100) NOT NULL,
  `fee_discount` double NOT NULL,
  `batch_status` varchar(50) NOT NULL,
  `start_date` varchar(10) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_branch`
--

CREATE TABLE `app_polyglot_branch` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_branch`
--

INSERT INTO `app_polyglot_branch` (`id`, `partner_id`, `name`, `address_id`, `contact_id`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 'Miyapur Branch', 22, 31, -1, '2017-07-26 15:51:15'),
(2, 1, 'New Branch', 23, 32, -1, '2017-09-02 15:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_contact`
--

CREATE TABLE `app_polyglot_contact` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_contact`
--

INSERT INTO `app_polyglot_contact` (`id`, `name`, `mobile_number`, `email`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(3, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-20 23:21:02'),
(4, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:40:49'),
(5, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:40:44'),
(6, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:40:59'),
(7, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 18:56:03'),
(8, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 18:59:45'),
(9, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:01:01'),
(10, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:02:17'),
(11, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:02:34'),
(12, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:03:36'),
(13, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:04:01'),
(14, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:05:19'),
(15, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:05:38'),
(16, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:05:47'),
(17, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:06:15'),
(18, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:08:50'),
(19, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:09:30'),
(20, 'Satheesh', '1234567890', 'asdsad@adsad.com', -1, '2017-03-21 19:14:40'),
(21, '', '9876543210', 'test@test.com', -1, '2017-03-29 22:26:52'),
(22, 'Satheesh', '1234567980', 'asdad@asddad.com', -1, '2017-03-26 16:38:36'),
(23, 'Vishy', '8464071773', 'vishwann@gmail.com', -1, '2017-04-08 20:45:16'),
(24, '', '', '', -1, '2017-04-10 08:23:07'),
(25, '', '', '', -1, '2017-04-10 08:24:53'),
(26, '', '', '', -1, '2017-04-10 08:25:43'),
(27, '', '', '', -1, '2017-04-10 08:26:20'),
(28, '', '', '', -1, '2017-04-10 08:35:35'),
(29, '', '', '', -1, '2017-04-10 08:37:48'),
(30, '', '', '', -1, '2017-04-10 08:40:57'),
(31, 'New Contact', '8464071773', 'vishwann@gmail.com', -1, '2017-07-26 15:51:15'),
(32, 'vishy', '846407177', 'viasda@asdad.com', -1, '2017-09-02 15:48:05');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_course`
--

CREATE TABLE `app_polyglot_course` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `schedule` varchar(30) NOT NULL,
  `duration` int(11) NOT NULL,
  `duration_type` varchar(30) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_course`
--

INSERT INTO `app_polyglot_course` (`id`, `partner_id`, `name`, `schedule`, `duration`, `duration_type`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 'Javascript', 'Weekdays', 5, 'weeks', -1, '2017-07-26 15:50:31');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_demo`
--

CREATE TABLE `app_polyglot_demo` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_faculty`
--

CREATE TABLE `app_polyglot_faculty` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `mode` varchar(45) DEFAULT NULL,
  `lastInsrtUpdUsrId` int(11) DEFAULT NULL,
  `lastInsrtUpdTs` date DEFAULT NULL,
  `courseId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_polyglot_faculty`
--

INSERT INTO `app_polyglot_faculty` (`id`, `partner_id`, `name`, `mobile`, `emailId`, `mode`, `lastInsrtUpdUsrId`, `lastInsrtUpdTs`, `courseId`) VALUES
(1, 1, 'Vishwanath', '8464071773', 'vishwann@gmail.com', 'ClassRoom', -1, '2017-07-26', 35);

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_lead`
--

CREATE TABLE `app_polyglot_lead` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `course` varchar(100) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mode` varchar(50) DEFAULT NULL,
  `schedule` varchar(30) DEFAULT NULL,
  `branch` int(11) DEFAULT NULL,
  `preferred_time` varchar(20) DEFAULT NULL,
  `source` varchar(50) NOT NULL,
  `reffered_by` varchar(50) DEFAULT NULL,
  `batch_id` varchar(50) DEFAULT NULL,
  `lead_status` varchar(50) DEFAULT NULL,
  `comments` varchar(250) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL DEFAULT '-1',
  `last_insrt_upd_ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_lead`
--

INSERT INTO `app_polyglot_lead` (`id`, `partner_id`, `first_name`, `last_name`, `course`, `mobile`, `email`, `mode`, `schedule`, `branch`, `preferred_time`, `source`, `reffered_by`, `batch_id`, `lead_status`, `comments`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 'vishy', 'nadimpally', 'Javascript', '8464071773', 'vishwann@gmail.com', 'Class Room', 'Weekdays', 1, '12:30 PM-01:30 PM', 'Online', NULL, NULL, 'PROPOSED', NULL, -1, '2017-07-26 15:52:05'),
(37, 1, 'srinivasa', 'A', 'devops', '9533797976', 'No Email Provided', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, 'SCHEDULED', 'next batch', -1, '2017-07-26 17:01:33'),
(38, 1, 'sudheer', 'B', 'linux', '9492931819', 'No Email Provided', 'regular', NULL, NULL, '11-1pm', 'Not Known', NULL, NULL, 'SCHEDULED', 'finished linux', -1, '2017-07-26 17:01:33'),
(39, 1, 'rama krishna', 'C', 'aws+devops', '8106830830', 'ramtest0@gmail.com', 'regular', NULL, NULL, '3-5pm', 'Not Known', NULL, NULL, 'COMPLETED', 'finished', -1, '2017-07-26 17:01:33'),
(40, 1, 'wahwda', 'D', 'aws', '8380078876', 'waheeda806@gmail.com', 'regular', NULL, NULL, '3-5pm', 'pamphlet', NULL, NULL, 'COMPLETED', 'Completed', -1, '2017-07-26 17:01:33'),
(41, 1, 'srinivasa rao', 'Rao', 'devops', '9885642199', 'srinivasrao.konakanchi@gmail.com', 'weekend', NULL, NULL, NULL, 'urbanpro', NULL, NULL, 'INVITED', 'invited to Linux 16/07', -1, '2017-07-26 17:01:33'),
(42, 1, 'murali', 'Test', 'linux+devops', '7032640061', 'nmkmailbox@gmail.com', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, NULL, '7 to 9AM', -1, '2017-07-26 17:01:33'),
(43, 1, 'teja', 'Teja', 'devops', '7893802045', 'tejaharley@gmail.com', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, 'SCHEDULED', 'joined 3-5PM', -1, '2017-07-26 17:01:33'),
(44, 1, 'hari', 'gudiya', 'aws', '8861828888', 'hari.gudiya@gmail.com', 'online', NULL, NULL, NULL, 'Not Known', NULL, NULL, NULL, '(hold fr 2 mnths)', -1, '2017-07-26 17:01:33'),
(45, 1, 'karthik', 'Reddy', 'linux+aws', '9701120811', 'No Email Provided', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, 'ENROLLED', 'joined', -1, '2017-07-26 17:01:33'),
(46, 1, 'narendra reddy', 'reddy', 'AWS', '7799206699', 'narendra9599@gmail.com', 'regular', NULL, NULL, NULL, 'pamphlet', NULL, NULL, 'SCHEDULED', 'next batch', -1, '2017-07-26 17:01:33'),
(47, 1, 'satya', 'S', 'linux', '9032466844', 'No Email Provided', 'regular', NULL, NULL, NULL, 'urbanpro', NULL, NULL, 'INVITED', '7 to 9AM', -1, '2017-07-26 17:01:33'),
(48, 1, 'ramesh', 'R', 'aws', '9959356689', 'kulkram1989@gmail.com', 'regular', NULL, NULL, '3-5pm', 'urban pro', NULL, NULL, NULL, 'cl again', -1, '2017-07-26 17:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_payment`
--

CREATE TABLE `app_polyglot_payment` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `total_fee` double NOT NULL,
  `fee_paid` double NOT NULL,
  `fee_pending` double NOT NULL,
  `mode` varchar(10) NOT NULL,
  `transaction_ref` varchar(50) NOT NULL,
  `opted_discount` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_plan`
--

CREATE TABLE `app_polyglot_plan` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(100) NOT NULL,
  `subscription_date` datetime NOT NULL,
  `expiration_date` datetime NOT NULL,
  `partner_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `is_expired` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_plan`
--

INSERT INTO `app_polyglot_plan` (`id`, `plan_name`, `subscription_date`, `expiration_date`, `partner_id`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`, `is_expired`) VALUES
(1, 'DEFAULT PLAN', '2017-08-17 14:10:57', '2017-09-16 14:10:55', 1, 1, '2017-08-17 14:10:57', '');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_student`
--

CREATE TABLE `app_polyglot_student` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `joined_date` varchar(10) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `next_interest` varchar(100) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_student`
--

INSERT INTO `app_polyglot_student` (`id`, `partner_id`, `student_name`, `course_name`, `mode`, `joined_date`, `status`, `next_interest`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 'Vishy Nadimpally', 'Javascript', 'Class Room', '26/07/2017', 'ENROLLED', 'Java', -1, '2017-07-26 15:57:19');

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--

CREATE TABLE `app_users` (
  `fname` varchar(20) DEFAULT NULL,
  `lname` varchar(20) DEFAULT NULL,
  `userType` char(1) DEFAULT NULL,
  `emailId` varchar(45) DEFAULT NULL,
  `mobile` varchar(10) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `dob` datetime DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `flatno` varchar(45) DEFAULT NULL,
  `aprtmentName` varchar(45) DEFAULT NULL,
  `area` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `branch` varchar(45) DEFAULT NULL,
  `passoutYr` int(11) DEFAULT NULL,
  `percentage` int(11) DEFAULT NULL,
  `compName` varchar(45) DEFAULT NULL,
  `designation` varchar(45) DEFAULT NULL,
  `yrsofexp` int(11) DEFAULT NULL,
  `skills` varchar(45) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `inst_estbl_date` datetime DEFAULT NULL,
  `inst_name` varchar(45) DEFAULT NULL,
  `inst_founder` varchar(45) DEFAULT NULL,
  `contact_person` varchar(45) DEFAULT NULL,
  `contact_email` varchar(45) DEFAULT NULL,
  `contact_landline` varchar(45) DEFAULT NULL,
  `contact_mobile` varchar(10) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `dsbl_in` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `app_users`
--

INSERT INTO `app_users` (`fname`, `lname`, `userType`, `emailId`, `mobile`, `password`, `dob`, `gender`, `flatno`, `aprtmentName`, `area`, `city`, `state`, `pincode`, `qualification`, `branch`, `passoutYr`, `percentage`, `compName`, `designation`, `yrsofexp`, `skills`, `last_insrt_upd_ts`, `inst_estbl_date`, `inst_name`, `inst_founder`, `contact_person`, `contact_email`, `contact_landline`, `contact_mobile`, `country`, `dsbl_in`, `last_insrt_upd_usr_id`, `id`) VALUES
(NULL, NULL, 'P', 'vishwann@gmail.com', '8464071773', 'Change100$', NULL, NULL, '04', 'Buddha heights', 'Miyapur', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2017-07-26 13:12:21', '2017-07-26 00:00:00', 'My Institute', 'Me', 'vishy', 'vishwann@gmail.com', NULL, '8464071773', '1', 'N', -1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dmn_cities`
--

CREATE TABLE `dmn_cities` (
  `city_id` int(11) NOT NULL,
  `city_desc` varchar(45) DEFAULT NULL,
  `city_long_desc` varchar(45) DEFAULT NULL,
  `city_code` varchar(5) DEFAULT NULL,
  `state_id` int(11) NOT NULL,
  `dsbl_in` varchar(1) NOT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dmn_cities`
--

INSERT INTO `dmn_cities` (`city_id`, `city_desc`, `city_long_desc`, `city_code`, `state_id`, `dsbl_in`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'Hyderabad', 'Old City', 'HYD', 1, 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dmn_cntry`
--

CREATE TABLE `dmn_cntry` (
  `cntry_id` int(11) NOT NULL,
  `cntry_desc` varchar(45) NOT NULL,
  `cntry_code` varchar(5) NOT NULL,
  `cntry_long_desc` varchar(45) DEFAULT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dmn_cntry`
--

INSERT INTO `dmn_cntry` (`cntry_id`, `cntry_desc`, `cntry_code`, `cntry_long_desc`, `dsbl_in`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'INDIA', 'IND', 'Republic of India', 'N', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `dmn_courses_tests`
--

CREATE TABLE `dmn_courses_tests` (
  `courseId` int(11) NOT NULL,
  `testId` int(11) NOT NULL,
  `question` varchar(145) DEFAULT NULL,
  `choice_a` varchar(145) DEFAULT NULL,
  `correct_choice` varchar(1) DEFAULT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `choice_b` varchar(45) DEFAULT NULL,
  `choice_c` varchar(45) DEFAULT NULL,
  `choice_d` varchar(45) DEFAULT NULL,
  `question_no` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `dmn_course_list`
--

CREATE TABLE `dmn_course_list` (
  `id` int(11) NOT NULL,
  `field_name` varchar(75) DEFAULT NULL,
  `category` varchar(75) DEFAULT NULL,
  `sub_category` varchar(75) DEFAULT NULL,
  `course_name` varchar(100) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dmn_course_list`
--

INSERT INTO `dmn_course_list` (`id`, `field_name`, `category`, `sub_category`, `course_name`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'IT', 'Cloud Computing', 'AWS', 'AWS - Administration ( Solution Architect - Associate )', -1, '2017-03-12 00:00:00'),
(2, 'IT', 'Cloud Computing', 'AWS', 'AWS - Administration ( Solution Architect - Professional)', -1, '2017-03-12 00:00:00'),
(3, 'IT', 'Cloud Computing', 'AWS', 'AWS - Development ( Developer Associate )', -1, '2017-03-12 00:00:00'),
(4, 'IT', 'Cloud Computing', 'AWS', 'AWS - DevOps', -1, '2017-03-12 00:00:00'),
(5, 'IT', 'Cloud Computing', 'Microsoft - Azure', 'Azure - Administration', -1, '2017-03-12 00:00:00'),
(6, 'IT', 'Cloud Computing', 'Microsoft - Azure', 'Azure - Development', -1, '2017-03-12 00:00:00'),
(7, 'IT', 'Cloud Computing', 'Openstack', 'Openstack - Administration', -1, '2017-03-12 00:00:00'),
(8, 'IT', 'Cloud Computing', 'Salesforce', 'Salesforce-Admin', -1, '2017-03-12 00:00:00'),
(9, 'IT', 'Cloud Computing', 'Salesforce', 'Salesforce-Development', -1, '2017-03-12 00:00:00'),
(10, 'IT', 'DevOps', 'Tools', 'Jenkins', -1, '2017-03-12 00:00:00'),
(11, 'IT', 'DevOps', 'Tools', 'Docker', -1, '2017-03-12 00:00:00'),
(12, 'IT', 'DevOps', 'Tools', 'Puppet', -1, '2017-03-12 00:00:00'),
(13, 'IT', 'DevOps', 'Tools', 'Chef', -1, '2017-03-12 00:00:00'),
(14, 'IT', 'DevOps', 'Tools', 'Ansible', -1, '2017-03-12 00:00:00'),
(15, 'IT', 'Administration', 'System', 'RedHat Linux', -1, '2017-03-12 00:00:00'),
(16, 'IT', 'Administration', 'System', 'Microsoft Windows (MCSE)', -1, '2017-03-12 00:00:00'),
(17, 'IT', 'Networking', 'Network', 'CCNA', -1, '2017-03-12 00:00:00'),
(18, 'IT', 'Networking', 'Network', 'CCIE', -1, '2017-03-12 00:00:00'),
(19, 'IT', 'Networking', 'Network', 'CCSP', -1, '2017-03-12 00:00:00'),
(20, 'IT', 'Administration', 'Application Servers', 'WebLogic Administration', -1, '2017-03-12 00:00:00'),
(21, 'IT', 'Administration', 'Application Servers', 'WebSphere Application Server Administration', -1, '2017-03-12 00:00:00'),
(22, 'IT', 'Administration', 'Application Servers', 'Websphere MQ Administration', -1, '2017-03-12 00:00:00'),
(23, 'IT', 'Administration', 'Application Servers', 'Jboss Application server Administration', -1, '2017-03-12 00:00:00'),
(24, 'IT', 'Database', 'RDBMS', 'MySQL', -1, '2017-03-12 00:00:00'),
(25, 'IT', 'Database', 'RDBMS', 'Oracle', -1, '2017-03-12 00:00:00'),
(26, 'IT', 'Database', 'RDBMS', 'PostgreSQL', -1, '2017-03-12 00:00:00'),
(27, 'IT', 'Database', 'RDBMS', 'MSSQL', -1, '2017-03-12 00:00:00'),
(28, 'IT', 'Database', 'NoSQL', 'MongoDB', -1, '2017-03-12 00:00:00'),
(29, 'IT', 'Database', 'NoSQL', 'Apache cassandra', -1, '2017-03-12 00:00:00'),
(30, 'IT', 'Database', 'NoSQL', 'CouchDB', -1, '2017-03-12 00:00:00'),
(31, 'IT', 'Development', 'Languages', 'Java', -1, '2017-03-12 00:00:00'),
(32, 'IT', 'Development', 'Languages', 'Python', -1, '2017-03-12 00:00:00'),
(33, 'IT', 'Development', 'Languages', 'Shell', -1, '2017-03-12 00:00:00'),
(34, 'IT', 'Development', 'Languages', 'Ruby', -1, '2017-03-12 00:00:00'),
(35, 'IT', 'Development', 'Languages', 'Javascript', -1, '2017-03-12 00:00:00'),
(36, 'IT', 'Development', 'Languages', 'PHP', -1, '2017-03-12 00:00:00'),
(37, 'IT', 'Development', 'Languages', 'scala', -1, '2017-03-12 00:00:00'),
(38, 'IT', 'Development', 'Frameworks', 'NodeJS', -1, '2017-03-12 00:00:00'),
(39, 'IT', 'Development', 'Frameworks', 'AngularJS', -1, '2017-03-12 00:00:00'),
(40, 'IT', 'Development', 'Frameworks', 'MEAN ( Mongo, express, Angular, NodeJS )', -1, '2017-03-12 00:00:00'),
(41, 'IT', 'Development', 'Frameworks', 'Spring', -1, '2017-03-12 00:00:00'),
(42, 'IT', 'Development', 'Frameworks', 'Hibernate', -1, '2017-03-12 00:00:00'),
(43, 'IT', 'Development', 'Frameworks', 'Ruby on Rails', -1, '2017-03-12 00:00:00'),
(44, 'IT', 'Development', 'Frameworks', 'Python Django', -1, '2017-03-12 00:00:00'),
(45, 'IT', 'Development', 'Frameworks', 'jQuery', -1, '2017-03-12 00:00:00'),
(46, 'IT', 'Development', 'Frameworks', 'struts', -1, '2017-03-12 00:00:00'),
(47, 'IT', 'Development', 'Mobile', 'Android', -1, '2017-03-12 00:00:00'),
(48, 'IT', 'Development', 'Mobile', 'Phonegap', -1, '2017-03-12 00:00:00'),
(49, 'IT', 'Development', 'Webdesigning', 'HTML5, CSS', -1, '2017-03-12 00:00:00'),
(50, 'IT', 'Development', 'Designing tools', 'Adobe Photoshop', -1, '2017-03-12 00:00:00'),
(51, 'IT', 'Development', 'Designing tools', 'Coraldraw', -1, '2017-03-12 00:00:00'),
(52, 'IT', 'Development', 'Designing tools', 'Adobe Illustrator', -1, '2017-03-12 00:00:00'),
(53, 'IT', 'Development', 'Designing tools', 'Adobe Aftereffects', -1, '2017-03-12 00:00:00'),
(54, 'IT', 'Develppment', 'Apps', 'Oracle Apps', -1, '2017-03-12 00:00:00'),
(55, 'IT', 'ERP', 'SAP', 'SAP-BO', -1, '2017-03-12 00:00:00'),
(56, 'IT', 'ERP', 'SAP', 'SAP-ABAP', -1, '2017-03-12 00:00:00'),
(57, 'IT', 'ERP', 'SAP', 'SAP-BI', -1, '2017-03-12 00:00:00'),
(58, 'IT', 'ERP', 'SAP', 'SAP-HANA', -1, '2017-03-12 00:00:00'),
(59, 'IT', 'Reporting', 'Tools', 'QlikView', -1, '2017-03-12 00:00:00'),
(60, 'IT', 'Reporting', 'Tools', 'Business Objects (BO)', -1, '2017-03-12 00:00:00'),
(61, 'IT', 'Reporting', 'Tools', 'Informatica', -1, '2017-03-12 00:00:00'),
(62, 'IT', 'Reporting', 'Tools', 'MSBI', -1, '2017-03-12 00:00:00'),
(63, 'IT', 'Security', 'Tools', 'Ethical Hacking', -1, '2017-03-12 00:00:00'),
(64, 'IT', 'Testing', 'Mobile', 'Appium', -1, '2017-03-12 00:00:00'),
(65, 'IT', 'Testing', 'Mobile', 'Jmeter', -1, '2017-03-12 00:00:00'),
(66, 'IT', 'Testing', 'Automation', 'Selenium', -1, '2017-03-12 00:00:00'),
(67, 'IT', 'Testing', 'Automation', 'QTP/UFT', -1, '2017-03-12 00:00:00'),
(68, 'IT', 'Testing', '', 'SAP testing', -1, '2017-03-12 00:00:00'),
(69, 'IT', 'Testing', '', 'Cloud testing', -1, '2017-03-12 00:00:00'),
(70, 'IT', 'Testing', '', 'storage testing', -1, '2017-03-12 00:00:00'),
(71, 'IT', 'Testing', '', 'security testing', -1, '2017-03-12 00:00:00'),
(72, 'IT', 'Bigdata', 'Hadoop', 'Hadoop-spark', -1, '2017-03-12 00:00:00'),
(73, 'IT', 'Bigdata', 'Hadoop', 'Hadoop-pig', -1, '2017-03-12 00:00:00'),
(74, 'IT', 'Bigdata', 'Hadoop', 'Hadoop-Hive', -1, '2017-03-12 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dmn_location`
--

CREATE TABLE `dmn_location` (
  `id` int(11) NOT NULL,
  `city` varchar(50) NOT NULL,
  `location` varchar(50) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dmn_states`
--

CREATE TABLE `dmn_states` (
  `state_id` int(11) NOT NULL,
  `state_desc` varchar(45) DEFAULT NULL,
  `state_long_desc` varchar(45) DEFAULT NULL,
  `state_code` varchar(5) DEFAULT NULL,
  `cntry_id` int(11) NOT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `dmn_states`
--

INSERT INTO `dmn_states` (`state_id`, `state_desc`, `state_long_desc`, `state_code`, `cntry_id`, `dsbl_in`, `last_insrt_upd_ts`, `last_insrt_upd_usr_id`) VALUES
(1, 'TELANGANA', 'Prev Andhra', 'TS', 1, 'N', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `app_polyglot_address`
--
ALTER TABLE `app_polyglot_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  ADD PRIMARY KEY (`batch_id`),
  ADD KEY `fk_batch_faculty` (`faculty_id`),
  ADD KEY `indx_partner_id_batch` (`partner_id`);

--
-- Indexes for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_branch_address_id` (`address_id`),
  ADD KEY `fk_branch_contact_id` (`contact_id`),
  ADD KEY `indx_partner_id` (`partner_id`);

--
-- Indexes for table `app_polyglot_contact`
--
ALTER TABLE `app_polyglot_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_course`
--
ALTER TABLE `app_polyglot_course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `partner_id` (`partner_id`);

--
-- Indexes for table `app_polyglot_demo`
--
ALTER TABLE `app_polyglot_demo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_faculty`
--
ALTER TABLE `app_polyglot_faculty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_partner_id_faculty` (`partner_id`);

--
-- Indexes for table `app_polyglot_lead`
--
ALTER TABLE `app_polyglot_lead`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_lead_branch` (`branch`);

--
-- Indexes for table `app_polyglot_payment`
--
ALTER TABLE `app_polyglot_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_partner_id_payment` (`partner_id`);

--
-- Indexes for table `app_polyglot_plan`
--
ALTER TABLE `app_polyglot_plan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_partner_id_plan` (`partner_id`);

--
-- Indexes for table `app_polyglot_student`
--
ALTER TABLE `app_polyglot_student`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indx_partner_id_student` (`partner_id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_idx` (`emailId`,`userType`);

--
-- Indexes for table `dmn_cities`
--
ALTER TABLE `dmn_cities`
  ADD PRIMARY KEY (`city_id`),
  ADD KEY `cntry_state_idx` (`state_id`);

--
-- Indexes for table `dmn_cntry`
--
ALTER TABLE `dmn_cntry`
  ADD PRIMARY KEY (`cntry_id`);

--
-- Indexes for table `dmn_courses_tests`
--
ALTER TABLE `dmn_courses_tests`
  ADD PRIMARY KEY (`question_no`,`courseId`,`testId`);

--
-- Indexes for table `dmn_course_list`
--
ALTER TABLE `dmn_course_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmn_location`
--
ALTER TABLE `dmn_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmn_states`
--
ALTER TABLE `dmn_states`
  ADD PRIMARY KEY (`state_id`),
  ADD KEY `state_cntry_idx` (`cntry_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `app_polyglot_address`
--
ALTER TABLE `app_polyglot_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `app_polyglot_plan`
--
ALTER TABLE `app_polyglot_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  ADD CONSTRAINT `fk_partner_id_batch` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  ADD CONSTRAINT `fk_partner_id_branches` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_course`
--
ALTER TABLE `app_polyglot_course`
  ADD CONSTRAINT `fk_partner_id_courses` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_faculty`
--
ALTER TABLE `app_polyglot_faculty`
  ADD CONSTRAINT `fk_partner_id_faculty` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_payment`
--
ALTER TABLE `app_polyglot_payment`
  ADD CONSTRAINT `fk_partner_id_payment` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_plan`
--
ALTER TABLE `app_polyglot_plan`
  ADD CONSTRAINT `fk_partner_id_plan` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `app_polyglot_student`
--
ALTER TABLE `app_polyglot_student`
  ADD CONSTRAINT `fk_partner_id_student` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
