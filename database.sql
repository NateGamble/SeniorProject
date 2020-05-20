-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 208.97.172.70
-- Generation Time: May 19, 2020 at 07:19 PM
-- Server version: 5.7.28-log
-- PHP Version: 7.1.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `emiofficemetric_work`
--

-- --------------------------------------------------------

--
-- Table structure for table `Expense`
--

CREATE TABLE `Expense` (
  `Payee` text NOT NULL,
  `Category` text NOT NULL,
  `OfficeName` enum('Cambodia','India','Egypt') NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `Date` date NOT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Expense`
--

INSERT INTO `Expense` (`Payee`, `Category`, `OfficeName`, `Amount`, `Date`, `ID`) VALUES
('', 'Reimbursement Expense', 'Cambodia', '10449', '2019-09-01', 1),
('', 'Local Staff Salary', 'Cambodia', '4162', '2019-09-01', 2),
('Sarina Hotel', '', 'Cambodia', '7000', '2019-09-01', 3),
('Grant Thorton', '', 'Cambodia', '1000', '2019-09-01', 4);

-- --------------------------------------------------------

--
-- Table structure for table `Income`
--

CREATE TABLE `Income` (
  `ProjectID` int(11) NOT NULL,
  `ID` int(11) NOT NULL,
  `OfficeName` enum('Cambodia','India','Egypt') NOT NULL,
  `Amount` decimal(10,0) NOT NULL,
  `Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Income`
--

INSERT INTO `Income` (`ProjectID`, `ID`, `OfficeName`, `Amount`, `Date`) VALUES
(1, 1, 'Cambodia', '1337', '2019-09-01'),
(2, 2, 'Cambodia', '360', '2019-09-01');

-- --------------------------------------------------------

--
-- Table structure for table `MonthOffice`
--

CREATE TABLE `MonthOffice` (
  `OfficeName` enum('Cambodia','India','Egypt') NOT NULL,
  `Month` date NOT NULL,
  `TransferIncome` int(11) NOT NULL,
  `TransferComment` text NOT NULL,
  `TotalCashAssets` int(11) NOT NULL,
  `LocalBankAccount` int(11) NOT NULL,
  `LocalCashBox` int(11) NOT NULL,
  `EMIAbroadAccount` int(11) NOT NULL,
  `ProjectHours` int(11) NOT NULL,
  `ProjectIncome` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `MonthOffice`
--

INSERT INTO `MonthOffice` (`OfficeName`, `Month`, `TransferIncome`, `TransferComment`, `TotalCashAssets`, `LocalBankAccount`, `LocalCashBox`, `EMIAbroadAccount`, `ProjectHours`, `ProjectIncome`) VALUES
('Cambodia', '2019-09-01', 8000, 'DC', 42494, 5230, 2264, 35000, 1437, 3968),
('Cambodia', '2019-10-01', 500, '', 1000, 2354, 189, 4000, 1000, 3000);

-- --------------------------------------------------------

--
-- Table structure for table `Office`
--

CREATE TABLE `Office` (
  `Name` enum('Cambodia','India','Egypt') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holds office name (primary key)';

--
-- Dumping data for table `Office`
--

INSERT INTO `Office` (`Name`) VALUES
('Cambodia'),
('India'),
('Egypt');

-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `OfficeName` enum('Cambodia','India','Egypt') NOT NULL,
  `Month` date NOT NULL,
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL,
  `Category` text NOT NULL,
  `DiscipleshipMonthlyHours` int(11) NOT NULL,
  `ProjectMonthlyHours` int(11) NOT NULL,
  `PercentProjectMonthlyHours` int(11) NOT NULL,
  `TotalHours` int(11) NOT NULL,
  `TotalAnnualHours` int(11) NOT NULL,
  `AnnualCommitment` int(11) NOT NULL,
  `PercentCommitmentComplete` int(11) NOT NULL,
  `HourPerMonthRemaining` int(11) NOT NULL,
  `Nationality` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holds information of staff including monthly hours';

--
-- Dumping data for table `Person`
--

INSERT INTO `Person` (`OfficeName`, `Month`, `Name`, `ID`, `Category`, `DiscipleshipMonthlyHours`, `ProjectMonthlyHours`, `PercentProjectMonthlyHours`, `TotalHours`, `TotalAnnualHours`, `AnnualCommitment`, `PercentCommitmentComplete`, `HourPerMonthRemaining`, `Nationality`) VALUES
('Cambodia', '2019-09-01', 'Anna Seeley', 1, 'Admin', 56, 19, 11, 175, 1405, 1800, 78, 132, 'USA'),
('Cambodia', '2019-09-01', 'Laura', 2, 'Admin', 57, 3, 4, 80, 717, 900, 80, 61, 'USA'),
('Cambodia', '2019-09-01', 'Rathana', 3, 'Admin', 21, 0, 0, 163, 1445, 1800, 80, 118, 'Cambodia'),
('Cambodia', '2019-09-01', 'Vicky', 4, 'Admin', 29, 7, 4, 178, 1212, 1800, 67, 196, 'USA'),
('Cambodia', '2019-09-01', 'Neth', 5, 'Admin', 12, 0, 0, 157, 1450, 1800, 81, 117, 'Cambodia'),
('Cambodia', '2019-09-01', 'Chad Gamble', 6, 'DP', 5, 115, 42, 272, 1525, 1800, 85, 92, 'USA'),
('Cambodia', '2019-09-01', 'Reatrey Chan', 7, 'DP', 28, 98, 66, 149, 1206, 1800, 67, 198, 'Cambodia'),
('Cambodia', '2019-09-01', 'Ian Ebersolle', 8, 'DP', 18, 169, 73, 231, 1603, 1800, 89, 66, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `Project Name` text NOT NULL,
  `ID` int(11) NOT NULL,
  `HoursSpent` int(11) NOT NULL,
  `IncomeGenerated` int(11) NOT NULL,
  `OfficeName` enum('Cambodia','India','Egypt') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Holds each project';

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`Project Name`, `ID`, `HoursSpent`, `IncomeGenerated`, `OfficeName`) VALUES
('1028 J@J', 1, 190, 1337, 'Cambodia'),
('1011 RCC', 2, 160, 360, 'Cambodia'),
('1039 YWAM BB', 4, 56, 500, 'Cambodia');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Expense`
--
ALTER TABLE `Expense`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OfficeName` (`OfficeName`);

--
-- Indexes for table `Income`
--
ALTER TABLE `Income`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ProjectID` (`ProjectID`);

--
-- Indexes for table `MonthOffice`
--
ALTER TABLE `MonthOffice`
  ADD PRIMARY KEY (`OfficeName`,`Month`);

--
-- Indexes for table `Office`
--
ALTER TABLE `Office`
  ADD PRIMARY KEY (`Name`);

--
-- Indexes for table `Person`
--
ALTER TABLE `Person`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OfficeName` (`OfficeName`,`Month`);

--
-- Indexes for table `Project`
--
ALTER TABLE `Project`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `OfficeName` (`OfficeName`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Expense`
--
ALTER TABLE `Expense`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `Income`
--
ALTER TABLE `Income`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `Person`
--
ALTER TABLE `Person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `Project`
--
ALTER TABLE `Project`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Expense`
--
ALTER TABLE `Expense`
  ADD CONSTRAINT `Expense_ibfk_1` FOREIGN KEY (`OfficeName`) REFERENCES `Office` (`Name`);

--
-- Constraints for table `Income`
--
ALTER TABLE `Income`
  ADD CONSTRAINT `Income_ibfk_1` FOREIGN KEY (`ProjectID`) REFERENCES `Project` (`ID`);

--
-- Constraints for table `MonthOffice`
--
ALTER TABLE `MonthOffice`
  ADD CONSTRAINT `MonthOffice_ibfk_1` FOREIGN KEY (`OfficeName`) REFERENCES `Office` (`Name`);

--
-- Constraints for table `Person`
--
ALTER TABLE `Person`
  ADD CONSTRAINT `Person_ibfk_1` FOREIGN KEY (`OfficeName`,`Month`) REFERENCES `MonthOffice` (`OfficeName`, `Month`);

--
-- Constraints for table `Project`
--
ALTER TABLE `Project`
  ADD CONSTRAINT `Project_ibfk_1` FOREIGN KEY (`OfficeName`) REFERENCES `Office` (`Name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
