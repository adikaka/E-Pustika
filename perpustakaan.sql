-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 18, 2021 at 12:21 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perpustakaan`
--

-- --------------------------------------------------------

--
-- Table structure for table `anggota`
--

CREATE TABLE `anggota` (
  `Id` char(10) NOT NULL,
  `Nama` varchar(50) DEFAULT NULL,
  `Alamat` varchar(50) DEFAULT NULL,
  `Ttl` datetime DEFAULT NULL,
  `Jkl` char(10) DEFAULT NULL,
  `Pekerjaan` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anggota`
--

INSERT INTO `anggota` (`Id`, `Nama`, `Alamat`, `Ttl`, `Jkl`, `Pekerjaan`) VALUES
('301150001', 'John Wayne', 'Sukabirus', '1999-02-19 00:00:00', 'Laki-Laki', 'Mahasiswa'),
('301150002', 'Sarah Eve', 'Pasteur', '1998-09-23 00:00:00', 'Perempuan', 'Mahasiswa'),
('301150003', 'Reynard Sucipto', 'Dago', '2000-10-20 00:00:00', 'Laki-Laki', 'Mahasiswa'),
('301150004', 'Arno James', 'Cimindi', '1997-05-12 00:00:00', 'Laki-Laki', 'Mahasiswa'),
('401150029', 'Jesyca Keviati', 'Cibaduyut', '1988-12-18 00:00:00', 'Perempuan', 'Dosen'),
('401150030', 'Wulan Ahugrah', 'Cibiru', '1985-07-07 00:00:00', 'Perempuan', 'Dosen');

-- --------------------------------------------------------

--
-- Table structure for table `koleksi`
--

CREATE TABLE `koleksi` (
  `Kode` char(10) NOT NULL,
  `Judul` varchar(50) DEFAULT NULL,
  `Pengarang` varchar(50) DEFAULT NULL,
  `Penerbit` varchar(50) DEFAULT NULL,
  `Stock` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `koleksi`
--

INSERT INTO `koleksi` (`Kode`, `Judul`, `Pengarang`, `Penerbit`, `Stock`) VALUES
('9786020457', 'CITYLITE: Midnight Prince', 'Titi Sanaria', 'Elex Media Komputindo', '15'),
('9786020639', 'Nebula', 'Tere Liye', 'Gramedia', '25'),
('9786020822', 'Tentang Kamu', 'Tere Liye', 'Republika', '7'),
('9786024526', 'Sebuah Seni untuk Bersikap Bodo Amat', 'Mark Manson', 'Gramedia', '12'),
('9786230005', 'Detektif Conan 96', 'Aoyama Gosho', 'Elex Media Komputindo', '9'),
('9789799105', 'Malam Terakhir', 'Leila S.Chudori', 'Gramedia', '20');

-- --------------------------------------------------------

--
-- Table structure for table `pinjam`
--

CREATE TABLE `pinjam` (
  `Id` char(10) NOT NULL,
  `Kode` char(10) DEFAULT NULL,
  `Tgl_pinjam` datetime DEFAULT NULL,
  `Tgl_kembali` datetime DEFAULT NULL,
  `Denda` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pinjam`
--

INSERT INTO `pinjam` (`Id`, `Kode`, `Tgl_pinjam`, `Tgl_kembali`, `Denda`) VALUES
('301150001', '9786230005', '2021-01-01 00:00:00', '2021-01-18 00:00:00', '10000'),
('301150002', '9786020822', '2021-01-12 00:00:00', '2021-01-21 00:00:00', '5000'),
('401150030', '9789799105', '2021-01-17 00:00:00', '2021-01-18 00:00:00', '0');

-- --------------------------------------------------------

--
-- Table structure for table `stok`
--

CREATE TABLE `stok` (
  `Kode` char(10) NOT NULL,
  `Jumlah` char(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stok`
--

INSERT INTO `stok` (`Kode`, `Jumlah`) VALUES
('9786020822', '7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anggota`
--
ALTER TABLE `anggota`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `koleksi`
--
ALTER TABLE `koleksi`
  ADD PRIMARY KEY (`Kode`);

--
-- Indexes for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `Kode` (`Kode`);

--
-- Indexes for table `stok`
--
ALTER TABLE `stok`
  ADD PRIMARY KEY (`Kode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pinjam`
--
ALTER TABLE `pinjam`
  ADD CONSTRAINT `pinjam_ibfk_1` FOREIGN KEY (`Id`) REFERENCES `anggota` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pinjam_ibfk_2` FOREIGN KEY (`Kode`) REFERENCES `koleksi` (`Kode`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `stok`
--
ALTER TABLE `stok`
  ADD CONSTRAINT `stok_ibfk_1` FOREIGN KEY (`Kode`) REFERENCES `koleksi` (`Kode`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
