-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 02, 2017 at 08:00 AM
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
(21, 'Flat No 604', 'Buddha heights', 'Miyapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-04-08 20:45:16');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_batch`
--

CREATE TABLE `app_polyglot_batch` (
  `batch_id` int(11) NOT NULL,
  `ply_batch_no` varchar(50) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `schedule` varchar(30) NOT NULL,
  `mode` varchar(50) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `branch_name` varchar(100) NOT NULL,
  `fee_discount` double NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_batch`
--

INSERT INTO `app_polyglot_batch` (`batch_id`, `ply_batch_no`, `course_name`, `schedule`, `mode`, `faculty_id`, `branch_name`, `fee_discount`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'PLYB100005', 'Javascript', 'Weekdays', 'Class Room', 2, 'Polyglot100', 0, -1, '2017-04-02 19:19:00'),
(2, 'PLYB100006', 'Azure - Development', 'Weekend', 'Online', 1, 'Polyglot100', 0, -1, '2017-04-04 06:39:09'),
(3, 'PLYB1000010', 'SAP testing', 'Weeks', 'Class Room', 2, 'Polyglot2', 0, -1, '2017-04-04 06:43:38'),
(4, 'PLYB100003', 'Javascript', 'Weekend', 'Online', 2, 'Polyglot2', 0, -1, '2017-04-04 22:39:03'),
(5, 'PLYB1000010', 'SAP testing', 'Weeks', 'Class Room', 2, 'Polyglot2', 0, -1, '2017-04-10 08:29:05');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_branch`
--

CREATE TABLE `app_polyglot_branch` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `address_id` int(11) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_branch`
--

