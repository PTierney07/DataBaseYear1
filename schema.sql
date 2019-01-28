-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 10, 2018 at 06:15 PM
-- Server version: 5.5.52-MariaDB
-- PHP Version: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ptierney07`
--

-- --------------------------------------------------------

--
-- Table structure for table `Assignment`
--

CREATE TABLE IF NOT EXISTS `Assignment` (
  `ProjectID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Contract`
--

CREATE TABLE IF NOT EXISTS `Contract` (
  `ContractID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Start` date NOT NULL,
  `DueFinish` date DEFAULT NULL,
  `ActualFinish` date DEFAULT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE IF NOT EXISTS `Employee` (
  `EmployeeID` bigint(20) NOT NULL,
  `Title` varchar(32) DEFAULT NULL,
  `FirstName` varchar(255) NOT NULL,
  `LastName` varchar(255) NOT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Joined` date DEFAULT NULL,
  `Left` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL DEFAULT '1',
  `Phone` varchar(32) NOT NULL,
  `GradeID` int(11) NOT NULL,
  `Manager` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EmployeeSkill`
--

CREATE TABLE IF NOT EXISTS `EmployeeSkill` (
  `EmployeeID` bigint(20) NOT NULL,
  `SkillID` bigint(20) NOT NULL,
  `DateAchieved` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Equipment`
--

