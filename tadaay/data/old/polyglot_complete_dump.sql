-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 05, 2017 at 02:13 PM
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
-- Table structure for table `app_email_templates`
--

CREATE TABLE `app_email_templates` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `template_name` varchar(100) NOT NULL,
  `file_name` varchar(100) NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_email_templates`
--

INSERT INTO `app_email_templates` (`id`, `partner_id`, `template_name`, `file_name`, `is_active`, `last_insrt_upd_ts`, `last_insrt_upd_usr_id`) VALUES
(1, 1, 'Test', 'demo.htm', 'Y', '2017-10-01 07:23:29', 1);

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
(22, 'asada', 'asdad', 'ameerpet', 'Hyderabad', 'Telangana', '500034', -1, '2017-09-13 16:12:55'),
(23, 'New Address', '104', 'Miyapur', 'Hyderabad', 'Telangana', '500034', -1, '2017-09-13 16:52:32'),
(24, 'Aditya Enclave', '123', 'Ameerpet', 'Hyderabad', 'Telangana', '500034', -1, '2017-09-13 14:08:04'),
(25, '11222', 'asad', 'asdad', 'Bangalore', 'Tamilnadu', '50003', -1, '2017-09-13 16:17:41'),
(26, 'asdad', 'sadsad', 'asdsad', 'Chennai', 'Tamilnadu', '50003', -1, '2017-09-13 16:22:52'),
(27, 'asad', 'asdasd', 'asdasd', 'Bangalore', 'Tamilnadu', '50003', -1, '2017-09-13 16:24:23'),
(28, '11222', 'Buddhas', 'asdad', 'Chennai', 'Andhra Pradesh', '50003', -1, '2017-09-13 16:25:44'),
(29, 'asdad', 'saad', 'asad', 'Hyderabad', 'Telangana', '50003', -1, '2017-09-13 16:26:42'),
(30, 'asdad', 'Buddhas', 'ameerpet', 'Chennai', 'Tamilnadu', '50003', -1, '2017-09-13 16:29:57'),
(31, '11222', 'Buddhas', 'asdad', 'Chennai', 'Tamilnadu', '50003', -1, '2017-09-13 16:30:44'),
(32, 'asdad', 'Buddhas', 'ameerpet', 'Chennai', 'Tamilnadu', '50003', -1, '2017-09-13 16:32:39'),
(33, 'asada', 'asdsad', 'assdsad', 'Bangalore', 'Tamilnadu', '500034', -1, '2017-09-13 18:58:09'),
(34, 'asada', '111', 'assdsad', 'Bangalore', 'Tamilnadu', '500034', -1, '2017-09-13 19:06:37'),
(35, '207', 'Nilgiri Block', 'Ameerpet', 'Hyderabad', 'Telangana', '500032', -1, '2017-09-23 15:30:57');

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
  `start_date` varchar(20) NOT NULL,
  `batch_name` varchar(100) DEFAULT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_batch`
--

