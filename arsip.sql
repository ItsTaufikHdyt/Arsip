-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Oct 10, 2018 at 01:23 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 7.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `arsip`
--

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE `disposisi` (
  `id_surat_masuk` int(15) DEFAULT NULL,
  `no_disposisi` int(15) NOT NULL,
  `keterangan` varchar(30) DEFAULT NULL,
  `status_surat` varchar(15) DEFAULT NULL,
  `tanggapan` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_surat`
--

CREATE TABLE `jenis_surat` (
  `id_jenis_surat` int(10) NOT NULL,
  `jenis_surat` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `jenis_surat`
--

INSERT INTO `jenis_surat` (`id_jenis_surat`, `jenis_surat`) VALUES
(1, 'surat masuk'),
(2, 'surat keluar');

-- --------------------------------------------------------

--
-- Table structure for table `petugas`
--

CREATE TABLE `petugas` (
  `id_petugas` int(10) NOT NULL,
  `nama_petugas` varchar(30) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `hak` enum('admin','surat_masuk','surat_keluar') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `petugas`
--

INSERT INTO `petugas` (`id_petugas`, `nama_petugas`, `password`, `hak`) VALUES
(111, 'kevin', '827ccb0eea8a706c4c34a16891f84e7b', 'surat_masuk'),
(222, 'julio', '827ccb0eea8a706c4c34a16891f84e7b', 'surat_keluar'),
(333, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `surat_keluar`
--

CREATE TABLE `surat_keluar` (
  `id_surat_keluar` int(10) NOT NULL,
  `no_agenda` int(10) DEFAULT NULL,
  `id_jenis_surat` int(15) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `no_surat` int(10) DEFAULT NULL,
  `pengirim` varchar(30) DEFAULT NULL,
  `perihal` varchar(30) DEFAULT NULL,
  `id_petugas` int(10) DEFAULT NULL,
  `kepada` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surat_masuk`
--

CREATE TABLE `surat_masuk` (
  `id_surat_masuk` int(10) NOT NULL,
  `no_agenda` int(10) DEFAULT NULL,
  `id_jenis_surat` int(15) DEFAULT NULL,
  `kepada` varchar(30) DEFAULT NULL,
  `tgl_kirim` date DEFAULT NULL,
  `tgl_terima` date DEFAULT NULL,
  `no_surat` int(10) DEFAULT NULL,
  `pengirim` varchar(30) DEFAULT NULL,
  `perihal` varchar(30) DEFAULT NULL,
  `id_petugas` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD PRIMARY KEY (`no_disposisi`),
  ADD KEY `id_surat_masuk` (`id_surat_masuk`);

--
-- Indexes for table `jenis_surat`
--
ALTER TABLE `jenis_surat`
  ADD PRIMARY KEY (`id_jenis_surat`);

--
-- Indexes for table `petugas`
--
ALTER TABLE `petugas`
  ADD PRIMARY KEY (`id_petugas`);

--
-- Indexes for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD PRIMARY KEY (`id_surat_keluar`),
  ADD KEY `id_petugas` (`id_petugas`),
  ADD KEY `id_jenis_surat` (`id_jenis_surat`);

--
-- Indexes for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD PRIMARY KEY (`id_surat_masuk`),
  ADD KEY `id_jenis_surat` (`id_jenis_surat`),
  ADD KEY `id_petugas` (`id_petugas`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `disposisi`
--
ALTER TABLE `disposisi`
  ADD CONSTRAINT `disposisi_ibfk_1` FOREIGN KEY (`id_surat_masuk`) REFERENCES `surat_masuk` (`id_surat_masuk`);

--
-- Constraints for table `surat_keluar`
--
ALTER TABLE `surat_keluar`
  ADD CONSTRAINT `surat_keluar_ibfk_1` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`),
  ADD CONSTRAINT `surat_keluar_ibfk_2` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`);

--
-- Constraints for table `surat_masuk`
--
ALTER TABLE `surat_masuk`
  ADD CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`id_jenis_surat`) REFERENCES `jenis_surat` (`id_jenis_surat`),
  ADD CONSTRAINT `surat_masuk_ibfk_2` FOREIGN KEY (`id_petugas`) REFERENCES `petugas` (`id_petugas`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
