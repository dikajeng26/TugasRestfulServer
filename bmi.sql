-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2019 at 11:46 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.1.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bmi`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenispembayaran`
--

CREATE TABLE `tb_jenispembayaran` (
  `id` int(11) NOT NULL,
  `virtual` int(11) NOT NULL,
  `jenis_pembayaran` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenispembayaran`
--

INSERT INTO `tb_jenispembayaran` (`id`, `virtual`, `jenis_pembayaran`) VALUES
(1, 1, 'DPP'),
(2, 2, 'SPP'),
(3, 3, 'SKS'),
(4, 4, 'HEREGISTRASI'),
(5, 5, 'SKRIPSI'),
(6, 6, 'PKN'),
(7, 7, 'SEMESTER PENDEK'),
(8, 8, 'WISUDA'),
(9, 9, 'ALMAMATER'),
(10, 10, 'LABORATORIUM PRAKTIKUM'),
(11, 12, 'TUGAS TUGAS'),
(12, 15, 'DEPOSIT'),
(13, 16, 'SEMINAR');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenispengguna`
--

CREATE TABLE `tb_jenispengguna` (
  `id` int(11) NOT NULL,
  `jenis_pengguna` varchar(20) NOT NULL,
  `hak_akses` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenispengguna`
--

INSERT INTO `tb_jenispengguna` (`id`, `jenis_pengguna`, `hak_akses`) VALUES
(1, 'Admin', 1),
(2, 'Customer Service', 2),
(3, 'Mahasiswa', 3);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pengguna` bigint(30) NOT NULL,
  `tanggal_transaksi` date NOT NULL,
  `jenis_pembayaran` varchar(50) NOT NULL,
  `nominal` bigint(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`id_pembayaran`, `id_pengguna`, `tanggal_transaksi`, `jenis_pembayaran`, `nominal`) VALUES
(2, 1718056, '2019-11-01', 'SPP', 1900000),
(3, 1718056, '2019-11-01', 'SKS', 185000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_pengguna`
--

CREATE TABLE `tb_pengguna` (
  `id_pengguna` int(11) NOT NULL,
  `nim` bigint(100) NOT NULL,
  `nik` bigint(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `prodi` varchar(100) NOT NULL,
  `jenis_pengguna` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hp` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pengguna`
--

INSERT INTO `tb_pengguna` (`id_pengguna`, `nim`, `nik`, `nama`, `prodi`, `jenis_pengguna`, `email`, `password`, `hp`) VALUES
(1, 1718056, 3577026602990002, 'DIK AJENG AYUTANTRI', 'S-1 Teknik Informatika', 'Mahasiswa', 'ajeng26@gmail.com', 'ajeng1234', '089692528078');

-- --------------------------------------------------------

--
-- Table structure for table `tb_prodi`
--

CREATE TABLE `tb_prodi` (
  `id` int(11) NOT NULL,
  `jenjang` varchar(10) NOT NULL,
  `prodi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_prodi`
--

INSERT INTO `tb_prodi` (`id`, `jenjang`, `prodi`) VALUES
(1, 'D-4', 'Teknik Mesin'),
(2, 'D-4', 'Teknik Elektro'),
(3, 'D-4', 'Teknik Industri'),
(4, 'S-1', 'Teknik Mesin'),
(5, 'S-1', 'Teknik Elektro'),
(6, 'S-1', 'Teknik Industri'),
(7, 'S-1', 'Teknik Kimia'),
(8, 'S-1', 'Teknik Informatika'),
(9, 'S-1', 'Teknik Sipil'),
(10, 'S-1', 'Arsitektur'),
(11, 'S-1', 'Perencanaan Wilayah dan Kota'),
(12, 'S-1', 'Teknik Geodesi'),
(13, 'S-1', 'Teknik Lingkungan'),
(14, 'S-2', 'Teknik Industri'),
(15, 'S-2', 'Teknik Sipil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_jenispembayaran`
--
ALTER TABLE `tb_jenispembayaran`
  ADD PRIMARY KEY (`virtual`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tb_jenispengguna`
--
ALTER TABLE `tb_jenispengguna`
  ADD PRIMARY KEY (`hak_akses`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  ADD PRIMARY KEY (`nim`),
  ADD KEY `id_pengguna` (`id_pengguna`);

--
-- Indexes for table `tb_prodi`
--
ALTER TABLE `tb_prodi`
  ADD PRIMARY KEY (`jenjang`,`prodi`),
  ADD KEY `id` (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_jenispembayaran`
--
ALTER TABLE `tb_jenispembayaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_jenispengguna`
--
ALTER TABLE `tb_jenispengguna`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_pengguna`
--
ALTER TABLE `tb_pengguna`
  MODIFY `id_pengguna` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_prodi`
--
ALTER TABLE `tb_prodi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
