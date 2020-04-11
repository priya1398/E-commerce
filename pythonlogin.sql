drop database pythonlogin;
CREATE DATABASE IF NOT EXISTS `pythonlogin` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `pythonlogin`;

CREATE TABLE IF NOT EXISTS `accounts` (
	`id` int(6) UNSIGNED NOT NULL DEFAULT '0',
  	`username` varchar(50) NOT NULL,
  	`password` varchar(255) NOT NULL,
  	`email` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);
COMMIT;

ALTER TABLE `accounts`
  MODIFY `id` mediumint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";
-- --------------------------------------------------------
--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customerID` mediumint(4) UNSIGNED NOT NULL DEFAULT '0',
  `customerName` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--
INSERT INTO `customers` (`customerID`, `customerName`) VALUES
(1, 'peter'),
(2, 'sam'),
(3, 'john'),
(4, 'tom'),
(5, 'susan'),
(6, 'mary'),
(7, 'tim'),
(8, 'amy'),
(9, 'jack'),
(10, 'mark'),
(11, 'katy'),
(12, 'jim'),
(13, 'rob'),
(14, 'sean'),
(15, 'leon'),
(16, 'chris'),
(17, 'adam'),
(18, 'gary'),
(19, 'zoe'),
(20, 'ben'),
(21, 'alice'),
(22, 'alex'),
(23, 'ryan'),
(24, 'henry'),
(25, 'oli'),
(26, 'luke'),
(27, 'daniel');
COMMIT;

INSERT INTO accounts (id,username,password,email) SELECT DISTINCT customerId,customerName,CONCAT(customerName,customerId),CONCAT(customerId,'customer@gmail.com') FROM customers;

-- phpMyAdmin SQL Dump

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------
--
-- Table structure for table `movieRatings`
--

CREATE TABLE `movieRatings` (
  `ratingID` int(6) UNSIGNED NOT NULL DEFAULT '0',
  `fkCustomerID` mediumint(4) UNSIGNED NOT NULL,
  `fkMovieID` mediumint(4) UNSIGNED NOT NULL,
  `rating` decimal(6,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
ALTER TABLE `movieRatings`
  ADD PRIMARY KEY (`ratingID`);
COMMIT;

ALTER TABLE `movieRatings`
  MODIFY `ratingID` mediumint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;
-- Dumping data for table `movieRatings`
--

INSERT INTO `movieRatings` (`ratingID`, `fkCustomerID`, `fkMovieID`, `rating`) VALUES
(1, 16, 49, '8.50'),
(2, 15, 2, '8.00'),
(3, 12, 3, '8.00'),
(4, 27, 2, '9.00'),
(5, 12, 4, '9.00'),
(6, 27, 3, '5.00'),
(8, 27, 4, '6.00'),
(9, 15, 4, '1.00'),
(10, 15, 6, '8.00'),
(11, 15, 7, '10.00'),
(12, 12, 7, '8.00'),
(13, 27, 7, '3.00'),
(14, 15, 9, '9.00'),
(16, 26, 3, '6.00'),
(17, 15, 10, '8.00'),
(18, 27, 10, '7.00'),
(19, 12, 8, '9.00'),
(20, 10, 4, '8.00'),
(21, 22, 2, '10.00'),
(23, 27, 11, '7.00'),
(24, 22, 3, '10.00'),
(25, 16, 50, '7.00'),
(26, 26, 2, '8.50'),
(27, 15, 11, '9.00'),
(28, 21, 2, '7.50'),
(29, 10, 6, '10.00'),
(30, 22, 4, '10.00'),
(31, 17, 4, '6.50'),
(32, 12, 10, '9.00'),
(33, 10, 7, '10.00'),
(34, 12, 11, '7.00'),
(35, 15, 13, '6.00'),
(36, 27, 19, '2.00'),
(37, 22, 6, '7.00'),
(38, 15, 15, '8.00'),
(39, 22, 7, '10.00'),
(40, 21, 4, '9.00'),
(41, 27, 23, '6.00'),
(42, 10, 9, '7.50'),
(43, 22, 8, '10.00'),
(45, 10, 10, '7.00'),
(46, 16, 51, '7.50'),
(48, 17, 8, '9.50'),
(49, 27, 16, '7.00'),
(50, 15, 17, '9.00'),
(51, 12, 12, '7.50'),
(52, 16, 42, '8.50'),
(53, 12, 13, '8.50'),
(54, 15, 20, '1.00'),
(56, 9, 2, '8.50'),
(57, 16, 29, '9.50'),
(58, 10, 12, '8.50'),
(59, 22, 9, '10.00'),
(60, 21, 3, '8.00'),
(61, 26, 19, '1.00'),
(62, 17, 10, '9.50'),
(63, 10, 14, '8.50'),
(65, 17, 11, '8.00'),
(68, 2, 3, '10.00'),
(69, 9, 4, '8.50'),
(70, 21, 6, '5.00'),
(71, 22, 11, '10.00'),
(72, 10, 16, '6.00'),
(73, 15, 27, '6.00'),
(74, 21, 7, '8.00'),
(75, 9, 6, '8.00'),
(76, 22, 12, '9.00'),
(77, 15, 28, '5.00'),
(78, 12, 16, '8.00'),
(79, 2, 6, '9.00'),
(80, 27, 25, '6.00'),
(81, 15, 29, '10.00'),
(82, 21, 8, '9.00'),
(83, 16, 3, '7.50'),
(84, 9, 7, '8.00'),
(85, 10, 19, '5.00'),
(86, 22, 13, '10.00'),
(87, 27, 27, '6.00'),
(88, 21, 10, '5.00'),
(89, 9, 8, '9.00'),
(90, 21, 11, '6.50'),
(91, 27, 29, '5.00'),
(92, 15, 31, '10.00'),
(93, 9, 10, '9.00'),
(94, 10, 23, '10.00'),
(95, 12, 18, '9.00'),
(96, 27, 36, '8.00'),
(98, 9, 11, '7.50'),
(99, 10, 27, '9.00'),
(100, 15, 36, '4.00'),
(101, 21, 12, '8.00'),
(102, 17, 20, '8.90'),
(103, 12, 19, '8.00'),
(104, 27, 40, '7.00'),
(105, 15, 37, '3.00'),
(107, 9, 12, '8.50'),
(109, 21, 13, '9.00'),
(110, 15, 38, '2.00'),
(111, 27, 42, '8.00'),
(112, 9, 13, '8.00'),
(113, 21, 15, '8.00'),
(114, 15, 40, '5.00'),
(115, 9, 14, '9.00'),
(116, 27, 50, '5.00'),
(117, 15, 41, '1.00'),
(118, 27, 51, '6.00'),
(119, 9, 15, '8.00'),
(120, 15, 42, '10.00'),
(121, 21, 16, '5.00'),
(122, 9, 16, '6.00'),
(123, 9, 18, '9.00'),
(124, 15, 44, '8.00'),
(125, 9, 19, '7.00'),
(126, 17, 24, '9.50'),
(127, 15, 50, '2.00'),
(128, 15, 51, '3.00'),
(129, 22, 15, '9.00'),
(130, 9, 20, '8.00'),
(132, 22, 16, '10.00'),
(133, 9, 24, '8.00'),
(134, 17, 38, '8.50'),
(135, 22, 17, '10.00'),
(136, 12, 22, '9.00'),
(137, 21, 19, '8.00'),
(138, 9, 25, '7.00'),
(139, 24, 2, '10.00'),
(140, 10, 29, '7.00'),
(141, 21, 20, '7.50'),
(142, 10, 30, '4.00'),
(143, 9, 27, '7.00'),
(144, 24, 3, '10.00'),
(145, 2, 11, '8.00'),
(146, 9, 28, '5.00'),
(147, 21, 21, '6.00'),
(148, 24, 4, '10.00'),
(149, 17, 40, '8.50'),
(150, 9, 29, '8.50'),
(152, 24, 6, '10.00'),
(153, 17, 46, '9.00'),
(154, 11, 4, '7.00'),
(155, 2, 30, '7.00'),
(156, 24, 7, '10.00'),
(157, 10, 41, '4.50'),
(159, 11, 7, '7.50'),
(160, 10, 40, '5.00'),
(161, 24, 9, '10.00'),
(162, 22, 18, '9.00'),
(163, 12, 27, '8.00'),
(164, 10, 39, '6.50'),
(165, 21, 25, '4.00'),
(166, 24, 10, '10.00'),
(167, 2, 29, '8.00'),
(168, 22, 19, '7.00'),
(169, 11, 13, '9.00'),
(170, 12, 29, '7.50'),
(171, 24, 11, '10.00'),
(172, 21, 27, '6.00'),
(173, 10, 49, '9.00'),
(174, 24, 12, '10.00'),
(175, 11, 16, '6.50'),
(177, 10, 50, '7.50'),
(179, 21, 28, '7.00'),
(180, 10, 51, '8.50'),
(181, 24, 13, '10.00'),
(182, 9, 30, '8.00'),
(183, 21, 29, '8.00'),
(184, 24, 14, '10.00'),
(185, 21, 30, '8.00'),
(186, 12, 32, '8.00'),
(187, 21, 31, '7.50'),
(188, 10, 37, '7.50'),
(189, 24, 15, '10.00'),
(190, 11, 25, '7.00'),
(191, 22, 24, '10.00'),
(192, 21, 33, '4.00'),
(193, 24, 16, '9.00'),
(195, 2, 36, '7.00'),
(196, 11, 29, '7.50'),
(199, 21, 36, '8.50'),
(200, 9, 32, '7.00'),
(201, 21, 37, '9.00'),
(202, 9, 36, '1.00'),
(203, 24, 19, '10.00'),
(204, 21, 39, '6.00'),
(205, 2, 44, '7.00'),
(206, 9, 39, '8.00'),
(207, 12, 40, '9.00'),
(208, 11, 36, '6.90'),
(209, 21, 40, '7.50'),
(210, 9, 40, '4.00'),
(211, 24, 20, '9.00'),
(212, 12, 42, '7.00'),
(213, 21, 41, '3.00'),
(214, 9, 41, '2.00'),
(215, 11, 37, '8.00'),
(216, 24, 21, '10.00'),
(217, 21, 42, '9.00'),
(218, 12, 45, '2.00'),
(219, 9, 42, '7.00'),
(220, 10, 11, '5.50'),
(222, 17, 42, '8.00'),
(223, 21, 44, '7.00'),
(224, 2, 50, '5.00'),
(225, 24, 24, '8.00'),
(226, 12, 46, '8.00'),
(227, 22, 27, '9.00'),
(228, 11, 40, '6.70'),
(229, 22, 28, '9.00'),
(230, 24, 25, '9.00'),
(232, 10, 13, '5.50'),
(233, 22, 31, '10.00'),
(234, 9, 43, '8.00'),
(235, 11, 42, '6.80'),
(236, 2, 19, '8.00'),
(237, 24, 27, '10.00'),
(238, 11, 43, '7.00'),
(239, 10, 32, '8.00'),
(241, 22, 32, '10.00'),
(242, 11, 28, '7.00'),
(243, 24, 29, '8.00'),
(245, 24, 30, '10.00'),
(246, 21, 46, '4.00'),
(247, 24, 31, '10.00'),
(248, 11, 45, '5.50'),
(249, 9, 46, '7.00'),
(250, 24, 32, '10.00'),
(251, 2, 16, '7.00'),
(252, 21, 47, '3.00'),
(254, 11, 47, '6.00'),
(255, 9, 51, '6.00'),
(256, 22, 33, '8.00'),
(257, 24, 33, '10.00'),
(258, 9, 50, '6.00'),
(259, 11, 49, '7.00'),
(260, 24, 36, '7.00'),
(261, 2, 7, '7.00'),
(262, 21, 48, '6.00'),
(263, 24, 37, '10.00'),
(264, 21, 49, '8.50'),
(265, 9, 48, '8.00'),
(267, 21, 50, '5.50'),
(269, 11, 50, '5.00'),
(270, 2, 4, '6.50'),
(271, 22, 36, '8.00'),
(272, 2, 41, '9.00'),
(273, 11, 39, '6.50'),
(274, 24, 40, '6.00'),
(275, 22, 39, '10.00'),
(276, 22, 40, '4.00'),
(277, 24, 41, '9.00'),
(278, 22, 41, '10.00'),
(279, 24, 42, '8.00'),
(280, 24, 44, '7.00'),
(281, 24, 45, '6.00'),
(282, 24, 46, '9.00'),
(283, 22, 42, '7.00'),
(284, 24, 48, '6.00'),
(285, 24, 49, '6.00'),
(286, 7, 2, '8.00'),
(287, 24, 50, '7.00'),
(288, 7, 4, '7.00'),
(290, 7, 10, '6.00'),
(291, 11, 26, '8.50'),
(292, 7, 11, '10.00'),
(293, 22, 46, '10.00'),
(294, 22, 47, '5.00'),
(295, 7, 12, '5.00'),
(297, 7, 13, '5.00'),
(298, 24, 51, '8.00'),
(299, 8, 2, '8.00'),
(300, 8, 3, '7.50'),
(301, 8, 4, '8.50'),
(302, 8, 5, '3.50'),
(303, 8, 6, '9.00'),
(304, 8, 7, '9.50'),
(305, 8, 8, '9.00'),
(306, 6, 2, '8.00'),
(307, 6, 3, '1.00'),
(308, 8, 9, '7.00'),
(309, 6, 4, '7.50'),
(310, 8, 10, '8.00'),
(312, 6, 8, '8.50'),
(313, 8, 11, '8.00'),
(314, 6, 9, '10.00'),
(315, 8, 12, '8.00'),
(316, 6, 10, '6.50'),
(317, 6, 11, '8.00'),
(318, 8, 13, '3.50'),
(320, 6, 13, '6.00'),
(321, 6, 14, '9.00'),
(322, 8, 14, '8.00'),
(323, 6, 15, '9.50'),
(324, 8, 15, '6.50'),
(325, 6, 16, '7.00'),
(326, 8, 16, '5.00'),
(327, 8, 17, '3.50'),
(328, 6, 49, '8.00'),
(329, 6, 42, '9.50'),
(330, 6, 41, '7.00'),
(331, 5, 2, '9.00'),
(332, 6, 40, '4.00'),
(333, 8, 18, '1.00'),
(334, 5, 4, '8.50'),
(335, 6, 37, '7.50'),
(336, 8, 19, '7.50'),
(337, 5, 3, '8.50'),
(338, 8, 20, '7.00'),
(339, 6, 36, '7.50'),
(340, 5, 7, '9.00'),
(341, 6, 31, '9.00'),
(342, 5, 11, '7.00'),
(343, 8, 21, '3.00'),
(345, 5, 12, '7.00'),
(346, 6, 29, '6.50'),
(347, 8, 22, '3.00'),
(348, 5, 13, '8.50'),
(349, 8, 23, '1.00'),
(350, 6, 27, '9.00'),
(351, 8, 24, '3.00'),
(352, 6, 19, '10.00'),
(353, 8, 25, '8.50'),
(354, 8, 26, '3.00'),
(355, 8, 27, '8.00'),
(356, 8, 28, '7.50'),
(357, 8, 29, '7.50'),
(358, 8, 30, '8.00'),
(359, 8, 31, '8.50'),
(361, 8, 32, '6.00'),
(362, 8, 33, '7.00'),
(363, 8, 34, '7.00'),
(364, 8, 35, '7.50'),
(365, 8, 36, '7.00'),
(366, 8, 37, '6.50'),
(367, 8, 38, '3.00'),
(368, 8, 39, '8.00'),
(369, 8, 40, '7.50'),
(370, 8, 41, '9.00'),
(371, 8, 42, '7.00'),
(372, 8, 43, '3.00'),
(373, 8, 44, '3.50'),
(374, 8, 45, '7.50'),
(375, 8, 46, '6.00'),
(377, 8, 47, '3.00'),
(378, 5, 16, '9.00'),
(379, 5, 19, '9.00'),
(380, 8, 48, '2.00'),
(382, 8, 49, '6.50'),
(383, 8, 50, '7.00'),
(384, 8, 51, '7.00'),
(385, 5, 22, '9.50'),
(386, 5, 23, '9.50'),
(387, 5, 25, '8.00'),
(388, 5, 27, '9.00'),
(389, 5, 28, '6.00'),
(390, 5, 29, '8.00'),
(391, 5, 31, '8.00'),
(392, 5, 36, '8.00'),
(393, 5, 37, '9.00'),
(394, 5, 39, '9.00'),
(395, 5, 41, '7.00'),
(396, 5, 42, '7.00'),
(397, 5, 43, '7.00'),
(398, 5, 44, '8.00'),
(399, 5, 45, '8.00'),
(400, 5, 51, '9.00'),
(401, 5, 50, '7.00'),
(402, 7, 19, '7.00'),
(403, 7, 20, '7.00'),
(404, 7, 21, '8.00'),
(405, 7, 27, '8.00'),
(406, 7, 29, '9.00'),
(408, 7, 37, '10.00'),
(410, 7, 49, '9.00'),
(411, 4, 2, '10.00'),
(412, 4, 3, '8.00'),
(415, 4, 6, '8.50'),
(416, 4, 7, '9.00'),
(417, 4, 8, '10.00'),
(418, 4, 9, '7.00'),
(419, 4, 10, '8.50'),
(420, 4, 11, '7.50'),
(421, 4, 13, '8.00'),
(422, 4, 14, '8.50'),
(423, 4, 15, '8.00'),
(424, 4, 16, '7.50'),
(425, 4, 20, '7.00'),
(426, 4, 21, '8.00'),
(427, 4, 22, '7.00'),
(428, 4, 24, '8.50'),
(429, 4, 25, '9.00'),
(430, 4, 26, '8.00'),
(431, 4, 27, '9.00'),
(432, 4, 29, '6.00'),
(433, 4, 30, '5.00'),
(434, 4, 31, '8.00'),
(435, 4, 32, '9.00'),
(436, 4, 33, '10.00'),
(438, 4, 38, '8.00'),
(439, 4, 40, '5.00'),
(440, 4, 42, '4.00'),
(441, 4, 43, '9.00'),
(442, 4, 44, '7.00'),
(443, 20, 2, '8.00'),
(444, 20, 3, '7.00'),
(445, 20, 4, '9.00'),
(446, 20, 6, '8.00'),
(448, 20, 8, '10.00'),
(449, 20, 9, '8.00'),
(450, 20, 10, '10.00'),
(451, 20, 11, '7.00'),
(453, 20, 12, '9.00'),
(454, 20, 13, '9.00'),
(456, 20, 16, '8.00'),
(457, 20, 17, '7.00'),
(459, 20, 19, '8.00'),
(460, 20, 25, '8.00'),
(463, 20, 28, '9.00'),
(464, 20, 29, '9.00'),
(465, 20, 31, '8.00'),
(466, 20, 36, '10.00'),
(468, 20, 39, '7.00'),
(470, 20, 41, '6.00'),
(471, 20, 42, '9.00'),
(472, 20, 44, '8.00'),
(473, 20, 45, '7.00'),
(474, 20, 47, '6.00'),
(475, 20, 49, '9.00'),
(476, 20, 50, '9.00'),
(477, 20, 51, '10.00'),
(478, 26, 5, '3.00'),
(479, 26, 7, '9.00'),
(481, 26, 9, '4.00'),
(482, 26, 11, '6.00'),
(483, 26, 16, '9.50'),
(484, 26, 18, '4.00'),
(485, 26, 24, '5.50'),
(486, 26, 27, '8.00'),
(487, 26, 29, '8.50'),
(488, 26, 31, '3.00'),
(489, 26, 39, '4.50'),
(491, 26, 41, '8.50'),
(492, 26, 42, '7.00'),
(493, 26, 47, '9.00'),
(494, 26, 49, '7.50'),
(495, 26, 50, '6.50'),
(496, 23, 2, '7.00'),
(499, 23, 6, '8.00'),
(500, 23, 7, '3.00'),
(501, 23, 8, '7.00'),
(502, 23, 10, '8.00'),
(503, 23, 11, '7.00'),
(504, 23, 12, '9.00'),
(505, 23, 13, '7.00'),
(506, 23, 14, '7.00'),
(507, 23, 15, '8.00'),
(508, 23, 16, '7.00'),
(509, 23, 18, '8.00'),
(510, 23, 19, '8.00'),
(511, 23, 20, '8.00'),
(512, 23, 25, '8.00'),
(513, 23, 27, '7.00'),
(514, 23, 28, '8.00'),
(515, 23, 29, '6.00'),
(516, 23, 30, '5.00'),
(517, 23, 31, '7.00'),
(518, 23, 32, '6.00'),
(519, 23, 33, '8.00'),
(520, 23, 36, '9.00'),
(521, 23, 37, '6.00'),
(522, 23, 38, '8.00'),
(523, 23, 39, '7.00'),
(524, 23, 40, '6.00'),
(525, 23, 41, '6.00'),
(526, 23, 42, '7.00'),
(527, 23, 46, '7.00'),
(528, 23, 47, '3.00'),
(529, 23, 49, '5.00'),
(530, 14, 2, '9.00'),
(531, 14, 4, '8.00'),
(532, 14, 6, '7.00'),
(533, 14, 7, '10.00'),
(534, 14, 8, '7.00'),
(535, 14, 10, '9.00'),
(536, 14, 11, '10.00'),
(537, 14, 12, '6.00'),
(538, 14, 13, '8.00'),
(539, 14, 16, '6.00'),
(540, 14, 19, '6.00'),
(541, 14, 20, '5.00'),
(542, 14, 21, '7.00'),
(544, 14, 27, '7.00'),
(545, 14, 29, '7.00'),
(546, 14, 33, '8.00'),
(547, 14, 36, '8.00'),
(548, 14, 37, '6.00'),
(549, 14, 39, '7.00'),
(550, 14, 40, '9.00'),
(551, 14, 41, '6.00'),
(552, 14, 42, '8.00'),
(553, 14, 43, '5.00'),
(554, 14, 45, '6.00'),
(557, 14, 50, '7.00'),
(558, 14, 51, '7.00'),
(560, 18, 8, '10.00'),
(561, 18, 4, '10.00'),
(562, 18, 3, '6.50');

--
-- Indexes for table `movieRatings`
--
ALTER TABLE `movieRatings`
  ADD PRIMARY KEY (`ratingID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--
