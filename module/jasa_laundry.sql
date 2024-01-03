-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 31, 2023 at 05:18 PM
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
-- Table structure for table `barang`
--

CREATE TABLE `barang` (
  `KodeBarang` varchar(5) NOT NULL,
  `NmBarang` varchar(50) NOT NULL,
  `Stok` int(11) NOT NULL,
  `TglUpdateStok` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`KodeBarang`, `NmBarang`, `Stok`, `TglUpdateStok`) VALUES
('item1', 'Sabun', 14, '2016-09-14'),
('item2', 'Shampoo', 10, '2016-10-21');

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
('c', 'Cuci'),
('ck', 'Cuci Kering'),
('cks', 'Cuci Kering Setrika');

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
('admin', 'Greggy Gianini F.', 'Malang', '0000', 'L');

-- --------------------------------------------------------

--
-- Table structure for table `konsumen`
--

CREATE TABLE `konsumen` (
  `KodeKonsumen` varchar(5) NOT NULL,
  `NmKonsumen` varchar(50) NOT NULL,
  `AlmtKonsumen` varchar(50) NOT NULL,
  `TelpKonsumen` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `konsumen`
--

INSERT INTO `konsumen` (`KodeKonsumen`, `NmKonsumen`, `AlmtKonsumen`, `TelpKonsumen`) VALUES
('kmz87', 'Member 1', 'Malang', '0000'),
('ksm03', 'Member 2', 'Malang', '0000'),
('mmb22', 'Member 3', 'Malang', '0000');

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
-- Table structure for table `pemakaian_barang`
--

CREATE TABLE `pemakaian_barang` (
  `KodePengeluaran` varchar(5) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `KodeBarang` varchar(5) NOT NULL,
  `NIK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `pemakaian_barang`
--

INSERT INTO `pemakaian_barang` (`KodePengeluaran`, `Jumlah`, `KodeBarang`, `NIK`) VALUES
('kode1', 50, 'item1', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `NoPembelian` varchar(5) NOT NULL,
  `TglPembelian` date NOT NULL,
  `TotalBiaya` int(11) NOT NULL,
  `IDSupplier` varchar(5) NOT NULL,
  `NIK` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rincian_pembelian`
--

CREATE TABLE `rincian_pembelian` (
  `NoRincian` varchar(50) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `NoPembelian` varchar(5) NOT NULL,
  `KodeBarang` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rincian_transaksi`
--

CREATE TABLE `rincian_transaksi` (
  `IDRincian` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `NoTransaksi` varchar(5) NOT NULL,
  `IDJenisPakaian` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `IDSupplier` varchar(5) NOT NULL,
  `NmSupplier` varchar(50) NOT NULL,
  `AlmtSupplier` varchar(50) NOT NULL,
  `TelpSupplier` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`IDSupplier`, `NmSupplier`, `AlmtSupplier`, `TelpSupplier`) VALUES
('sup01', 'Supplier 1', 'Malang', '0000'),
('sup02', 'Supplier 2', 'Malang', '0000'),
('sup03', 'Supplier 3', 'Malang', '0000');

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
-- Indexes for dumped tables
--

--
-- Indexes for table `barang`
--
ALTER TABLE `barang`
  ADD PRIMARY KEY (`KodeBarang`);

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
-- Indexes for table `konsumen`
--
ALTER TABLE `konsumen`
  ADD PRIMARY KEY (`KodeKonsumen`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `pemakaian_barang`
--
ALTER TABLE `pemakaian_barang`
  ADD PRIMARY KEY (`KodePengeluaran`),
  ADD KEY `pemakaian_barang_ibfk_1` (`KodeBarang`),
  ADD KEY `pemakaian_barang_ibfk_2` (`NIK`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`NoPembelian`),
  ADD KEY `NIK` (`NIK`),
  ADD KEY `IDSupplier` (`IDSupplier`);

--
-- Indexes for table `rincian_pembelian`
--
ALTER TABLE `rincian_pembelian`
  ADD PRIMARY KEY (`NoRincian`),
  ADD KEY `NoPembelian` (`NoPembelian`),
  ADD KEY `KodeBarang` (`KodeBarang`);

--
-- Indexes for table `rincian_transaksi`
--
ALTER TABLE `rincian_transaksi`
  ADD PRIMARY KEY (`IDRincian`),
  ADD KEY `NoTransaksi` (`NoTransaksi`),
  ADD KEY `IDJenisPakaian` (`IDJenisPakaian`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`IDSupplier`);

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
  MODIFY `IDRincian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

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
-- Constraints for table `pemakaian_barang`
--
ALTER TABLE `pemakaian_barang`
  ADD CONSTRAINT `pemakaian_barang_ibfk_1` FOREIGN KEY (`KodeBarang`) REFERENCES `barang` (`KodeBarang`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `pemakaian_barang_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `karyawan` (`NIK`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`IDSupplier`) REFERENCES `supplier` (`IDSupplier`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rincian_pembelian`
--
ALTER TABLE `rincian_pembelian`
  ADD CONSTRAINT `rincian_pembelian_ibfk_1` FOREIGN KEY (`NoPembelian`) REFERENCES `pembelian` (`NoPembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rincian_pembelian_ibfk_2` FOREIGN KEY (`KodeBarang`) REFERENCES `barang` (`KodeBarang`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `rincian_transaksi`
--
ALTER TABLE `rincian_transaksi`
  ADD CONSTRAINT `rincian_transaksi_ibfk_2` FOREIGN KEY (`IDJenisPakaian`) REFERENCES `tarif` (`IDJenisPakaian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tarif`
--
ALTER TABLE `tarif`
  ADD CONSTRAINT `tarif_ibfk_1` FOREIGN KEY (`IDJenisLaundry`) REFERENCES `jenis_laundry` (`IDJenisLaundry`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
