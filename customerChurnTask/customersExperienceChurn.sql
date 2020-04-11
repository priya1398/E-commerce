-- phpMyAdmin SQL Dump

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

-- --------------------------------------------------------

--
-- Table structure for table `customersChurn`
--

CREATE TABLE `customersChurn` (
  `customerID` mediumint(4) UNSIGNED NOT NULL DEFAULT '0',
  `nickname` varchar(20) NOT NULL,
  `Delivery` varchar(20) NOT NULL,
  `Price` varchar(20) NOT NULL,
  `Website` varchar(20) NOT NULL,
  `productQuality` varchar(20) NOT NULL,
  `Loyalty` varchar(20) NOT NULL,
  `Security` varchar(20) NOT NULL,
  `customerService` varchar(20) NOT NULL,
  `churn` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customersChurn`
--

INSERT INTO `customersChurn` (`customerID`, `nickname`, `Delivery`, `Price`, `Website`, `productQuality`, `Loyalty`, `Security`, `customerService`, `churn`) VALUES
(1, 'peter', 'VERY BAD', 'BAD', 'VERY BAD', 'BAD', 'HIGH', 'VERY BAD', 'GOOD', 'YES'),
(2, 'sam', 'BAD', 'VERY GOOD', 'VERY GOOD', 'BAD', 'LOW', 'GOOD', 'GOOD', 'NO'),
(3, 'john', 'VERY GOOD', 'VERY GOOD', 'BAD', 'VERY GOOD', 'MEDIUM', 'VERY GOOD', 'BAD', 'NO'),
(4, 'tom', 'GOOD', 'BAD', 'VERY BAD', 'GOOD', 'MEDIUM', 'GOOD', 'VERY GOOD', 'YES'),
(5, 'susan', 'BAD', 'VERY GOOD', 'GOOD', 'GOOD', 'LOW', 'VERY GOOD', 'BAD', 'NO'),
(6, 'mary', 'GOOD', 'BAD', 'VERY BAD', 'VERY GOOD', 'LOW', 'BAD', 'GOOD', 'YES'),
(7, 'tim', 'VERY BAD', 'VERY BAD', 'GOOD', 'GOOD', 'HIGH', 'BAD', 'BAD', 'YES'),
(8, 'amy', 'VERY GOOD', 'BAD', 'GOOD', 'BAD', 'LOW', 'VERY GOOD', 'VERY GOOD', 'NO'),
(9, 'jack', 'GOOD', 'BAD', 'BAD', 'GOOD', 'MEDIUM', 'BAD', 'GOOD', 'YES'),
(10, 'mark', 'VERY GOOD', 'GOOD', 'VERY BAD', 'VERY BAD', 'HIGH', 'VERY BAD', 'GOOD', 'YES'),
(11, 'katy', 'GOOD', 'VERY GOOD', 'VERY BAD', 'GOOD', 'LOW', 'VERY GOOD', 'BAD', 'NO'),
(12, 'jim', 'BAD', 'BAD', 'GOOD', 'GOOD', 'MEDIUM', 'BAD', 'VERY GOOD', 'NO'),
(13, 'rob', 'BAD', 'GOOD', 'GOOD', 'VERY GOOD', 'LOW', 'GOOD', 'GOOD', 'NO'),
(15, 'leon', 'BAD', 'BAD', 'VERY GOOD', 'GOOD', 'HIGH', 'BAD', 'VERY GOOD', 'YES'),
(16, 'chris', 'BAD', 'VERY BAD', 'GOOD', 'BAD', 'HIGH', 'GOOD', 'VERY BAD', 'YES'),
(17, 'adam', 'VERY GOOD', 'GOOD', 'GOOD', 'GOOD', 'LOW', 'BAD', 'GOOD', 'NO'),
(20, 'ben', 'GOOD', 'GOOD', 'GOOD', 'GOOD', 'HIGH', 'VERY GOOD', 'BAD', 'NO'),
(21, 'alice', 'GOOD', 'VERY GOOD', 'VERY BAD', 'VERY GOOD', 'MEDIUM', 'GOOD', 'VERY GOOD', 'NO'),
(22, 'alex', 'BAD', 'VERY BAD', 'GOOD', 'VERY GOOD', 'HIGH', 'BAD', 'VERY BAD', 'YES'),
(24, 'henry', 'VERY GOOD', 'VERY GOOD', 'BAD', 'GOOD', 'HIGH', 'VERY GOOD', 'GOOD', 'NO'),
(25, 'oli', 'GOOD', 'VERY BAD', 'GOOD', 'BAD', 'LOW', 'GOOD', 'GOOD', 'YES'),
(26, 'luke', 'BAD', 'VERY BAD', 'GOOD', 'GOOD', 'HIGH', 'GOOD', 'GOOD', 'NO'),
(27, 'daniel', 'VERY BAD', 'BAD', 'GOOD', 'GOOD', 'MEDIUM', 'BAD', 'GOOD', 'YES');

--
-- Indexes for table `customersChurn`
--
ALTER TABLE `customersChurn`
  ADD PRIMARY KEY (`customerID`);
COMMIT;

