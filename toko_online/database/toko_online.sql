-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2021 at 04:11 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_barang`
--

CREATE TABLE `tb_barang` (
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(120) NOT NULL,
  `keterangan` varchar(225) NOT NULL,
  `kategori` varchar(60) NOT NULL,
  `harga` int(11) NOT NULL,
  `stok` int(4) NOT NULL,
  `gambar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_barang`
--

INSERT INTO `tb_barang` (`id_brg`, `nama_brg`, `keterangan`, `kategori`, `harga`, `stok`, `gambar`) VALUES
(1, 'Abon Sapi', 'Produk Desa Selojari', 'Abon', 25000, 46, 'abonsapi.jpg'),
(2, 'Sambal Pecel', 'Produk Desa Selojari', 'Sambal', 10000, 50, 'sambalpecel.jpg'),
(3, 'Keripik Singkong', 'Produk Desa Selojari', 'Keripik', 13000, 50, 'keripiksingkong.jpg'),
(4, 'Jenang', 'Produk Desa Selojari', 'Camilan Manis', 18000, 50, 'jenang.jpg'),
(6, 'Abon Ayam', 'Produk Desa Selojari', 'Abon', 20000, 55, 'abonayam.jpg'),
(7, 'Keripik Bayam', 'Produk Desa Selojari', 'Keripik', 12000, 40, 'keripikbayam.jpg'),
(9, 'Keripik Talas', 'Produk Desa Selojari', 'Keripik', 17000, 86, 'keripiktalas.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tb_invoice`
--

CREATE TABLE `tb_invoice` (
  `id` int(11) NOT NULL,
  `nama` varchar(56) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `tgl_pesan` datetime NOT NULL,
  `batas_bayar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_invoice`
--

INSERT INTO `tb_invoice` (`id`, `nama`, `alamat`, `tgl_pesan`, `batas_bayar`) VALUES
(1, 'Ridho', 'Kota Balikpapan, Kalimantan Timur', '2021-07-13 22:25:53', '2021-07-14 22:25:53'),
(2, 'Muhammad Ridho', 'Kota Samarinda, Kalimantan Timur', '2021-07-13 22:31:41', '2021-07-14 22:31:41'),
(3, 'Miya', 'Kota Tenggarong, Kalimantan Timur', '2021-07-14 05:29:48', '2021-07-15 05:29:48'),
(4, 'Muhammad Ridho', 'Kota Pontianak, Kalimantan Barat', '2021-07-14 10:54:12', '2021-07-15 10:54:12'),
(6, 'Muhammad Ridho Abdillah', 'Kota Tarakan, Kalimantan Utara', '2021-07-14 12:16:22', '2021-07-15 12:16:22');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pesanan`
--

CREATE TABLE `tb_pesanan` (
  `id` int(11) NOT NULL,
  `id_invoice` int(11) NOT NULL,
  `id_brg` int(11) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `jumlah` int(3) NOT NULL,
  `harga` int(10) NOT NULL,
  `pilihan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_pesanan`
--

INSERT INTO `tb_pesanan` (`id`, `id_invoice`, `id_brg`, `nama_brg`, `jumlah`, `harga`, `pilihan`) VALUES
(1, 1, 1, 'Abon Sapi', 1, 25000, ''),
(2, 1, 2, 'Sambal Pecel', 1, 10000, ''),
(3, 1, 3, 'Keripik Singkong', 1, 13000, ''),
(4, 1, 4, 'Jenang', 1, 18000, ''),
(5, 2, 2, 'Sambal Pecel', 1, 10000, ''),
(6, 3, 1, 'Abon Sapi', 1, 25000, ''),
(7, 4, 1, 'Abon Sapi', 1, 25000, ''),
(8, 5, 1, 'Abon Sapi', 1, 25000, ''),
(9, 6, 1, 'Abon Sapi', 1, 25000, '');

--
-- Triggers `tb_pesanan`
--
DELIMITER $$
CREATE TRIGGER `pesanan_penjualan` AFTER INSERT ON `tb_pesanan` FOR EACH ROW BEGIN
	UPDATE tb_barang SET stok = stok-NEW.jumlah
    WHERE id_brg = NEW.id_brg;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `id` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`id`, `nama`, `username`, `password`, `role_id`) VALUES
(1, 'Admin', 'Admin', '123', 1),
(2, 'Ridho', 'Ridho', 'ridho000', 2),
(3, 'tes', 'tes', '321', 2),
(4, 'Muhammad Ridho', 'M Ridho', 'mridho123', 2),
(7, 'Muhammad Ridho Abdillah', 'M Ridho A', '12345', 2),
(8, 'yes', 'yes', '123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_barang`
--
ALTER TABLE `tb_barang`
  ADD PRIMARY KEY (`id_brg`);

--
-- Indexes for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_barang`
--
ALTER TABLE `tb_barang`
  MODIFY `id_brg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_invoice`
--
ALTER TABLE `tb_invoice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_pesanan`
--
ALTER TABLE `tb_pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
