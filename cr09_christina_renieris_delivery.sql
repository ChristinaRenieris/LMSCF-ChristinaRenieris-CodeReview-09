-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 03:05 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_chris_renieris_delivery`
--
CREATE DATABASE IF NOT EXISTS `cr09_chris_renieris_delivery` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_chris_renieris_delivery`;

-- --------------------------------------------------------

--
-- Table structure for table `contact_info`
--

CREATE TABLE `contact_info` (
  `contact_info_id` int(11) NOT NULL,
  `street` varchar(35) DEFAULT NULL,
  `house_number` int(11) DEFAULT NULL,
  `zip_code` tinyint(4) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `country` varchar(20) DEFAULT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `fk_sen_rec_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_info`
--

INSERT INTO `contact_info` (`contact_info_id`, `street`, `house_number`, `zip_code`, `city`, `country`, `phone_number`, `fk_sen_rec_id`) VALUES
(1, 'Blue Str. 123', 2, 123, 'Vienna', 'Austria', 69696969, 3),
(2, 'Water Str. 94', 25, 12, 'Athens', 'Greece', 12346651, 5),
(3, 'Rittergasse 34', 5, 36, 'Berlin', 'Germany', 12435674, 4);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `fk_contact_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `fk_contact_info_id`) VALUES
(1, 'Christina', 'Renieris', 3),
(2, 'John', 'Doe', 2),
(3, 'Bobby', 'McBobbin', 1);

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `department_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `department`
--

INSERT INTO `department` (`department_id`, `name`) VALUES
(1, 'Transport'),
(2, 'Front Office'),
(3, 'Warehouse organizer');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `fk_department_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`employee_id`, `first_name`, `last_name`, `birth_date`, `hire_date`, `fk_department_id`) VALUES
(1, 'Boris', 'Jankovic', '1995-11-10', '2005-03-21', 2),
(2, 'Mark', 'Johnson', '1985-06-19', '2015-02-01', 1),
(3, 'Zelda', 'Casimir', '2000-01-01', '2018-08-15', 3);

-- --------------------------------------------------------

--
-- Table structure for table `firm_info`
--

CREATE TABLE `firm_info` (
  `firm_info_id` int(11) NOT NULL,
  `corporate_form` varchar(40) DEFAULT NULL,
  `commercial_registration` int(20) DEFAULT NULL,
  `VAT` varchar(50) DEFAULT NULL,
  `cus_support_tel` int(15) DEFAULT NULL,
  `hq_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `firm_info`
--

INSERT INTO `firm_info` (`firm_info_id`, `corporate_form`, `commercial_registration`, `VAT`, `cus_support_tel`, `hq_address`) VALUES
(1, 'DHL', 4386, 'UT23865', 2105487, 'First Str. 124, Vienna Austria');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` int(11) NOT NULL,
  `date_sent` datetime DEFAULT NULL,
  `date_received` datetime DEFAULT NULL,
  `fk_description_id` int(11) DEFAULT NULL,
  `fk_sen_rec_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `date_sent`, `date_received`, `fk_description_id`, `fk_sen_rec_id`) VALUES
