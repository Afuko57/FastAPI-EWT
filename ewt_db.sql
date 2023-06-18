-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2023 at 11:09 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ewt_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ewt_data`
--

CREATE TABLE `ewt_data` (
  `pointID` int(11) NOT NULL,
  `pointAlert` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ewt_data`
--

INSERT INTO `ewt_data` (`pointID`, `pointAlert`) VALUES
(1, 'Greeting'),
(2, 'selectProduct'),
(3, 'Prospect');

-- --------------------------------------------------------

--
-- Table structure for table `ewt_data2`
--

CREATE TABLE `ewt_data2` (
  `productID` int(11) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `ewt_current_value` int(20) NOT NULL,
  `ewt_alert_value` int(20) NOT NULL,
  `ewt_config_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ewt_data2`
--

INSERT INTO `ewt_data2` (`productID`, `productName`, `ewt_current_value`, `ewt_alert_value`, `ewt_config_status`) VALUES
(1, 'All', 20, 10, 1),
(1, 'All', 20, 10, 0),
(1, 'All', 5, 1, 1),
(2, 'tmh_post', 20, 10, 1),
(2, 'tmh_post', 20, 10, 0),
(2, 'tmh_post', 5, 1, 1),
(2, 'tmh_pre', 20, 10, 1),
(2, 'tmh_pre', 20, 10, 0),
(2, 'tmh_pre', 5, 1, 1),
(2, 'tol', 20, 10, 1),
(2, 'tol', 20, 10, 0),
(2, 'tol', 5, 1, 1),
(2, 'tvs', 20, 10, 1),
(2, 'tvs', 20, 10, 0),
(2, 'tvs', 5, 1, 1),
(3, 'tmh_pros', 20, 10, 1),
(3, 'tmh_pros', 20, 10, 0),
(3, 'tmh_pros', 5, 1, 1),
(3, 'tol_pros', 20, 10, 1),
(3, 'tol_pros', 20, 10, 0),
(3, 'tol_pros', 5, 1, 1),
(3, 'tvs_pros', 20, 10, 1),
(3, 'tvs_pros', 20, 10, 0),
(3, 'tvs_pros', 5, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ewt_test`
--

CREATE TABLE `ewt_test` (
  `pointID` int(20) NOT NULL,
  `pointAlert` varchar(20) NOT NULL,
  `productName` varchar(20) NOT NULL,
  `ewt_current_value` int(20) NOT NULL,
  `ewt_alert_value` int(20) NOT NULL,
  `ewt_config_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `ewt_test`
--

INSERT INTO `ewt_test` (`pointID`, `pointAlert`, `productName`, `ewt_current_value`, `ewt_alert_value`, `ewt_config_status`) VALUES
(1, 'Greeting', 'All', 20, 10, 1),
(1, 'Greeting', 'All', 20, 10, 0),
(1, 'Greeting', 'All', 5, 1, 1),
(2, 'selectProduct', 'tmh_post', 20, 10, 1),
(2, 'selectProduct', 'tmh_post', 20, 10, 0),
(2, 'selectProduct', 'tmh_post', 5, 1, 1),
(2, 'selectProduct', 'tmh_pre', 20, 10, 1),
(2, 'selectProduct', 'tmh_pre', 20, 10, 0),
(2, 'selectProduct', 'tmh_pre', 5, 1, 1),
(2, 'selectProduct', 'tol', 20, 10, 1),
(2, 'selectProduct', 'tol', 20, 10, 0),
(2, 'selectProduct', 'tol', 5, 1, 1),
(2, 'selectProduct', 'tvs', 20, 10, 1),
(2, 'selectProduct', 'tvs', 20, 10, 0),
(2, 'selectProduct', 'tvs', 5, 1, 1),
(3, 'Prospect', 'tmh_pros', 20, 10, 1),
(3, 'Prospect', 'tmh_pros', 20, 10, 0),
(3, 'Prospect', 'tmh_pros', 5, 1, 1),
(3, 'Prospect', 'tol_pros', 20, 10, 1),
(3, 'Prospect', 'tol_pros', 20, 10, 0),
(3, 'Prospect', 'tol_pros', 5, 1, 1),
(3, 'Prospect', 'tvs_pros', 20, 10, 1),
(3, 'Prospect', 'tvs_pros', 20, 10, 0),
(3, 'Prospect', 'tvs_pros', 5, 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ewt_data`
--
ALTER TABLE `ewt_data`
  ADD PRIMARY KEY (`pointID`) USING BTREE;

--
-- Indexes for table `ewt_data2`
--
ALTER TABLE `ewt_data2`
  ADD KEY `productID` (`productID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ewt_data`
--
ALTER TABLE `ewt_data`
  MODIFY `pointID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ewt_data2`
--
ALTER TABLE `ewt_data2`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ewt_data2`
--
ALTER TABLE `ewt_data2`
  ADD CONSTRAINT `ewt_data2_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `ewt_data` (`pointID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
