-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 12, 2020 at 09:06 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `br6`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `BillId` int(11) NOT NULL,
  `No_Zones` varchar(50) DEFAULT NULL,
  `TarriffId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`BillId`, `No_Zones`, `TarriffId`) VALUES
(1, '4', 1),
(2, '2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerId` int(11) NOT NULL,
  `Cname` varchar(50) DEFAULT NULL,
  `Phone_no` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerId`, `Cname`, `Phone_no`) VALUES
(1, 'John Doe', '0888779625'),
(2, 'Jane Doe', '0998771222');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `PaymentId` int(11) NOT NULL,
  `PaymentModel` varchar(50) DEFAULT NULL,
  `Remaining` varchar(50) DEFAULT NULL,
  `Bill_Paid` varchar(50) DEFAULT NULL,
  `CustomerId` int(11) DEFAULT NULL,
  `BillId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`PaymentId`, `PaymentModel`, `Remaining`, `Bill_Paid`, `CustomerId`, `BillId`) VALUES
(1, 'yearly', '0', '1000', 2, 1),
(2, 'monthly', '1000', '1000', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `PlantId` int(11) NOT NULL,
  `Plantsize` varchar(50) DEFAULT NULL,
  `Plantname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`PlantId`, `Plantsize`, `Plantname`) VALUES
(1, '10', 'plant001'),
(2, '15', 'plant002');

-- --------------------------------------------------------

--
-- Table structure for table `premises`
--

CREATE TABLE `premises` (
  `PremisesId` int(11) NOT NULL,
  `Meter_no` varchar(50) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `StaffId` int(10) NOT NULL,
  `RouteId` int(26) NOT NULL,
  `BillId` int(26) NOT NULL,
  `ZoneId` int(26) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premises`
--

INSERT INTO `premises` (`PremisesId`, `Meter_no`, `CID`, `status`, `StaffId`, `RouteId`, `BillId`, `ZoneId`) VALUES
(1, '10', 2, 'active', 2, 1, 1, 2),
(2, '12', 1, 'suspended', 1, 2, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `RouteId` int(11) NOT NULL,
  `No_Plants` varchar(50) DEFAULT NULL,
  `Status` varchar(50) DEFAULT NULL,
  `PlantId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`RouteId`, `No_Plants`, `Status`, `PlantId`) VALUES
(1, '4', 'Active', 1),
(2, '3', 'Active', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `SectorId` int(11) NOT NULL,
  `Sname` varchar(50) DEFAULT NULL,
  `No_Zones` varchar(50) DEFAULT NULL,
  `SOffice` varchar(50) DEFAULT NULL,
  `Location` varchar(50) DEFAULT NULL,
  `No_plants` varchar(50) DEFAULT NULL,
  `StaffId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`SectorId`, `Sname`, `No_Zones`, `SOffice`, `Location`, `No_plants`, `StaffId`) VALUES
(1, 'Kacyiru', '4', '001', 'KG567', '2', 1),
(2, 'Kicukiro', '4', '001', 'KN890', '1', 2);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffId` int(11) NOT NULL,
  `StaffName` varchar(50) DEFAULT NULL,
  `No_Clients` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffId`, `StaffName`, `No_Clients`) VALUES
(1, 'Paul', '4'),
(2, 'Pauline', '6');

-- --------------------------------------------------------

--
-- Table structure for table `tarriff`
--

CREATE TABLE `tarriff` (
  `TarriffId` int(11) NOT NULL,
  `Tarriff_Type` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarriff`
--

INSERT INTO `tarriff` (`TarriffId`, `Tarriff_Type`) VALUES
(1, 'Commercial'),
(2, 'Domestic');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `ZoneId` int(11) NOT NULL,
  `Zname` varchar(50) DEFAULT NULL,
  `MonthlySupply` varchar(50) DEFAULT NULL,
  `MonthlyConsumption` varchar(50) DEFAULT NULL,
  `No_Routes` varchar(50) DEFAULT NULL,
  `No_Billers` varchar(50) DEFAULT NULL,
  `SectorId` int(11) DEFAULT NULL,
  `RouteId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`ZoneId`, `Zname`, `MonthlySupply`, `MonthlyConsumption`, `No_Routes`, `No_Billers`, `SectorId`, `RouteId`) VALUES
(1, 'Zoneone', '2', '2', '1', '2', 2, 2),
(2, 'Zonetwo', '3', '2', '2', '1', 1, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`BillId`),
  ADD KEY `TarriffId` (`TarriffId`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerId`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`PaymentId`),
  ADD KEY `CustomerId` (`CustomerId`,`BillId`),
  ADD KEY `BillId` (`BillId`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`PlantId`);

--
-- Indexes for table `premises`
--
ALTER TABLE `premises`
  ADD PRIMARY KEY (`PremisesId`),
  ADD KEY `key` (`RouteId`),
  ADD KEY `BillId` (`BillId`),
  ADD KEY `ZoneId` (`ZoneId`),
  ADD KEY `StaffId` (`StaffId`),
  ADD KEY `CID` (`CID`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`RouteId`),
  ADD KEY `PlantId` (`PlantId`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`SectorId`),
  ADD KEY `StaffId` (`StaffId`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffId`);

--
-- Indexes for table `tarriff`
--
ALTER TABLE `tarriff`
  ADD PRIMARY KEY (`TarriffId`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`ZoneId`),
  ADD KEY `SectorId` (`SectorId`,`RouteId`),
  ADD KEY `RouteId` (`RouteId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `BillId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `PaymentId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `plants`
--
ALTER TABLE `plants`
  MODIFY `PlantId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `premises`
--
ALTER TABLE `premises`
  MODIFY `PremisesId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `RouteId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sector`
--
ALTER TABLE `sector`
  MODIFY `SectorId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tarriff`
--
ALTER TABLE `tarriff`
  MODIFY `TarriffId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `ZoneId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_ibfk_1` FOREIGN KEY (`TarriffId`) REFERENCES `tarriff` (`TarriffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`CustomerId`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `payments_ibfk_2` FOREIGN KEY (`BillId`) REFERENCES `bills` (`BillId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `premises`
--
ALTER TABLE `premises`
  ADD CONSTRAINT `premises_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customer` (`CustomerId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `premises_ibfk_2` FOREIGN KEY (`ZoneId`) REFERENCES `zones` (`ZoneId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `premises_ibfk_3` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `premises_ibfk_4` FOREIGN KEY (`BillId`) REFERENCES `bills` (`BillId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `premises_ibfk_5` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`PlantId`) REFERENCES `plants` (`PlantId`);

--
-- Constraints for table `sector`
--
ALTER TABLE `sector`
  ADD CONSTRAINT `sector_ibfk_1` FOREIGN KEY (`StaffId`) REFERENCES `staff` (`StaffId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`SectorId`) REFERENCES `sector` (`SectorId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `zones_ibfk_2` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteId`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
