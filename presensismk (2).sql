-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 26, 2024 at 05:46 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `presensismk`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` bigint DEFAULT NULL,
  `nuptk` bigint DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `user_id`, `name`, `nip`, `nuptk`, `jk`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 1, 'Administrator', 9874356980, 8729308239, 'L', '087712762627', 'Wonogiri', '2024-06-04 22:16:48', '2024-06-13 15:53:46'),
(2, 56, 'Luthfiyyatun Nuur Jannah, S.Pd., M.Pd', 198002022006041008, NULL, 'L', '( 0273 ) 461081', 'Jl. Raya Baturetno Km. 1, Desa Baturetno, Kecamatan Baturetno, Kabupaten Wonogiri, Propinsi Jawa Tengah, Baturetno, Wonogiri, Jawa Tengah 57673', '2024-06-25 03:58:14', '2024-06-25 03:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gurus`
--

CREATE TABLE `gurus` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nip` bigint DEFAULT NULL,
  `nuptk` bigint DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gurus`
--

INSERT INTO `gurus` (`id`, `user_id`, `name`, `nip`, `nuptk`, `jk`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 2, 'Dimas Setiawan S.Pd', 76836250719, 54189389742, 'L', '08231312123', 'Wonogiri', '2024-06-04 22:16:48', '2024-06-13 16:15:17'),
(2, 6, 'Diki Setiawan S.Pd', 1111, 1111, 'L', '08111111', 'Wonogiri', '2024-06-13 17:01:01', '2024-06-13 17:01:01'),
(3, 57, 'Fletcher Holder', NULL, NULL, 'L', 'Facere dolorem itaqu', 'Enim cupidatat maxim', '2024-06-26 16:58:03', '2024-06-26 16:58:03');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint UNSIGNED NOT NULL,
  `tapel_id` bigint UNSIGNED NOT NULL,
  `guru_id` bigint UNSIGNED NOT NULL,
  `tingkat` bigint NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `tapel_id`, `guru_id`, `tingkat`, `name`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 10, 'X TKR A', '2024-06-04 22:16:48', '2024-06-22 20:10:20'),
(2, 4, 2, 10, 'X TKR B', '2024-06-13 17:01:50', '2024-06-22 20:10:31');

-- --------------------------------------------------------

--
-- Table structure for table `mapels`
--

CREATE TABLE `mapels` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `singkatan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `mapels`
--

INSERT INTO `mapels` (`id`, `name`, `singkatan`, `created_at`, `updated_at`) VALUES
(1, 'Bahasa Indonesia', 'B Indo', '2024-06-04 22:19:27', '2024-06-04 22:19:27'),
(2, 'Bahasa Inggris', 'B Inggris', '2024-06-04 22:28:41', '2024-06-04 22:28:41'),
(3, 'Kelistrikan', 'Kelistrikan', '2024-06-07 08:34:54', '2024-06-07 08:34:54'),
(4, 'Matematika', 'MTK', '2024-06-13 17:02:13', '2024-06-13 17:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(46, '2014_10_12_000000_create_users_table', 1),
(47, '2014_10_12_100000_create_password_resets_table', 1),
(48, '2019_08_19_000000_create_failed_jobs_table', 1),
(49, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(50, '2023_06_28_112929_create_tapels_table', 1),
(51, '2023_06_28_112930_create_admins_table', 1),
(52, '2023_06_28_112950_create_gurus_table', 1),
(53, '2023_06_28_122839_create_kelas_table', 1),
(54, '2023_06_28_132719_create_siswas_table', 1),
(55, '2023_06_28_132902_create_sekolahs_table', 1),
(56, '2023_06_28_133004_create_mapels_table', 1),
(57, '2023_06_28_133027_create_pembelajarans_table', 1),
(58, '2023_06_28_133055_create_pertemuans_table', 1),
(59, '2023_06_28_133116_create_absens_table', 1),
(60, '2023_07_08_142057_create_notifikasis_table', 1),
(61, '2024_06_26_235045_create_student_parents_table', 2),
(62, '2024_06_27_000503_add_parent_id_to_siswas_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `notifikasis`
--

CREATE TABLE `notifikasis` (
  `id` bigint UNSIGNED NOT NULL,
  `pengirim_id` bigint UNSIGNED NOT NULL,
  `penerima_id` bigint UNSIGNED DEFAULT NULL,
  `judul` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `isi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kategori` enum('Informasi','Peringatan') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dibaca` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifikasis`
--

INSERT INTO `notifikasis` (`id`, `pengirim_id`, `penerima_id`, `judul`, `isi`, `kategori`, `dibaca`, `created_at`, `updated_at`) VALUES
(3, 2, 3, 'Presensi', 'Segera isi Presensi', 'Peringatan', 1, '2024-06-21 03:13:06', '2024-06-21 03:13:37'),
(4, 1, 19, 'Presensi', 'Mohon segera Presensi', 'Peringatan', 1, '2024-06-22 20:26:44', '2024-06-22 20:41:51'),
(5, 56, 1, 'Reiciendis qui odit', 'tes', 'Peringatan', 1, '2024-06-25 03:59:05', '2024-06-26 16:43:17');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pembelajarans`
--

