-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 01, 2022 at 03:54 PM
-- Server version: 8.0.31-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `parcijalni1`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `prosjekPlaca` ()  BEGIN
SELECT avg(placa) prosjekPlaca
from place;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `odjeli`
--

CREATE TABLE `odjeli` (
  `odjeliID` int UNSIGNED NOT NULL,
  `imeOdjela` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `odjeli`
--

INSERT INTO `odjeli` (`odjeliID`, `imeOdjela`) VALUES
(1, 'računovodstvo'),
(2, 'prodaja'),
(3, 'marketing');

-- --------------------------------------------------------

--
-- Table structure for table `place`
--

CREATE TABLE `place` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `placa` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `place`
--

INSERT INTO `place` (`zaposlenikID`, `placa`, `odDatuma`, `doDatuma`) VALUES
(1, 8000, '2020-01-01', '2022-11-11'),
(2, 9000, '2020-01-01', '2022-11-11'),
(3, 800, '2020-01-01', '2002-11-11');

-- --------------------------------------------------------

--
-- Table structure for table `radnoMjesto`
--

CREATE TABLE `radnoMjesto` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `radnoMjesto` varchar(255) NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `radnoMjesto`
--

INSERT INTO `radnoMjesto` (`zaposlenikID`, `radnoMjesto`, `odDatuma`, `doDatuma`) VALUES
(1, 'tajnica', '2020-01-01', '2022-01-10'),
(2, 'direktor', '2022-11-11', '2020-10-10'),
(3, 'domar', '2022-11-11', '2020-10-09');

-- --------------------------------------------------------

--
-- Table structure for table `voditeljOdjela`
--

CREATE TABLE `voditeljOdjela` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `voditeljOdjela`
--

INSERT INTO `voditeljOdjela` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatuma`) VALUES
(1, 3, '2000-01-01', '2022-09-09'),
(2, 2, '2000-01-01', '2020-08-09'),
(3, 1, '2000-01-01', '2021-05-09');

-- --------------------------------------------------------

--
-- Table structure for table `zaposlenici`
--

CREATE TABLE `zaposlenici` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `ime` varchar(255) NOT NULL,
  `prezime` varchar(255) NOT NULL,
  `datumRodjenja` date NOT NULL,
  `spol` varchar(255) NOT NULL,
  `datumZaposlenja` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposlenici`
--

INSERT INTO `zaposlenici` (`zaposlenikID`, `ime`, `prezime`, `datumRodjenja`, `spol`, `datumZaposlenja`) VALUES
(1, 'stevica', 'stević', '2000-01-01', 'muški', '2022-12-12'),
(2, 'đon', 'vejn', '1888-01-01', 'muški', '2022-12-06'),
(3, 'ranko', 'ostojić', '1900-01-01', 'muški', '2011-10-12'),
(4, 'ivona', 'turudić', '1979-10-07', 'muški', '2022-10-10');

-- --------------------------------------------------------

--
-- Table structure for table `zaposleniciOdjeli`
--

CREATE TABLE `zaposleniciOdjeli` (
  `zaposlenikID` int UNSIGNED NOT NULL,
  `odjeliID` int UNSIGNED NOT NULL,
  `odDatuma` date NOT NULL,
  `doDatuma` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `zaposleniciOdjeli`
--

INSERT INTO `zaposleniciOdjeli` (`zaposlenikID`, `odjeliID`, `odDatuma`, `doDatuma`) VALUES
(1, 1, '2019-01-01', '2022-07-07'),
(1, 2, '2019-01-01', '2022-07-07'),
(2, 2, '2019-01-01', '2022-07-07');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `odjeli`
--
ALTER TABLE `odjeli`
  ADD PRIMARY KEY (`odjeliID`);

--
-- Indexes for table `place`
--
ALTER TABLE `place`
  ADD PRIMARY KEY (`zaposlenikID`,`odDatuma`);

--
-- Indexes for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD PRIMARY KEY (`zaposlenikID`,`radnoMjesto`,`odDatuma`);

--
-- Indexes for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Indexes for table `zaposlenici`
--
ALTER TABLE `zaposlenici`
  ADD PRIMARY KEY (`zaposlenikID`);

--
-- Indexes for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD PRIMARY KEY (`zaposlenikID`,`odjeliID`),
  ADD KEY `odjeliID` (`odjeliID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `place`
--
ALTER TABLE `place`
  ADD CONSTRAINT `place_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `radnoMjesto`
--
ALTER TABLE `radnoMjesto`
  ADD CONSTRAINT `radnoMjesto_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE;

--
-- Constraints for table `voditeljOdjela`
--
ALTER TABLE `voditeljOdjela`
  ADD CONSTRAINT `voditeljOdjela_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `voditeljOdjela_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;

--
-- Constraints for table `zaposleniciOdjeli`
--
ALTER TABLE `zaposleniciOdjeli`
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_1` FOREIGN KEY (`zaposlenikID`) REFERENCES `zaposlenici` (`zaposlenikID`) ON DELETE CASCADE,
  ADD CONSTRAINT `zaposleniciOdjeli_ibfk_2` FOREIGN KEY (`odjeliID`) REFERENCES `odjeli` (`odjeliID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