CREATE TABLE `movies` (
  `movieID` mediumint(4) UNSIGNED NOT NULL,
  `movieRank` smallint(3) UNSIGNED NOT NULL,
  `movieTitle` varchar(120) CHARACTER SET utf8 NOT NULL,
  `imdbID` varchar(10) NOT NULL,
  `movieDirector` varchar(80) CHARACTER SET utf8 NOT NULL,
  `movieProtagonist` varchar(80) CHARACTER SET utf8 NOT NULL,
  `movieGenre` varchar(40) NOT NULL,
  `IMDBrating` decimal(5,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `Image` text(65535) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='forECommerceDataAnalytics';

--
-- Dumping data for table `movies`
--
INSERT INTO `movies` (`movieID`, `movieRank`, `movieTitle`, `imdbID`, `movieDirector`, `movieProtagonist`, `movieGenre`, `IMDBrating`,`Image`) VALUES
(2, 1, 'The Shawshank Redemption ', 'tt0111161', 'Frank Darabont', 'Morgan Freeman ', 'Drama', '9.20', 'https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(3, 2, 'The Godfather ', 'tt0068646', 'Francis Ford Coppola', 'Marlon Brando', 'Crime', '9.20', 'https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY268_CR3,0,182,268_AL_.jpg')
,(4, 3, 'The Dark Knight ', 'tt0468569', 'Christopher Nolan', 'Christian Bale', 'Action', '9.00', 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(5, 4, '12 Angry Men ', 'tt0050083', 'Sidney Lumet', 'Henry Fonda', 'Drama', '8.90', 'https://m.media-amazon.com/images/M/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(6, 5, "Schindler's List ", 'tt0108052', 'Steven Spielberg', 'Liam Neeson', 'Drama', '8.90', 'https://m.media-amazon.com/images/M/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(7, 6, 'The Lord of the Rings', 'tt0120737', 'Peter Jackson', 'Elijah Wood', 'Adventure', '8.90', 'https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(8, 7, 'Pulp Fiction ', 'tt0110912', 'Quentin Tarantino', 'John Travolta', 'Crime', '8.90', 'https://m.media-amazon.com/images/M/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UY268_CR1,0,182,268_AL_.jpg')
,(9, 8, 'The Good, the Bad and the Ugly', 'tt0060196', 'Sergio Leone', 'Clint Eastwood', 'Western', '8.80', 'https://m.media-amazon.com/images/M/MV5BOTQ5NDI3MTI4MF5BMl5BanBnXkFtZTgwNDQ4ODE5MDE@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(10, 9, 'Fight Club ', 'tt0137523', 'David Fincher', 'Brad Pitt', 'Drama', '8.80', 'https://m.media-amazon.com/images/M/MV5BMmEzNTkxYjQtZTc0MC00YTVjLTg5ZTEtZWMwOWVlYzY0NWIwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(11, 10, 'Forrest Gump ', 'tt0109830', 'Robert Zemeckis', 'Tom Hanks', 'Romance', '8.70', 'https://m.media-amazon.com/images/M/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UY268_CR1,0,182,268_AL_.jpg')
,(12, 11, 'The Empire Strikes Back ', 'tt0080684', 'Irvin Kershner', 'Harrison Ford', 'Sci-Fi', '8.70', 'https://m.media-amazon.com/images/M/MV5BYmU1NDRjNDgtMzhiMi00NjZmLTg5NGItZDNiZjU5NTU4OTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(13, 12, 'Inception ', 'tt1375666', 'Christopher Nolan', 'Leonardo DiCaprio', 'Action', '8.70', 'https://m.media-amazon.com/images/M/MV5BMjAxMzY3NjcxNF5BMl5BanBnXkFtZTcwNTI5OTM0Mw@@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(14, 13, "One Flew Over the Cuckoo's Nest ", 'tt0073486', 'Milos Forman', 'Jack Nicholson', 'Drama', '8.70', 'https://m.media-amazon.com/images/M/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(15, 14, 'Goodfellas ', 'tt0099685', 'Martin Scorsese', 'Robert De Niro', 'Crime', '8.70', 'https://m.media-amazon.com/images/M/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(16, 15, 'The Matrix ', 'tt0133093', 'Wachowski Brothers', 'Keanu Reeves', 'Sci-Fi', '8.60', 'https://m.media-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(17, 16, 'Seven Samurai ', 'tt0047478', 'Akira Kurosawa', 'Takashi Shimura', 'Adventure', '8.60', 'https://m.media-amazon.com/images/M/MV5BODdlYjU1Y2MtMWUxMy00YjJjLTgyMWItNzgzZmZkNTYxNWFkXkEyXkFqcGdeQXVyMTAwMjU1MzA2._V1_UX182_CR0,0,182,268_AL_.jpg')
,(18, 17, 'City of God ', 'tt0317248', ' Fernando Meirelles', 'Alexandre Rodrigues', 'Crime', '8.60', 'https://m.media-amazon.com/images/M/MV5BNDJiNTEwMjMtOGQ1ZC00OTczLWFjZjctZWQ0MGJjZmFkMjcwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(19, 18, 'Star Wars ', 'tt0076759', 'George Lucas', 'Harrison Ford', 'Sci-Fi', '8.60', 'https://m.media-amazon.com/images/M/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(20, 19, 'The Silence of the Lambs ', 'tt0102926', 'Jonathan Demme', 'Anthony Hopkins', 'Thriller', '8.60', 'https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(21, 20, "It's a Wonderful Life ", 'tt0038650', 'Frank Capra', 'James Stewart', 'Fantasy', '8.60', 'https://m.media-amazon.com/images/M/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU@._V1_UY268_CR1,0,182,268_AL_.jpg')
,(22, 21, 'Life Is Beautiful ', 'tt0118799', 'Roberto Benigni', 'Roberto Benigni', 'Comedy', '8.60', 'https://m.media-amazon.com/images/M/MV5BYmJmM2Q4NmMtYThmNC00ZjRlLWEyZmItZTIwOTBlZDQ3NTQ1XkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(23, 22, 'Spider-Man: Into the Spider-Verse ', 'tt4633694', 'Bob Persichetti', 'Shameik Moore', 'Animation', '8.60', 'https://m.media-amazon.com/images/M/MV5BMjMwNDkxMTgzOF5BMl5BanBnXkFtZTgwNTkwNTQ3NjM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(24, 23, 'Leon ', 'tt0110413', 'Luc Besson', 'Jean Reno', 'Crime', '8.50', 'https://m.media-amazon.com/images/M/MV5BZDAwYTlhMDEtNTg0OS00NDY2LWJjOWItNWY3YTZkM2UxYzUzXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY268_CR4,0,182,268_AL_.jpg')
,(25, 24, 'The Green Mile ', 'tt0120689', 'Frank Darabont', 'Tom Hanks', 'Fantasy', '8.50', 'https://m.media-amazon.com/images/M/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_UX182_CR0,0,182,268_AL_.jpg')
,(26, 25, 'Untouchable ', 'tt1675434', 'Olivier Nakache', 'Franois Cluzet', 'Comedy', '8.50', 'https://m.media-amazon.com/images/M/MV5BMTYxNDA3MDQwNl5BMl5BanBnXkFtZTcwNTU4Mzc1Nw@@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(27, 26, 'Back to the Future ', 'tt0088763', 'Robert Zemeckis', 'Michael J. Fox', 'Sci-Fi', '8.50', 'https://m.media-amazon.com/images/M/MV5BZmU0M2Y1OGUtZjIxNi00ZjBkLTg1MjgtOWIyNThiZWIwYjRiXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(28, 27, 'Terminator 2: Judgment Day ', 'tt0103064', 'James Cameron', 'Arnold Schwarzenegger', 'Action', '8.50', 'https://m.media-amazon.com/images/M/MV5BMGU2NzRmZjUtOGUxYS00ZjdjLWEwZWItY2NlM2JhNjkxNTFmXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(29, 28, 'The Lion King ', 'tt0110357', 'Roger Allers', 'Matthew Broderick', 'Animation', '8.50', 'https://m.media-amazon.com/images/M/MV5BYTYxNGMyZTYtMjE3MS00MzNjLWFjNmYtMDk3N2FmM2JiM2M1XkEyXkFqcGdeQXVyNjY5NDU4NzI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(30, 29, 'Raiders of the Lost Ark ', 'tt0082971', 'Steven Spielberg', 'Harrison Ford', 'Action', '8.50', 'https://m.media-amazon.com/images/M/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA@@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(31, 30, 'Gladiator ', 'tt0172495', 'Ridley Scott', 'Russell Crowe', 'Action', '8.50', 'https://m.media-amazon.com/images/M/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(32, 31, 'The Prestige ', 'tt0482571', 'Christopher Nolan', 'Christian Bale', 'Thriller', '8.50', 'https://m.media-amazon.com/images/M/MV5BMjA4NDI0MTIxNF5BMl5BanBnXkFtZTYwNTM0MzY2._V1_UX182_CR0,0,182,268_AL_.jpg')
,(33, 32, 'Apocalypse Now ', 'tt0078788', 'Francis Ford Coppola', 'Marlon Brando', 'Drama', '8.40', 'https://m.media-amazon.com/images/M/MV5BMDdhODg0MjYtYzBiOS00ZmI5LWEwZGYtZDEyNDU4MmQyNzFkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(34, 33, 'The Great Dictator ', 'tt0032553', 'Charles Chaplin', 'Charles Chaplin', 'Comedy', '8.40', 'https://m.media-amazon.com/images/M/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(35, 34, 'Dr. Strangelove ', 'tt0057012', 'Stanley Kubrick', 'Peter Sellers', 'Comedy', '8.40', 'https://m.media-amazon.com/images/M/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(36, 35, 'Avengers: Infinity War ', 'tt4154756', 'Anthony Russo', 'Robert Downey Jr.', 'Action', '8.40', 'https://m.media-amazon.com/images/M/MV5BMjMxNjY2MDU1OV5BMl5BanBnXkFtZTgwNzY1MTUwNTM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(37, 36, 'WALL.E ', 'tt0910970', 'Andrew Stanton', 'Elissa Knight', 'Animation', '8.40', 'https://m.media-amazon.com/images/M/MV5BMjExMTg5OTU0NF5BMl5BanBnXkFtZTcwMjMxMzMzMw@@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(38, 37, 'American Beauty ', 'tt0169547', 'Sam Mendes', 'Kevin Spacey', 'Drama', '8.30', 'https://m.media-amazon.com/images/M/MV5BNTBmZWJkNjctNDhiNC00MGE2LWEwOTctZTk5OGVhMWMyNmVhXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(39, 38, 'Aliens ', 'tt0090605', 'James Cameron', 'Sigourney Weaver', 'Sci-Fi', '8.30', 'https://m.media-amazon.com/images/M/MV5BZGU2OGY5ZTYtMWNhYy00NjZiLWI0NjUtZmNhY2JhNDRmODU3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(40, 39, 'Titanic ', 'tt0120338', 'James Cameron', 'Leonardo DiCaprio', 'Romance', '8.30', 'https://m.media-amazon.com/images/M/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(41, 40, 'Braveheart ', 'tt0112573', 'Mel Gibson', 'Mel Gibson', 'Drama', '8.30', 'https://m.media-amazon.com/images/M/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(42, 41, 'Toy Story ', 'tt0114709', 'John Lasseter', 'Tom Hanks', 'Animation', '8.30', 'https://m.media-amazon.com/images/M/MV5BMDU2ZWJlMjktMTRhMy00ZTA5LWEzNDgtYmNmZTEwZTViZWJkXkEyXkFqcGdeQXVyNDQ2OTk4MzI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(43, 42, 'Amélie', 'tt0211915', 'Jean-Pierre Jeunet', 'Audrey Tautou', 'Romance', '8.30', 'https://m.media-amazon.com/images/M/MV5BNDg4NjM1YjMtYmNhZC00MjM0LWFiZmYtNGY1YjA3MzZmODc5XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(44, 43, 'To Kill a Mockingbird ', 'tt0056592', 'Robert Mulligan', 'Gregory Peck', 'Drama', '8.30', 'https://m.media-amazon.com/images/M/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(45, 44, 'The Exorcist ', 'tt0070047', 'William Friedkin', 'Ellen Burstyn', 'Horror', '8.00', 'https://m.media-amazon.com/images/M/MV5BYjhmMGMxZDYtMTkyNy00YWVmLTgyYmUtYTU3ZjcwNTBjN2I1XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(46, 45, 'Snatch ', 'tt0208092', 'Guy Ritchie', 'Brad Pitt', 'Crime', '8.30', 'https://m.media-amazon.com/images/M/MV5BMTA2NDYxOGYtYjU1Mi00Y2QzLTgxMTQtMWI1MGI0ZGQ5MmU4XkEyXkFqcGdeQXVyNDk3NzU2MTQ@._V1_UY268_CR0,0,182,268_AL_.jpg')
,(47, 46, 'Tom Raider ', 'tt1365519', 'Roar Uthaug', 'Alicia Vikander', 'Thriller', '8.20', 'https://m.media-amazon.com/images/M/MV5BOTY4NDcyZGQtYmVlNy00ODgwLTljYTMtYzQ2OTE3NDhjODMwXkEyXkFqcGdeQXVyNzYzODM3Mzg@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(48, 47, 'L.A. Confidential ', 'tt0119488', 'Curtis Hanson', 'Kevin Spacey', 'Thriller', '8.20', 'https://m.media-amazon.com/images/M/MV5BMDQ2YzEyZGItYWRhOS00MjBmLTkzMDUtMTdjYzkyMmQxZTJlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UY268_CR0,0,182,268_AL_.jpg')
,(49, 48, 'Up ', 'tt1049413', 'Pete Docter', 'Edward Asner', 'Adventure', '8.20', 'https://m.media-amazon.com/images/M/MV5BMTk3NDE2NzI4NF5BMl5BanBnXkFtZTgwNzE1MzEyMTE@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(50, 49, 'Matilda ', 'tt0117008', 'Danny DeVito', 'Mara Wilson', 'Comedy', '8.20', 'https://m.media-amazon.com/images/M/MV5BZTA4MmI5YzgtOTU1Yy00NGVjLTgyMGQtNjNlMDY2YWVlZmYyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX182_CR0,0,182,268_AL_.jpg')
,(51, 50, 'How to Train Your Dragon ', 'tt0892769', 'Dean DeBlois', 'Jay Baruchel ', 'Animation', '8.10', 'https://m.media-amazon.com/images/M/MV5BMjA5NDQyMjc2NF5BMl5BanBnXkFtZTcwMjg5ODcyMw@@._V1_UX182_CR0,0,182,268_AL_.jpg');


--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movieID`);

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movieID` mediumint(4) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
COMMIT;

ALTER TABLE movies ADD COLUMN Price DECIMAL(5,2);

UPDATE movies SET Price = '48.64' WHERE movieID = 2;
COMMIT;
UPDATE movies SET Price = '60.31' WHERE movieID = 3;
COMMIT;
UPDATE movies SET Price = '88.39' WHERE movieID = 4;
COMMIT;
UPDATE movies SET Price = '99.82' WHERE movieID = 5;
COMMIT;
UPDATE movies SET Price = '96.24' WHERE movieID = 6;
COMMIT;
UPDATE movies SET Price = '54.61' WHERE movieID = 7;
COMMIT;
UPDATE movies SET Price = '93.94' WHERE movieID = 8;
COMMIT;
UPDATE movies SET Price = '56.64' WHERE movieID = 9;
COMMIT;
UPDATE movies SET Price = '78.00' WHERE movieID = 10;
COMMIT;
UPDATE movies SET Price = '52.23' WHERE movieID = 11;
COMMIT;
UPDATE movies SET Price = '44.55' WHERE movieID = 12;
COMMIT;
UPDATE movies SET Price = '77.00' WHERE movieID = 13;
COMMIT;
UPDATE movies SET Price = '93.50' WHERE movieID = 14;
COMMIT;
UPDATE movies SET Price = '53.94' WHERE movieID = 15;
COMMIT;
UPDATE movies SET Price = '91.20' WHERE movieID = 16;
COMMIT;
UPDATE movies SET Price = '37.00' WHERE movieID = 17;
COMMIT;
UPDATE movies SET Price = '78.50' WHERE movieID = 18;
COMMIT;
UPDATE movies SET Price = '66.60' WHERE movieID = 19;
COMMIT;
UPDATE movies SET Price = '88.00' WHERE movieID = 20;
COMMIT;
UPDATE movies SET Price = '80.60' WHERE movieID = 21;
COMMIT;
UPDATE movies SET Price = '46.54' WHERE movieID = 22;
COMMIT;
UPDATE movies SET Price = '43.56' WHERE movieID = 23;
COMMIT;
UPDATE movies SET Price = '70.94' WHERE movieID = 24;
COMMIT;
UPDATE movies SET Price = '62.50' WHERE movieID = 25;
COMMIT;
UPDATE movies SET Price = '62.75' WHERE movieID = 26;
COMMIT;
UPDATE movies SET Price = '44.75' WHERE movieID = 27;
COMMIT;
UPDATE movies SET Price = '49.25' WHERE movieID = 28;
COMMIT;
UPDATE movies SET Price = '34.80' WHERE movieID = 29;
COMMIT;
UPDATE movies SET Price = '55.00' WHERE movieID = 30;
COMMIT;
UPDATE movies SET Price = '74.00' WHERE movieID = 31;
COMMIT;
UPDATE movies SET Price = '43.00' WHERE movieID = 32;
COMMIT;
UPDATE movies SET Price = '67.90' WHERE movieID = 33;
COMMIT;
UPDATE movies SET Price = '61.00' WHERE movieID = 34;
COMMIT;
UPDATE movies SET Price = '45.56' WHERE movieID = 35;
COMMIT;
UPDATE movies SET Price = '41.64' WHERE movieID = 36;
COMMIT;
UPDATE movies SET Price = '96.00' WHERE movieID = 37;
COMMIT;
UPDATE movies SET Price = '53.28' WHERE movieID = 38;
COMMIT;
UPDATE movies SET Price = '67.27' WHERE movieID = 39;
COMMIT;
UPDATE movies SET Price = '66.88' WHERE movieID = 40;
COMMIT;
UPDATE movies SET Price = '87.90' WHERE movieID = 41;
COMMIT;
UPDATE movies SET Price = '63.90' WHERE movieID = 42;
COMMIT;
UPDATE movies SET Price = '35.00' WHERE movieID = 43;
COMMIT;
UPDATE movies SET Price = '88.64' WHERE movieID = 44;
COMMIT;
UPDATE movies SET Price = '71.34' WHERE movieID = 45;
COMMIT;
UPDATE movies SET Price = '92.57' WHERE movieID = 46;
COMMIT;
UPDATE movies SET Price = '74.82' WHERE movieID = 47;
COMMIT;
UPDATE movies SET Price = '50.43' WHERE movieID = 48;
COMMIT;
UPDATE movies SET Price = '62.48' WHERE movieID = 49;
COMMIT;
UPDATE movies SET Price = '98.40' WHERE movieID = 50;
COMMIT;
UPDATE movies SET Price = '60.48' WHERE movieID = 51;
COMMIT;