(1, '2020-02-12 15:34:22', '2020-03-19 13:34:22', 1, 5),
(2, '2020-03-12 10:00:16', NULL, 3, 4),
(3, '2020-03-06 13:35:34', '2020-03-19 13:35:34', 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `package_description`
--

CREATE TABLE `package_description` (
  `description_id` int(11) NOT NULL,
  `category` varchar(25) DEFAULT NULL,
  `customs_number` int(11) DEFAULT NULL,
  `weight` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `package_description`
--

INSERT INTO `package_description` (`description_id`, `category`, `customs_number`, `weight`) VALUES
(1, 'Fragile', 1, 25),
(2, 'Furniture', 4, 50),
(3, 'Liquids', 9, 15);

-- --------------------------------------------------------

--
-- Table structure for table `post_office`
--

CREATE TABLE `post_office` (
  `post_office_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_sen_rec_id` int(11) DEFAULT NULL,
  `fk_firm_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_office`
--

INSERT INTO `post_office` (`post_office_id`, `name`, `address`, `phone_number`, `fk_employee_id`, `fk_sen_rec_id`, `fk_firm_info_id`) VALUES
(1, 'DHL', 'Purple str. 15, Vienna Austria', 367457854, 1, 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `post_warehouse`
--

CREATE TABLE `post_warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phone_number` int(15) DEFAULT NULL,
  `capacity` int(50) DEFAULT NULL,
  `fk_employee_id` int(11) DEFAULT NULL,
  `fk_sen_rec_id` int(11) DEFAULT NULL,
  `fk_firm_info_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `post_warehouse`
--

INSERT INTO `post_warehouse` (`warehouse_id`, `name`, `address`, `phone_number`, `capacity`, `fk_employee_id`, `fk_sen_rec_id`, `fk_firm_info_id`) VALUES
(1, 'DHL warehouse', 'Third Str. 73 , Vienna Austria', 68757864, 50, 3, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sender_receiver`
--

CREATE TABLE `sender_receiver` (
  `sen_rec_id` int(11) NOT NULL,
  `package_status` varchar(50) DEFAULT NULL,
  `sender_name` varchar(20) DEFAULT NULL,
  `receiver_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sender_receiver`
--

INSERT INTO `sender_receiver` (`sen_rec_id`, `package_status`, `sender_name`, `receiver_name`) VALUES
(3, 'delivered', 'Maria Papadopoulos', 'John Doe'),
(4, 'on transport', 'Oliver Petergrifin', 'Bobby McBobbin'),
(5, 'delivered', 'Hannah Baliakas', 'Christina Renieris');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD PRIMARY KEY (`contact_info_id`),
  ADD KEY `fk_sen_rec_id` (`fk_sen_rec_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_contact_info_id` (`fk_contact_info_id`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`department_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `fk_department_id` (`fk_department_id`);

--
-- Indexes for table `firm_info`
--
ALTER TABLE `firm_info`
  ADD PRIMARY KEY (`firm_info_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `fk_description_id` (`fk_description_id`),
  ADD KEY `fk_sen_rec_id` (`fk_sen_rec_id`);

--
-- Indexes for table `package_description`
--
ALTER TABLE `package_description`
  ADD PRIMARY KEY (`description_id`);

--
-- Indexes for table `post_office`
--
ALTER TABLE `post_office`
  ADD PRIMARY KEY (`post_office_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_sen_rec_id` (`fk_sen_rec_id`),
  ADD KEY `fk_firm_info_id` (`fk_firm_info_id`);

--
-- Indexes for table `post_warehouse`
--
ALTER TABLE `post_warehouse`
  ADD PRIMARY KEY (`warehouse_id`),
  ADD KEY `fk_sen_rec_id` (`fk_sen_rec_id`),
  ADD KEY `fk_employee_id` (`fk_employee_id`),
  ADD KEY `fk_firm_info_id` (`fk_firm_info_id`);

--
-- Indexes for table `sender_receiver`
--
ALTER TABLE `sender_receiver`
  ADD PRIMARY KEY (`sen_rec_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact_info`
--
ALTER TABLE `contact_info`
  MODIFY `contact_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `department_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `employee_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `firm_info`
--
ALTER TABLE `firm_info`
  MODIFY `firm_info_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package_description`
--
ALTER TABLE `package_description`
  MODIFY `description_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `post_office`
--
ALTER TABLE `post_office`
  MODIFY `post_office_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `post_warehouse`
--
ALTER TABLE `post_warehouse`
  MODIFY `warehouse_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `sender_receiver`
--
ALTER TABLE `sender_receiver`
  MODIFY `sen_rec_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contact_info`
--
ALTER TABLE `contact_info`
  ADD CONSTRAINT `contact_info_ibfk_1` FOREIGN KEY (`fk_sen_rec_id`) REFERENCES `sender_receiver` (`sen_rec_id`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_contact_info_id`) REFERENCES `contact_info` (`contact_info_id`);

--
-- Constraints for table `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`fk_department_id`) REFERENCES `department` (`department_id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`fk_description_id`) REFERENCES `package_description` (`description_id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`fk_sen_rec_id`) REFERENCES `sender_receiver` (`sen_rec_id`);

--
-- Constraints for table `post_office`
--
ALTER TABLE `post_office`
  ADD CONSTRAINT `post_office_ibfk_1` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `post_office_ibfk_2` FOREIGN KEY (`fk_sen_rec_id`) REFERENCES `sender_receiver` (`sen_rec_id`),
  ADD CONSTRAINT `post_office_ibfk_3` FOREIGN KEY (`fk_firm_info_id`) REFERENCES `firm_info` (`firm_info_id`);

--
-- Constraints for table `post_warehouse`
--
ALTER TABLE `post_warehouse`
  ADD CONSTRAINT `post_warehouse_ibfk_1` FOREIGN KEY (`fk_sen_rec_id`) REFERENCES `sender_receiver` (`sen_rec_id`),
  ADD CONSTRAINT `post_warehouse_ibfk_2` FOREIGN KEY (`fk_employee_id`) REFERENCES `employee` (`employee_id`),
  ADD CONSTRAINT `post_warehouse_ibfk_3` FOREIGN KEY (`fk_firm_info_id`) REFERENCES `firm_info` (`firm_info_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