CREATE TABLE `pembelajarans` (
  `id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `guru_id` bigint UNSIGNED NOT NULL,
  `mapel_id` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pembelajarans`
--

INSERT INTO `pembelajarans` (`id`, `kelas_id`, `guru_id`, `mapel_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, '2024-06-04 22:19:39', '2024-06-04 22:19:39'),
(2, 1, 1, 2, '2024-06-04 22:29:07', '2024-06-04 22:29:07'),
(4, 1, 1, 3, '2024-06-07 08:42:38', '2024-06-07 08:42:38'),
(5, 2, 2, 4, '2024-06-13 17:02:31', '2024-06-13 17:02:31');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pertemuans`
--

CREATE TABLE `pertemuans` (
  `id` bigint UNSIGNED NOT NULL,
  `pembelajaran_id` bigint UNSIGNED NOT NULL,
  `pertemuan_ke` bigint NOT NULL,
  `tanggal` date NOT NULL,
  `dari_pukul` time NOT NULL,
  `sampai_pukul` time NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pertemuans`
--

INSERT INTO `pertemuans` (`id`, `pembelajaran_id`, `pertemuan_ke`, `tanggal`, `dari_pukul`, `sampai_pukul`, `created_at`, `updated_at`) VALUES
(2, 2, 1, '2024-06-04', '19:30:00', '20:00:00', '2024-06-04 22:30:45', '2024-06-04 22:30:45'),
(3, 2, 2, '2024-06-04', '19:00:00', '20:00:00', '2024-06-04 22:33:00', '2024-06-04 22:33:00'),
(4, 4, 1, '2024-07-06', '06:00:00', '07:00:00', '2024-06-07 08:47:34', '2024-06-07 08:47:34'),
(10, 2, 3, '2024-06-21', '15:33:00', '03:45:00', '2024-06-20 20:33:59', '2024-06-20 20:33:59'),
(11, 1, 1, '2024-06-21', '10:00:00', '03:00:00', '2024-06-21 03:00:26', '2024-06-21 03:00:26'),
(13, 5, 1, '2024-06-23', '08:00:00', '18:00:00', '2024-06-22 20:24:51', '2024-06-22 20:24:51'),
(14, 5, 2, '2024-07-23', '06:00:00', '18:00:00', '2024-06-22 20:33:42', '2024-06-22 20:33:42'),
(15, 5, 3, '2024-06-24', '13:00:00', '14:00:00', '2024-06-24 06:16:42', '2024-06-24 06:16:42');

-- --------------------------------------------------------

--
-- Table structure for table `presensis`
--

CREATE TABLE `presensis` (
  `id` bigint UNSIGNED NOT NULL,
  `pertemuan_id` bigint UNSIGNED NOT NULL,
  `siswa_id` bigint UNSIGNED NOT NULL,
  `keterangan` enum('H','S','I','A','T') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `presensis`
--

INSERT INTO `presensis` (`id`, `pertemuan_id`, `siswa_id`, `keterangan`, `created_at`, `updated_at`) VALUES
(2, 2, 1, 'I', '2024-06-04 22:31:18', '2024-06-04 22:31:18'),
(3, 3, 1, 'S', '2024-06-04 22:33:35', '2024-06-04 22:33:35'),
(5, 4, 1, 'H', '2024-06-07 08:48:12', '2024-06-07 08:48:12'),
(8, 10, 1, 'H', '2024-06-21 02:24:06', '2024-06-21 02:24:06'),
(10, 11, 1, 'H', '2024-06-21 03:01:15', '2024-06-21 03:01:15'),
(13, 15, 16, 'H', '2024-06-24 06:16:59', '2024-06-24 06:16:59');

-- --------------------------------------------------------

--
-- Table structure for table `sekolahs`
--

CREATE TABLE `sekolahs` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `npsn` bigint DEFAULT NULL,
  `nss` bigint DEFAULT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `kodepos` bigint NOT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kepsek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nipkepsek` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'logo.png',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sekolahs`
--

INSERT INTO `sekolahs` (`id`, `name`, `npsn`, `nss`, `telepon`, `email`, `alamat`, `kodepos`, `website`, `kepsek`, `nipkepsek`, `logo`, `created_at`, `updated_at`) VALUES
(1, 'SMK Pancasila 3 Baturetno', 20338523, NULL, '( 0273 ) 461081', 'smkpancasila3@yahoo.com', 'Jl. Raya Baturetno Km. 1, Desa Baturetno, Kecamatan Baturetno, Kabupaten Wonogiri, Propinsi Jawa Tengah, Baturetno, Wonogiri, Jawa Tengah 57673', 57673, 'smkpancasila3.sch.id', 'Luthfiyyatun Nuur Jannah, S.Pd., M.Pd', '19800202 200604 1 008', 'logo.png', '2024-06-04 22:16:48', '2024-06-25 03:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `siswas`
--

CREATE TABLE `siswas` (
  `id` bigint UNSIGNED NOT NULL,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `kelas_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `nis` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nisn` bigint DEFAULT NULL,
  `jk` enum('L','P') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `siswas`
--

INSERT INTO `siswas` (`id`, `parent_id`, `user_id`, `kelas_id`, `name`, `nis`, `nisn`, `jk`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(1, 2, 3, 1, 'MOHAMMAD YUDATAMA', '0202020222', 11111111, 'L', '087736167959', 'Wonogiri', '2024-06-04 22:16:48', '2024-06-26 17:27:41'),
(15, NULL, 18, 1, 'ALFIAN', '123123', 123123, 'L', '087737766535', 'Baturetno', '2024-06-22 20:11:15', '2024-06-22 20:11:15'),
(16, 2, 19, 2, 'ADI PRASETYO', '227606', 1243239, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-26 17:20:40'),
(17, NULL, 20, 2, 'ADZAN OKTAVIONA', '227607', 12432310, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(18, NULL, 21, 2, 'AGIFTA CAHYA PUTRA', '227608', 12432311, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(19, NULL, 22, 2, 'AGUNG PRATAMA', '227609', 12432312, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(20, NULL, 23, 2, 'AHMAD RENO FERDINAN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(21, NULL, 24, 2, 'ALIF RAHMADANI', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(22, NULL, 25, 2, 'AMAR PRAVANA SUMA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(23, NULL, 26, 2, 'AUREL BAYU PRATAMA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(24, NULL, 27, 2, 'AZRIL ZIAUL HAQ', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(25, NULL, 28, 2, 'DAFI KURNIAWAN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(26, NULL, 29, 2, 'DENI DWI SAPUTRA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(27, NULL, 30, 2, 'DHIO CAHYA PRATAMA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(28, NULL, 31, 2, 'ERLANGGA SATRIA RHOMADON', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(29, NULL, 32, 2, 'FAIZAL FIRDA HAMDANI', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(30, NULL, 33, 2, 'FAUZAN NUUR ZAKI', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(31, NULL, 34, 2, 'FITRA MAULANA PRATAMA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(32, NULL, 35, 2, 'GILANG LANGIT RAMADHAN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(33, NULL, 36, 2, 'HAFIDZ IZZUDDIN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(34, NULL, 37, 2, 'IKHSAN NOVIANTO', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(35, NULL, 38, 2, 'IRFAN ADY PUTRA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(36, NULL, 39, 2, 'KUKUH BANYU JUNIAN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(37, NULL, 40, 2, 'LANTIP HANGGARA PUTRA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(38, NULL, 41, 2, 'MAYDHIKA WAHYU WARDHANA ', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(39, NULL, 42, 2, 'MUHAMAD ZULFAN RAMANDHANI', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(40, NULL, 43, 2, 'REHAND PRASTYA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(41, NULL, 44, 2, 'RENDI SATYA ARDANA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(42, NULL, 45, 2, 'RENDRA DIAZ SAPUTRA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(43, NULL, 46, 2, 'RENDY WAHYU SAPUTRO', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(44, NULL, 47, 2, 'RENOF ROHMAD AL AKBAR', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(45, NULL, 48, 2, 'RIFQI FAUZAN NAJIBA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(46, NULL, 49, 2, 'RIZQI SEPTRIYANTO', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(47, NULL, 50, 2, 'SUSILO BUDI PRATAMA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(48, NULL, 51, 2, 'TONY ANDRIAN', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(49, NULL, 52, 2, 'YANUAR ROHMAN HANIF', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(50, NULL, 53, 2, 'YUDA TRI BUDIANSYAH', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(51, NULL, 54, 2, 'ZAKI PUTRA VIRLYANSYA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(52, NULL, 55, 2, 'ZATRIA KURNIA DEWANGGA', '227610', 12432313, 'L', NULL, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(53, 2, 61, 2, 'Jackson Roy', '2332', 322332, 'L', 'In culpa veritatis', 'Aliquid ipsum qui i', '2024-06-26 17:18:54', '2024-06-26 17:18:54');

-- --------------------------------------------------------

--
-- Table structure for table `student_parents`
--

CREATE TABLE `student_parents` (
  `id` bigint UNSIGNED NOT NULL,
  `user_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jk` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telepon` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_parents`
--

INSERT INTO `student_parents` (`id`, `user_id`, `name`, `jk`, `telepon`, `alamat`, `created_at`, `updated_at`) VALUES
(2, 59, 'Ronan Fuller', 'L', 'Quos expedita sed im', 'Modi temporibus itaq', '2024-06-26 17:09:48', '2024-06-26 17:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `tapels`
--

CREATE TABLE `tapels` (
  `id` bigint UNSIGNED NOT NULL,
  `tahun_pelajaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `semester` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tapels`
--

INSERT INTO `tapels` (`id`, `tahun_pelajaran`, `semester`, `created_at`, `updated_at`) VALUES
(1, '2023/2024', '1', '2024-06-04 22:16:48', '2024-06-04 22:16:48'),
(2, '2023/2023', '2', '2024-06-07 08:33:58', '2024-06-07 08:33:58'),
(4, '2024/2025', '1', '2024-06-13 16:59:50', '2024-06-13 16:59:50'),
(5, '2024/2025', '2', '2024-06-22 20:22:29', '2024-06-22 20:22:29');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `role` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'profile.jpg',
  `is_aktif` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `email_verified_at`, `role`, `password`, `foto`, `is_aktif`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'erikadmin@gmail.com', NULL, 'admin', '$2y$10$q1m/vYI2Hxj3ShkFSI/vyuMNjB0hySWslAeAimnJuPHHlcGInlKLe', 'profile.jpg', 1, NULL, '2024-06-04 22:16:48', '2024-06-13 15:53:54'),
(2, 'dimasguru', 'dimasguru@gmail.com', NULL, 'guru', '$2y$10$6OIJliSF57PYSWqy0ikRfeofzETl7/yaEaIRS7anKuy15oM1dYQP2', 'profile.jpg', 1, NULL, '2024-06-04 22:16:48', '2024-06-13 16:15:40'),
(3, 'yudatama', 'yudasipo@gmail.com', NULL, 'siswa', '$2y$10$2rnuv4cR14/8kDDT3ucrMeDMN58xf/KxFPHmifp7N9p3xEiKJDSV.', 'img1717533910.jpg', 1, NULL, '2024-06-04 22:16:48', '2024-06-26 17:27:41'),
(6, 'dikiguru', NULL, NULL, 'guru', '$2y$10$hopn01WxRj60bPT5PGIvdOLK9w8DOM4tToRERVdqKYXViH5Wm753K', 'profile.jpg', 1, NULL, '2024-06-13 17:01:01', '2024-06-13 17:01:01'),
(18, 'alfiansiswa', NULL, NULL, 'siswa', '$2y$10$CU1dWjsBTdQrsBhJX4Xg/ewlTadml.Z4C59Ypw8gQkPMtJY4/rVd.', 'profile.jpg', 1, NULL, '2024-06-22 20:11:15', '2024-06-22 20:11:15'),
(19, 'adisiswa', NULL, NULL, 'siswa', '$2y$10$swFKKxtM/pcgqmO0tEKpnOeYKbWyMU21QxzchEB.2Do2gupbo7N.a', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-26 17:20:40'),
(20, 'adzansiswa', NULL, NULL, 'siswa', '$2y$10$NPEJLjzRN6svWdGH6sBl/uMV2VEA4QP2wGnjnj/RFNIn1y0ZAAj5.', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(21, 'agiftasiswa', NULL, NULL, 'siswa', '$2y$10$Lup9ku9fDuOeEREIfUg9lubsMmPvcJrkBuOuFt5tguKcR6vTX11Q2', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(22, 'agungsiswa', NULL, NULL, 'siswa', '$2y$10$eb1HE8R8hPicknhPCZvqWuMkOtkBPa5FmcnQ1V6BFVCTZpg6IJFhK', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(23, 'ahmadsiswa', NULL, NULL, 'siswa', '$2y$10$Y5fYsKNmHBDHHiUi/iJxT.ZdHRkGakiM845rRjJuioFaeFwa1rfxG', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(24, 'alifsiswa', NULL, NULL, 'siswa', '$2y$10$WLObY2Hu2h1XMw64dlpSju9ZGo83/1hcEvB7cDCpqteRau4NWzy5i', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(25, 'amarsiswa', NULL, NULL, 'siswa', '$2y$10$EcmNu7S.qS0QZdjmxbyqVO./YVZDqQYtQh8Au31nXWafF1PY8W48K', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(26, 'aurelsiswa', NULL, NULL, 'siswa', '$2y$10$MRQfX7pQLSRZoYs5xM.SB.qk2QqRl5X/nvtmDuMTwSeYnO3Hi.wAC', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(27, 'azrilsiswa', NULL, NULL, 'siswa', '$2y$10$lxqglYRo4Qavk0GMPBS8eODKCR9kbwnIT29fr6mFjNNQgJMRoUgIC', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(28, 'dafisiswa', NULL, NULL, 'siswa', '$2y$10$jikanbbfVJ6sOSs/EvV1WOMylrSHU/QGi1d/N8lDqRbyUlcyG6FRy', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(29, 'denisiswa', NULL, NULL, 'siswa', '$2y$10$zW.ZcCnU0vXygRfuLwKOpuVCYniTxf0P8nKGkA3Y4gF.U0TMBn/VG', 'profile.jpg', 1, NULL, '2024-06-22 20:20:24', '2024-06-22 20:20:24'),
(30, 'dhiosiswa', NULL, NULL, 'siswa', '$2y$10$y9LEJUySB9G0eM.mg9ALG.XpF8SVWWgh6CdZP7Id1M4HqwhHni0pi', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(31, 'erlanggasiswa', NULL, NULL, 'siswa', '$2y$10$RtMtbAPQlTFVvsgiKzLfeeQ2TR.Gpf2ZUNXX00oOXhhHDkjrPgNBu', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(32, 'faizalsiswa', NULL, NULL, 'siswa', '$2y$10$MHUhqtgiPNxPDf2snHK6qugbowDGk1F7uU2lZAyqbgexZrFoHA7yq', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(33, 'fauzansiswa', NULL, NULL, 'siswa', '$2y$10$52wx24F3bFFaiWXF9WRHpe0E1LvxgR187JdCat3S4OlSlkQlXGB9a', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(34, 'fitrasiswa', NULL, NULL, 'siswa', '$2y$10$YlJHMxsYguW6WIeb7dAW8ukSKE9Kjyw4UX9Gi6zR6RRw8HEujv32W', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(35, 'gilangsiswa', NULL, NULL, 'siswa', '$2y$10$RH7TgSAvhoPTaguxHqwgu.QqbEXWmI.qWDnIIAWKlX5bB8YjD0v76', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(36, 'hafidzsiswa', NULL, NULL, 'siswa', '$2y$10$IlRxScvF4bKLbGs1qRd.de8u804.radJi/CBSQ3vJ6qEDdVJVGn72', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(37, 'ikhsansiswa', NULL, NULL, 'siswa', '$2y$10$Yf.n8sBhr.6/w6x9I0HeKek929UBewORFa60GRzQdaX7xARWNs4R6', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(38, 'irfansiswa', NULL, NULL, 'siswa', '$2y$10$.2xf3xTHA/h7kIYLpRMmc.paN5Sq24ubWyylMNK0MlFJtFgbpheKi', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(39, 'kukuhsiswa', NULL, NULL, 'siswa', '$2y$10$yrLMjmqLeuZqib5U9iETkOSTbi0AMjxI2YBxAodACSxFVpij./sBe', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(40, 'lantipsiswa', NULL, NULL, 'siswa', '$2y$10$2R5Xw67DjrinryEyswrjUuRjA3gOhNHv8/KvDFdBQQr2tn/5cHiQW', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(41, 'maydhikasiswa', NULL, NULL, 'siswa', '$2y$10$Z7KChw/LDEPP88Yx0iDMceYZEmwxBEPCaf0.6GLTdp3Z/bxfJdZfe', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(42, 'muhamadsiswa', NULL, NULL, 'siswa', '$2y$10$HKNNsWmRAe0CFtAmUlVIP.4J/ZgCnbU8b8CIyMXfgGad2mAFO2nLm', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(43, 'rehandsiswa', NULL, NULL, 'siswa', '$2y$10$NPwZRjGMOdR4mMpmz8grXejSvJoq6cP.k1xoh89q9waHNy9LuCBey', 'profile.jpg', 1, NULL, '2024-06-22 20:20:25', '2024-06-22 20:20:25'),
(44, 'rendisiswa', NULL, NULL, 'siswa', '$2y$10$VBnaLva1AwPg/4M3FJezc.QsWuknY9tY/tbVY69/FGpVYlIy9YhmC', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(45, 'rendrasiswa', NULL, NULL, 'siswa', '$2y$10$iIDKoTP/fEeDhsZeidecF.MjK9QGsyMbtukCRY.V9KjKFBz.BqwIS', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(46, 'rendysiswa', NULL, NULL, 'siswa', '$2y$10$mhieb9cnh.L3o0uWqI2Bku/4KY1Gcd30AxjBgrtSjOR41Egvor2.y', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(47, 'renofsiswa', NULL, NULL, 'siswa', '$2y$10$dv3zCgGtidK7xt5s2M3T8eT3MUNCyYZa19I7SsHjjAafSgRx8k9xO', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(48, 'rifqisiswa', NULL, NULL, 'siswa', '$2y$10$aw3hKgXH5I.6A4P414zDjukyPL1S.Ul1AQK4/VZj4i26/IjHUrWlO', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(49, 'rizqisiswa', NULL, NULL, 'siswa', '$2y$10$vDPcQe6M.N3l33luJKM0seauKuJHNUL5UcRlY1qRajuo7.Lmmhdxi', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(50, 'susilosiswa', NULL, NULL, 'siswa', '$2y$10$LeSbSsvWIlya3YUIaedat.HU.Mktt5hRsGTqywUTUY0WgJ24T1oCW', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(51, 'tonysiswa', NULL, NULL, 'siswa', '$2y$10$wJTjHkexyL/Fnpv28z6gXuVo12rE6M7YZyxF.i4cXLJqNw3CNUuY6', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(52, 'yanuarsiswa', NULL, NULL, 'siswa', '$2y$10$jPffcYhFZ9AnKOpnxD4IiOLhggyyQ2nd7FDXk70reX2GfhhzVXVT2', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(53, 'yudasiswa', NULL, NULL, 'siswa', '$2y$10$r9/6JjfV7FdlCmspv0aka.fKaGEeNrAJ7XKtDO9GgPZuwREf3i03C', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(54, 'zakisiswa', NULL, NULL, 'siswa', '$2y$10$OwbniPJMKCqXBeVwJhD.3O1k.lK1n.FIEVTDiWaS5gm9JDgx.JOF6', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(55, 'zatriasiswa', NULL, NULL, 'siswa', '$2y$10$BWyCYmGTwBrvJX3I2KSGMeGGO.KrX2XwETSTKDsUihZuDLFRfmeHq', 'profile.jpg', 1, NULL, '2024-06-22 20:20:26', '2024-06-22 20:20:26'),
(56, 'smkpancasila3', 'smkpancasila3@yahoo.com', '2024-06-25 03:58:13', 'kepala-sekolah', '$2y$10$DDpoXAyifMjHG4UUirqs9O4/wxfXgp4e72gMNB8GqpZPNiwzXHSGm', 'profile.jpg', 1, NULL, '2024-06-25 03:58:14', '2024-06-25 03:58:14'),
(57, 'fopywabe', NULL, NULL, 'guru', '$2y$10$1Tlrrc1B/k1nrnoq/zmrSu6vQdwPiYw6l00TpX4Q9gPBaijxrKJ12', 'profile.jpg', 1, NULL, '2024-06-26 16:58:03', '2024-06-26 16:58:03'),
(59, 'qezunygici', NULL, NULL, 'orangtua', '$2y$10$kkHXFaR2zNmc2l2wi6CD7.g2ai2FT2MLd7aiBxlkhUcV0TQgw170e', 'profile.jpg', 1, NULL, '2024-06-26 17:09:48', '2024-06-26 17:09:48'),
(60, 'syfypyzab', NULL, NULL, 'siswa', '$2y$10$J9agi.wwQIj98D/ACLnnKeuKAP8lG91RBJz15TJHmsTuUoj70EWpC', 'profile.jpg', 1, NULL, '2024-06-26 17:18:28', '2024-06-26 17:18:28'),
(61, 'asdasdas', NULL, NULL, 'siswa', '$2y$10$Gv6gC7/Xl/jLBvJy3m5cheodxae2EdR7zk6dskVLAWLN5/sltLhe.', 'profile.jpg', 1, NULL, '2024-06-26 17:18:54', '2024-06-26 17:18:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD KEY `admins_user_id_foreign` (`user_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `gurus`
--
ALTER TABLE `gurus`
  ADD PRIMARY KEY (`id`),
  ADD KEY `gurus_user_id_foreign` (`user_id`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `kelas_tapel_id_foreign` (`tapel_id`),
  ADD KEY `kelas_guru_id_foreign` (`guru_id`);

--
-- Indexes for table `mapels`
--
ALTER TABLE `mapels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifikasis`
--
ALTER TABLE `notifikasis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifikasis_pengirim_id_foreign` (`pengirim_id`),
  ADD KEY `notifikasis_penerima_id_foreign` (`penerima_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `pembelajarans`
--
ALTER TABLE `pembelajarans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pembelajarans_kelas_id_foreign` (`kelas_id`),
  ADD KEY `pembelajarans_guru_id_foreign` (`guru_id`),
  ADD KEY `pembelajarans_mapel_id_foreign` (`mapel_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `pertemuans`
--
ALTER TABLE `pertemuans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pertemuans_pembelajaran_id_foreign` (`pembelajaran_id`);

--
-- Indexes for table `presensis`
--
ALTER TABLE `presensis`
  ADD PRIMARY KEY (`id`),
  ADD KEY `absens_pertemuan_id_foreign` (`pertemuan_id`),
  ADD KEY `absens_siswa_id_foreign` (`siswa_id`);

--
-- Indexes for table `sekolahs`
--
ALTER TABLE `sekolahs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswas`
--
ALTER TABLE `siswas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `siswas_user_id_foreign` (`user_id`),
  ADD KEY `siswas_kelas_id_foreign` (`kelas_id`),
  ADD KEY `siswas_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `student_parents`
--
ALTER TABLE `student_parents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `student_parents_user_id_foreign` (`user_id`);

--
-- Indexes for table `tapels`
--
ALTER TABLE `tapels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gurus`
--
ALTER TABLE `gurus`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `mapels`
--
ALTER TABLE `mapels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `notifikasis`
--
ALTER TABLE `notifikasis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pembelajarans`
--
ALTER TABLE `pembelajarans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pertemuans`
--
ALTER TABLE `pertemuans`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `presensis`
--
ALTER TABLE `presensis`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `sekolahs`
--
ALTER TABLE `sekolahs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `siswas`
--
ALTER TABLE `siswas`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `student_parents`
--
ALTER TABLE `student_parents`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tapels`
--
ALTER TABLE `tapels`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `gurus`
--
ALTER TABLE `gurus`
  ADD CONSTRAINT `gurus_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `kelas`
--
ALTER TABLE `kelas`
  ADD CONSTRAINT `kelas_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `gurus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `kelas_tapel_id_foreign` FOREIGN KEY (`tapel_id`) REFERENCES `tapels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `notifikasis`
--
ALTER TABLE `notifikasis`
  ADD CONSTRAINT `notifikasis_penerima_id_foreign` FOREIGN KEY (`penerima_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `notifikasis_pengirim_id_foreign` FOREIGN KEY (`pengirim_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pembelajarans`
--
ALTER TABLE `pembelajarans`
  ADD CONSTRAINT `pembelajarans_guru_id_foreign` FOREIGN KEY (`guru_id`) REFERENCES `gurus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelajarans_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pembelajarans_mapel_id_foreign` FOREIGN KEY (`mapel_id`) REFERENCES `mapels` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pertemuans`
--
ALTER TABLE `pertemuans`
  ADD CONSTRAINT `pertemuans_pembelajaran_id_foreign` FOREIGN KEY (`pembelajaran_id`) REFERENCES `pembelajarans` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `presensis`
--
ALTER TABLE `presensis`
  ADD CONSTRAINT `absens_pertemuan_id_foreign` FOREIGN KEY (`pertemuan_id`) REFERENCES `pertemuans` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `absens_siswa_id_foreign` FOREIGN KEY (`siswa_id`) REFERENCES `siswas` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `siswas`
--
ALTER TABLE `siswas`
  ADD CONSTRAINT `siswas_kelas_id_foreign` FOREIGN KEY (`kelas_id`) REFERENCES `kelas` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `siswas_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `student_parents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `siswas_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `student_parents`
--
ALTER TABLE `student_parents`
  ADD CONSTRAINT `student_parents_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
