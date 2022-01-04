-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2021 at 05:42 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `allowances`
--

CREATE TABLE `allowances` (
  `alw_id` int(11) NOT NULL,
  `allowance` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `allowances`
--

INSERT INTO `allowances` (`alw_id`, `allowance`, `emp_id`) VALUES
(1, 10000, NULL),
(2, 1500, 2),
(3, 0, 3),
(4, 500, NULL),
(5, 1000, 5),
(6, 0, 6),
(7, 0, 7),
(8, 0, NULL),
(9, 1500, 9),
(10, 0, NULL),
(11, 0, 11),
(12, 0, NULL),
(13, 0, NULL),
(14, 0, 14),
(15, 0, 15),
(16, 0, NULL),
(17, 0, NULL),
(18, 0, 18),
(19, 0, 19),
(20, 0, 20),
(21, 0, NULL),
(22, 0, NULL),
(23, 0, NULL),
(24, 0, NULL),
(25, 0, 25),
(26, 0, 26),
(27, 0, NULL),
(28, 0, NULL),
(29, 0, 29),
(30, 0, NULL),
(31, 0, NULL),
(32, 0, NULL),
(33, 0, NULL),
(34, 0, NULL),
(35, 0, NULL),
(36, 0, NULL),
(37, 0, NULL),
(38, 0, NULL),
(39, 0, 39),
(40, 0, NULL),
(41, 0, NULL),
(42, 0, NULL),
(43, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `announce_id` int(11) NOT NULL,
  `announce_msg` varchar(1500) NOT NULL,
  `dateposted` date NOT NULL,
  `timeposted` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `announcements`
--

INSERT INTO `announcements` (`announce_id`, `announce_msg`, `dateposted`, `timeposted`) VALUES
(1, 'Aslamo Alekum,\r\nThis is to notify all the departments and employees to have EID-UL-AZHA holidays w.e.f 21-07-2021.\r\nBest Wishes,\r\nCEO Carbon Company\r\nDated: 20-07-2021.', '2021-07-20', '07:42:02'),
(2, 'Aslamo Alekum, \r\nAll the employees will get 25% bonus in their salaries for the month July, 2021. So, all the employees must work properly and happily. We will be contributing in your joys.\r\nBest Wishes,\r\nCEO Carbon Company.', '2021-07-20', '07:55:53'),
(3, 'Aslamo Alekum,\r\nAll the employees can withdraw their salaries today in advance. We will always be contributing in your joys.\r\nGood Luck,\r\nCEO Carbon Company\r\n', '2021-07-20', '08:10:34');

-- --------------------------------------------------------

--
-- Table structure for table `assistant`
--

CREATE TABLE `assistant` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `doj` date NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(15) NOT NULL,
  `city` varchar(40) NOT NULL,
  `address` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `assistant`
--

INSERT INTO `assistant` (`id`, `name`, `gender`, `doj`, `email`, `phone`, `city`, `address`) VALUES
(3, 'Muhammad Naeem ', 'Male', '2021-12-20', 'me@gmail.com', '1234', 'chiniot', 'Mumtaz Hall'),
(6, 'Nadeem', 'Male', '2021-12-23', 'nadeem@gmail.com', '6476', 'jhu', 'ufdgfu'),
(7, 'assis', 'Male', '2021-12-21', 'ss@gmail.com', '03233213112', 'jhu', 'hgi'),
(9, 'Naeem', 'Male', '2021-12-24', 'me@gmail.com', '2322323232', 'ghsdhsj', 'njj'),
(10, 'Naeem', 'Male', '2021-12-14', 'urt@gmail.com', '03233213112', 'djvifhvi', 'ghty');

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `attend_id` int(11) NOT NULL,
  `attend_date` date NOT NULL,
  `attend_time` time NOT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `attendance`
--

INSERT INTO `attendance` (`attend_id`, `attend_date`, `attend_time`, `emp_id`) VALUES
(1, '2021-07-01', '01:13:15', NULL),
(2, '2021-07-01', '01:14:01', 2),
(3, '2021-07-01', '01:14:01', 3),
(4, '2021-07-01', '01:13:15', NULL),
(5, '2021-07-01', '01:14:01', 5),
(6, '2021-07-01', '01:14:01', 6),
(7, '2021-07-01', '01:13:15', 7),
(8, '2021-07-01', '01:14:01', 9),
(9, '2021-07-01', '01:14:01', 11),
(10, '2021-07-01', '01:13:15', NULL),
(13, '2021-07-01', '01:13:15', NULL),
(14, '2021-07-01', '01:14:01', 14),
(15, '2021-07-01', '01:14:01', 15),
(16, '2021-07-01', '01:13:15', NULL),
(17, '2021-07-01', '01:14:01', NULL),
(18, '2021-07-01', '01:14:01', 18),
(19, '2021-07-02', '01:13:15', NULL),
(20, '2021-07-02', '01:14:01', 2),
(21, '2021-07-02', '01:14:01', 3),
(22, '2021-07-02', '01:13:15', NULL),
(23, '2021-07-02', '01:14:01', 5),
(24, '2021-07-02', '01:14:01', 6),
(25, '2021-07-02', '01:13:15', 7),
(26, '2021-07-02', '01:14:01', 9),
(27, '2021-07-02', '01:14:01', 11),
(28, '2021-07-02', '01:13:15', NULL),
(29, '2021-07-02', '01:14:01', NULL),
(32, '2021-07-02', '01:14:01', 14),
(33, '2021-07-02', '01:14:01', 15),
(34, '2021-07-02', '01:13:15', NULL),
(35, '2021-07-02', '01:14:01', NULL),
(36, '2021-07-02', '01:14:01', 18),
(37, '2021-07-03', '01:13:15', NULL),
(38, '2021-07-03', '01:14:01', 15),
(39, '2021-07-03', '01:14:01', 3),
(40, '2021-07-03', '01:13:15', NULL),
(41, '2021-07-03', '01:14:01', 18),
(42, '2021-07-03', '01:14:01', 6),
(43, '2021-07-03', '01:13:15', 7),
(44, '2021-07-03', '01:14:01', 9),
(45, '2021-07-03', '01:14:01', 11),
(46, '2021-07-03', '01:13:15', NULL),
(47, '2021-07-03', '01:14:01', NULL),
(49, '2021-07-05', '01:13:15', NULL),
(50, '2021-07-05', '01:14:01', 3),
(51, '2021-07-05', '01:13:15', NULL),
(52, '2021-07-05', '01:14:01', 6),
(53, '2021-07-05', '01:13:15', 7),
(54, '2021-07-05', '01:14:01', 9),
(55, '2021-07-05', '01:14:01', 11),
(56, '2021-07-05', '01:14:01', NULL),
(59, '2021-07-05', '01:14:01', 14),
(60, '2021-07-05', '01:14:01', 15),
(61, '2021-07-06', '01:13:15', NULL),
(62, '2021-07-06', '01:14:01', 2),
(63, '2021-07-06', '01:14:01', 3),
(64, '2021-07-06', '01:13:15', NULL),
(65, '2021-07-06', '01:14:01', 5),
(66, '2021-07-06', '01:14:01', 6),
(67, '2021-07-06', '01:13:15', 7),
(68, '2021-07-06', '01:14:01', 9),
(69, '2021-07-06', '01:14:01', 11),
(70, '2021-07-06', '01:13:15', NULL),
(71, '2021-07-06', '01:13:15', NULL),
(72, '2021-07-06', '01:14:01', 14),
(73, '2021-07-06', '01:14:01', 15),
(74, '2021-07-06', '01:13:15', NULL),
(75, '2021-07-06', '01:14:01', NULL),
(76, '2021-07-06', '01:14:01', 18),
(77, '2021-07-07', '01:13:15', NULL),
(78, '2021-07-07', '01:14:01', 2),
(79, '2021-07-07', '01:14:01', 3),
(80, '2021-07-07', '01:13:15', NULL),
(81, '2021-07-07', '01:14:01', 5),
(82, '2021-07-07', '01:14:01', 6),
(83, '2021-07-07', '01:13:15', 7),
(84, '2021-07-07', '01:14:01', 9),
(85, '2021-07-07', '01:14:01', 11),
(86, '2021-07-07', '01:13:15', NULL),
(87, '2021-07-07', '01:13:15', NULL),
(88, '2021-07-07', '01:14:01', 14),
(89, '2021-07-07', '01:14:01', 15),
(90, '2021-07-07', '01:13:15', NULL),
(91, '2021-07-07', '01:14:01', NULL),
(92, '2021-07-07', '01:14:01', 18),
(93, '2021-07-08', '01:13:15', NULL),
(94, '2021-07-08', '01:14:01', 2),
(95, '2021-07-08', '01:14:01', 3),
(96, '2021-07-08', '01:13:15', NULL),
(97, '2021-07-08', '01:14:01', 5),
(98, '2021-07-08', '01:14:01', 6),
(99, '2021-07-08', '01:13:15', 7),
(100, '2021-07-08', '01:14:01', 9),
(101, '2021-07-08', '01:14:01', 11),
(102, '2021-07-08', '01:13:15', NULL),
(103, '2021-07-08', '01:13:15', NULL),
(104, '2021-07-08', '01:14:01', 14),
(105, '2021-07-08', '01:14:01', 15),
(106, '2021-07-08', '01:13:15', NULL),
(107, '2021-07-08', '01:14:01', NULL),
(108, '2021-07-08', '01:14:01', 18),
(109, '2021-07-09', '01:13:15', NULL),
(110, '2021-07-09', '01:14:01', 2),
(111, '2021-07-09', '01:14:01', 3),
(112, '2021-07-09', '01:13:15', NULL),
(113, '2021-07-09', '01:14:01', 5),
(114, '2021-07-09', '01:14:01', 6),
(115, '2021-07-09', '01:13:15', 7),
(116, '2021-07-09', '01:14:01', 9),
(117, '2021-07-09', '01:14:01', 11),
(118, '2021-07-09', '01:13:15', NULL),
(119, '2021-07-09', '01:14:01', NULL),
(121, '2021-07-09', '01:14:01', 14),
(122, '2021-07-09', '01:14:01', 15),
(123, '2021-07-09', '01:13:15', NULL),
(124, '2021-07-09', '01:14:01', NULL),
(125, '2021-07-09', '01:14:01', 18),
(126, '2021-07-10', '01:13:15', NULL),
(127, '2021-07-10', '01:14:01', 15),
(128, '2021-07-10', '01:14:01', 3),
(129, '2021-07-10', '01:13:15', NULL),
(130, '2021-07-10', '01:14:01', 18),
(131, '2021-07-10', '01:14:01', 6),
(132, '2021-07-10', '01:13:15', 7),
(133, '2021-07-10', '01:14:01', 9),
(134, '2021-07-10', '01:14:01', 11),
(135, '2021-07-10', '01:13:15', NULL),
(136, '2021-07-10', '01:14:01', NULL),
(137, '2021-07-12', '01:13:15', NULL),
(138, '2021-07-12', '01:14:01', 2),
(139, '2021-07-12', '01:14:01', 3),
(140, '2021-07-12', '01:13:15', NULL),
(141, '2021-07-12', '01:14:01', 5),
(142, '2021-07-12', '01:14:01', 6),
(143, '2021-07-12', '01:14:01', 9),
(144, '2021-07-12', '01:14:01', 11),
(145, '2021-07-12', '01:13:15', NULL),
(146, '2021-07-12', '01:13:15', NULL),
(147, '2021-07-12', '01:14:01', 14),
(148, '2021-07-12', '01:14:01', 15),
(149, '2021-07-12', '01:13:15', NULL),
(150, '2021-07-12', '01:14:01', NULL),
(151, '2021-07-12', '01:14:01', 18),
(152, '2021-07-13', '01:14:01', 2),
(153, '2021-07-13', '01:14:01', 3),
(154, '2021-07-13', '01:13:15', NULL),
(155, '2021-07-13', '01:14:01', 5),
(156, '2021-07-13', '01:14:01', 6),
(157, '2021-07-13', '01:14:01', 9),
(158, '2021-07-13', '01:14:01', 11),
(159, '2021-07-13', '01:13:15', NULL),
(160, '2021-07-13', '01:13:15', NULL),
(161, '2021-07-13', '01:14:01', 14),
(162, '2021-07-13', '01:14:01', 15),
(163, '2021-07-13', '01:13:15', NULL),
(164, '2021-07-13', '01:14:01', NULL),
(165, '2021-07-13', '01:14:01', 18),
(166, '2021-07-14', '01:14:01', 2),
(167, '2021-07-14', '01:14:01', 3),
(168, '2021-07-14', '01:14:15', NULL),
(169, '2021-07-14', '01:14:01', 5),
(170, '2021-07-14', '01:14:01', 6),
(171, '2021-07-14', '01:14:01', 9),
(172, '2021-07-14', '01:14:01', 11),
(173, '2021-07-14', '01:14:15', NULL),
(174, '2021-07-14', '01:14:15', NULL),
(175, '2021-07-14', '01:14:01', 14),
(176, '2021-07-14', '01:14:01', 15),
(177, '2021-07-14', '01:14:15', NULL),
(178, '2021-07-14', '01:14:01', NULL),
(179, '2021-07-14', '01:14:01', 18),
(180, '2021-07-15', '01:15:01', NULL),
(181, '2021-07-15', '01:15:01', 2),
(182, '2021-07-15', '01:15:01', 3),
(183, '2021-07-15', '01:15:15', NULL),
(184, '2021-07-15', '01:15:01', 5),
(185, '2021-07-15', '01:15:01', 6),
(186, '2021-07-15', '01:15:01', 9),
(187, '2021-07-15', '01:15:01', 11),
(188, '2021-07-15', '01:15:15', NULL),
(189, '2021-07-15', '01:15:15', NULL),
(190, '2021-07-15', '01:15:01', 14),
(191, '2021-07-15', '01:15:01', 15),
(192, '2021-07-15', '01:15:15', NULL),
(193, '2021-07-15', '01:15:01', NULL),
(194, '2021-07-15', '01:15:01', 18),
(195, '2021-07-16', '01:16:01', NULL),
(196, '2021-07-16', '01:16:01', 2),
(197, '2021-07-16', '01:16:01', 3),
(198, '2021-07-16', '01:16:16', NULL),
(199, '2021-07-16', '01:16:01', 5),
(200, '2021-07-16', '01:16:01', 6),
(201, '2021-07-16', '01:16:01', 9),
(202, '2021-07-16', '01:16:01', 11),
(203, '2021-07-16', '01:16:16', NULL),
(204, '2021-07-16', '01:16:16', NULL),
(205, '2021-07-16', '01:16:01', NULL),
(206, '2021-07-16', '01:16:01', NULL),
(207, '2021-07-16', '01:16:16', NULL),
(208, '2021-07-16', '01:16:01', NULL),
(209, '2021-07-16', '01:16:01', 18),
(210, '2021-07-17', '01:13:15', NULL),
(211, '2021-07-17', '01:14:01', 2),
(212, '2021-07-17', '01:14:01', 3),
(213, '2021-07-17', '01:13:15', NULL),
(214, '2021-07-17', '01:14:01', 5),
(215, '2021-07-17', '01:14:01', 6),
(216, '2021-07-17', '01:13:15', 7),
(217, '2021-07-17', '01:14:01', 9),
(218, '2021-07-17', '01:14:01', 11),
(219, '2021-07-17', '01:13:15', NULL),
(220, '2021-07-17', '01:13:15', NULL),
(221, '2021-07-17', '01:14:01', 14),
(222, '2021-07-17', '01:14:01', 15),
(223, '2021-07-17', '01:13:15', NULL),
(224, '2021-07-17', '01:14:01', NULL),
(225, '2021-07-17', '01:14:01', 18),
(226, '2021-07-19', '01:13:15', NULL),
(227, '2021-07-19', '01:14:01', 2),
(228, '2021-07-19', '01:14:01', 3),
(229, '2021-07-19', '01:13:15', NULL),
(230, '2021-07-19', '01:14:01', 5),
(231, '2021-07-19', '01:14:01', 6),
(232, '2021-07-19', '01:13:15', 7),
(233, '2021-07-19', '01:14:01', 9),
(234, '2021-07-19', '01:14:01', 11),
(235, '2021-07-19', '01:13:15', NULL),
(236, '2021-07-19', '01:13:15', NULL),
(237, '2021-07-19', '01:14:01', 14),
(238, '2021-07-19', '01:14:01', 15),
(239, '2021-07-19', '01:13:15', NULL),
(240, '2021-07-19', '01:14:01', NULL),
(241, '2021-07-19', '01:14:01', 18),
(258, '2021-07-20', '01:13:15', NULL),
(259, '2021-07-20', '01:14:01', 2),
(260, '2021-07-20', '01:14:01', 3),
(261, '2021-07-20', '01:13:15', NULL),
(262, '2021-07-20', '01:14:01', 5),
(263, '2021-07-20', '01:14:01', 6),
(264, '2021-07-20', '01:13:15', 7),
(265, '2021-07-20', '01:14:01', 9),
(266, '2021-07-20', '01:14:01', 11),
(267, '2021-07-20', '01:13:15', NULL),
(268, '2021-07-20', '01:13:15', NULL),
(269, '2021-07-20', '01:14:01', 14),
(270, '2021-07-20', '01:14:01', 15),
(271, '2021-07-20', '01:13:15', NULL),
(272, '2021-07-20', '01:14:01', NULL),
(273, '2021-07-20', '01:14:01', 18),
(274, '2021-07-22', '05:13:09', 5),
(275, '2021-07-22', '05:13:47', NULL),
(276, '2021-07-22', '05:16:33', 2),
(277, '2021-07-22', '05:17:14', 3),
(278, '2021-07-22', '05:17:53', NULL),
(279, '2021-07-22', '05:18:17', 6),
(280, '2021-07-22', '05:21:03', 7),
(281, '2021-07-22', '05:28:40', 9),
(282, '2021-07-22', '05:29:16', 18),
(283, '2021-07-22', '08:24:11', NULL),
(284, '2021-07-23', '08:13:38', NULL),
(285, '2021-07-23', '08:46:49', 2),
(286, '2021-07-23', '09:42:23', NULL),
(287, '2021-07-23', '10:02:39', NULL),
(288, '2021-07-23', '10:07:17', 18),
(289, '2021-07-23', '10:09:28', NULL),
(290, '2021-07-23', '10:10:47', 7),
(291, '2021-07-23', '10:11:53', 15),
(292, '2021-07-23', '10:13:35', 11),
(293, '2021-07-23', '10:14:39', 6),
(294, '2021-07-23', '10:21:56', 19),
(295, '2021-07-23', '10:26:16', 20),
(296, '2021-07-24', '08:57:10', 2),
(297, '2021-07-24', '09:00:18', 5),
(298, '2021-07-24', '09:01:32', 20),
(299, '2021-07-24', '09:09:05', 14),
(300, '2021-07-24', '09:09:41', 7),
(301, '2021-07-24', '09:10:22', 9),
(302, '2021-07-24', '09:11:58', 11),
(303, '2021-07-24', '09:32:11', NULL),
(304, '2021-07-24', '01:47:01', 15),
(305, '2021-07-24', '01:48:20', 18),
(306, '2021-07-24', '01:53:24', 3),
(307, '2021-07-24', '02:55:06', NULL),
(308, '2021-07-24', '04:10:07', 19),
(309, '2021-12-10', '09:06:19', 2),
(310, '2021-12-10', '09:53:26', NULL),
(311, '2021-12-15', '09:51:48', 2),
(312, '2021-12-16', '10:48:18', 2),
(313, '2021-12-17', '12:32:35', NULL),
(314, '2021-12-17', '01:20:06', 2),
(315, '2021-12-20', '09:49:34', 2),
(316, '2021-12-21', '09:55:40', 2),
(317, '2021-12-21', '12:39:58', NULL),
(318, '2021-12-21', '01:49:17', 5);

-- --------------------------------------------------------

--
-- Table structure for table `deductions`
--

CREATE TABLE `deductions` (
  `ded_id` int(11) NOT NULL,
  `deduction` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deductions`
--

INSERT INTO `deductions` (`ded_id`, `deduction`, `emp_id`) VALUES
(1, 2000, NULL),
(2, 0, 2),
(3, 1500, 3),
(4, 500, NULL),
(5, 0, 5),
(6, 1000, 6),
(7, 800, 7),
(8, 0, NULL),
(9, 0, 9),
(10, 0, NULL),
(11, 0, 11),
(12, 0, NULL),
(13, 0, NULL),
(14, 0, 14),
(15, 0, 15),
(16, 0, NULL),
(17, 0, NULL),
(18, 0, 18),
(19, 0, 19),
(20, 0, 20),
(21, 0, NULL),
(22, 0, NULL),
(23, 0, NULL),
(24, 0, NULL),
(25, 0, 25),
(26, 0, 26),
(27, 0, NULL),
(28, 0, NULL),
(29, 0, 29),
(30, 0, NULL),
(31, 0, NULL),
(32, 0, NULL),
(33, 0, NULL),
(34, 0, NULL),
(35, 0, NULL),
(36, 0, NULL),
(37, 0, NULL),
(38, 0, NULL),
(39, 0, 39),
(40, 0, NULL),
(41, 0, NULL),
(42, 0, NULL),
(43, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `id` int(11) NOT NULL,
  `department` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`id`, `department`) VALUES
(3, 'PR Department'),
(4, 'Sales Department'),
(5, 'HR Department');

-- --------------------------------------------------------

--
-- Table structure for table `departments`
--

CREATE TABLE `departments` (
  `dept_id` int(11) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `hod` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `departments`
--

INSERT INTO `departments` (`dept_id`, `dept_name`, `hod`) VALUES
(1, 'Admin Department', 'Muhammad Ameer'),
(2, 'Production Department', 'Zeeshan Sadiq'),
(3, 'Sales Department', 'Amjad Khan');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `password` varchar(20) NOT NULL,
  `department_id` int(11) NOT NULL,
  `address` varchar(2000) NOT NULL,
  `birthday` date NOT NULL,
  `role` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `email`, `mobile`, `password`, `department_id`, `address`, `birthday`, `role`) VALUES
(2, 'Vishal1', 'vishal@gmail.com', '123456789', '123', 3, 'Delhi', '2020-10-31', 2),
(3, 'ad', 'admin@gmail.com', '', 'admin', 4, '', '0000-00-00', 1),
(4, 'Sumit', 'sumit@gmail.com', '1234567890', '123', 3, 'Delhi', '2020-12-31', 2);

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

CREATE TABLE `employees` (
  `emp_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `doj` varchar(50) NOT NULL,
  `dob` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` bigint(20) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` varchar(200) NOT NULL,
  `pos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`emp_id`, `name`, `gender`, `doj`, `dob`, `email`, `phone`, `city`, `address`, `pos_id`) VALUES
(2, 'Nadeem ', 'Male', '2020-09-05', '2000-10-09', 'ali@gmail.com', 3267876565, 'Multan', 'Multan', 1),
(3, 'Arbaz Ali', 'Male', '2020-09-05', '2001-11-10', 'arbaz@gmail.com', 316898878, 'Rajanpur', 'Rajanpur', 2),
(5, 'Aqil Fareed', 'Male', '2020-09-05', '2002-02-05', 'aqil@gmail.com', 3357876767, 'Kohat', 'Kohat', 4),
(6, 'Waheed Murad', 'Male', '2020-09-05', '2003-01-01', 'waheed@gmail.com', 3451234567, 'Karachi', 'Karachi', 5),
(7, 'Arif Habib', 'Male', '2021-09-22', '2000-09-22', 'arif@gmail.com', 3176478789, 'Quetta', 'Quetta', 8),
(9, 'Asif Kamal', 'Male', '2021-09-22', '2000-09-22', 'asif@gmail.com', 3176478788, 'Rajanpur', 'Rajanpur', 5),
(11, 'Akmal Khan', 'Male', '2020-12-12', '2000-11-11', 'akmal@gmail.com', 3125678880, 'Bahawalpur', 'Bahawalpur', 7),
(14, 'Ahmad Mehmood', 'Male', '2020-11-11', '2000-11-11', 'mehmood@gmail.com', 3125678884, 'Attock', 'Attock', 7),
(15, 'Ghazanfar Abbas', 'Male', '2020-11-11', '2000-11-11', 'ghazanfar@gmail.com', 3125678885, 'KALAM', 'KALAM', 10),
(18, 'Umair Asghar', 'Male', '2020-11-11', '2000-11-11', 'umair@gmail.com', 3125678888, 'Rahim Yar Khan', 'Rahim Yar Khan', 6),
(19, 'Waseem Abbas', 'Male', '2020-11-12', '2000-11-11', 'waseem@gmail.com', 3451235678, 'Rajanpur', 'Rajanpur', 9),
(20, 'Naveed Akhtar', 'Male', '2020-11-12', '2000-11-11', 'naveed@gmail.com', 3451235679, 'Rajanpur', 'Rajanpur', 6),
(25, 'Uzair', 'Male', '2000-11-11', '2000-11-11', 'uzair@gmail.com', 3233213112, 'lahore', 'lahore', 1),
(26, 'Khalid', 'Male', '2021-11-11', '2000-11-11', 'khalid@gmail.com', 2322323232, 'lahore', 'lhr', 1),
(29, 'Talha', 'Male', '2021-05-09', '3322-03-23', 'ehrieh@gmail.com', 67890233, 'ghsdhsj', 'ashjwhdj', NULL),
(39, '', 'Male', '', '', '', 0, '', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `leftcomp`
--

CREATE TABLE `leftcomp` (
  `spt_id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `spt_name` varchar(100) NOT NULL,
  `spt_email` varchar(100) NOT NULL,
  `spt_subject` varchar(500) NOT NULL,
  `spt_description` varchar(2000) NOT NULL,
  `spt_date` date NOT NULL,
  `spt_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `leftcomp`
--

INSERT INTO `leftcomp` (`spt_id`, `emp_id`, `spt_name`, `spt_email`, `spt_subject`, `spt_description`, `spt_date`, `spt_time`) VALUES
(5, 2, 'Nadeem', 'urt@gmail.com', 'Leave the company', 'Salary package is very low', '2021-12-20', '23:38:06'),
(6, 2, 'nadeem', 'urt@gmail.com', 'Leaves the Compnay', 'application for leave', '2021-12-21', '13:54:09');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `pos_id` int(11) NOT NULL,
  `pos_name` varchar(200) NOT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`pos_id`, `pos_name`, `dept_id`) VALUES
(1, 'Finance', 1),
(2, 'Assistant', 1),
(3, 'Human Resources', 1),
(4, 'Software Engineer', 2),
(5, 'Software Designer', 2),
(6, 'Software Tester', 2),
(7, 'Quality Assurance', 2),
(8, 'Sales Person', 3),
(9, 'Sales Associate', 3),
(10, 'Sales Specialist', 3);

-- --------------------------------------------------------

--
-- Table structure for table `salaries`
--

CREATE TABLE `salaries` (
  `sal_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `pos_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salaries`
--

INSERT INTO `salaries` (`sal_id`, `amount`, `pos_id`) VALUES
(1, 50000, 1),
(2, 50000, 2),
(3, 60000, 3),
(4, 70000, 4),
(5, 70000, 5),
(6, 70000, 6),
(7, 70000, 7),
(8, 40000, 8),
(9, 50000, 9),
(10, 60000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `support`
--

CREATE TABLE `support` (
  `spt_id` int(11) NOT NULL,
  `spt_name` varchar(100) NOT NULL,
  `spt_email` varchar(100) NOT NULL,
  `spt_subject` varchar(500) NOT NULL,
  `spt_description` varchar(2000) NOT NULL,
  `spt_date` date NOT NULL,
  `spt_time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `support`
--

INSERT INTO `support` (`spt_id`, `spt_name`, `spt_email`, `spt_subject`, `spt_description`, `spt_date`, `spt_time`) VALUES
(1, 'Ahmad Ali', 'ahmadali@gmail.com', 'Employee Entry In The System', 'With due respect,\r\nit is stated that I have been selected as Sales Person in your company a month ago. Still, I have not been issued with the employee id or user login credentials. Please, provide me the said as early. Good Luck! ', '2021-07-21', '13:12:18'),
(2, 'Aziz Durrani', 'aziz@gmail.com', 'Forget Login Password', 'With due respect,\r\nIt is stated that I have forgot my login credntials. I cannot change my password or reset it. Kind advice is required immediately, please.\r\nBest Wishes,\r\nUser ID: 101\r\nEmp. ID: 150', '2021-07-21', '14:36:20'),
(3, 'Aamir Sohail', 'amir@gmail.com', 'Position Change', 'Dear Sir,\r\nI have applied for position change from Software designer post to Software Engineer post. Now, I have received nomination letter as to have the new post as Software Engineer. So, kindly provide me the new login credentials for my new employee account or update the old one with the new data.\r\nThanks.', '2021-07-21', '15:29:02'),
(4, 'Naeem', 'urt@gmail.com', 'bnbn', 'ugui', '2021-12-10', '09:19:51'),
(5, '', '', '', '', '2021-12-16', '22:48:26'),
(6, 'fgreg', 'gtrgtre@gmail.com', 'sfe', '', '2021-12-16', '22:49:39'),
(7, '', '', '', '', '2021-12-17', '01:23:51'),
(8, 'Naeem', 'urt@gmail.com', 'bnbn', 'vuhv', '2021-12-20', '22:33:29'),
(9, 'Naeem', 'urt@gmail.com', 'bnbn', 'njkkkj', '2021-12-20', '22:41:10');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `picture` varchar(200) NOT NULL,
  `type` varchar(50) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `nickname`, `picture`, `type`, `emp_id`, `dept_id`) VALUES
(0, 'muzamil', 'abc123', 'Khan', '', 'admin', NULL, NULL),
(1, 'naeem', 'abc123', 'naeem', '', 'manager', NULL, 1),
(2, 'zeeshan', 'zeeshan', 'zeeshan', '', 'manager', NULL, 2),
(3, 'amjad', 'amjad', 'amjad', '', 'manager', NULL, 3),
(5, 'nadeem', '123', 'malik', '', 'employee', 2, 1),
(6, 'arbaz', 'arbaz', 'arbaz', '', 'employee', 3, 1),
(8, 'aqil', 'aqil', 'aqil', '', 'employee', 5, 2),
(9, 'waheed', 'waheed', 'waheed', '', 'employee', 6, 2),
(10, 'arif', 'arif', 'arif', '', 'employee', 7, 3),
(11, 'asif', 'asif', 'arif', '', 'employee', 9, 2),
(12, 'akmal', 'akmal', 'akmal', '', 'employee', 11, 2),
(15, 'mehmood', 'mehmood', 'mehmood', '', 'employee', 14, 2),
(16, 'ghani', 'ghani', 'ghani', '', 'employee', 15, 3),
(18, 'umair', 'umair', 'umair', '', 'employee', 18, 2),
(19, 'waseem', 'waseem', 'wasee', '', 'employee', 19, 3),
(21, 'naveed', 'naveed', 'naveed', '', 'employee', 20, 2),
(23, 'uzair', 'uzair', 'uzair', '', 'employee', 25, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `allowances`
--
ALTER TABLE `allowances`
  ADD PRIMARY KEY (`alw_id`),
  ADD KEY `fk_emp_in_alw` (`emp_id`);

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announce_id`);

--
-- Indexes for table `assistant`
--
ALTER TABLE `assistant`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`attend_id`),
  ADD KEY `fk_emp_in_attend` (`emp_id`);

--
-- Indexes for table `deductions`
--
ALTER TABLE `deductions`
  ADD PRIMARY KEY (`ded_id`),
  ADD KEY `fk_emp_in_ded` (`emp_id`);

--
-- Indexes for table `departments`
--
ALTER TABLE `departments`
  ADD PRIMARY KEY (`dept_id`);

--
-- Indexes for table `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`emp_id`),
  ADD KEY `fk_pos_in_emp` (`pos_id`);

--
-- Indexes for table `leftcomp`
--
ALTER TABLE `leftcomp`
  ADD PRIMARY KEY (`spt_id`);

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`pos_id`),
  ADD KEY `fk_positons` (`dept_id`);

--
-- Indexes for table `salaries`
--
ALTER TABLE `salaries`
  ADD PRIMARY KEY (`sal_id`),
  ADD KEY `fk_pos_in_sal` (`pos_id`);

--
-- Indexes for table `support`
--
ALTER TABLE `support`
  ADD PRIMARY KEY (`spt_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `fk_emp_in_user` (`emp_id`),
  ADD KEY `fk_dept_in_user` (`dept_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `allowances`
--
ALTER TABLE `allowances`
  MODIFY `alw_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `assistant`
--
ALTER TABLE `assistant`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `attend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=319;

--
-- AUTO_INCREMENT for table `deductions`
--
ALTER TABLE `deductions`
  MODIFY `ded_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `departments`
--
ALTER TABLE `departments`
  MODIFY `dept_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `employees`
--
ALTER TABLE `employees`
  MODIFY `emp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `leftcomp`
--
ALTER TABLE `leftcomp`
  MODIFY `spt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `salaries`
--
ALTER TABLE `salaries`
  MODIFY `sal_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `support`
--
ALTER TABLE `support`
  MODIFY `spt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `allowances`
--
ALTER TABLE `allowances`
  ADD CONSTRAINT `fk_emp_in_alw` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE SET NULL;

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `fk_emp_in_attend` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE SET NULL;

--
-- Constraints for table `deductions`
--
ALTER TABLE `deductions`
  ADD CONSTRAINT `fk_emp_in_ded` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE SET NULL;

--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
  ADD CONSTRAINT `fk_pos_in_emp` FOREIGN KEY (`pos_id`) REFERENCES `positions` (`pos_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `positions`
--
ALTER TABLE `positions`
  ADD CONSTRAINT `fk_positons` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `salaries`
--
ALTER TABLE `salaries`
  ADD CONSTRAINT `fk_pos_in_sal` FOREIGN KEY (`pos_id`) REFERENCES `positions` (`pos_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_dept_in_user` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_emp_in_user` FOREIGN KEY (`emp_id`) REFERENCES `employees` (`emp_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
