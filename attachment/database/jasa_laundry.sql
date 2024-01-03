-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2024 at 05:03 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jasa_laundry`
--

-- --------------------------------------------------------

--
-- Table structure for table `jenis_laundry`
--

CREATE TABLE `jenis_laundry` (
  `IDJenisLaundry` varchar(5) NOT NULL,
  `NmJenisLaundry` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jenis_laundry`
--

INSERT INTO `jenis_laundry` (`IDJenisLaundry`, `NmJenisLaundry`) VALUES
('1', 'Cuci'),
('2', 'Cuci Kering'),
('3', 'Cuci Kering Setrika');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `NIK` varchar(20) NOT NULL,
  `NmKaryawan` varchar(50) NOT NULL,
  `AlmtKaryawan` varchar(50) NOT NULL,
  `TelpKaryawan` varchar(13) NOT NULL,
  `GenderKaryawan` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`NIK`, `NmKaryawan`, `AlmtKaryawan`, `TelpKaryawan`, `GenderKaryawan`) VALUES
('40220', 'alex', 'sby', '28382748275', 'L'),
('admin', 'Nasywa Ivena', 'Surabaya', '0000', 'P');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(10) NOT NULL,
  `password` varchar(10) NOT NULL,
  `TypeUser` varchar(10) NOT NULL,
  `NIK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`, `TypeUser`, `NIK`) VALUES
('admin', 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `rincian_transaksi`
--

CREATE TABLE `rincian_transaksi` (
  `IDRincian` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `NoTransaksi` varchar(5) NOT NULL,
  `IDJenisPakaian` varchar(10) NOT NULL,
  `NIK` varchar(11) NOT NULL,
  `IDJenisLaundry` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tarif`
--

CREATE TABLE `tarif` (
  `IDJenisPakaian` varchar(10) NOT NULL,
  `NmPakaian` varchar(50) NOT NULL,
  `tarif` int(11) NOT NULL,
  `IDJenisLaundry` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tarif`
--

INSERT INTO `tarif` (`IDJenisPakaian`, `NmPakaian`, `tarif`, `IDJenisLaundry`) VALUES
('', '', 0, '3'),
('123', 'baju', 4000, '2'),
('tqq', 'celana', 5000, 'cks');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jenis_laundry`
--
ALTER TABLE `jenis_laundry`
  ADD PRIMARY KEY (`IDJenisLaundry`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `rincian_transaksi`
--
ALTER TABLE `rincian_transaksi`
  ADD PRIMARY KEY (`IDRincian`),
  ADD KEY `NoTransaksi` (`NoTransaksi`),
  ADD KEY `IDJenisPakaian` (`IDJenisPakaian`),
  ADD KEY `IDJenisLaundry` (`IDJenisLaundry`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`IDJenisPakaian`),
  ADD KEY `IDJenisLaundry` (`IDJenisLaundry`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rincian_transaksi`
--
ALTER TABLE `rincian_transaksi`
  MODIFY `IDRincian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rincian_transaksi`
--
ALTER TABLE `rincian_transaksi`
  ADD CONSTRAINT `IDJenisLaundry` FOREIGN KEY (`IDJenisLaundry`) REFERENCES `jenis_laundry` (`IDJenisLaundry`),
  ADD CONSTRAINT `rincian_transaksi_ibfk_1` FOREIGN KEY (`IDJenisPakaian`) REFERENCES `tarif` (`IDJenisPakaian`),
  ADD CONSTRAINT `rincian_transaksi_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