CREATE TABLE IF NOT EXISTS `Equipment` (
  `EquipmentID` bigint(20) NOT NULL,
  `Type` varchar(255) NOT NULL,
  `Make` varchar(255) DEFAULT NULL,
  `Model` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL,
  `OperationNotes` text,
  `Damaged` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EquipmentLoan`
--

CREATE TABLE IF NOT EXISTS `EquipmentLoan` (
  `EmployeeID` bigint(20) NOT NULL,
  `EquipmentID` bigint(20) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date DEFAULT NULL,
  `Current` tinyint(1) NOT NULL DEFAULT '1',
  `Notes` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Expense`
--

CREATE TABLE IF NOT EXISTS `Expense` (
  `ExpenseID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `ProjectID` bigint(20) DEFAULT NULL,
  `Description` varchar(255) NOT NULL,
  `Amount` double NOT NULL,
  `Paid` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FileItem`
--

CREATE TABLE IF NOT EXISTS `FileItem` (
  `ItemID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL DEFAULT '',
  `Location` varchar(255) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Grade`
--

CREATE TABLE IF NOT EXISTS `Grade` (
  `GradeID` int(11) NOT NULL,
  `Title` varchar(128) NOT NULL,
  `Code` varchar(16) NOT NULL,
  `SpineMin` int(11) NOT NULL DEFAULT '1',
  `SpineMax` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Payslip`
--

CREATE TABLE IF NOT EXISTS `Payslip` (
  `PayslipID` bigint(20) NOT NULL,
  `EmployeeID` bigint(20) NOT NULL,
  `Taxable` double NOT NULL DEFAULT '0',
  `NonTaxable` double NOT NULL DEFAULT '0',
  `IncomeTax` double NOT NULL DEFAULT '0',
  `NationalInsurance` double NOT NULL DEFAULT '0',
  `NetPay` double NOT NULL DEFAULT '0',
  `Payday` date NOT NULL,
  `TransferDay` date NOT NULL,
  `TransferRef` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE IF NOT EXISTS `Project` (
  `ProjectID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL,
  `Notes` text,
  `Internal` tinyint(1) NOT NULL DEFAULT '0',
  `Sensitive` tinyint(1) NOT NULL DEFAULT '0',
  `Started` date NOT NULL,
  `Ended` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Skill`
--

CREATE TABLE IF NOT EXISTS `Skill` (
  `SkillID` bigint(20) NOT NULL,
  `Title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Assignment`
--
ALTER TABLE `Assignment`
  ADD KEY `ProjectID` (`ProjectID`,`EmployeeID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `Contract`
--
ALTER TABLE `Contract`
  ADD PRIMARY KEY (`ContractID`),
  ADD UNIQUE KEY `ContractID` (`ContractID`),
  ADD UNIQUE KEY `ContractID_3` (`ContractID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ContractID_2` (`ContractID`,`Title`,`EmployeeID`);

--
-- Indexes for table `Employee`
--
ALTER TABLE `Employee`
  ADD PRIMARY KEY (`EmployeeID`),
  ADD UNIQUE KEY `EmployeeID` (`EmployeeID`),
  ADD UNIQUE KEY `EmployeeID_4` (`EmployeeID`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD UNIQUE KEY `EmployeeID_3` (`EmployeeID`,`Email`),
  ADD KEY `Manager` (`Manager`),
  ADD KEY `GradeID` (`GradeID`),
  ADD KEY `EmployeeID_2` (`EmployeeID`,`FirstName`,`LastName`,`Current`,`Manager`),
  ADD KEY `Email_2` (`Email`);

--
-- Indexes for table `EmployeeSkill`
--
ALTER TABLE `EmployeeSkill`
  ADD KEY `SkillID` (`SkillID`),
  ADD KEY `EmployeeID` (`EmployeeID`,`SkillID`),
  ADD KEY `EmployeeID_2` (`EmployeeID`,`SkillID`);

--
-- Indexes for table `Equipment`
--
ALTER TABLE `Equipment`
  ADD PRIMARY KEY (`EquipmentID`),
  ADD UNIQUE KEY `EquipmentID` (`EquipmentID`),
  ADD UNIQUE KEY `EquipmentID_3` (`EquipmentID`),
  ADD KEY `EquipmentID_2` (`EquipmentID`,`Type`,`Model`,`Description`,`Damaged`),
  ADD KEY `Model` (`Model`);

--
-- Indexes for table `EquipmentLoan`
--
ALTER TABLE `EquipmentLoan`
  ADD KEY `EquipmentID` (`EquipmentID`),
  ADD KEY `EmployeeID` (`EmployeeID`,`EquipmentID`,`StartDate`,`EndDate`,`Current`);

--
-- Indexes for table `Expense`
--
ALTER TABLE `Expense`
  ADD PRIMARY KEY (`ExpenseID`),
  ADD UNIQUE KEY `ExpenseID` (`ExpenseID`),
  ADD UNIQUE KEY `ExpenseID_3` (`ExpenseID`),
  ADD KEY `ExpenseID_2` (`ExpenseID`,`EmployeeID`,`ProjectID`,`Description`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `FileItem`
--
ALTER TABLE `FileItem`
  ADD PRIMARY KEY (`ItemID`),
  ADD UNIQUE KEY `ItemID` (`ItemID`),
  ADD UNIQUE KEY `ItemID_3` (`ItemID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `ItemID_2` (`ItemID`,`Title`,`EmployeeID`);

--
-- Indexes for table `Grade`
--
ALTER TABLE `Grade`
  ADD PRIMARY KEY (`GradeID`),
  ADD UNIQUE KEY `GradeID` (`GradeID`),
  ADD UNIQUE KEY `Code` (`Code`),
  ADD UNIQUE KEY `GradeID_3` (`GradeID`,`Code`),
  ADD UNIQUE KEY `GradeID_4` (`GradeID`,`Code`),
  ADD UNIQUE KEY `GradeID_6` (`GradeID`),
  ADD KEY `Grade_Index` (`GradeID`),
  ADD KEY `Code_Index` (`Code`),
  ADD KEY `Code_2` (`Code`),
  ADD KEY `GradeID_2` (`GradeID`),
  ADD KEY `GradeID_5` (`GradeID`,`Code`);

--
-- Indexes for table `Payslip`
--
ALTER TABLE `Payslip`
  ADD PRIMARY KEY (`PayslipID`),
  ADD UNIQUE KEY `PayslipID` (`PayslipID`),
  ADD UNIQUE KEY `PayslipID_3` (`PayslipID`),
  ADD KEY `EmployeeID` (`EmployeeID`),
  ADD KEY `PayslipID_2` (`PayslipID`,`EmployeeID`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ProjectID`),
  ADD UNIQUE KEY `ProjectID` (`ProjectID`),
  ADD UNIQUE KEY `ProjectID_3` (`ProjectID`),
  ADD KEY `ProjectID_2` (`ProjectID`,`Title`,`Internal`,`Sensitive`,`Started`,`Notes`(255));

--
-- Indexes for table `Skill`
--
ALTER TABLE `Skill`
  ADD PRIMARY KEY (`SkillID`),
  ADD UNIQUE KEY `SkillID` (`SkillID`),
  ADD UNIQUE KEY `Title` (`Title`),
  ADD UNIQUE KEY `SkillID_3` (`SkillID`,`Title`),
  ADD KEY `SkillID_2` (`SkillID`),
  ADD KEY `Title_2` (`Title`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Contract`
--
ALTER TABLE `Contract`
  MODIFY `ContractID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Employee`
--
ALTER TABLE `Employee`
  MODIFY `EmployeeID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Equipment`
--
ALTER TABLE `Equipment`
  MODIFY `EquipmentID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Expense`
--
ALTER TABLE `Expense`
  MODIFY `ExpenseID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `FileItem`
--
ALTER TABLE `FileItem`
  MODIFY `ItemID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Grade`
--
ALTER TABLE `Grade`
  MODIFY `GradeID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Payslip`
--
ALTER TABLE `Payslip`
  MODIFY `PayslipID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ProjectID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `Skill`
--
ALTER TABLE `Skill`
  MODIFY `SkillID` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `Assignment`
--
ALTER TABLE `Assignment`
  ADD CONSTRAINT `Assignment_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`),
  ADD CONSTRAINT `Assignment_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Contract`
--
ALTER TABLE `Contract`
  ADD CONSTRAINT `Contract_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Employee`
--
ALTER TABLE `Employee`
  ADD CONSTRAINT `Employee_ibfk_2` FOREIGN KEY (`GradeID`) REFERENCES `Grade` (`GradeID`),
  ADD CONSTRAINT `Employee_ibfk_1` FOREIGN KEY (`Manager`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `EmployeeSkill`
--
ALTER TABLE `EmployeeSkill`
  ADD CONSTRAINT `EmployeeSkill_ibfk_2` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `EmployeeSkill_ibfk_1` FOREIGN KEY (`SkillID`) REFERENCES `Skill` (`SkillID`);

--
-- Constraints for table `EquipmentLoan`
--
ALTER TABLE `EquipmentLoan`
  ADD CONSTRAINT `EquipmentLoan_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `EquipmentLoan_ibfk_2` FOREIGN KEY (`EquipmentID`) REFERENCES `Equipment` (`EquipmentID`);

--
-- Constraints for table `Expense`
--
ALTER TABLE `Expense`
  ADD CONSTRAINT `Expense_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`),
  ADD CONSTRAINT `Expense_ibfk_2` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ProjectID`);

--
-- Constraints for table `FileItem`
--
ALTER TABLE `FileItem`
  ADD CONSTRAINT `FileItem_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

--
-- Constraints for table `Payslip`
--
ALTER TABLE `Payslip`
  ADD CONSTRAINT `Payslip_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `Employee` (`EmployeeID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
