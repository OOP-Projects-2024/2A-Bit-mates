-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 21, 2024 at 08:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drivingschool_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts_tbl`
--

CREATE TABLE `accounts_tbl` (
  `id` int(11) NOT NULL,
  `adminid` int(11) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `token` text DEFAULT NULL,
  `isdeleted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts_tbl`
--

INSERT INTO `accounts_tbl` (`id`, `adminid`, `username`, `password`, `email`, `token`, `isdeleted`) VALUES
(1, 123, 'rus', '$2y$10$OTdiNjkyZmQyMTJmMDMyNucXxGQK0BseYRgXVeW88cHLMxPvCZ9rK', 'rus@gmail.com', 'Y2MyYTU5YjFmY2M3MDFlZDI5N2FlZTc0ZjY0ZWU0MThhMjUyZGQ4M2JiZjlhZjgzOGIxN2VmZTZlYzE4YzcxMw==', 0),
(2, 444, 'test', '$2y$10$ZTM0NTkwOTZjMjE4OTk0NevIOArbWgJbB5jkAsjKKjhRY6PE1tTNy', 'test@gmail.com', 'M2I5YzRkYmI1MWI1Mjg4Mjc0M2FjNGZmYzAxNjg0NDNhMDE5YWFkNjA3OGFmMWMxMGFmOTUyZWJmNzMyMTMzOQ==', 0);

-- --------------------------------------------------------

--
-- Table structure for table `comments_tbl`
--

CREATE TABLE `comments_tbl` (
  `id` int(11) NOT NULL,
  `fname` varchar(55) NOT NULL,
  `lname` varchar(55) NOT NULL,
  `email` varchar(100) NOT NULL,
  `package_name` varchar(100) NOT NULL,
  `comment` text NOT NULL,
  `rating` int(11) NOT NULL CHECK (`rating` between 1 and 5),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments_tbl`
--

INSERT INTO `comments_tbl` (`id`, `fname`, `lname`, `email`, `package_name`, `comment`, `rating`, `created_at`) VALUES
(1, 'rums3', 'rums3', 'rums3@gmail.com', 'Manual Car Training', 'Betlo training package!', 5, '2024-12-20 21:11:05');

-- --------------------------------------------------------

--
-- Table structure for table `package_tbl`
--

CREATE TABLE `package_tbl` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package_tbl`
--

INSERT INTO `package_tbl` (`id`, `package_name`, `cost`, `created_at`) VALUES
(1, 'Automatic Car Training', 12000.00, '2024-12-17 19:46:40'),
(2, 'Manual Car Training', 10000.00, '2024-12-17 19:46:40');

-- --------------------------------------------------------

--
-- Table structure for table `payment_tbl`
--

CREATE TABLE `payment_tbl` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `payment_amount` decimal(10,2) NOT NULL,
  `payment_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment_tbl`
--

INSERT INTO `payment_tbl` (`id`, `user_id`, `package_id`, `payment_amount`, `payment_date`) VALUES
(1, 3, 2, 10000.00, '2024-12-17 19:55:45'),
(2, 5, 2, 10000.00, '2024-12-17 19:58:06'),
(3, 13, 1, 12000.00, '2024-12-20 21:25:08');

-- --------------------------------------------------------

--
-- Table structure for table `user_tbl`
--

CREATE TABLE `user_tbl` (
  `id` int(11) NOT NULL,
  `fname` varchar(55) DEFAULT NULL,
  `lname` varchar(55) DEFAULT NULL,
  `email` varchar(55) DEFAULT NULL,
  `no` varchar(20) DEFAULT NULL,
  `package` varchar(55) DEFAULT NULL,
  `isdeleted` int(11) DEFAULT 0,
  `created_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_tbl`
--

INSERT INTO `user_tbl` (`id`, `fname`, `lname`, `email`, `no`, `package`, `isdeleted`, `created_at`) VALUES
(1, 'rald', 'rald', 'rald@gmail.com', '09999999992', '0', 0, '2024-12-20 19:42:53'),
(3, 'rus', 'rus', 'rus@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(4, 'rums', 'rums', 'rums@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(5, 'rums1', 'rums1', 'rums1@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(6, 'rums2', 'rums2', 'rums2@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(7, 'rums2', 'rums2', 'rums2@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(8, 'rums2', 'rums2', 'rums2@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(9, 'rums2', 'rums2', 'rums2@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(10, 'rums2', 'rums2', 'rums2@gmail.com', '2147483647', '0', 0, '0000-00-00 00:00:00'),
(11, 'rams2', 'rams2', 'rams2@gmail.com', '09999999994', '0', 0, '0000-00-00 00:00:00'),
(12, 'raws5', 'raws5', 'raws5@gmail.com', '09999999993', '0', 0, '2024-12-17 09:12:54'),
(13, 'zip', 'zip', 'zip@gmail.com', '09876543211', 'Automatic Car Training', 0, '2024-12-20 21:22:56'),
(15, 'ziip', 'ziip', 'ziip@gmail.com', '09876543212', 'Automatic Car Training', 0, '2024-12-20 21:24:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `comments_tbl`
--
ALTER TABLE `comments_tbl`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `package_tbl`
--
ALTER TABLE `package_tbl`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_package_name` (`package_name`);

--
-- Indexes for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `package_id` (`package_id`);

--
-- Indexes for table `user_tbl`
--
ALTER TABLE `user_tbl`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts_tbl`
--
ALTER TABLE `accounts_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `comments_tbl`
--
ALTER TABLE `comments_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package_tbl`
--
ALTER TABLE `package_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_tbl`
--
ALTER TABLE `user_tbl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `payment_tbl`
--
ALTER TABLE `payment_tbl`
  ADD CONSTRAINT `payment_tbl_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user_tbl` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_tbl_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package_tbl` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