INSERT INTO `app_polyglot_branch` (`id`, `name`, `address_id`, `contact_id`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'Polyglot', 1, 3, -1, '2017-03-20 23:21:02'),
(2, 'Polyglot3', 2, 4, -1, '2017-03-21 19:40:49'),
(3, 'Polyglot2', 3, 5, -1, '2017-03-21 19:40:44'),
(4, 'Polyglot100', 4, 6, -1, '2017-03-21 19:40:59'),
(5, 'Some New Branch', 19, 21, -1, '2017-03-29 22:26:52'),
(6, 'Test Branch', 21, 23, -1, '2017-04-08 20:45:16');

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
(30, '', '', '', -1, '2017-04-10 08:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_course`
--

CREATE TABLE `app_polyglot_course` (
  `id` int(11) NOT NULL,
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

INSERT INTO `app_polyglot_course` (`id`, `name`, `schedule`, `duration`, `duration_type`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(2, 'Bigdata', 'Weekdays', 4, 'weeks', -1, '2017-03-19 10:28:05'),
(3, 'SAP testing', 'Weekdays', 4, 'days', -1, '2017-03-19 10:27:59'),
(6, 'Selenium', 'Weekdays', 5, 'days', -1, '2017-03-19 10:26:05'),
(8, 'Ethical Hacking', 'Weeks', 2, 'weeks', -1, '2017-03-19 11:17:07'),
(9, 'One More Course Test', 'Weeks', 2, 'weeks', -1, '2017-05-01 12:32:24');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_faculty`
--

CREATE TABLE `app_polyglot_faculty` (
  `id` int(11) NOT NULL,
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

INSERT INTO `app_polyglot_faculty` (`id`, `name`, `mobile`, `emailId`, `mode`, `lastInsrtUpdUsrId`, `lastInsrtUpdTs`, `courseId`) VALUES
(1, 'vishy', '1234567890', 'test@test.com', 'O', -1, '2017-04-02', 1),
(2, 'satheesh', '1234567890', 'satheesh@polyglot.com', 'O', -1, '2017-04-02', 1);

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_lead`
--

CREATE TABLE `app_polyglot_lead` (
  `id` int(11) NOT NULL,
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
  `last_insrt_upd_usr_id` int(11) NOT NULL DEFAULT '-1',
  `last_insrt_upd_ts` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_lead`
--

INSERT INTO `app_polyglot_lead` (`id`, `first_name`, `last_name`, `course`, `mobile`, `email`, `mode`, `schedule`, `branch`, `preferred_time`, `source`, `reffered_by`, `batch_id`, `lead_status`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(3, 'sateesh', 'challa', 'Javascript', '1234567890', '', 'Online', 'Weekend', 3, '09:00 PM-12:00 PM', 'Partner', NULL, 'PLYB100003', 'PROPOSED', -1, '2017-03-29 22:40:57'),
(4, 'vishy', 'test', 'Java', '8464071773', 'vishwann@gmail.com', 'Online', 'Weekend', 3, '1 PM - 4 PM', 'Some thing else', NULL, 'PLYB1000010', 'IN PROGRESS', -1, '2017-04-10 22:50:33'),
(5, 'Some new', 'test', 'Javascript', '9999999999', '', 'Class Room', 'Weekdays', 4, '12:00 PM-02:00 PM', 'Online Search', NULL, 'PLYB100005', 'PROPOSED', -1, '2017-03-29 23:05:59'),
(6, 'mahesh', 'maragani', 'Azure - Development', '1234567890', 'sadad@adads.com', 'Online', 'Weekend', 4, '01:00 PM-03:00 PM', 'Online', NULL, 'PLYB100006', 'PROPOSED', -1, '2017-04-02 19:16:11'),
(7, 'test', 'test1', 'Azure - Administration', '1234567890', 'asad@asad.cm', 'Online', 'Weekend', 5, '10:00 AM-12:00 AM', 'something', NULL, NULL, NULL, -1, '2017-04-03 06:09:35'),
(8, 'new', 'test', 'Microsoft Windows (MCSE)', '1234567890', 'asad@asad.cm', 'Class Room', 'Weekdays', 3, '10:00 AM-12:00 AM', 'online', NULL, NULL, NULL, -1, '2017-04-03 06:10:22'),
(9, 'new lead', 'again', 'Javascript', '1234567890', 'asad@asad.cm', 'Class Room', 'Weeks', 3, '10:00 AM-12:00 AM', 'something', NULL, NULL, NULL, -1, '2017-04-03 06:10:46'),
(10, 'vishy', 'test2', 'Azure - Administration', '8464071773', '', 'Class Room', 'Weeks', 3, '10:00 AM-12:00 AM', 'search', NULL, 'PLYB1000010', 'IN PROGRESS', -1, '2017-04-10 22:50:33'),
(11, 'lead', 'test2', 'Azure - Administration', '1234567890', 'asdad@adsad.com', 'Class Room', 'Weekdays', 3, '12:00 PM-02:00 PM', 'new source', NULL, NULL, NULL, -1, '2017-04-04 06:47:17'),
(13, 'lead test', '3', 'Microsoft Windows (MCSE)', '1234567890', 'dadaa@asad.com', 'Class Room', 'Weekend', 4, '12:00 PM-02:00 PM', 'new source', NULL, NULL, NULL, -1, '2017-04-04 06:48:00'),
(14, 'test', 'vishy', 'Javascript', '8464071773', 'vishwann@gmail.com', 'Online', 'Weekend', NULL, '09:00 PM-12:00 PM', 'Partner', NULL, NULL, NULL, -1, '2017-04-10 08:18:36');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_payment`
--

CREATE TABLE `app_polyglot_payment` (
  `id` int(11) NOT NULL,
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

--
-- Dumping data for table `app_polyglot_payment`
--

INSERT INTO `app_polyglot_payment` (`id`, `student_id`, `course_name`, `total_fee`, `fee_paid`, `fee_pending`, `mode`, `transaction_ref`, `opted_discount`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 2, 'Test Course', 15000, 14000, 1000, 'Online', 'sada12413', 'N', -1, '2017-05-02 09:36:44'),
(2, 1, 'New Course', 15000, 14000, 1000, 'Online', 'asad23434', 'N', -1, '2017-05-02 11:30:16');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_student`
--

CREATE TABLE `app_polyglot_student` (
  `id` int(11) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `mode` varchar(25) NOT NULL,
  `joined_date` datetime DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  `next_interest` varchar(100) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_student`
--

INSERT INTO `app_polyglot_student` (`id`, `student_name`, `course_name`, `mode`, `joined_date`, `status`, `next_interest`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'Vishy Test', 'Amazon AWS', 'Online', NULL, 'Enrolled', 'Java', -1, '2017-05-02 09:25:58'),
(2, 'Vishy Test 2', 'New Course', 'Online', NULL, 'Enrolled', 'Nothing', -1, '2017-05-02 09:27:06');

-- --------------------------------------------------------

--
-- Table structure for table `app_users`
--
drop table app_users;

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
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_idx` (`emailId`,`userType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  ADD KEY `fk_batch_faculty` (`faculty_id`);

--
-- Indexes for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_branch_address_id` (`address_id`),
  ADD KEY `fk_branch_contact_id` (`contact_id`);

--
-- Indexes for table `app_polyglot_contact`
--
ALTER TABLE `app_polyglot_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_course`
--
ALTER TABLE `app_polyglot_course`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_faculty`
--
ALTER TABLE `app_polyglot_faculty`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_polyglot_student`
--
ALTER TABLE `app_polyglot_student`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `app_users`
--
ALTER TABLE `app_users`
  ADD PRIMARY KEY (`emailId`,`userType`);

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
-- Indexes for table `dmn_course_list`
--
ALTER TABLE `dmn_course_list`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;
--
-- AUTO_INCREMENT for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `app_polyglot_contact`
--
ALTER TABLE `app_polyglot_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
--
-- AUTO_INCREMENT for table `app_polyglot_course`
--
ALTER TABLE `app_polyglot_course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `app_polyglot_lead`
--
ALTER TABLE `app_polyglot_lead`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `dmn_course_list`
--
ALTER TABLE `dmn_course_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  ADD CONSTRAINT `fk_batch_faculty` FOREIGN KEY (`faculty_id`) REFERENCES `app_polyglot_faculty` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  ADD CONSTRAINT `fk_branch_address_id` FOREIGN KEY (`address_id`) REFERENCES `app_polyglot_address` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_branch_contact_id` FOREIGN KEY (`contact_id`) REFERENCES `app_polyglot_contact` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `app_polyglot_lead`
--
ALTER TABLE `app_polyglot_lead`
  ADD CONSTRAINT `fk_lead_branch` FOREIGN KEY (`branch`) REFERENCES `app_polyglot_branch` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dmn_cities`
--
ALTER TABLE `dmn_cities`
  ADD CONSTRAINT `cntry_state` FOREIGN KEY (`state_id`) REFERENCES `dmn_states` (`state_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `dmn_states`
--
ALTER TABLE `dmn_states`
  ADD CONSTRAINT `state_cntry` FOREIGN KEY (`cntry_id`) REFERENCES `dmn_cntry` (`cntry_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
CREATE TABLE `dmn_yrpassout` (
  `year` int(11) NOT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `dmn_degree` (
  `degree_name` varchar(20) NOT NULL,
  `dsbl_in` varchar(1) DEFAULT NULL,
  `last_insrt_upd_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`degree_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO `dmn_degree`
(`degree_name`,
`dsbl_in`,
`last_insrt_upd_ts`)
VALUES
('BTECH','N',curdate());

INSERT INTO `dmn_yrpassout`
(`year`,
`dsbl_in`,
`last_insrt_upd_ts`)
VALUES
(2009,'N',curdate());
