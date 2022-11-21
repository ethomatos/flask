-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 24, 2021 at 09:20 PM
-- Server version: 5.7.33-0ubuntu0.16.04.1
-- PHP Version: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `real_estate`
--
CREATE DATABASE IF NOT EXISTS `real_estate` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `real_estate`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings_status`
--

CREATE TABLE `bookings_status` (
	`id` int(11) NOT NULL,
	`status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `bookings_status`:
--

-- --------------------------------------------------------

--
-- Table structure for table `features`
--

CREATE TABLE `features` (
	`id` int(11) NOT NULL,
	`feature` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Property feature descriptions';

--
-- RELATIONS FOR TABLE `features`:
--

-- --------------------------------------------------------

--
-- Table structure for table `property`
--

CREATE TABLE `property` (
	`id` int(11) NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`street_address` varchar(255) NOT NULL,
	`city` varchar(255) NOT NULL,
	`state` varchar(255) NOT NULL,
	`zip_code` varchar(100) NOT NULL,
	`unit_count` int(11) NOT NULL,
	`floor_count` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Property description.';

--
-- RELATIONS FOR TABLE `property`:
--

-- --------------------------------------------------------

--
-- Table structure for table `property_features`
--

CREATE TABLE `property_features` (
	`id` int(11) NOT NULL,
	`property_id` int(11) NOT NULL,
	`feature_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='property to features mapping table';

--
-- RELATIONS FOR TABLE `property_features`:
--	 `feature_id`
--			 `features` -> `id`
--	 `property_id`
--			 `property` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `property_type`
--

CREATE TABLE `property_type` (
	`id` int(11) NOT NULL,
	`description` int(11) NOT NULL,
	`property_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `property_type`:
--	 `property_id`
--			 `property` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `Tenant`
--

CREATE TABLE `Tenant` (
	`id` int(11) NOT NULL,
	`first_name` varchar(255) NOT NULL,
	`last_name` varchar(255) NOT NULL,
	`middle_name` varchar(255) NOT NULL,
	`birth_date` date NOT NULL,
	`phone_number` varchar(255) NOT NULL,
	`mail_address` varchar(255) NOT NULL,
	`unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `Tenant`:
--	 `unit_id`
--			 `units` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tenant_bookings`
--

CREATE TABLE `tenant_bookings` (
	`id` int(11) NOT NULL,
	`tenant_id` int(11) NOT NULL,
	`unit_id` int(11) NOT NULL,
	`start_date` date NOT NULL,
	`end_date` date NOT NULL,
	`booking_status_id` int(11) NOT NULL,
	`booking_term` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tenant_bookings`:
--	 `booking_status_id`
--			 `bookings_status` -> `id`
--	 `tenant_id`
--			 `Tenant` -> `id`
--	 `unit_id`
--			 `units` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `tenant_type`
--

CREATE TABLE `tenant_type` (
	`id` int(11) NOT NULL,
	`description` varchar(255) NOT NULL,
	`tenant_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `tenant_type`:
--	 `tenant_id`
--			 `Tenant` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
	`id` int(11) NOT NULL,
	`unit_number` int(11) NOT NULL,
	`room_count` int(11) NOT NULL,
	`bedroom_count` int(11) NOT NULL,
	`property_id` int(11) NOT NULL,
	`bathroom_count` int(11) NOT NULL,
	`area` int(11) NOT NULL COMMENT 'square feet',
	`floor_plan` varchar(255) NOT NULL,
	`notes` varchar(255) NOT NULL,
	`floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `units`:
--	 `property_id`
--			 `property` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `unit_features`
--

CREATE TABLE `unit_features` (
	`id` int(11) NOT NULL,
	`feature_id` int(11) NOT NULL,
	`unit_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `unit_features`:
--	 `unit_id`
--			 `units` -> `id`
--	 `feature_id`
--			 `features` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `unit_price`
--

CREATE TABLE `unit_price` (
	`id` int(11) NOT NULL,
	`unit_id` int(11) NOT NULL,
	`price` float NOT NULL,
	`from_date` date NOT NULL,
	`to_date` date NOT NULL,
	`special_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `unit_price`:
--	 `unit_id`
--			 `units` -> `id`
--

-- --------------------------------------------------------

--
-- Table structure for table `unit_type`
--

CREATE TABLE `unit_type` (
	`id` int(11) NOT NULL,
	`unit_id` int(11) NOT NULL,
	`description` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- RELATIONS FOR TABLE `unit_type`:
--	 `unit_id`
--			 `units` -> `id`
--

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings_status`
--
ALTER TABLE `bookings_status`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`);

--
-- Indexes for table `features`
--
ALTER TABLE `features`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`);

--
-- Indexes for table `property`
--
ALTER TABLE `property`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`);

--
-- Indexes for table `property_features`
--
ALTER TABLE `property_features`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `property_id` (`property_id`),
	ADD KEY `feature_id` (`feature_id`);

--
-- Indexes for table `property_type`
--
ALTER TABLE `property_type`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `Tenant`
--
ALTER TABLE `Tenant`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `tenant_bookings`
--
ALTER TABLE `tenant_bookings`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `tenant_id` (`tenant_id`),
	ADD KEY `unit_id` (`unit_id`),
	ADD KEY `booking_status_id` (`booking_status_id`);

--
-- Indexes for table `tenant_type`
--
ALTER TABLE `tenant_type`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `tenant_id` (`tenant_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `property_id` (`property_id`);

--
-- Indexes for table `unit_features`
--
ALTER TABLE `unit_features`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `unit_id` (`unit_id`),
	ADD KEY `unit_id_2` (`unit_id`),
	ADD KEY `feature_id` (`feature_id`),
	ADD KEY `id_3` (`id`);

--
-- Indexes for table `unit_price`
--
ALTER TABLE `unit_price`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `unit_id` (`unit_id`);

--
-- Indexes for table `unit_type`
--
ALTER TABLE `unit_type`
	ADD PRIMARY KEY (`id`),
	ADD UNIQUE KEY `id` (`id`),
	ADD KEY `id_2` (`id`),
	ADD KEY `unit_id` (`unit_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `property_features`
--
ALTER TABLE `property_features`
	ADD CONSTRAINT `property_features_ibfk_1` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	ADD CONSTRAINT `property_features_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `property_type`
--
ALTER TABLE `property_type`
	ADD CONSTRAINT `property_type_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `Tenant`
--
ALTER TABLE `Tenant`
	ADD CONSTRAINT `Tenant_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tenant_bookings`
--
ALTER TABLE `tenant_bookings`
	ADD CONSTRAINT `tenant_bookings_ibfk_1` FOREIGN KEY (`booking_status_id`) REFERENCES `bookings_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	ADD CONSTRAINT `tenant_bookings_ibfk_2` FOREIGN KEY (`tenant_id`) REFERENCES `Tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	ADD CONSTRAINT `tenant_bookings_ibfk_3` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `tenant_type`
--
ALTER TABLE `tenant_type`
	ADD CONSTRAINT `tenant_type_ibfk_1` FOREIGN KEY (`tenant_id`) REFERENCES `Tenant` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
	ADD CONSTRAINT `units_ibfk_1` FOREIGN KEY (`property_id`) REFERENCES `property` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit_features`
--
ALTER TABLE `unit_features`
	ADD CONSTRAINT `unit_features_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
	ADD CONSTRAINT `unit_features_ibfk_2` FOREIGN KEY (`feature_id`) REFERENCES `features` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit_price`
--
ALTER TABLE `unit_price`
	ADD CONSTRAINT `unit_price_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `unit_type`
--
ALTER TABLE `unit_type`
	ADD CONSTRAINT `unit_type_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `units` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

--
-- Grant permissions to user for monitoring
-- The default user is called datadog but this
-- is being overriden using mysql
--
-- CREATE USER datadog@'%' IDENTIFIED WITH mysql_native_password by '<UNIQUEPASSWORD>';
ALTER USER mysql@'%' WITH MAX_USER_CONNECTIONS 5;
GRANT REPLICATION CLIENT ON *.* TO mysql@'%';
GRANT PROCESS ON *.* TO mysql@'%';
GRANT SELECT ON performance_schema.* TO mysql@'%';

--
-- create a datadog schema
--
CREATE SCHEMA IF NOT EXISTS datadog;
GRANT EXECUTE ON datadog.* to mysql@'%';
GRANT CREATE TEMPORARY TABLES ON datadog.* TO mysql@'%';

--
-- Create the the explain_statement procedure to enable the 
-- Agent to collect explain plans
--
DELIMITER $$
CREATE PROCEDURE datadog.explain_statement(IN query TEXT)
    SQL SECURITY DEFINER
BEGIN
    SET @explain := CONCAT('EXPLAIN FORMAT=json ', query);
    PREPARE stmt FROM @explain;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END $$
DELIMITER ;

--
-- Create this procedure in every schema from which explain plans
-- need to be collected.
--
--DELIMITER $$
--CREATE PROCEDURE <YOUR_SCHEMA>.explain_statement(IN query TEXT)
--    SQL SECURITY DEFINER
--BEGIN
--    SET @explain := CONCAT('EXPLAIN FORMAT=json ', query);
--    PREPARE stmt FROM @explain;
--    EXECUTE stmt;
--    DEALLOCATE PREPARE stmt;
--END $$
--DELIMITER ;
--GRANT EXECUTE ON PROCEDURE <YOUR_SCHEMA>.explain_statement TO mysql@'%';

--
-- Create the following procedure to give the Agent the ability to 
-- enable performance_schema.events_statements_* consumers at runtime
--
DELIMITER $$
CREATE PROCEDURE datadog.enable_events_statements_consumers()
    SQL SECURITY DEFINER
BEGIN
    UPDATE performance_schema.setup_consumers SET enabled='YES' WHERE name LIKE 'events_statements_%';
END $$
DELIMITER ;
GRANT EXECUTE ON PROCEDURE datadog.enable_events_statements_consumers TO mysql@'%';