INSERT INTO `app_polyglot_batch` (`batch_id`, `ply_batch_no`, `partner_id`, `course_name`, `schedule`, `mode`, `faculty_id`, `branch_name`, `fee_discount`, `batch_status`, `start_date`, `batch_name`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'PLYB100001', 1, 'Java', '09/30/2017 3:47 PM', 'Both', 1, 'Polyglot Ameerpet', 10, 'PROPOSED', '23/09/2017', 'Java-Polyglot Ameerpet-23/09/2017', 1, '2017-10-05 11:14:28'),
(2, 'PLYB100002', 1, 'Java', '09/30/2017 11:21 AM', 'Online', 2, 'Polyglot Ameerpet', 10, 'PROPOSED', '24/09/2017', 'Java-Polyglot Ameerpet-24/09/2017', 1, '2017-10-05 11:15:22');

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
(2, 1, 'New Branch 2', 23, 32, -1, '2017-09-13 16:52:32'),
(3, 1, 'Polyglot Ameerpet', 35, 45, -1, '2017-09-23 15:30:57');

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
(31, 'asdad', '1234567890', 'asdad@asad.com', -1, '2017-09-13 16:12:55'),
(32, 'vishy', '846407177', 'viasda@asdad.com', -1, '2017-09-13 16:52:32'),
(33, 'New Contact', '1234567890', 'adad@asad.com', -1, '2017-09-13 14:08:04'),
(34, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:17:41'),
(35, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:22:52'),
(36, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:24:23'),
(37, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:25:44'),
(38, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:26:42'),
(39, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:29:57'),
(40, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:30:44'),
(41, 'asdad', '0123456789', 'asdad@asad.com', -1, '2017-09-13 16:32:39'),
(42, 'asad', '1234657989', 'asda@Asdad.com', -1, '2017-09-13 18:58:09'),
(43, 'sadad', '1234567890', 'asdaa@asdad.com', -1, '2017-09-13 19:06:37'),
(44, 'dsadd', '1234567890', 'asdad@asda.com', -1, '2017-09-13 19:31:12'),
(45, 'Satish', '1234567890', 'vishwann@gmail.com', -1, '2017-09-23 15:30:57');

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
(1, 1, 'Javascript', 'Weekdays', 5, 'weeks', -1, '2017-07-26 15:50:31'),
(2, 1, 'Some New Course', 'Weekdays', 2, 'weeks', -1, '2017-09-19 14:14:13'),
(3, 1, 'Java', 'Weekdays', 4, 'days', -1, '2017-09-23 15:33:13'),
(4, 1, 'security testing', 'Weekend', 5, 'weeks', -1, '2017-09-26 12:16:01');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_demo`
--

CREATE TABLE `app_polyglot_demo` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `mode` varchar(20) NOT NULL,
  `branch_name` varchar(50) NOT NULL,
  `faculty_name` varchar(50) NOT NULL,
  `date_time` varchar(20) NOT NULL,
  `fee` double NOT NULL,
  `is_active` varchar(1) NOT NULL,
  `demo_status` varchar(10) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_demo`
--

INSERT INTO `app_polyglot_demo` (`id`, `partner_id`, `course_name`, `mode`, `branch_name`, `faculty_name`, `date_time`, `fee`, `is_active`, `demo_status`, `last_insrt_upd_ts`, `last_insrt_upd_usr_id`) VALUES
(2, 1, 'Java', 'Both', 'New Branch 2', '2', '10/10/2017 1:49 PM', 3000, 'N', 'CANCELLED', '2017-10-01 17:06:45', 1),
(3, 1, 'Hadoop-Hive', 'Class Room', 'Polyglot Ameerpet', '2', '10/06/2017 1:47 PM', 8000, 'N', 'COMPLETED', '2017-10-01 17:21:34', 1),
(4, 1, 'Java', 'Class Room', 'Polyglot Ameerpet', 'Vishwanath', '10/18/2017 10:33 PM', 4000, 'Y', 'SCHEDULED', '2017-10-03 22:33:31', 1);

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
(1, 1, 'Vishwanath', '8464071773', 'vishwann@gmail.com', 'ClassRoom', -1, '2017-10-02', 20),
(2, 1, 'satish', '1234567890', 'satish@polyglotIt.com', 'ClassRoom', -1, '2017-09-19', 15);

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
(37, 1, 'srinivasa', 'A', 'devops', '9533797976', 'vishwann@gmail.com', 'Online', 'Weekend', 2, '12:30 PM-01:30 PM', 'Not Known', NULL, 'PLYB100002', 'CONFIRMED', 'next batch', 1, '2017-09-23 15:24:21'),
(38, 1, 'sudheer', 'B', 'linux', '9492931819', 'vishwann@gmail.com', 'Online', 'Weekend', 3, '11-1pm', 'Not Known', NULL, 'PLYB100002', 'CONFIRMED', 'finished linux', -1, '2017-09-23 15:32:51'),
(39, 1, 'rama krishna', 'C', 'aws+devops', '8106830830', 'ramtest0@gmail.com', 'regular', NULL, NULL, '3-5pm', 'Not Known', NULL, 'PLYB100001', 'PROPOSED', 'finished', 1, '2017-09-30 08:20:59'),
(40, 1, 'wahwda', 'D', 'aws', '8380078876', 'waheeda806@gmail.com', 'regular', NULL, NULL, '3-5pm', 'pamphlet', NULL, 'PLYB100001', 'PROPOSED', 'Completed', 1, '2017-09-30 08:20:59'),
(41, 1, 'srinivasa rao', 'Rao', 'devops', '9885642199', 'srinivasrao.konakanchi@gmail.com', 'weekend', NULL, NULL, NULL, 'urbanpro', NULL, NULL, 'INVITED', 'invited to Linux 16/07', -1, '2017-07-26 17:01:33'),
(42, 1, 'murali', 'Test', 'linux+devops', '7032640061', 'nmkmailbox@gmail.com', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, NULL, '7 to 9AM', -1, '2017-07-26 17:01:33'),
(43, 1, 'teja', 'Teja', 'devops', '7893802045', 'tejaharley@gmail.com', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, 'SCHEDULED', 'joined 3-5PM', -1, '2017-07-26 17:01:33'),
(44, 1, 'hari', 'gudiya', 'aws', '8861828888', 'hari.gudiya@gmail.com', 'online', NULL, NULL, NULL, 'Not Known', NULL, NULL, NULL, '(hold fr 2 mnths)', -1, '2017-07-26 17:01:33'),
(45, 1, 'karthik', 'Reddy', 'linux+aws', '9701120811', 'No Email Provided', 'regular', NULL, NULL, NULL, 'Not Known', NULL, NULL, 'ENROLLED', 'joined', -1, '2017-07-26 17:01:33'),
(46, 1, 'narendra reddy', 'reddy', 'AWS', '7799206699', 'narendra9599@gmail.com', 'regular', NULL, NULL, NULL, 'pamphlet', NULL, NULL, 'SCHEDULED', 'next batch', -1, '2017-07-26 17:01:33'),
(47, 1, 'satya', 'S', 'java', '9032466844', 'vishwann@gmail.com', 'Class Room', 'Weekdays', 3, '12:30 PM-01:30 PM', 'urbanpro', NULL, 'PLYB100002', 'CONFIRMED', '7 to 9AM', -1, '2017-09-24 11:21:03'),
(48, 1, 'ramesh', 'R', 'aws', '9959356689', 'kulkram1989@gmail.com', 'regular', NULL, NULL, '3-5pm', 'urban pro', NULL, NULL, NULL, 'cl again', -1, '2017-07-26 17:01:33'),
(49, 1, 'Vishy', 'N', 'java', '1234567890', 'vishwann@gmail.com', 'Class Room', 'Weekend', 2, '05:00 PM-07:00 PM', 'Online', NULL, 'PLYB100001', 'CONFIRMED', 'New Test', -1, '2017-09-23 15:43:26'),
(50, 1, 'New Lead', 'Test', 'Javascript', '8464071773', 'vishwann@gmail.com', 'Online', 'Weekend', 2, '10:00 AM-11:00 AM', 'Online', NULL, 'PLYB100002', 'CONFIRMED', 'This is a test', 1, '2017-09-23 15:27:05'),
(51, 1, 'Vishy', 'N', 'java', '8464071773', 'vishwann@gmail.com', 'Class Room', 'Weekend', 3, '11:30 AM-12:30 AM', 'Online', NULL, 'PLYB100002', 'CONFIRMED', 'Testing...', -1, '2017-09-24 11:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `app_polyglot_lead_demo_status`
--

CREATE TABLE `app_polyglot_lead_demo_status` (
  `id` int(11) NOT NULL,
  `partner_id` int(11) NOT NULL,
  `lead_id` int(11) NOT NULL,
  `demo_id` int(11) NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `invite_status` varchar(20) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_lead_demo_status`
--

INSERT INTO `app_polyglot_lead_demo_status` (`id`, `partner_id`, `lead_id`, `demo_id`, `email_id`, `invite_status`, `first_name`, `last_name`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 39, 2, 'ramtest0@gmail.com', 'ATTENDED DEMO', 'rama krishna', 'C', 1, '2017-09-30 09:31:48'),
(2, 1, 40, 2, 'waheeda806@gmail.com', 'ATTENDED DEMO', 'wahwda', 'D', 1, '2017-09-30 09:31:48'),
(3, 1, 39, 4, 'ramtest0@gmail.com', 'ATTENDED DEMO', 'rama krishna', 'C', 1, '2017-10-05 10:35:03'),
(4, 1, 41, 4, 'srinivasrao.konakanchi@gmail.com', 'ATTENDED DEMO', 'srinivasa rao', 'Rao', 1, '2017-10-05 10:35:04'),
(5, 1, 40, 4, 'waheeda806@gmail.com', 'ATTENDED DEMO', 'wahwda', 'D', 1, '2017-10-05 10:35:04'),
(6, 1, 43, 4, 'tejaharley@gmail.com', 'INVITED FOR DEMO', 'teja', 'Teja', 1, '2017-10-05 10:34:40');

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
  `transaction_ref` varchar(50) DEFAULT NULL,
  `opted_discount` double NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_payment`
--

INSERT INTO `app_polyglot_payment` (`id`, `partner_id`, `student_id`, `course_name`, `total_fee`, `fee_paid`, `fee_pending`, `mode`, `transaction_ref`, `opted_discount`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 1, 2, 'Java', 15000, 12000, 3000, 'Online', '1234', 15, -1, '2017-10-01 06:58:48'),
(2, 1, 1, 'Puppet', 15000, 12000, 3000, 'Online', '45674', 16, -1, '2017-10-01 07:12:16');

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
  `keyword` varchar(100) NOT NULL,
  `location` varchar(100) NOT NULL,
  `duration` varchar(25) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL,
  `is_expired` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_plan`
--

INSERT INTO `app_polyglot_plan` (`id`, `plan_name`, `subscription_date`, `expiration_date`, `partner_id`, `keyword`, `location`, `duration`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`, `is_expired`) VALUES
(1, 'DEFAULT PLAN', '2017-08-17 14:10:57', '2017-09-16 14:10:55', 1, '', '', '', 1, '2017-08-17 14:10:57', ''),
(2, 'Platinum', '2017-09-12 16:06:31', '2017-10-12 16:06:31', 1, 'python', 'Bangalore', 'Monthly', 1, '2017-09-12 16:06:31', 'N');

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
  `batch_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `app_polyglot_student`
--

INSERT INTO `app_polyglot_student` (`id`, `partner_id`, `student_name`, `course_name`, `mode`, `joined_date`, `status`, `next_interest`, `batch_id`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(2, 1, 'Vishy N', '', 'Online', '24/09/2017', 'INVITED', 'Hadoop-spark', 2, 1, '2017-10-05 08:35:27');

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
-- Table structure for table `dmn_keyword_categories`
--

CREATE TABLE `dmn_keyword_categories` (
  `id` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `key_word` varchar(100) NOT NULL,
  `total` int(11) NOT NULL,
  `available` int(11) NOT NULL,
  `exhausted` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dmn_keyword_categories`
--

INSERT INTO `dmn_keyword_categories` (`id`, `category`, `key_word`, `total`, `available`, `exhausted`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'amazon web services', 'amazon web services', 100, 100, 0, -1, '2017-09-10 00:00:00'),
(2, 'amazon web services', 'aws', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(3, 'amazon web services', 'amazon ec2', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(4, 'amazon web services', 'amazon s3', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(5, 'python', 'python', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(6, 'python', 'django', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(7, 'python', 'flask', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(8, 'java', 'core java', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(9, 'java', 'advanced java', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(10, 'java', 'java', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(11, 'java', 'springs', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(12, 'java', 'struts', 100, 100, 0, 0, '2017-09-11 18:33:10'),
(13, 'java', 'hibernate', 100, 100, 0, 0, '2017-09-11 18:33:10');

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
-- Table structure for table `dmn_polyglot_plans`
--

CREATE TABLE `dmn_polyglot_plans` (
  `id` int(11) NOT NULL,
  `plan_name` varchar(50) NOT NULL,
  `lead_availability` int(11) NOT NULL,
  `view_contact_lead` int(11) NOT NULL,
  `add_new_batches` int(11) NOT NULL,
  `add_demos` int(11) NOT NULL,
  `form_batches` int(11) NOT NULL,
  `payment_tracking` int(11) NOT NULL,
  `no_of_emails` int(11) NOT NULL,
  `no_of_sms` int(11) NOT NULL,
  `custom_rule_engine` int(11) NOT NULL,
  `email_templates` int(11) NOT NULL,
  `online_quizzes` int(11) NOT NULL,
  `course_certificate` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dmn_polyglot_plans`
--

INSERT INTO `dmn_polyglot_plans` (`id`, `plan_name`, `lead_availability`, `view_contact_lead`, `add_new_batches`, `add_demos`, `form_batches`, `payment_tracking`, `no_of_emails`, `no_of_sms`, `custom_rule_engine`, `email_templates`, `online_quizzes`, `course_certificate`, `last_insrt_upd_usr_id`, `last_insrt_upd_ts`) VALUES
(1, 'Basic', -1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, -1, '2017-09-10 00:00:00'),
(2, 'Silver', 86400, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, -1, '2017-09-10 00:00:00'),
(3, 'Gold', 14400, 1, 1, 1, 1, 1, 100, 100, 0, 0, 0, 0, -1, '2017-09-10 00:00:00'),
(4, 'Platinum', 0, 1, 1, 1, 1, 1, 100, 100, 1, 1, 1, 1, -1, '2017-09-10 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `dmn_quizzes`
--

CREATE TABLE `dmn_quizzes` (
  `id` int(11) NOT NULL,
  `quiz_name` varchar(100) NOT NULL,
  `course_name` varchar(100) NOT NULL,
  `quiz_level` varchar(25) NOT NULL,
  `topic` varchar(50) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `last_insrt_upd_usr_id` int(11) NOT NULL,
  `last_insrt_upd_ts` datetime NOT NULL
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
-- Indexes for table `app_email_templates`
--
ALTER TABLE `app_email_templates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_email_tempalte` (`partner_id`);

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
-- Indexes for table `app_polyglot_lead_demo_status`
--
ALTER TABLE `app_polyglot_lead_demo_status`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `dmn_keyword_categories`
--
ALTER TABLE `dmn_keyword_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmn_location`
--
ALTER TABLE `dmn_location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmn_polyglot_plans`
--
ALTER TABLE `dmn_polyglot_plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dmn_quizzes`
--
ALTER TABLE `dmn_quizzes`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `app_polyglot_batch`
--
ALTER TABLE `app_polyglot_batch`
  MODIFY `batch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `app_polyglot_branch`
--
ALTER TABLE `app_polyglot_branch`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `app_polyglot_demo`
--
ALTER TABLE `app_polyglot_demo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `app_polyglot_lead_demo_status`
--
ALTER TABLE `app_polyglot_lead_demo_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `app_polyglot_plan`
--
ALTER TABLE `app_polyglot_plan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `dmn_quizzes`
--
ALTER TABLE `dmn_quizzes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `app_email_templates`
--
ALTER TABLE `app_email_templates`
  ADD CONSTRAINT `fk_user_email_tempalte` FOREIGN KEY (`partner_id`) REFERENCES `app_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

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
