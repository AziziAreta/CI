-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Okt 2019 pada 07.49
-- Versi server: 10.3.16-MariaDB
-- Versi PHP: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `areta_pendaftaran`
--
CREATE DATABASE IF NOT EXISTS `areta_pendaftaran` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `areta_pendaftaran`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(5) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `no_telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `agama`
--

CREATE TABLE `agama` (
  `id_agama` int(2) NOT NULL,
  `nama_agama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `calon_mahasiswa`
--

CREATE TABLE `calon_mahasiswa` (
  `no_pendaftaran` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jk` enum('P','L') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_telp` varchar(15) NOT NULL,
  `id_agama` int(1) NOT NULL,
  `email` varchar(100) NOT NULL,
  `id_jurusan` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `dosen`
--

CREATE TABLE `dosen` (
  `nik` varchar(15) NOT NULL,
  `kode_dosen` varchar(3) NOT NULL,
  `nama_dosen` varchar(50) NOT NULL,
  `jk` enum('P','L') NOT NULL,
  `email` varchar(50) NOT NULL,
  `status` enum('Aktif','Pasif') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `jurusan`
--

CREATE TABLE `jurusan` (
  `kode_jurusan` int(3) NOT NULL,
  `nama_jurusan` varchar(100) NOT NULL,
  `inisial` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `jurusan`
--

INSERT INTO `jurusan` (`kode_jurusan`, `nama_jurusan`, `inisial`) VALUES
(3, 'Sistem Informasi', 'SI'),
(12, 'Akuntansi', ''),
(23, 'Multimedia', ''),
(34, 'Komputer Akuntansi', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `agama`
--
ALTER TABLE `agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indeks untuk tabel `calon_mahasiswa`
--
ALTER TABLE `calon_mahasiswa`
  ADD PRIMARY KEY (`no_pendaftaran`);

--
-- Indeks untuk tabel `dosen`
--
ALTER TABLE `dosen`
  ADD PRIMARY KEY (`nik`);

--
-- Indeks untuk tabel `jurusan`
--
ALTER TABLE `jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `agama`
--
ALTER TABLE `agama`
  MODIFY `id_agama` int(2) NOT NULL AUTO_INCREMENT;
--
-- Database: `bpdb`
--
CREATE DATABASE IF NOT EXISTS `bpdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `bpdb`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `title`, `seotitle`, `active`) VALUES
(1, 'Pure', 'pure', 'Y'),
(2, 'Plain', 'plain', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `id_parent`, `seotitle`, `picture`, `active`) VALUES
(1, 0, 'indonesiaku', '', 'Y'),
(2, 0, 'motivasi', '', 'Y'),
(3, 0, 'hubungan', '', 'Y'),
(4, 0, 'sukses', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_description`
--

CREATE TABLE `category_description` (
  `id_category_description` int(5) NOT NULL,
  `id_category` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category_description`
--

INSERT INTO `category_description` (`id_category_description`, `id_category`, `id_language`, `title`) VALUES
(1, 1, 1, 'Indonesiaku'),
(2, 1, 2, 'My Indonesia'),
(3, 2, 1, 'Motivasi'),
(4, 2, 2, 'Motivation'),
(5, 3, 1, 'Hubungan'),
(6, 3, 2, 'Relationship'),
(7, 4, 1, 'Sukses'),
(8, 4, 2, 'Success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `id_post` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id_comment`, `id_parent`, `id_post`, `name`, `email`, `url`, `comment`, `date`, `time`, `active`, `status`) VALUES
(1, 0, 8, 'Jenuar Dalapang', 'djenuar@gmail.com', '', 'Edukasi keuangan terhadap anak memang penting sejak dini', '2016-07-28', '12:40:24', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `component`
--

CREATE TABLE `component` (
  `id_component` int(5) NOT NULL,
  `component` varchar(100) NOT NULL,
  `type` enum('component','widget') NOT NULL DEFAULT 'component',
  `datetime` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `component`
--

INSERT INTO `component` (`id_component`, `component`, `type`, `datetime`, `active`) VALUES
(1, 'gallery', 'component', '2016-03-11 10:00:00', 'Y'),
(2, 'contact', 'component', '2016-03-11 10:00:00', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `title`, `content`, `picture`) VALUES
(1, 1, 'Coloration', '', 'coloration.jpg'),
(2, 2, 'Legs On Table', '', 'legs_on_table.jpg'),
(3, 1, 'Shop Counter', '', 'shop_counter.jpg'),
(4, 2, 'Work Desk', '', 'work_desk.jpg'),
(5, 1, 'City From Sky', '', 'city_from_sky.jpg'),
(6, 2, 'Traction', '', 'traction.jpg'),
(7, 1, 'Still Life White', '', 'still_life_white.jpg'),
(8, 2, 'Coffee In Heart', '', 'coffee_in_heart.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `id_language` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`id_language`, `title`, `code`, `active`) VALUES
(1, 'Indonesia', 'id', 'Y'),
(2, 'English', 'gb', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `target` varchar(10) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`, `target`) VALUES
(1, 0, 'dashboard', 'admin.php?mod=home', 'fa-home', 1, 1, 'Y', 'none'),
(2, 0, 'post', 'admin.php?mod=post', 'fa-book', 2, 1, 'Y', 'none'),
(3, 2, 'addnew', 'admin.php?mod=post&act=addnew', '', 2, 1, 'Y', 'none'),
(4, 2, 'allpost', 'admin.php?mod=post', '', 1, 1, 'Y', 'none'),
(5, 0, 'category', 'admin.php?mod=category', 'fa-tasks', 3, 1, 'Y', 'none'),
(6, 5, 'allcategory', 'admin.php?mod=category', '', 1, 1, 'Y', 'none'),
(7, 5, 'addnew', 'admin.php?mod=category&act=addnew', '', 2, 1, 'Y', 'none'),
(8, 0, 'tag', 'admin.php?mod=tag', 'fa-tags', 4, 1, 'Y', 'none'),
(9, 8, 'alltag', 'admin.php?mod=tag', '', 1, 1, 'Y', 'none'),
(19, 8, 'addnew', 'admin.php?mod=tag&act=addnew', '', 2, 1, 'Y', 'none'),
(20, 0, 'pages', 'admin.php?mod=pages', 'fa-file', 6, 1, 'Y', 'none'),
(21, 20, 'allpages', 'admin.php?mod=pages', '', 1, 1, 'Y', 'none'),
(22, 20, 'addnew', 'admin.php?mod=pages&act=addnew', '', 2, 1, 'Y', 'none'),
(23, 0, 'library', 'admin.php?mod=library', 'fa-picture-o', 7, 1, 'Y', 'none'),
(27, 0, 'setting', 'admin.php?mod=setting', 'fa-cog', 8, 1, 'Y', 'none'),
(28, 0, 'theme', 'admin.php?mod=theme', 'fa-desktop', 9, 1, 'Y', 'none'),
(29, 28, 'alltheme', 'admin.php?mod=theme', '', 1, 1, 'Y', 'none'),
(30, 28, 'addnew', 'admin.php?mod=theme&act=addnew', '', 2, 1, 'Y', 'none'),
(31, 0, 'menumanager', 'admin.php?mod=menumanager', 'fa-sitemap', 10, 1, 'Y', 'none'),
(32, 0, 'component', 'admin.php?mod=component', 'fa-puzzle-piece', 11, 1, 'Y', 'none'),
(33, 32, 'allcomponent', 'admin.php?mod=component', '', 1, 1, 'Y', 'none'),
(34, 32, 'addnew', 'admin.php?mod=component&act=addnew', '', 2, 1, 'Y', 'none'),
(42, 0, 'comment', 'admin.php?mod=comment', 'fa-comments', 5, 1, 'Y', 'none'),
(43, 32, 'Galeri', 'admin.php?mod=gallery', '', 3, 1, 'Y', 'none'),
(44, 32, 'Kontak', 'admin.php?mod=contact', '', 4, 1, 'Y', 'none'),
(45, 0, 'user', 'admin.php?mod=user', 'fa-group', 12, 1, 'Y', 'none'),
(46, 45, 'alluser', 'admin.php?mod=user', '', 1, 1, 'Y', 'none'),
(47, 45, 'addnew', 'admin.php?mod=user&act=addnew', '', 2, 1, 'Y', 'none'),
(48, 0, 'Beranda', './', '', 1, 2, 'Y', 'none'),
(49, 0, 'Home', './', '', 1, 3, 'Y', 'none'),
(50, 0, 'Tentang Kami', 'pages/tentang-kami', '', 2, 2, 'Y', 'none'),
(51, 50, 'Layanan', 'pages/layanan', '', 1, 2, 'Y', 'none'),
(52, 0, 'Indonesiaku', 'category/indonesiaku', '', 49, 2, 'Y', 'none'),
(53, 0, 'Motivasi', 'category/motivasi', '', 49, 2, 'Y', 'none'),
(54, 0, 'Hubungan', 'category/hubungan', '', 49, 2, 'Y', 'none'),
(55, 0, 'Sukses', 'category/sukses', '', 49, 2, 'Y', 'none'),
(56, 0, 'Galeri', 'album', '', 49, 2, 'Y', 'none'),
(57, 0, 'Kontak', 'contact', '', 49, 2, 'Y', 'none'),
(58, 0, 'About Us', 'pages/tentang-kami', '', 2, 3, 'Y', 'none'),
(59, 58, 'Services', 'pages/layanan', '', 1, 3, 'Y', 'none'),
(60, 0, 'Indonesiaku', 'category/indonesiaku', '', 50, 3, 'Y', 'none'),
(61, 0, 'Motivation', 'category/motivasi', '', 50, 3, 'Y', 'none'),
(62, 0, 'Relationship', 'category/hubungan', '', 50, 3, 'Y', 'none'),
(63, 0, 'Success', 'category/sukses', '', 50, 3, 'Y', 'none'),
(64, 0, 'Gallery', 'album', '', 50, 3, 'Y', 'none'),
(65, 0, 'Contact', 'contact', '', 50, 3, 'Y', 'none');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_group`
--

CREATE TABLE `menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_group`
--

INSERT INTO `menu_group` (`id`, `title`) VALUES
(1, 'Dashboard'),
(2, 'id'),
(3, 'gb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth`
--

CREATE TABLE `oauth` (
  `id_oauth` int(5) NOT NULL,
  `oauth_type` varchar(10) NOT NULL,
  `oauth_key` text NOT NULL,
  `oauth_secret` text NOT NULL,
  `oauth_id` varchar(100) NOT NULL,
  `oauth_user` varchar(100) NOT NULL,
  `oauth_token1` text NOT NULL,
  `oauth_token2` text NOT NULL,
  `oauth_fbtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `oauth`
--

INSERT INTO `oauth` (`id_oauth`, `oauth_type`, `oauth_key`, `oauth_secret`, `oauth_id`, `oauth_user`, `oauth_token1`, `oauth_token2`, `oauth_fbtype`) VALUES
(1, 'facebook', '1379700562291163', '8fecea44bbbca74ce2cc1f0129f004bf', '', '', '', '', ''),
(2, 'twitter', 'uPXZGTJI2xcMcviHJdZxw', '9Jacq3buOEY39dWgCnuREbe5vMUnuDLP86daS7b1uw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id_pages` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id_pages`, `seotitle`, `picture`, `active`) VALUES
(1, 'tentang-kami', '', 'Y'),
(2, 'layanan', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages_description`
--

CREATE TABLE `pages_description` (
  `id_pages_description` int(5) NOT NULL,
  `id_pages` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages_description`
--

INSERT INTO `pages_description` (`id_pages_description`, `id_pages`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Tentang Kami', '&lt;p&gt;PopojiCMS adalah Content Management System yang dibuat dengan konsep yang sangat menarik dan mudah untuk digunakan. PopojiCMS dibuat dengan tampilan responsive dengan base bootstarp dan selain itu juga dilengkapi dengan banyak plugin jQuery.&lt;br /&gt;&lt;br /&gt;PopojiCMS dibangun di atas dasar OOP tetapi tetap tidak menghilangkan rasa native-nya, sehingga developer awam pun bisa dengan mudah menggunakannya. Semoga PopojiCMS dapat menjawab semua kebutuhan Anda tentang web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terima kasih,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(2, 1, 2, 'About Us', '&lt;p&gt;PopojiCMS is a Content Management System that is made with a very interesting concept and easy to use. PopojiCMS made its appearance bootstarp responsive to the base and it is also equipped with a lot of jQuery plugins.&lt;br /&gt;&lt;br /&gt;PopojiCMS built on a foundation of OOP, but still does not eliminate its native flavor, so the developer can easily to use. Hopefully PopojiCMS can answer all your needs on the web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Thank you,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(3, 2, 1, 'Layanan', '&lt;p&gt;PopojiCMS telah berkembang menjadi CMS besar selama 2 tahun terakhir ini, berbagai masukan dan perbaikan sana sini telah menjadikan PopojiCMS siap menjawab kebutuhan web Anda, dukungan komunitas yang luas dan tentunya keamanan web yang handal siap Anda dapatkan.&lt;br /&gt;&lt;br /&gt;Dengan dilengkapi oleh jQuery dan bootstrap, PopojiCMS tampil lebih hidup menghadirkan fitur yang tidak terbayangkan sebelumnya.&lt;br /&gt;&lt;br /&gt; PopojiCMS dibuat dengan tampilan responsive sehingga bisa dibuka pada ukuran layar manapun dan kapanpun.&lt;br /&gt;PopojiCMS didesain dengan tampilan modern yang cantik sehingga menarik pengguna web untuk selalu berkunjung.&lt;br /&gt;PopojiCMS dibuat dengan konsep OOP dengan rasa native sehingga developer awampun bisa mengcustom dengan mudah rasa webnya.&lt;/p&gt;'),
(4, 2, 2, 'Services', '&lt;p&gt;PopojiCMS has developed into a major CMS over the past 2 years, a variety of input and improvements here and there have made PopojiCMS ready to answer the needs of your web, broad community support and a reliable web security course is ready you get.&lt;br /&gt;&lt;br /&gt;With furnished by jQuery and Bootstrap, PopojiCMS more vivid brings the features previously unimaginable.&lt;br /&gt;&lt;br /&gt;PopojiCMS made its appearance responsive so that it can be opened on the screen size anytime and anywhere.&lt;br /&gt;PopojiCMS designed with a modern look that is beautiful that attract web users to always visit.&lt;br /&gt;PopojiCMS made with OOP concepts with native flavors so that developers can custom easily its flavor.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id_post` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `publishdate` datetime NOT NULL,
  `editor` int(5) NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `headline` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `picture` varchar(255) NOT NULL,
  `picture_description` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`id_post`, `seotitle`, `tag`, `date`, `time`, `publishdate`, `editor`, `active`, `headline`, `comment`, `picture`, `picture_description`, `hits`) VALUES
(1, 'destinasi-wisata-tentang-toleransi-beragama-di-indonesia', 'indonesia,wisata-religi,toleransi-beragama', '2016-03-31', '10:06:17', '2016-03-31 10:06:17', 1, 'Y', 'Y', 'Y', 'bukit-kasih-kanonang.jpg', '', 17),
(2, 'wisata-alam-manado-maladewa-nya-indonesia', 'indonesia,manado,wisata-manado,sulawesi-utara', '2016-03-31', '06:34:27', '2016-03-31 06:34:27', 1, 'Y', 'Y', 'Y', 'pulau-nain.jpg', '', 4),
(3, 'bangun-lebih-pagi-agar-bisa-merealisasikan-startup-impianmu', 'startup,impian', '2016-03-31', '04:43:27', '2016-03-31 04:43:27', 1, 'Y', 'Y', 'Y', 'trik-bagun-lebih-pagi.jpg', '', 15),
(4, '5-alasan-kenapa-kamu-harus-membangun-usaha-kecil-bukan-startup', 'startup,bisnis,usaha-kecil', '2016-03-31', '08:54:26', '2016-03-31 08:54:26', 1, 'Y', 'N', 'Y', 'membangun-usaha-kecil.jpg', '', 5),
(5, 'cowok-cuek-justru-tepat-jadi-pendampingmu', 'cowok,pendamping', '2016-03-31', '05:04:09', '2016-03-31 05:04:09', 1, 'Y', 'Y', 'Y', 'cowok-cuek.jpg', '', 12),
(6, 'cewek-bergigi-gingsul-emang-layak-disayang', 'cewek,ginsul,sayang,pendamping', '2016-03-31', '10:12:10', '2016-03-31 10:12:10', 1, 'Y', 'N', 'Y', 'cewek-bergigi-gingsul.jpg', '', 8),
(7, 'ingin-sukses-terapkan-7-tips-sukses-oprah-winfrey', 'sukses,tips-sukses', '2016-03-31', '03:20:42', '2016-03-31 03:20:42', 1, 'Y', 'N', 'Y', 'tips-sukses.jpg', '', 4),
(8, '7-ide-beri-edukasi-keuangan-kepada-anak', 'edukasi-anak,keuangan', '2016-03-31', '01:32:45', '2016-03-31 01:32:45', 1, 'Y', 'Y', 'Y', 'edukasi-anak.jpg', '', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_category`
--

CREATE TABLE `post_category` (
  `id_post_category` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_category`
--

INSERT INTO `post_category` (`id_post_category`, `id_post`, `id_category`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_description`
--

CREATE TABLE `post_description` (
  `id_post_description` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_description`
--

INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Destinasi Wisata Tentang Toleransi Beragama di Indonesia', '&lt;p&gt;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan. Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.&lt;br /&gt;&lt;br /&gt;Tapi sebenarnya, toleransi itu masih ada kok. Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.&lt;br /&gt;&lt;br /&gt;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam. Di mana sajakah itu? Yuk, kita telusuri satu persatu.&lt;br /&gt;&lt;br /&gt;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.&lt;br /&gt;&lt;br /&gt;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral. Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya. Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno. Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.&lt;br /&gt;&lt;br /&gt;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya. Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.&lt;br /&gt;&lt;br /&gt;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia. Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara. Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien. Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.&lt;br /&gt;&lt;br /&gt;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami` yang bersanding berdampingan.&lt;br /&gt;&lt;br /&gt;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun. Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih dari 1 abad. Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat. Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.&lt;br /&gt;&lt;br /&gt;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.&lt;br /&gt;&lt;br /&gt;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik. Kenapa? Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia. Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa. Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan. Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.&lt;br /&gt;&lt;br /&gt;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl. Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian. Yang menjadikan tempat ini unik adalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no. 222.&lt;br /&gt;&lt;br /&gt;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.&lt;br /&gt;&lt;br /&gt;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama. Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia. Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.&lt;br /&gt;&lt;br /&gt;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung, kacang, dan telur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari content Hipwee oleh Reza Akhmad&lt;/p&gt;'),
(2, 1, 2, 'Sightseeing About Religious Tolerance in Indonesia', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan.&quot;&gt;Differences in belief in our country often leads to an unpleasant incident. &lt;/span&gt;&lt;span title=&quot;Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.\r\n\r\n&quot;&gt;Of the forced closure of places of worship to attack minorities home, internet and print media is filled with negative news which makes us pessimistic about the future of tolerance of religious life in Indonesia.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tapi sebenarnya, toleransi itu masih ada kok.&quot;&gt;But in fact, tolerance is still there anyway. &lt;/span&gt;&lt;span title=&quot;Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.\r\n\r\n&quot;&gt;At least the physical remains can you see the beauty of six religious tourist destinations in this article.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam.&quot;&gt;This time, the author will tell you all the places in Indonesia that you can go to prove that different is beautiful, if you think about it more deeply. &lt;/span&gt;&lt;span title=&quot;Di mana sajakah itu?&quot;&gt;Where are they? &lt;/span&gt;&lt;span title=&quot;Yuk, kita telusuri satu persatu.\r\n\r\n&quot;&gt;Let us examine one by one.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.\r\n\r\n&quot;&gt;1. At the center of the capital, two religious harmony shown by the Istiqlal Mosque and Jakarta Cathedral were built side by side.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral.&quot;&gt;One of the symbols of inter-religious harmony which is located in the center of the capital Jakarta was the Istiqlal Mosque and Cathedral Church. &lt;/span&gt;&lt;span title=&quot;Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya.&quot;&gt;They were built side by side, standing complement one another. &lt;/span&gt;&lt;span title=&quot;Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno.&quot;&gt;Cathedral Church itself was built since 1891 and its construction was stopped due to lack of funds in 1892. The Istiqlal Mosque is located not far from the Cathedral Church of development initiated by the President. &lt;/span&gt;&lt;span title=&quot;Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.\r\n\r\n&quot;&gt;The mosque itself was inaugurated on February 22, 1978. The location of the mosque adjoining the cathedral is chosen to symbolize the spirit of brotherhood, unity and religious tolerance corresponding values contained in Pancasila.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya.&quot;&gt;2. Jakarta also has evidence of other religious harmony. &lt;/span&gt;&lt;span title=&quot;Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.\r\n\r\n&quot;&gt;Examples Masjid Al-Muqarrabien and Christian Gospel Church in North Jakarta.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia.&quot;&gt;Jakarta still have other places that prove the existence of religious tolerance in Indonesia. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara.&quot;&gt;Two places of worship which became a symbol of harmony is located in Tanjung Priok, North Jakarta. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien.&quot;&gt;Two places of worship are Church of the Sangihe Talaud Mahanaim Christian Gospel and Al-Muqarrabien. &lt;/span&gt;&lt;span title=&quot;Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.\r\n\r\n&quot;&gt;Although built for two different beliefs, the two places of worship is only separated by a wall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami&amp;#96; yang bersanding berdampingan.\r\n\r\n&quot;&gt;3. In Malang, you can find GPIB Immanuel and Grand Jami` are coupled together.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun.&quot;&gt;In Malang, there is also a place of worship two buildings side by side, the two places of worship stood together for over 100 years. &lt;/span&gt;&lt;span title=&quot;Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih&quot;&gt;The location is both a place of worship is located in the heart of Malang, exactly in front of the town square, a church which was built in 1861 while the mosque was built in 1875, although only coincide separated by an insurance office in the middle, there was never any quarrels or squabbles over &lt;/span&gt;&lt;span title=&quot;dari 1 abad.&quot;&gt;from the 1st century. &lt;/span&gt;&lt;span title=&quot;Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat.&quot;&gt;Both administrators places of worship often work together and be tolerant with each other, when the celebration of Christmas arrived, the young man from the Ansar Ansar Barisan Multipurpose (Banser) and Youth Masjid help guard the security and the church parking lot. &lt;/span&gt;&lt;span title=&quot;Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.\r\n\r\n&quot;&gt;So even when the Id prayers arrived, the congregation could until spilling outside the mosque, and even some prayers at the front and side of the church.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.\r\n\r\n&quot;&gt;4. Complex Puja Mandala is evidence of religious harmony in Bali.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik.&quot;&gt;The complex houses of worship located in Nusa Dua, Bali is quite unique and interesting. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia.&quot;&gt;Because this is where the building is situated worship five religions in Indonesia are located in one complex, perhaps the only one in the world. &lt;/span&gt;&lt;span title=&quot;Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa.&quot;&gt;The location is in the hill region Kampial, which we used to skip if you want bervakansi to tourist areas Garuda Wisnu Kencana (GWK) of Tanjung Benoa. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan.&quot;&gt;We can see five religious buildings that line, starting from the mosque, the Catholic Church, Temple, Protestant Church, and Pura, maybe that&#039;s why this place is called by the name of Puja Mandala - which means room for worship. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.\r\n\r\n&quot;&gt;We can see religious tolerance when worship is in progress because every religion have a regular schedule of different worship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.\r\n\r\n&quot;&gt;5. GKL Joyodiningratan Building and Masjid Al-Hikmah sharing wall in Solo.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl.&quot;&gt;For those of you who live in Solo, may already be familiar with both the building located at Jl. &lt;/span&gt;&lt;span title=&quot;Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian.&quot;&gt;Gatot Subroto, major roads that divides the city of Solo southern half. &lt;/span&gt;&lt;span title=&quot;Yang menjadikan tempat ini unikadalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no.&quot;&gt;What makes this place unique is building Java Christian Church Joyodiningratan and Masjid Al-Hikmah are close and share a wall, more unique that the address of the two buildings is the same, namely at Jalan Gatot Subroto no. &lt;/span&gt;&lt;span title=&quot;222.\r\n\r\n&quot;&gt;222.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.\r\n\r\n&quot;&gt;6. In Minahasa, Tugu teaching of religion in Bukit Kasih 5 Kanonang become a symbol of the beauty of differences in beliefs.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama.&quot;&gt;Monument located in Bukit Kasih Kanonang, Minahasa, North Sulawesi is also popularly known as religious tolerance travel. &lt;/span&gt;&lt;span title=&quot;Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia.&quot;&gt;Points that can be addressed with a journey time of 2 hours from the city of Manado has a tower with a height of 22 meters with five field side of each side sculpted reliefs symbol of five major religions in Indonesia. &lt;/span&gt;&lt;span title=&quot;Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.\r\n\r\n&quot;&gt;In addition, sites built on land measuring 4 hectares was established in 2002 and has 5 places of worship for different religions 5 around him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung,&quot;&gt;In this place you can learn that human beings must respect each other and love, you also have to climb the stairs as much as 2,435 steps, do not worry, a sense capekmu will be replaced with the beauty of the crater sulfur around the stairs, where the water used by people to cook corn, &lt;/span&gt;&lt;span title=&quot;kacang, dan telur.\r\n\r\n\r\n&quot;&gt;nuts, and eggs.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari content Hipwee oleh Reza Akhmad&quot;&gt;Taken from the content Hipwee by Reza Akhmad&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(3, 2, 1, 'Wisata Alam Manado, Maladewa-nya Indonesia', '&lt;p&gt;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal. Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi. Apa saja sih 9 destinasi ini?&lt;br /&gt;&lt;br /&gt;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini&lt;br /&gt;&lt;br /&gt;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini. Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung. Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado. Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.&lt;br /&gt;&lt;br /&gt;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado. Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi. Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini. Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.&lt;br /&gt;&lt;br /&gt;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;Aer&quot; -- bukan &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan. Orang Manado bilang &quot;aer&quot;, bukan &quot;air&quot;, dan entah bagaimana asal-usulnya pantai ini dinamakan &quot;pantai aer&quot;. Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara. Hanya saja, pantai ini terletak di desa yang berbeda.&lt;br /&gt;&lt;br /&gt;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa. Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.&lt;br /&gt;&lt;br /&gt;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan. Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini. So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.&lt;br /&gt;&lt;br /&gt;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian&lt;br /&gt;&lt;br /&gt;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun? Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun. Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.&lt;br /&gt;&lt;br /&gt;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan. Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana. Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon. Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.&lt;br /&gt;&lt;br /&gt;Jalan awal memang berupa anak tangga yang agak terawat. Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.&lt;br /&gt;&lt;br /&gt;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa&lt;br /&gt;&lt;br /&gt;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas? Pergi saja ke Gunung Soputan. Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung. Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan. Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.&lt;br /&gt;&lt;br /&gt;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;nggembel&quot; atau dalam kamus bahasa Indonesianya numpang gratis di kampung terakhir sebelum pos pendakian. Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II. Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya. Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.&lt;br /&gt;&lt;br /&gt;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;leher unta&quot;&lt;br /&gt;&lt;br /&gt;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan. Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang. Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai. Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat. Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.&lt;br /&gt;&lt;br /&gt;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar. Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang. Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.&lt;br /&gt;&lt;br /&gt;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang&lt;br /&gt;&lt;br /&gt;Indonesia adalah negeri dengan ribuan pulau kecil. Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga. Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.&lt;br /&gt;&lt;br /&gt;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu. Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;Selamat Datang di Pulau Lihaga, Perombakan Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas. Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.&lt;br /&gt;&lt;br /&gt;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini. Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.&lt;br /&gt;&lt;br /&gt;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!&lt;br /&gt;&lt;br /&gt;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini. Peringatan berupa spanduk bergambar tengkorak&amp;nbsp; warna merah &quot;Dilarang mendaki kawah gunung lokon&quot; sepertinya kurang diperhatikan oleh para pendaki. Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.&lt;br /&gt;&lt;br /&gt;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal. Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam. Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.&lt;br /&gt;&lt;br /&gt;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa&lt;br /&gt;&lt;br /&gt;Pernahkan kamu pergi ke Maladewa? Wah mungkin terlalu jauh ya buat jalan-jalan ke sana. Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa. Orang Bajo Kampung Nain menyebutnya &quot;bungin pasir timbul&quot; yakni fenomena surutnya air laut secara maksimal ketika bulan purnama atau bulan mati.&lt;br /&gt;&lt;br /&gt;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;Maladewa-nya Indonesia&quot;. Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang. Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.&lt;br /&gt;&lt;br /&gt;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&amp;nbsp; Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.&lt;br /&gt;&lt;br /&gt;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta&lt;br /&gt;&lt;br /&gt;Bukan cuma manusia yang punya hati, bumipun punya. Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara. Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.&lt;br /&gt;&lt;br /&gt;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau. Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi. Sebagai tanda perbatasanNKRI, di pulau ini dibangun sebuah monumen bernama &quot;Monumen Kedaulatan Negara Kesatuan Republik Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat. Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat. Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak. Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat. &lt;br /&gt;&lt;br /&gt;Wah, siapa sangka? Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Qobul Pamuji&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(4, 2, 2, 'Nature Tour of Manado, Indonesia Maldives', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal.&quot;&gt;When wander or stroll in the city of Manado, you&#039;ll want to explore the natural beauty of the famous. &lt;/span&gt;&lt;span title=&quot;Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi.&quot;&gt;Well, among an assortment of natural beauty, there are 9 destinations that most makes you miss even wanted to return to Manado again. &lt;/span&gt;&lt;span title=&quot;Apa saja sih 9 destinasi ini?\r\n\r\n&quot;&gt;What the hell 9 this destination?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini\r\n\r\n&quot;&gt;1. Pall Coast, destination hits that make you linger here&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini.&quot;&gt;Formerly the hell is so deserted beach, was so lonely maybe only three or four people who visit this beach. &lt;/span&gt;&lt;span title=&quot;Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung.&quot;&gt;White sand was very soft and clean, with no trace of footprints visitors. &lt;/span&gt;&lt;span title=&quot;Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado.&quot;&gt;However, after some photos circulating on sosmed Pall Beach, this beach suddenly became a Top Hits new tourist destinations for residents of Manado. &lt;/span&gt;&lt;span title=&quot;Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.\r\n\r\n&quot;&gt;When the weekend, we often see congestion up to one kilometer to the entrance of Pall Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado.&quot;&gt;It is in the village of Marinsow, District Likupang East, North Minahasa Regency, not far from downtown Manado. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi.&quot;&gt;Not more than two hours, you can reach this beach with private vehicle. &lt;/span&gt;&lt;span title=&quot;Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini.&quot;&gt;Blue water, long shoreline and a variety of games that exist to make visitors linger on this beach. &lt;/span&gt;&lt;span title=&quot;Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.\r\n\r\n&quot;&gt;Well if you&#039;ve been here once, will definitely miss when you can stroll to the beach for the second time with my friends.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;&gt;2. Turkish Aer Pulisan, because the Manado bilangnya &quot;Aer&quot; - instead of &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan.&quot;&gt;Not far from the beach Pall, you can enjoy the natural attractions Pulisan Aer Beach. &lt;/span&gt;&lt;span title=&quot;Orang Manado bilang &quot;&gt;Manado people say &quot;aer&quot;, instead of &quot;water&quot;, and somehow its origins this beach called &quot;beach aer&quot;. &lt;/span&gt;&lt;span title=&quot;Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara.&quot;&gt;Aer beach is still located in the same district with Pall coast, namely North Minahasa regency. &lt;/span&gt;&lt;span title=&quot;Hanya saja, pantai ini terletak di desa yang berbeda.\r\n\r\n&quot;&gt;Only, this beach is located in a different village.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa.&quot;&gt;Small caves on the beach this is a characteristic that makes it very different from other beaches in Minahasa. &lt;/span&gt;&lt;span title=&quot;Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.\r\n\r\n&quot;&gt;Needless out a lot of money, you just pay for a long-tail boat Rp15,000 to get to the cave of Aer Pulisan Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan.&quot;&gt;The place is also a favorite destination for Manado citizens or immigrants who want refreshing after so long tired with the work. &lt;/span&gt;&lt;span title=&quot;Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini.&quot;&gt;The waves were calm and the clear sea water, it is suitable for you who like snorkeling or just playing water at this beach. &lt;/span&gt;&lt;span title=&quot;So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.\r\n\r\n&quot;&gt;So, do not miss this beach to be recorded in the list tripmu if you&#039;re visiting or wander in Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian\r\n\r\n&quot;&gt;3. Niagara Tekaan telu, like rafting-raft upstream swim to the shore&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun?&quot;&gt;Harder Where the heck, climbing a mountain or a walk to a waterfall? &lt;/span&gt;&lt;span title=&quot;Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun.&quot;&gt;Maybe for some people, it is more difficult to climb the mountain from the waterfall. &lt;/span&gt;&lt;span title=&quot;Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.\r\n\r\n&quot;&gt;But briefly, jajal Niagara Tinoor first before absolutely sure that the roads to the waterfall is easy.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan.&quot;&gt;Niagara Tinoor, or often referred to as Niagara Tekaan telu, pick a track that is very difficult to conquer. &lt;/span&gt;&lt;span title=&quot;Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana.&quot;&gt;In addition because the terrain is teetering on the edge, contour slippery rocks and soil erosive make a special experience that will not be forgotten when you finally get there. &lt;/span&gt;&lt;span title=&quot;Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon.&quot;&gt;It is quite close to the city of Manado, which is in the village of Tinoor, Tomohon district. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.\r\n\r\n&quot;&gt;Not more than an hour you came to the entrance of this waterfall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jalan awal memang berupa anak tangga yang agak terawat.&quot;&gt;Road early risers indeed be somewhat maintained. &lt;/span&gt;&lt;span title=&quot;Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.\r\n\r\n&quot;&gt;But after passing through the jungle, you will feel the sensation wild and difficult terrain that will make you more and more challenged to quickly get to it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa\r\n\r\n&quot;&gt;4. Soputan, a mountain of a million people for the people of Minahasa&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas?&quot;&gt;You simply pengin camping set up small tents, streets relieve fatigue, or sing accompanied by guitars in the wild? &lt;/span&gt;&lt;span title=&quot;Pergi saja ke Gunung Soputan.&quot;&gt;Just go to Soputan. &lt;/span&gt;&lt;span title=&quot;Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung.&quot;&gt;Spacious camping area with gently sloping terrain is suitable for you novice climbers who want to experience the adventure first to climb the mountain. &lt;/span&gt;&lt;span title=&quot;Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan.&quot;&gt;High mountain mdl 1784 is located in the district of Kawangkoan. &lt;/span&gt;&lt;span title=&quot;Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.\r\n\r\n&quot;&gt;From the city of Manado may take two hours by road.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;&gt;There are unique things done by the climbers Minahasa, namely &quot;nggembel&quot; or in Indonesian language dictionary free ride at the last village before heading ascent. &lt;/span&gt;&lt;span title=&quot;Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II.&quot;&gt;This active volcano has two peaks namely Puncak Puncak Soputan Soputan I and II. &lt;/span&gt;&lt;span title=&quot;Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya.&quot;&gt;Generally, the climbers reach the summit I could just as Peak II has a vertical terrain, slippery and dangerous. &lt;/span&gt;&lt;span title=&quot;Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.\r\n\r\n&quot;&gt;Having reached the peak I, you can pose with your friends or write words for someone and then uploaded on sosmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;&gt;5. Mount Threshold, the only mountain that has a &quot;neck camel&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan.&quot;&gt;Talking about mountain in North Sulawesi&#039;s not enough to just get Soputan. &lt;/span&gt;&lt;span title=&quot;Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang.&quot;&gt;In District Boltim (Boolang Mongondow East) there is a mountain that had a camel&#039;s neck, the Mount Threshold. &lt;/span&gt;&lt;span title=&quot;Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai.&quot;&gt;The volcano is still has the same characteristics as Soputan, namely mild and gentle terrain. &lt;/span&gt;&lt;span title=&quot;Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat.&quot;&gt;Although this mountain is a mountain of dead, the fumes coming out of the crater of Mount Threshold enough to sting. &lt;/span&gt;&lt;span title=&quot;Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.\r\n\r\n&quot;&gt;Mountains with an altitude of 1,795 mdl is located not far from Lake Moat, so you&#039;re going to get to see the lake from the top of the mountain Moat.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar.&quot;&gt;Extensive plantation residents along a hiking trail, trekking makes you more beautiful and not boring because you&#039;re going to meet with farmers who were harvesting his crop for sale at the market. &lt;/span&gt;&lt;span title=&quot;Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang.&quot;&gt;Something interesting from this mountain is the natural contours of the neck in the form of a camel that extends above the crater sulfur. &lt;/span&gt;&lt;span title=&quot;Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.\r\n\r\n&quot;&gt;Green hills and white color sulfur soil is suitable for being the object of photography for you that hunting hobby.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang\r\n\r\n&quot;&gt;6. Lihaga island, deserted islands that make you not want to go home&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Indonesia adalah negeri dengan ribuan pulau kecil.&quot;&gt;Indonesia is a country with thousands of small islands. &lt;/span&gt;&lt;span title=&quot;Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga.&quot;&gt;Well, for you who were in Manado, do not miss this one little island its name Lihaga Island. &lt;/span&gt;&lt;span title=&quot;Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.\r\n\r\n&quot;&gt;Tanjung Serei in North Minahasa is the dock of the most recommended for you who pengin ngetrip to this island except for the place broad selection of passenger ships leased by fishermen are also provided quite a lot so you are free to choose whichever you want.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu.&quot;&gt;Passenger boat trip to the island of Tanjung Serei Lihaga takes about 30 minutes, with a rental fee of 700-800 thousand. &lt;/span&gt;&lt;span title=&quot;Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;&gt;Arriving on this island, you&#039;re going to be greeted by a monument built of wood by saying &quot;Welcome to the island Lihaga, reshuffle Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas.&quot;&gt;Simply by paying 25,000 per person, you can enjoy all the natural beauty of this island with satisfaction. &lt;/span&gt;&lt;span title=&quot;Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.\r\n\r\n&quot;&gt;Starting from a stretch of soft white sand, crystal clear sea water or just sitting under the shady trees at a time when the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini.&quot;&gt;Skin has started to burn, the body is tired and hungry, you&#039;re still playing around the water on the island. &lt;/span&gt;&lt;span title=&quot;Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.\r\n\r\n&quot;&gt;Well, this island is very suitable for you who wanted to calm down from the bustle of the city of Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!\r\n\r\n&quot;&gt;7. Mount Lokon, though can not reach the top I&#039;m still proud to be mendakimu!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini.&quot;&gt;This mountain status of mid-2015 was never passed on from standby become wary that mean you are not allowed to climb this mountain. &lt;/span&gt;&lt;span title=&quot;Peringatan berupa spanduk bergambar tengkorak warna merah &quot;&gt;Warnings in the form of a skull red banners &quot;No to climb crater Lokon&quot; is less likely to be noticed by the climbers. &lt;/span&gt;&lt;span title=&quot;Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.\r\n\r\n&quot;&gt;Many climbers who remain desperate to climb to the crater of the mountain.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal.&quot;&gt;To climb the highest mountain in Tomohon is indeed not required physically strong, because the track is quite short and not so steep. &lt;/span&gt;&lt;span title=&quot;Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam.&quot;&gt;The challenge is lavas form of large rocks quite slippery and steep. &lt;/span&gt;&lt;span title=&quot;Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.\r\n\r\n&quot;&gt;Mount also has no water source, so the nature of kesetiakawananmu will be tested when there are friends who run out of drinking water.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa\r\n\r\n&quot;&gt;8. Nain Island, sand Bungin charm arises like the Maldives&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pernahkan kamu pergi ke Maladewa?&quot;&gt;Have you ever go to Maldives? &lt;/span&gt;&lt;span title=&quot;Wah mungkin terlalu jauh ya buat jalan-jalan ke sana.&quot;&gt;Wah perhaps too much so for a walk to get there. &lt;/span&gt;&lt;span title=&quot;Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa.&quot;&gt;But enough to Minahasa Utara Wori District precisely in Kampung Nain, you&#039;re going to enjoy the thrill of nature like in the Maldives. &lt;/span&gt;&lt;span title=&quot;Orang Bajo Kampung Nain menyebutnya &quot;&gt;Nain Kampung Bajo people call it &quot;sand Bungin raised&quot; the phenomenon of receding tides maximum when full moon or dark moon.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;&gt;White sand that will arise to the surface when the tide is very beautiful, well worth making this point is referred to as &quot;Maldives of its Indonesia&quot;. &lt;/span&gt;&lt;span title=&quot;Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang.&quot;&gt;Budget rental boats to this island is quite expensive: 2.5 million for vessels measuring 30 to 40 passengers. &lt;/span&gt;&lt;span title=&quot;Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.\r\n\r\n&quot;&gt;There are two access ports to get there, the port Bersehati Market and Port Wori Manado in North Minahasa.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&quot;&gt;Reflux Bungin peak is usually around 11:00 s.d 14:00 pm so, you must sunbathe new first to enjoy the beauty of this island. &lt;/span&gt;&lt;span title=&quot;Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.\r\n\r\n&quot;&gt;For you were afraid of the heat, it is advisable to use sunblock and a hat because there is no place to take shelter from the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta\r\n\r\n&quot;&gt;9. Lake of Love, from one end of the country&#039;s border beloved Indonesiaku&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan cuma manusia yang punya hati, bumipun punya.&quot;&gt;It&#039;s not just humans who have a heart, the earth has. &lt;/span&gt;&lt;span title=&quot;Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara.&quot;&gt;Heart Lake is located at the north end of the border of Indonesia and the Philippines, namely in Sitaro Islands regency, North Sulawesi. &lt;/span&gt;&lt;span title=&quot;Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.\r\n\r\n&quot;&gt;Here, there is a small island called Pulau Makalehi - inhabited by about 100 people Sangihe tribe citizens.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau.&quot;&gt;Access to this island of Manado is still difficult, there are only fast boat service that will take you from Manado harbor to the Port Ulu Siau. &lt;/span&gt;&lt;span title=&quot;Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi.&quot;&gt;After that you have to hire a boat for access to the island Makalehi. &lt;/span&gt;&lt;span title=&quot;Sebagai tanda perbatasan NKRI, di pulau ini dibangun sebuah monumen bernama &quot;&gt;As a sign of Homeland border, on the island was built a monument called &quot;Monument of Sovereignty of the Republic of Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat.&quot;&gt;For those of you who are hobby explore foreign places, Makalehi Island might be the right choice. &lt;/span&gt;&lt;span title=&quot;Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat.&quot;&gt;In addition to the access challenging, viscosity customs Makalehi residents are still very strong. &lt;/span&gt;&lt;span title=&quot;Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak.&quot;&gt;Before you trekking the hill to photograph the Lake of Love, you are going to be delivered by the citizens Makalehi towards a cave containing the skulls. &lt;/span&gt;&lt;span title=&quot;Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat.\r\n\r\n&quot;&gt;It is said that the skulls can spend one cigarette very quickly.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Wah, siapa sangka?&quot;&gt;Wow, who would have thought? &lt;/span&gt;&lt;span title=&quot;Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.\r\n\r\n\r\n&quot;&gt;Apparently on the northern tip of Indonesia&#039;s border stored cultural diversity and natural charm Heart Lake unparalleled.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Qobul Pamuji&quot;&gt;Taken from Hipwee By Qobul Pamuji&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(5, 3, 1, 'Bangun Lebih Pagi agar Bisa Merealisasikan Startup Impianmu', '&lt;p&gt;Apa rutinitas pagi kamu sehari-hari? Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.&lt;br /&gt;&lt;br /&gt;Siklus ini terus berlanjut dan berulang setiap hari. Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari. Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.&lt;br /&gt;&lt;br /&gt;Hidup kita tidak akan mengalami perubahan. Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja. Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Memulainya dengan bangun lebih pagi&lt;br /&gt;&lt;br /&gt;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor. Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.&lt;br /&gt;&lt;br /&gt;Bahkan saya sering lebih memilih untuk melanjutkan tidur. Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.&lt;br /&gt;&lt;br /&gt;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah. Namun saat kita mencoba, kenyataannya sangat sulit. Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.&lt;br /&gt;&lt;br /&gt;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama. Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi. Apakah mereka manusia normal seperti saya?&lt;br /&gt;&lt;br /&gt;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit. Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi. Atau menekan tombol snooze ketika kita harus mengejar kereta. Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pilihlah alarm yang canggih&lt;br /&gt;&lt;br /&gt;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik. Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan. Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.&lt;br /&gt;&lt;br /&gt;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya. Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.&lt;br /&gt;&lt;br /&gt;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga. Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.&lt;br /&gt;&lt;br /&gt;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly. Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lakukan LDR (hubungan jarak jauh) dengan alarm&lt;br /&gt;&lt;br /&gt;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan. Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan. Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:&lt;br /&gt;&lt;br /&gt;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin. Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples. Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Paksa diri kamu untuk minum secangkir kopi&lt;br /&gt;&lt;br /&gt;Setelah berhasil bangun pagi, muncul masalah baru. Bagaimana caranya agar kita tetap terjaga? Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur. Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.&lt;br /&gt;&lt;br /&gt;Apa yang terjadi setelah itu? Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali. Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.&lt;br /&gt;&lt;br /&gt;Minumlah kopi sesuai dengan selera dan kebiasaanmu. Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya. Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.&lt;br /&gt;&lt;br /&gt;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu. Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.&lt;br /&gt;&lt;br /&gt;Jika alarm kamu berdering, minumlah kopi. Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.&lt;br /&gt;&lt;br /&gt;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur. Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.&lt;br /&gt;&lt;br /&gt;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya. Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.&lt;br /&gt;&lt;br /&gt;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan? Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi. Manfaatkanlah itu untuk menyiapkan startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Alihkan dirimu untuk bangun&lt;br /&gt;&lt;br /&gt;Masih belum terbangun? Sedikit pengalihan mungkin akan berguna. Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.&lt;br /&gt;&lt;br /&gt;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG. Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.&lt;br /&gt;&lt;br /&gt;Jadi, mari kita lihat sisi positifnya. Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.&lt;br /&gt;&lt;br /&gt;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap. Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil&lt;br /&gt;&lt;br /&gt;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya. Mood kamu di pagi hari mungkin tidak sebagus biasanya. Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.&lt;br /&gt;&lt;br /&gt;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya. Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.&lt;br /&gt;&lt;br /&gt;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar. Kamu tidak mungkin membangun startup dalam satu hari. Kamu hanya harus memulainya terlebih dahulu. Setelah memulainya, akan lebih mudah untuk melanjutkannya.&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor. Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program. Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.&lt;br /&gt;&lt;br /&gt;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus. Ingat, tidak semua pekerjaan harus sempurna. Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Gunakan metode Lean Startup&lt;br /&gt;&lt;br /&gt;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan. Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas. Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.&lt;br /&gt;&lt;br /&gt;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch. Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries. Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.&lt;br /&gt;&lt;br /&gt;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan. Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup? Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?&lt;br /&gt;&lt;br /&gt;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan? Jangan sampai kamu keliru mengambil langkah.&lt;br /&gt;&lt;br /&gt;Jangan terlampau puas dengan apa yang sudah kamu kerjakan. Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil. Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog). Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.&lt;br /&gt;&lt;br /&gt;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform. Hasilnya? Mereka juga tidak tahu apa-apa tentang itu.&lt;br /&gt;&lt;br /&gt;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Publikasikan karya kamu&lt;br /&gt;&lt;br /&gt;Kita semua pasti memiliki sebuah ketakutan. Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan. Kenyataannya? Tidak ada yang peduli dengan itu.&lt;br /&gt;&lt;br /&gt;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya. Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.&lt;br /&gt;&lt;br /&gt;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu. Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan. Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.&lt;br /&gt;&lt;br /&gt;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya. Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.&lt;br /&gt;&lt;br /&gt;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter. Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi. Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi. Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Percayalah pada dirimu sendiri. Karya kamu luar biasa.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terobsesi dengan produktivitas&lt;br /&gt;&lt;br /&gt;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin. Saya memulai setiap pagi dengan menulis jurnal. Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini. Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.&lt;br /&gt;&lt;br /&gt;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai. Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna? Apakah saya harus beralih dari platform komentar WordPress ke Disqus?&lt;br /&gt;&lt;br /&gt;Apakah iklan Adsense masih baik digunakan dalam era Adblock? Kapan waktu terbaik untuk memublikasikan blog? Apa saja pekerjaan yang dapat saya otomatisasi? Apakah saya sudah gila dengan memulai bisnis sendiri?&lt;br /&gt;&lt;br /&gt;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob. Membangun blog yang bagus membutuhkan cukup banyak waktu. Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google. Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.&lt;br /&gt;&lt;br /&gt;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown. TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait. Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Persiapan untuk bekerja tanpa henti&lt;br /&gt;&lt;br /&gt;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu. Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari. Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.&lt;br /&gt;&lt;br /&gt;Mengerjakan startup butuh waktu, dan kamu butuh makan. Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko. Contohnya, membangun startup atau bermain bungee jumping. Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.&lt;br /&gt;&lt;br /&gt;Nikmati semua waktu kamu di dunia ini. Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Jadi, kapan kamu akan bangun?&lt;br /&gt;&lt;br /&gt;Rutinitas pagi di dunia startup akan berbeda. Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan. Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.&lt;br /&gt;&lt;br /&gt;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda. Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah. Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai. Bangunlah lebih pagi, dan mulailah membangun startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Min H. Park&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(6, 3, 2, 'More Morning Waking Order Startup Can Realize Your Dreams', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Apa rutinitas pagi kamu sehari-hari?&quot;&gt;What is your morning routine everyday? &lt;/span&gt;&lt;span title=&quot;Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.\r\n\r\n&quot;&gt;I myself used to get up at 7:00 am, showered, dressed, enjoying a cup of coffee, then go to the bus stop along with the other office employees.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Siklus ini terus berlanjut dan berulang setiap hari.&quot;&gt;This cycle continues and repeated every day. &lt;/span&gt;&lt;span title=&quot;Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari.&quot;&gt;Although want to get out of the routine, it is difficult to build a startup after a tired working eight hours a day. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.\r\n\r\n&quot;&gt;However, if we do not take the time to begin with, we will be trapped in the circle of the corporate world are endless.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hidup kita tidak akan mengalami perubahan.&quot;&gt;Our lives will not be amended. &lt;/span&gt;&lt;span title=&quot;Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja.&quot;&gt;Went to the office before 9:00 am, dealing with a manager who is always suppress, and patiently responded to comments and teasing from peers. &lt;/span&gt;&lt;span title=&quot;Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.\r\n\r\n\r\n&quot;&gt;For me, it does not sound like a pleasant life.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulainya dengan bangun lebih pagi\r\n\r\n&quot;&gt;Start by getting up early&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor.&quot;&gt;I then decided to get up early, at 5:00 am, and began to &quot;build&quot; my startup before getting ready for work. &lt;/span&gt;&lt;span title=&quot;Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.\r\n\r\n&quot;&gt;Initially I thought this is trivial and can run smoothly, until I realized that it was not easy to get up in the morning.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bahkan saya sering lebih memilih untuk melanjutkan tidur.&quot;&gt;In fact I often prefer to continue sleeping. &lt;/span&gt;&lt;span title=&quot;Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.\r\n\r\n&quot;&gt;Although in some occasions I managed to get up in the morning, I just spent time with the filmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah.&quot;&gt;Many blogs are made as though improving productivity is an easy thing. &lt;/span&gt;&lt;span title=&quot;Namun saat kita mencoba, kenyataannya sangat sulit.&quot;&gt;But when we try, the reality is very difficult. &lt;/span&gt;&lt;span title=&quot;Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.\r\n\r\n&quot;&gt;You will find a lot of this kind of writing, for example 8 Things Every Person Should Do Before 8 AM, 7 Things People Do Differently Morning, and Rev Insanely Productive People Get Up Early.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama.&quot;&gt;Sometimes, writing it makes me feel guilty enjoying a long sleep time. &lt;/span&gt;&lt;span title=&quot;Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi.&quot;&gt;The great man in the article already contribute substantially to the world even before 8 o&#039;clock. &lt;/span&gt;&lt;span title=&quot;Apakah mereka manusia normal seperti saya?\r\n\r\n&quot;&gt;Are they normal people like me?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit.&quot;&gt;In fact, getting up at 5:00 am it was very difficult. &lt;/span&gt;&lt;span title=&quot;Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi.&quot;&gt;We can turn off the alarm without knowing it, when we had an early morning meeting schedule. &lt;/span&gt;&lt;span title=&quot;Atau menekan tombol snooze ketika kita harus mengejar kereta.&quot;&gt;Or hit the snooze button when we had to catch a train. &lt;/span&gt;&lt;span title=&quot;Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.\r\n\r\n\r\n&quot;&gt;Seeing this incident, things we can do is to change the way we wake up.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pilihlah alarm yang canggih\r\n\r\n&quot;&gt;Choose a sophisticated alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik.&quot;&gt;I&#039;m not the kind of person who likes to be woken up suddenly by the noise. &lt;/span&gt;&lt;span title=&quot;Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan.&quot;&gt;I wake up in the morning with a feeling of surprised it&#039;s not fun. &lt;/span&gt;&lt;span title=&quot;Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.\r\n\r\n&quot;&gt;I think it would be better if we are looking for an alarm that woke us gradually, so that your mind will first prepare the body to actually wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya.&quot;&gt;You can try the coffee machine alarm automatically dispensing coffee and wake you from a deep sleep aroma. &lt;/span&gt;&lt;span title=&quot;Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.\r\n\r\n&quot;&gt;In addition, there is also alarm Philips Wake-Up Light will illuminate the face, giving the impression that it is the sun rises.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga.&quot;&gt;Alarm annular can also make you wake up in the morning through vibration, so that your partner do not have to come awakened too. &lt;/span&gt;&lt;span title=&quot;Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.\r\n\r\n&quot;&gt;Keep a pet like a dog or cat can also be an option to wake up at 5:00 am, given they like to lick and trample on our face to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly.&quot;&gt;In addition to using a conventional alarm, I also use Warmly. &lt;/span&gt;&lt;span title=&quot;Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.\r\n\r\n&quot;&gt;This app will give voice melodious birdsong in advance for five minutes, before finally woke me with the sound of the strings of the cello of Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!\r\n\r\n\r\n&quot;&gt;Try to beat the taste malasmu in the morning with a sophisticated alarm!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lakukan LDR (hubungan jarak jauh) dengan alarm\r\n\r\n&quot;&gt;Make LDR (long distance relationship) with alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan.&quot;&gt;Changing habits takes time and the process of course, can not be instant. &lt;/span&gt;&lt;span title=&quot;Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan.&quot;&gt;Build positive habits such as reading, exercising, and socializing, as well as changing bad habits such as drinking alcohol, smoking, and eating fast food definitely need to fight. &lt;/span&gt;&lt;span title=&quot;Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:\r\n\r\n&quot;&gt;I would like to quote from the blog posts Evernote before continuing:&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin.&quot;&gt;If you want to break the habit of turning off the alarm, so make it as difficult as possible. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples.&quot;&gt;You can put up multiple alarms at once, downloading apps with puzzle alarm, or insert your smartphone into a jar. &lt;/span&gt;&lt;span title=&quot;Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.\r\n\r\n\r\n&quot;&gt;If you want to get up in the morning, place your alarm in places difficult to reach.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Paksa diri kamu untuk minum secangkir kopi\r\n\r\n&quot;&gt;You force yourself to drink a cup of coffee&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Setelah berhasil bangun pagi, muncul masalah baru.&quot;&gt;After successfully waking up, new problems arise. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar kita tetap terjaga?&quot;&gt;How can we stay awake? &lt;/span&gt;&lt;span title=&quot;Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur.&quot;&gt;It was hard to get up at 5:00 am and resist the temptation to go back to sleep. &lt;/span&gt;&lt;span title=&quot;Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.\r\n\r\n&quot;&gt;And anyway, you might think to get up early &quot;tomorrow,&quot; do not have to begin from today.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apa yang terjadi setelah itu?&quot;&gt;What happened after that? &lt;/span&gt;&lt;span title=&quot;Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali.&quot;&gt;We will regret in the morning to follow the temptation to fall back asleep. &lt;/span&gt;&lt;span title=&quot;Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.\r\n\r\n&quot;&gt;So, before it all happens, drink a cup of coffee to keep you awake.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Minumlah kopi sesuai dengan selera dan kebiasaanmu.&quot;&gt;Drink coffee according to your tastes and habits. &lt;/span&gt;&lt;span title=&quot;Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya.&quot;&gt;If you are not used to drink coffee, do not have to force yourself to drink it. &lt;/span&gt;&lt;span title=&quot;Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.\r\n\r\n&quot;&gt;Do what you normally do after waking up, because the temptation to go back to sleep will still appear with or without a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu.&quot;&gt;Find a way to integrate the coffee directly into your morning routine. &lt;/span&gt;&lt;span title=&quot;Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.\r\n\r\n&quot;&gt;The goal is to create an alarm you become a trigger for a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika alarm kamu berdering, minumlah kopi.&quot;&gt;If your alarm rings, drink coffee. &lt;/span&gt;&lt;span title=&quot;Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.\r\n\r\n&quot;&gt;Try a few different ways that makes you automatically think for a coffee after waking.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur.&quot;&gt;Initially I tried to get up in the morning and dispensing coffee in the kitchen, I did not even make it to the kitchen. &lt;/span&gt;&lt;span title=&quot;Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.\r\n\r\n&quot;&gt;After that, I tried to prepare a cup of iced coffee at night before I sleep and put it on the table, I still did not manage to get to the table.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya.&quot;&gt;In the end, I put the coffee cup on top of my smartphone. &lt;/span&gt;&lt;span title=&quot;Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.\r\n\r\n&quot;&gt;So, to turn off the alarm, I had to lift the cup first.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan?&quot;&gt;When a coffee cup in hand, why not drink it, do not you? &lt;/span&gt;&lt;span title=&quot;Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi.&quot;&gt;Congratulations, now you&#039;ve managed to get up at 5:00 am. &lt;/span&gt;&lt;span title=&quot;Manfaatkanlah itu untuk menyiapkan startup kamu!\r\n\r\n\r\n&quot;&gt;Make use of it to set up your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alihkan dirimu untuk bangun\r\n\r\n&quot;&gt;Divert yourself to wake up&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Masih belum terbangun?&quot;&gt;Still not awake? &lt;/span&gt;&lt;span title=&quot;Sedikit pengalihan mungkin akan berguna.&quot;&gt;A little diversion might be useful. &lt;/span&gt;&lt;span title=&quot;Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.\r\n\r\n&quot;&gt;As a person who loves surfing the internet, I am probably not the best person to give advice improve productivity.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG.&quot;&gt;I spent a lot of time looking at pictures of cute cats on Reddit, Imgur, and 9GAG. &lt;/span&gt;&lt;span title=&quot;Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.\r\n\r\n&quot;&gt;Until finally I have seen all the contents and hope there is new content appears.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, mari kita lihat sisi positifnya.&quot;&gt;So, let&#039;s look at the positive side. &lt;/span&gt;&lt;span title=&quot;Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.\r\n\r\n&quot;&gt;If you see a cute cat pictures on the internet at night can cause us to experience insomnia, then check smartphone or computer in the morning can help us to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap.&quot;&gt;If you can not directly work on the preparation of startup you after you wake up, you can probably wait a few minutes past until you are really ready. &lt;/span&gt;&lt;span title=&quot;Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.\r\n\r\n\r\n&quot;&gt;Remember, there are two challenges that you must face, got up early and startup preparation installments.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil\r\n\r\n&quot;&gt;Your startup broke into small sections&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya.&quot;&gt;When just woken up in the morning, I do not want to directly confront the various problems in the preparation stage of my startup. &lt;/span&gt;&lt;span title=&quot;Mood kamu di pagi hari mungkin tidak sebagus biasanya.&quot;&gt;Your mood in the morning may not be as good as usual. &lt;/span&gt;&lt;span title=&quot;Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.\r\n\r\n&quot;&gt;So, do unpleasant things will only provoke you to get back to sleep.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya.&quot;&gt;Now I think almost everyone has failed to meet his new year&#039;s resolution. &lt;/span&gt;&lt;span title=&quot;Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.\r\n\r\n&quot;&gt;One reason may be because we choose something that is too big and hard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar.&quot;&gt;The Art of Manliness makes us realize that the habit of doing something small will lead to something bigger. &lt;/span&gt;&lt;span title=&quot;Kamu tidak mungkin membangun startup dalam satu hari.&quot;&gt;You can not build a startup in one day. &lt;/span&gt;&lt;span title=&quot;Kamu hanya harus memulainya terlebih dahulu.&quot;&gt;You just have to start it first. &lt;/span&gt;&lt;span title=&quot;Setelah memulainya, akan lebih mudah untuk melanjutkannya.\r\n\r\n&quot;&gt;Once started, it will be easier to continue.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor.&quot;&gt;Your startup broke into several small pieces that can be done the morning before going to the office. &lt;/span&gt;&lt;span title=&quot;Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program.&quot;&gt;For example, if you are a startup product application, every morning you can start writing a line of program code. &lt;/span&gt;&lt;span title=&quot;Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.\r\n\r\n&quot;&gt;Write a paragraph-if it is a blog, or create a product design.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus.&quot;&gt;It is better to do little by little gradually than spend a lot of time to do many things at once. &lt;/span&gt;&lt;span title=&quot;Ingat, tidak semua pekerjaan harus sempurna.&quot;&gt;Remember, not all jobs have to be perfect. &lt;/span&gt;&lt;span title=&quot;Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.\r\n\r\n\r\n&quot;&gt;Do disciplined and makeit into a new good habit.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gunakan metode Lean Startup\r\n\r\n&quot;&gt;Use Lean Startup method&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan.&quot;&gt;Believe it or not, at first no one actually knows what they finally did. &lt;/span&gt;&lt;span title=&quot;Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas.&quot;&gt;The unicorn startup even though it takes time to find a clear basis. &lt;/span&gt;&lt;span title=&quot;Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.\r\n\r\n&quot;&gt;Airbnb able to survive thanks to the sale of cereals political theme, that Obama O&#039;s and Cap&#039;n McCain&#039;s.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch.&quot;&gt;Slack founder, Stewart Butterfield, also initially failed to create a game called Glitch. &lt;/span&gt;&lt;span title=&quot;Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.\r\n\r\n&quot;&gt;In fact, YouTube was originally a video dating site Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries.&quot;&gt;Start working on your startup with a phased, detailed and focused according to the book The Lean Startup methodology popularized by Eric Ries. &lt;/span&gt;&lt;span title=&quot;Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.\r\n\r\n&quot;&gt;Thus, you will be easier to implement ideas and get quick feedback from users.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan.&quot;&gt;You already know that 75 percent of the startup in the world have failed. &lt;/span&gt;&lt;span title=&quot;Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup?&quot;&gt;So if you are willing to spend a hundred days working on the product you are covered? &lt;/span&gt;&lt;span title=&quot;Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?\r\n\r\n&quot;&gt;What if after you finished products, people do not like it?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan?&quot;&gt;Would not it be nice if you interact with others during the process, so that you know exactly what they need and want? &lt;/span&gt;&lt;span title=&quot;Jangan sampai kamu keliru mengambil langkah.\r\n\r\n&quot;&gt;Do not you dare take a step wrong.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jangan terlampau puas dengan apa yang sudah kamu kerjakan.&quot;&gt;Do not be too happy with what you&#039;ve done. &lt;/span&gt;&lt;span title=&quot;Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil.&quot;&gt;You should continue to test your products through a variety of small experiments. &lt;/span&gt;&lt;span title=&quot;Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog).&quot;&gt;When I first started Krown.io, I call it a Blogging Platform Annotation (annotation platform blog). &lt;/span&gt;&lt;span title=&quot;Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.\r\n\r\n&quot;&gt;Then I realized that most people still do not know what annotations.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform.&quot;&gt;We&#039;ve tried a variety of things such as Smart Blogging, Highlight Blogging, Blogs Feedback, and Contextual Blogging Platform. &lt;/span&gt;&lt;span title=&quot;Hasilnya?&quot;&gt;The result? &lt;/span&gt;&lt;span title=&quot;Mereka juga tidak tahu apa-apa tentang itu.\r\n\r\n&quot;&gt;They also do not know anything about it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.\r\n\r\n\r\n&quot;&gt;So we decided to add the explanation easier to understand, which is &quot;a highlight text and add comments directly on the highlighted text.&quot; You should always perform validation on hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Publikasikan karya kamu\r\n\r\n&quot;&gt;Publish your artwork&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kita semua pasti memiliki sebuah ketakutan.&quot;&gt;We all have a fear. &lt;/span&gt;&lt;span title=&quot;Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan.&quot;&gt;Perhaps you feel scared if the work you will be scorned and overthrown by the people after they are published. &lt;/span&gt;&lt;span title=&quot;Kenyataannya?&quot;&gt;The reality? &lt;/span&gt;&lt;span title=&quot;Tidak ada yang peduli dengan itu.\r\n\r\n&quot;&gt;No one bothered with it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya.&quot;&gt;In this world there are more than two million works published each day. &lt;/span&gt;&lt;span title=&quot;Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.\r\n\r\n&quot;&gt;The biggest challenge that you have to think about now is not the fear that is not proven that, but how do you work this can be published and the scrutiny of the public eye.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu.&quot;&gt;If the current course you are still difficult to get up early and work on your startup, you should not be too confusing content beforehand. &lt;/span&gt;&lt;span title=&quot;Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan.&quot;&gt;Begin everything gradually, not to worry excessively raised. &lt;/span&gt;&lt;span title=&quot;Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.\r\n\r\n&quot;&gt;It&#039;s just like learning to worry too much, as if the impact you will become a professor at Harvard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya.&quot;&gt;If you still have trouble to build your startup, the first solution you need to do is to wake up early and start working on it. &lt;/span&gt;&lt;span title=&quot;Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.\r\n\r\n&quot;&gt;It has been proven scientifically and not just based on my experience alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter.&quot;&gt;You can begin to publish your progress using a simple thing like Twitter. &lt;/span&gt;&lt;span title=&quot;Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi.&quot;&gt;Thomas Frank of College Info Geek using Twitter and Buffer to force him to get up early. &lt;/span&gt;&lt;span title=&quot;Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi.&quot;&gt;He scheduled a tweet that he would donate US $ 25 (about Rp327.000) every morning. &lt;/span&gt;&lt;span title=&quot;Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;\r\n\r\n&quot;&gt;So, he had to get up early before the tweet was &quot;on the air.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percayalah pada dirimu sendiri.&quot;&gt;Believe in yourself. &lt;/span&gt;&lt;span title=&quot;Karya kamu luar biasa.\r\n\r\n\r\n&quot;&gt;Your work is incredible.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terobsesi dengan produktivitas\r\n\r\n&quot;&gt;Obsessed with productivity&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin.&quot;&gt;Try to do as many things with minimum effort. &lt;/span&gt;&lt;span title=&quot;Saya memulai setiap pagi dengan menulis jurnal.&quot;&gt;I begin each morning with a journal. &lt;/span&gt;&lt;span title=&quot;Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini.&quot;&gt;If I write only for personal interest, I probably would not have this diligently. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.\r\n\r\n&quot;&gt;Keeping a journal has helped the development of my startup in three things at once.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai.&quot;&gt;First, write a journal in the morning helps me to see the progress that has been achieved. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna?&quot;&gt;How do I interact more with the users? &lt;/span&gt;&lt;span title=&quot;Apakah saya harus beralih dari platform komentar WordPress ke Disqus?\r\n\r\n&quot;&gt;Do I have to switch on the platform WordPress comments to Disqus?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apakah iklan Adsense masih baik digunakan dalam era Adblock?&quot;&gt;Is Adsense ads still well used in Adblock era? &lt;/span&gt;&lt;span title=&quot;Kapan waktu terbaik untuk memublikasikan blog?&quot;&gt;When is the best time to publish a blog? &lt;/span&gt;&lt;span title=&quot;Apa saja pekerjaan yang dapat saya otomatisasi?&quot;&gt;Any job that can be my automation? &lt;/span&gt;&lt;span title=&quot;Apakah saya sudah gila dengan memulai bisnis sendiri?\r\n\r\n&quot;&gt;Am I crazy to start your own business?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob.&quot;&gt;Second, write in a journal can help build content for my blog, TechMob. &lt;/span&gt;&lt;span title=&quot;Membangun blog yang bagus membutuhkan cukup banyak waktu.&quot;&gt;Building a good blog takes some time. &lt;/span&gt;&lt;span title=&quot;Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google.&quot;&gt;You need about a thousand articles to start getting traction from Google organic. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.\r\n\r\n&quot;&gt;Writing a journal every day helped us to build the foundation required content.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown.&quot;&gt;Finally, write a journal for public help me promote my blog annotation platform, Krown. &lt;/span&gt;&lt;span title=&quot;TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait.&quot;&gt;TechMob built from Krown and use the system to add a comment per sentence related information. &lt;/span&gt;&lt;span title=&quot;Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.\r\n\r\n\r\n&quot;&gt;Each article in TechMob will promote Krown through sub domains techmob.krown.io and call to action at the bottom of the article.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Persiapan untuk bekerja tanpa henti\r\n\r\n&quot;&gt;Preparation for work ceaselessly&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu.&quot;&gt;When the time is shown at 7:00 am, get ready to go to the office even though they want to work on your startup. &lt;/span&gt;&lt;span title=&quot;Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari.&quot;&gt;You have to keep working to meet your needs everyday. &lt;/span&gt;&lt;span title=&quot;Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.\r\n\r\n&quot;&gt;Working on a small fraction of the startup in the morning can be a preparation before you have to work from 9:00 until 5:00.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengerjakan startup butuh waktu, dan kamu butuh makan.&quot;&gt;Working startup takes time, and you need to eat. &lt;/span&gt;&lt;span title=&quot;Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko.&quot;&gt;Based on the barbell strategy (of the Anti-Fragile book by Nassim Taleb), you should allocate 20 percent of its resources for risky activity. &lt;/span&gt;&lt;span title=&quot;Contohnya, membangun startup atau bermain bungee jumping.&quot;&gt;For example, building a startup or play bungee jumping. &lt;/span&gt;&lt;span title=&quot;Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.\r\n\r\n&quot;&gt;Then invest 80 per cent of the remaining resources for things that are not at risk such as school, work, or dinner with the family.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nikmati semua waktu kamu di dunia ini.&quot;&gt;Enjoy all your time in this world. &lt;/span&gt;&lt;span title=&quot;Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.\r\n\r\n\r\n&quot;&gt;Build your startup as a side project, perform validation, and then began to plunge serious when you&#039;re ready.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, kapan kamu akan bangun?\r\n\r\n&quot;&gt;So, when are you going to wake up?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rutinitas pagi di dunia startup akan berbeda.&quot;&gt;A morning routine in the startup world will be different. &lt;/span&gt;&lt;span title=&quot;Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan.&quot;&gt;You should try to find a routine that can bring you closer to the goal. &lt;/span&gt;&lt;span title=&quot;Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.\r\n\r\n&quot;&gt;If you had to spend eight hours doing something you do not like, you at least have to invest one hour doing things that you like.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda.&quot;&gt;You can not do the same thing continuously and expecting different results. &lt;/span&gt;&lt;span title=&quot;Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah.&quot;&gt;Do not let the current situation is leading you down the wrong path. &lt;/span&gt;&lt;span title=&quot;Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai.&quot;&gt;Face the reality, live your life according to what you believe. &lt;/span&gt;&lt;span title=&quot;Bangunlah lebih pagi, dan mulailah membangun startup kamu!\r\n\r\n\r\n\r\n&quot;&gt;Get up early, and start building your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Min H. Park&quot;&gt;Taken from TechInAsia By Min H. Park&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(7, 4, 1, '5 Alasan Kenapa Kamu Harus Membangun Usaha Kecil, Bukan Startup', '&lt;p&gt;Saya mengerti, kita semua ingin melakukan sesuatu yang penting. Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar. Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.&lt;br /&gt;&lt;br /&gt;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Mampukah gagasan tersebut berkembang?&lt;br /&gt;&lt;br /&gt;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.&lt;br /&gt;&lt;br /&gt;Terkadang, kita bahkan menertawakannya. Saat kita melakukan hal tersebut, kita jadi orang yang brengsek. Benar-benar brengsek. Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama. Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.&lt;br /&gt;&lt;br /&gt;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak. Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn. Memang, apa bedanya?&lt;br /&gt;&lt;br /&gt;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.&lt;br /&gt;&lt;br /&gt;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.&lt;br /&gt;&lt;br /&gt;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau. Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa fokus pada kesederhanaan produk&lt;br /&gt;&lt;br /&gt;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas. Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.&lt;br /&gt;&lt;br /&gt;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang. Bisnis skala kecil tak punya kendala semacam itu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pegawai kamu lebih penting&lt;br /&gt;&lt;br /&gt;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu. Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan. Dalam bisnis skala kecil, para pegawai adalah yang utama.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lebih mudah dalam mengatur bisnis&lt;br /&gt;&lt;br /&gt;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk. Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar. Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil. Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kecil bukan berarti miskin&lt;br /&gt;&lt;br /&gt;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan. Bukan berarti juga kamu akan mati dalam keadaan miskin.&lt;br /&gt;&lt;br /&gt;Pendapatan kamu memang kecil, tentu saja. Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.&lt;br /&gt;&lt;br /&gt;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan. Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa mengembangkan bisnis kapan pun kamu siap&lt;br /&gt;&lt;br /&gt;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan. Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.&lt;br /&gt;&lt;br /&gt;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.&lt;br /&gt;&lt;br /&gt;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya. Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.&lt;br /&gt;&lt;br /&gt;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.&lt;br /&gt;&lt;br /&gt;Jika kamu melakukannya, kamu tak akan menjadi miliuner. Namun kamu bisa menjadi jutawan yang bahagia. Dan bagi saya, itu adalah pilihan yang sangat bagus.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Jon Westenberg&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(8, 4, 2, '5 Reasons Why You Should Build Your Small Business, Not Startup', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saya mengerti, kita semua ingin melakukan sesuatu yang penting.&quot;&gt;I understand, we all want to do something important. &lt;/span&gt;&lt;span title=&quot;Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar.&quot;&gt;We all want to create special products, establishing the company is worth, and do things that can change the world and have a huge impact. &lt;/span&gt;&lt;span title=&quot;Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.\r\n\r\n&quot;&gt;Things like this often I found in the community of entrepreneurs and technology.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:\r\n\r\n\r\n&quot;&gt;The questions we ask, when we hear an idea or a new idea-be it renewable energy to instant messaging applications, are the following:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mampukah gagasan tersebut berkembang?\r\n\r\n&quot;&gt;Can the idea evolve?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.\r\n\r\n&quot;&gt;When we feel we are considering the idea can not be developed to use one million users, and is not designed to achieve revenues of tens of trillions of rupiah, we forget about the idea.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang, kita bahkan menertawakannya.&quot;&gt;Sometimes, we even laugh about it. &lt;/span&gt;&lt;span title=&quot;Saat kita melakukan hal tersebut, kita jadi orang yang brengsek.&quot;&gt;When we do that, we become a jerk. &lt;/span&gt;&lt;span title=&quot;Benar-benar brengsek.&quot;&gt;Really a jerk. &lt;/span&gt;&lt;span title=&quot;Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama.&quot;&gt;Because establishing technology companies are large, grand and worth is not the main thing. &lt;/span&gt;&lt;span title=&quot;Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.\r\n\r\n&quot;&gt;And chose not to do so does not make us a fool.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak.&quot;&gt;To be honest, if you choose the opposite way, you&#039;re likely to be happier, rarely sick, richer, and far more wisely. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn.&quot;&gt;You can choose to set up a small online businesses rather than planning to build a startup unicorn. &lt;/span&gt;&lt;span title=&quot;Memang, apa bedanya?\r\n\r\n&quot;&gt;Indeed, what&#039;s the difference?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.\r\n\r\n&quot;&gt;Startup unicorn requires rapid growth and large, also requires an investment and should dominate.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.\r\n\r\n&quot;&gt;Small-scale online businesses only require growth in a clear boundaries, profit, and serve customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau.&quot;&gt;Plans to not target the extensive growth may be somewhat contrary to what you want. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.\r\n\r\n\r\n&quot;&gt;However, I am sure there are quite a lot of benefits that you can reap just by setting up small businesses.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa fokus pada kesederhanaan produk\r\n\r\n&quot;&gt;You can focus on the simplicity of the product&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas.&quot;&gt;Literally, you build something small, with restrictions and a clear benchmark. &lt;/span&gt;&lt;span title=&quot;Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.\r\n\r\n&quot;&gt;There is no greater pressure to add certain features of your product, which means you have the freedom to focus on the most essential part of the product for you and your customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang.&quot;&gt;Creating products that prioritizes simplicity is a big challenge for many companies large and growing. &lt;/span&gt;&lt;span title=&quot;Bisnis skala kecil tak punya kendala semacam itu.\r\n\r\n\r\n&quot;&gt;Small businesses have no such constraints.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pegawai kamu lebih penting\r\n\r\n&quot;&gt;Your employee is more important&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu.&quot;&gt;When you choose a small-scale business, you can spend time with employees, which means in your business. &lt;/span&gt;&lt;span title=&quot;Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan.&quot;&gt;Either the number of servants only one or five, people will be your main priority than if you hire many employees to pursue growth. &lt;/span&gt;&lt;span title=&quot;Dalam bisnis skala kecil, para pegawai adalah yang utama.\r\n\r\n\r\n&quot;&gt;In a small business, the employees are the main ones.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih mudah dalam mengatur bisnis\r\n\r\n&quot;&gt;It is easier to set up a business&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk.&quot;&gt;I love when she saw a personal touch to every business and products. &lt;/span&gt;&lt;span title=&quot;Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar.&quot;&gt;It was impossible happens when you ambition to set up a very large company. &lt;/span&gt;&lt;span title=&quot;Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil.&quot;&gt;But it was so very likely when you start by setting up something small. &lt;/span&gt;&lt;span title=&quot;Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.\r\n\r\n\r\n&quot;&gt;You can use your time to ensure that customers and consumers get attention every time.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kecil bukan berarti miskin\r\n\r\n&quot;&gt;Small does not mean poor&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan.&quot;&gt;Although your company is small and the products you use only a handful of people, it does not mean the company will not benefit you. &lt;/span&gt;&lt;span title=&quot;Bukan berarti juga kamu akan mati dalam keadaan miskin.\r\n\r\n&quot;&gt;Not that too you will die in a poor state.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendapatan kamu memang kecil, tentu saja.&quot;&gt;Your income is small, of course. &lt;/span&gt;&lt;span title=&quot;Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.\r\n\r\n&quot;&gt;But your chances to build companies worth billions of rupiah is much greater than the chance to set up a company worth trillions of rupiah.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan.&quot;&gt;By doing so, the operational cost you so much less, spending the company can be suppressed. &lt;/span&gt;&lt;span title=&quot;Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.\r\n\r\n\r\n&quot;&gt;You and your team a chance to enjoy all the benefits.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa mengembangkan bisnis kapan pun kamu siap\r\n\r\n&quot;&gt;You can grow your business whenever you&#039;re ready&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan.&quot;&gt;If you want your company develops, you have a better chance to do it with a smaller company but successful and able to generate a profit. &lt;/span&gt;&lt;span title=&quot;Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.\r\n\r\n&quot;&gt;When the product and the flow of funds you are already a more mature company, you not only become attractive in the eyes of investors, but also able to fund the company withyour own money.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.\r\n\r\n&quot;&gt;Not to mention the knowledge and learning you for running a small company can be a good capital when you want to develop your business.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya.&quot;&gt;Some people call bootstrapping, but I think the word was not yet fully represented. &lt;/span&gt;&lt;span title=&quot;Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.\r\n\r\n&quot;&gt;For me, the only meaningful bootstrapping your company funded independently.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.\r\n\r\n&quot;&gt;Starting a small business means to fund a company, determine the limits and standards, understand the product or service you are and what you want to achieve with the product or service and plan to reach the target.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu melakukannya, kamu tak akan menjadi miliuner.&quot;&gt;If you do, you will not become a millionaire. &lt;/span&gt;&lt;span title=&quot;Namun kamu bisa menjadi jutawan yang bahagia.&quot;&gt;However, you can become a millionaire happy. &lt;/span&gt;&lt;span title=&quot;Dan bagi saya, itu adalah pilihan yang sangat bagus.\r\n\r\n\r\n&quot;&gt;And for me, it is a very nice option.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Jon Westenberg&quot;&gt;Taken from TechInAsia By Jon Westenberg&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(9, 5, 1, 'Cowok Cuek Justru Tepat Jadi Pendampingmu', '&lt;p&gt;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu. Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu. Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek. Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...&lt;br /&gt;&lt;br /&gt;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu. Tapi. bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya. Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.&lt;br /&gt;&lt;br /&gt;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;. Tapi toh dia selalu ada saat benar-benar dibutuhkan.&lt;br /&gt;&lt;br /&gt;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya. Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja. Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini? Apa dia di sana memikirkan kamu?&lt;br /&gt;&lt;br /&gt;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam. Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu. Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu. Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.&lt;br /&gt;&lt;br /&gt;2. Cowok cuek jarang bertanya kabar. Percaya atau tidak, sikapnya ini justru membebaskan.&lt;br /&gt;&lt;br /&gt;Perihal dia menanyakan kabarmu juga jarang sekali. Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.&lt;br /&gt;&lt;br /&gt;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan. Karena percaya atau tidak, hal seperti ini justru terasa membebaskan. Gimana nggak bebas? Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu. Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa. Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.&lt;br /&gt;&lt;br /&gt;3. Dia punya cara unik untuk mengungkap rasa sayang. Walau jarang memberi bunga, dia gak suka melihatmu berduka.&lt;br /&gt;&lt;br /&gt;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;. Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga. Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.&lt;br /&gt;&lt;br /&gt;4. Kalian pun tak banyak pamer kemesraan. Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.&lt;br /&gt;&lt;br /&gt;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media. Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.&lt;br /&gt;&lt;br /&gt;Bukan, bukan karena dia malu dengan hubungan yang kalian punya. Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama. Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.&lt;br /&gt;&lt;br /&gt;5. Kadang malah kamu dikira tak punya pacar. Eh, itu artinya kamu mandiri! Bersamanya bisa, sendiri pun biasa saja.&lt;br /&gt;&lt;br /&gt;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri. Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu. Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu. Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.&lt;br /&gt;&lt;br /&gt;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.&lt;br /&gt;&lt;br /&gt;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele. Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik? Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.&lt;br /&gt;&lt;br /&gt;7. Ada saat tertentu dimana dia berusaha memanjakan. Nikmati saja; maklum, jarang-jarang!&lt;br /&gt;&lt;br /&gt;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi. Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu. Kamu ingin makan di tempat ini, dia langsung menurutinya. Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu. Pokoknya hari itu, kamu serasa jadi putri sehari.&lt;br /&gt;&lt;br /&gt;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya. Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe&lt;br /&gt;&lt;br /&gt;8. Tak perlu cemas dia tebar pesona sana-sini. Lihat saja sikapnya ke pacar sendiri!&lt;br /&gt;&lt;br /&gt;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem. Kamu nggak perlu cemas dia akan tebar pesona sana sini. Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.&lt;br /&gt;&lt;br /&gt;9. Dia memperjuangkanmu meski kamu tak selalu sadar. Sosoknya lebih suka mendoakanmu dalam diam.&lt;br /&gt;&lt;br /&gt;Kata siapa dia nggak berjuang untuk kamu? Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya. Dia itu sosok sederhana yang menjagamu cukup melalui doa. Karena, baginya doa itu lebih kuat dari apapun. Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.&lt;br /&gt;&lt;br /&gt;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya? Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya. Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mustika Karindra&lt;/p&gt;'),
(10, 5, 2, 'Cuek Guy Precisely Right So Best Man', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu.&quot;&gt;You have always wanted a guy who could devote more attention to yourself. &lt;/span&gt;&lt;span title=&quot;Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu.&quot;&gt;Often you daydream when attendance is able to fulfill your days. &lt;/span&gt;&lt;span title=&quot;Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek.&quot;&gt;However, in reality not all the boys can do it, especially when he referred types indifferent. &lt;/span&gt;&lt;span title=&quot;Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...\r\n\r\n&quot;&gt;When you hear the word ignorant is the one, it could be that comes to your head, Do not tell me he can not treat you with the best ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu.&quot;&gt;Uh, wait, although the nature of cueknya will make you often own sewatu-watu. &lt;/span&gt;&lt;span title=&quot;Tapi.&quot;&gt;But. &lt;/span&gt;&lt;span title=&quot;bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya.&quot;&gt;that does not mean he can not make you feel special and important to his life. &lt;/span&gt;&lt;span title=&quot;Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.\r\n\r\n&quot;&gt;That ye be sure to mention if the cuek is also worth to you later choose as a life companion, 9 this reason you need to know in advance.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;.&quot;&gt;1. Men may ignore often &quot;disappear&quot;. &lt;/span&gt;&lt;span title=&quot;Tapi toh dia selalu ada saat benar-benar dibutuhkan.\r\n\r\n&quot;&gt;But anyway he is always there when really needed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya.&quot;&gt;PhoneSee was almost deserted several days without news. &lt;/span&gt;&lt;span title=&quot;Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja.&quot;&gt;Some like the wind and your message is ignored. &lt;/span&gt;&lt;span title=&quot;Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini?&quot;&gt;It can not be denied you would often wonder to myself, What is she today? &lt;/span&gt;&lt;span title=&quot;Apa dia di sana memikirkan kamu?\r\n\r\n&quot;&gt;Is he in there thinking about you?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam.&quot;&gt;Homesick really, but you also know that he disappeared not because of all sorts. &lt;/span&gt;&lt;span title=&quot;Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu.&quot;&gt;One time, when you really need it, yet he will always be there for you. &lt;/span&gt;&lt;span title=&quot;Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu.&quot;&gt;Quiet, she&#039;s there was also thinking about you, just trust you high makes her not to worry too much about you. &lt;/span&gt;&lt;span title=&quot;Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.\r\n\r\n&quot;&gt;Moreover, he was there too sure if you are just seemed that trust completely against the couple.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Cowok cuek jarang bertanya kabar.&quot;&gt;2. Men rarely ask news indifferent. &lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, sikapnya ini justru membebaskan.\r\n\r\n&quot;&gt;Believe it or not, this attitude actually liberating.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perihal dia menanyakan kabarmu juga jarang sekali.&quot;&gt;Subject him see how you too rarely. &lt;/span&gt;&lt;span title=&quot;Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.\r\n\r\n&quot;&gt;Within a week sometimes only occasionally he asks about your health, news college or work, or other things that you and everyday when she was with you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan.&quot;&gt;Already lah, regarding news from him that rarely comes you should not worry about. &lt;/span&gt;&lt;span title=&quot;Karena percaya atau tidak, hal seperti ini justru terasa membebaskan.&quot;&gt;Because believe it or not, things like this just feels liberating. &lt;/span&gt;&lt;span title=&quot;Gimana nggak bebas?&quot;&gt;How not free? &lt;/span&gt;&lt;span title=&quot;Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu.&quot;&gt;If you do not have to bother replying to the messages each time. &lt;/span&gt;&lt;span title=&quot;Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa.&quot;&gt;Not at any time should also update will go anywhere, with whom, and no matter what. &lt;/span&gt;&lt;span title=&quot;Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.\r\n\r\n&quot;&gt;Remember, keposesifan also not a good thing for a relationship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Dia punya cara unik untuk mengungkap rasa sayang.&quot;&gt;3. He had a unique way to uncover affection. &lt;/span&gt;&lt;span title=&quot;Walau jarang memberi bunga, dia gak suka melihatmu berduka.\r\n\r\n&quot;&gt;Although rarely give flowers, he does not like to see you sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;.&quot;&gt;He seldom really say, &quot;I love you&quot;. &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga.&quot;&gt;Cueknya nature makes him think, if the feeling of love that there are many ways do not always say it directly or give cendramata like flowers. &lt;/span&gt;&lt;span title=&quot;Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.\r\n\r\n&quot;&gt;But one is for sure in his heart, he never like to see a grim and sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kalian pun tak banyak pamer kemesraan.&quot;&gt;4. You were not much show affection. &lt;/span&gt;&lt;span title=&quot;Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.\r\n\r\n&quot;&gt;He knew that love would not last much longer only because it is often exhibited in the virtual world.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media.&quot;&gt;When all of your friends show affection with a partner in every social media. &lt;/span&gt;&lt;span title=&quot;Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.\r\n\r\n&quot;&gt;You and he himself actually rarely do, even arguably moment you show the relationship in the virtual world can still be counted on the fingers alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan, bukan karena dia malu dengan hubungan yang kalian punya.&quot;&gt;No, not because she was embarrassed by the relationship you have. &lt;/span&gt;&lt;span title=&quot;Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama.&quot;&gt;He&#039;s just thinking, if showing off relationships in the virtual world is no guarantee of love that will last longer. &lt;/span&gt;&lt;span title=&quot;Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.\r\n\r\n&quot;&gt;Her love is simple, no snapping here and there, but felt by you and him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kadang malah kamu dikira tak punya pacar.&quot;&gt;5. Sometimes even you do not have a boyfriend calculated. &lt;/span&gt;&lt;span title=&quot;Eh, itu artinya kamu mandiri!&quot;&gt;Eh, it means that you are independent! &lt;/span&gt;&lt;span title=&quot;Bersamanya bisa, sendiri pun biasa saja.\r\n\r\n&quot;&gt;With him can, itself was mediocre.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri.&quot;&gt;An, why you have a boyfriend, but do not have a girlfriend like ya ... You see, you often really go anywhere alone. &lt;/span&gt;&lt;span title=&quot;Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu.&quot;&gt;Uh, think like that weve not only out of the mouth of one or two friends. &lt;/span&gt;&lt;span title=&quot;Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu.&quot;&gt;But, that does not mean something like this would be a burden dipikiranmu. &lt;/span&gt;&lt;span title=&quot;Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.\r\n\r\n&quot;&gt;You need to remember, the rarity of her presence beside it a marker, if you girls are independent and not always depend on her.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.\r\n\r\n&quot;&gt;6. And with cueknya nature, you will feel special when she remembers small details about you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele.&quot;&gt;He was cool, but that does not mean he&#039;s forgetful with things that are considered trivial. &lt;/span&gt;&lt;span title=&quot;Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik?&quot;&gt;When you have told it, he was minimally resepon, but what if it turns out all that he remembered so well? &lt;/span&gt;&lt;span title=&quot;Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.\r\n\r\n&quot;&gt;Imagine if he remembers small details such as eating habits, riwat your pain, or a story about the difficulties you had to go through.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Ada saat tertentu dimana dia berusaha memanjakan.&quot;&gt;7. There is a particular moment in which he tried to spoil. &lt;/span&gt;&lt;span title=&quot;Nikmati saja;&quot;&gt;Just enjoy it; &lt;/span&gt;&lt;span title=&quot;maklum, jarang-jarang!\r\n\r\n&quot;&gt;Feedback, rarely!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi.&quot;&gt;Suddenly he took you to a region that had long edge of town you want to visit. &lt;/span&gt;&lt;span title=&quot;Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu.&quot;&gt;To get there, he also devote attention to you. &lt;/span&gt;&lt;span title=&quot;Kamu ingin makan di tempat ini, dia langsung menurutinya.&quot;&gt;You want to eat at this place, he immediately complied. &lt;/span&gt;&lt;span title=&quot;Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu.&quot;&gt;You want to buy the stuff, he did not hesitate to buy it for you. &lt;/span&gt;&lt;span title=&quot;Pokoknya hari itu, kamu serasa jadi putri sehari.\r\n\r\n&quot;&gt;Anyway that day, you seemed to be princess day.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya.&quot;&gt;Already not be surprised anymore, dinikmatin wrote all his attention. &lt;/span&gt;&lt;span title=&quot;Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe\r\n\r\n&quot;&gt;While there, and rarely too right ... hehehe&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Tak perlu cemas dia tebar pesona sana-sini.&quot;&gt;8. Do not worry her charisma and there. &lt;/span&gt;&lt;span title=&quot;Lihat saja sikapnya ke pacar sendiri!\r\n\r\n&quot;&gt;Look at his attitude to his own girlfriend!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem.&quot;&gt;You also need to know, the advantage of a couple who ignore the others can not make your heart calm and cool and calm. &lt;/span&gt;&lt;span title=&quot;Kamu nggak perlu cemas dia akan tebar pesona sana sini.&quot;&gt;You do not need to worry he would charisma here and there. &lt;/span&gt;&lt;span title=&quot;Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.\r\n\r\n&quot;&gt;The reason is not only because of his work is pretty solid, but you check it out for yourselves sikapnnya perfunctory.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Dia memperjuangkanmu meski kamu tak selalu sadar.&quot;&gt;9. He memperjuangkanmu even if you were not always aware. &lt;/span&gt;&lt;span title=&quot;Sosoknya lebih suka mendoakanmu dalam diam.\r\n\r\n&quot;&gt;That figure is more like is praying in silence.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kata siapa dia nggak berjuang untuk kamu?&quot;&gt;Who says he does not fight for you? &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya.&quot;&gt;Cueknya nature makes him not an exaggeration to show cause. &lt;/span&gt;&lt;span title=&quot;Dia itu sosok sederhana yang menjagamu cukup melalui doa.&quot;&gt;He was a modest figure that take care simply through prayer. &lt;/span&gt;&lt;span title=&quot;Karena, baginya doa itu lebih kuat dari apapun.&quot;&gt;Because, her prayer is more powerful than anything. &lt;/span&gt;&lt;span title=&quot;Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.\r\n\r\n&quot;&gt;He believes God never sleeps to hear his prayers and take care of one form or another.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya?&quot;&gt;Duh, still not convinced with all sincerity that is hidden behind nature indifferently? &lt;/span&gt;&lt;span title=&quot;Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya.&quot;&gt;He was cool, but that does not mean he can not treat you well. &lt;/span&gt;&lt;span title=&quot;Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.\r\n\r\n\r\n&quot;&gt;It is precisely the way he treated you the difference it makes you more sure that she was &quot;the right person&quot; you are looking for.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mustika Karindra&quot;&gt;Taken from Hipwee By Mustika Karindra&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(11, 6, 1, 'Cewek Bergigi Gingsul Emang Layak Disayang', '&lt;p&gt;Pernah lihat cewek bergigi gingsul senyum nggak? Manis ya. Entah kenapa senyum cewek bergigi gingsul itu enak dilihat. Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang. Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik. Tunggu deh, btw maloklusi gigi itu apa ya artinya?&lt;br /&gt;&lt;br /&gt;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar. Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis. Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul. Mau tahu alasannya kenapa? Baca ya..&lt;br /&gt;&lt;br /&gt;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.&lt;br /&gt;&lt;br /&gt;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis. Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya. Senyumnya yang aduhai membuatmu enggan untuk berpaling.&lt;br /&gt;&lt;br /&gt;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda. Mereka terlihat lebih menarik.&lt;br /&gt;&lt;br /&gt;Cewek bergigi gingsul itu punya kecantikan yang beda lho. Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik. Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka. Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya. Diam-diam kamu suka mengambil fotonya saat senyum.&lt;br /&gt;&lt;br /&gt;3. Cewek bergigi gingsul adalah pribadi yang percaya diri. Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.&lt;br /&gt;&lt;br /&gt;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka. Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka. Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan. Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.&lt;br /&gt;&lt;br /&gt;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute. Imut banget.&lt;br /&gt;&lt;br /&gt;Gigi gingsulnya bikin wajah dia terlihat cute. Setuju nggak? via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute. Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka. Cute yang bikin gemes deh&amp;hellip;&lt;br /&gt;&lt;br /&gt;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris. Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.&lt;br /&gt;&lt;br /&gt;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris. Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh. Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas. Asyik kan punya pacar yang selow bin humoris?&lt;br /&gt;&lt;br /&gt;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia. Duh, ngangenin banget itu senyumnya&lt;br /&gt;&lt;br /&gt;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia. Sehari nggak lihat dia aja udah bikin kamu kangen. Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum. Tuh, kan, punya cewek bergigi gingsul itu ngangenin!&lt;br /&gt;&lt;br /&gt;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka. Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan. Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri. So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Neneng Pratiwi&lt;/p&gt;'),
(12, 6, 2, 'Toothed Chick Gingsul Weve Worth Dear', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Pernah lihat cewek bergigi gingsul senyum nggak?&quot;&gt;Ever see a girl toothed smile gingsul not? &lt;/span&gt;&lt;span title=&quot;Manis ya.&quot;&gt;Sweet yes. &lt;/span&gt;&lt;span title=&quot;Entah kenapa senyum cewek bergigi gingsul itu enak dilihat.&quot;&gt;Somehow the girl toothed smile gingsul it unsightly. &lt;/span&gt;&lt;span title=&quot;Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang.&quot;&gt;They have a distinctive beauty and make people never tire of looking at. &lt;/span&gt;&lt;span title=&quot;Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik.&quot;&gt;The emergence of a real gear including dental malocclusion is actually even make a girl more attractive. &lt;/span&gt;&lt;span title=&quot;Tunggu deh, btw maloklusi gigi itu apa ya artinya?\r\n\r\n&quot;&gt;Wait for me, btw dental malocclusion was what yes means?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar.&quot;&gt;Malocclusion is a condition when the teeth do not grow in the correct place and aligned. &lt;/span&gt;&lt;span title=&quot;Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis.&quot;&gt;Well, it means you are lucky toothed girl gingsul for dental conditions that are not aligned precisely even make your smile more sweet. &lt;/span&gt;&lt;span title=&quot;Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul.&quot;&gt;But, more fortunate you are the guy who has a toothed girl gingsul. &lt;/span&gt;&lt;span title=&quot;Mau tahu alasannya kenapa?&quot;&gt;Want to know the reason why? &lt;/span&gt;&lt;span title=&quot;Baca ya..\r\n\r\n&quot;&gt;Read ya ..&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.\r\n\r\n&quot;&gt;1. gingsul toothed girl has a nice smile, so it makes you feel at home to look at his face.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis.&quot;&gt;The growth of the tooth that is not aligned with the other teeth actually make gingsul toothed girl has a nice smile. &lt;/span&gt;&lt;span title=&quot;Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya.&quot;&gt;The gingsul teeth do not interfere but instead make you feel at home to look at his face. &lt;/span&gt;&lt;span title=&quot;Senyumnya yang aduhai membuatmu enggan untuk berpaling.\r\n\r\n&quot;&gt;How sad smile makes you reluctant to turn.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda.&quot;&gt;2. The presence of the teeth, which grow on other teeth actually make gingsul toothed girl had a different beauty. &lt;/span&gt;&lt;span title=&quot;Mereka terlihat lebih menarik.\r\n\r\n&quot;&gt;They look more attractive.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cewek bergigi gingsul itu punya kecantikan yang beda lho.&quot;&gt;Chick toothed gingsul it has a beauty that is different you know. &lt;/span&gt;&lt;span title=&quot;Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik.&quot;&gt;Gingsulnya gear arguably even make them aesthetically appealing. &lt;/span&gt;&lt;span title=&quot;Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka.&quot;&gt;Teeth are included malocclusion that just so they appeal. &lt;/span&gt;&lt;span title=&quot;Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya.&quot;&gt;Because beauty is different that makes you gatel, luggage always wanted to immortalize her smile. &lt;/span&gt;&lt;span title=&quot;Diam-diam kamu suka mengambil fotonya saat senyum.\r\n\r\n&quot;&gt;Secretly you love to take a picture when a smile.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Cewek bergigi gingsul adalah pribadi yang percaya diri.&quot;&gt;3. Women toothed gingsul is personal confidence. &lt;/span&gt;&lt;span title=&quot;Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.\r\n\r\n&quot;&gt;Because they chose not wearing braces to correct the position of teeth.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka.&quot;&gt;Many of the girls who accidentally lets toothed gingsul gingsul them. &lt;/span&gt;&lt;span title=&quot;Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka.&quot;&gt;Rather than wear braces to correct the position of teeth that are misaligned, they prefer to maintain their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan.&quot;&gt;They believe that gingsul teeth can be regarded as an excess and grace granted by God. &lt;/span&gt;&lt;span title=&quot;Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.\r\n\r\n&quot;&gt;It shows that they are personally confident and grateful for what has been given by God.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute.&quot;&gt;4. You would agree that gingsul toothed girl was cute. &lt;/span&gt;&lt;span title=&quot;Imut banget.\r\n\r\n&quot;&gt;So cute.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gigi gingsulnya bikin wajah dia terlihat cute.&quot;&gt;Dental gingsulnya face make her look cute. &lt;/span&gt;&lt;span title=&quot;Setuju nggak?&quot;&gt;Agree not? &lt;/span&gt;&lt;span title=&quot;via tidurdotcom.wordpress.com\r\n\r\n&quot;&gt;via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute.&quot;&gt;Somehow the girl toothed gingsul it looks more cute. &lt;/span&gt;&lt;span title=&quot;Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka.&quot;&gt;You would agree that their faces become more cute with their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Cute yang bikin gemes deh&amp;hellip;\r\n\r\n&quot;&gt;Cute that I gemes deh ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris.&quot;&gt;5. Not only has a sweet smile aja, toothed girl gingsul also selow and humorous. &lt;/span&gt;&lt;span title=&quot;Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.\r\n\r\n&quot;&gt;Let the word often dibecandain &#039;rice nyempil in the teeth&#039;, they relaxed wrote.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris.&quot;&gt;Not only has a sweet smile aja, toothed girl gingsul also arguably selow and humorous. &lt;/span&gt;&lt;span title=&quot;Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh.&quot;&gt;Although often dibecandain &#039;rice nyempil in the teeth&#039;, they selow aja tuh. &lt;/span&gt;&lt;span title=&quot;Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas.&quot;&gt;Instead of sulking because gingsulnya often diledekin, they would respond by laughter off. &lt;/span&gt;&lt;span title=&quot;Asyik kan punya pacar yang selow bin humoris?\r\n\r\n&quot;&gt;Not it be nice to have a boyfriend selow bin humorous?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;6. different beauty can make you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Duh, ngangenin banget itu senyumnya\r\n\r\n&quot;&gt;Duh, it&#039;s really ngangenin smile&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;Sweet smile, face interesting and cute, makes you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Sehari nggak lihat dia aja udah bikin kamu kangen.&quot;&gt;The day did not see him just&#039;ve made you miss. &lt;/span&gt;&lt;span title=&quot;Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum.&quot;&gt;Once apart at him, for a few moments you Mandangin photographs are again smiling. &lt;/span&gt;&lt;span title=&quot;Tuh, kan, punya cewek bergigi gingsul itu ngangenin!\r\n\r\n&quot;&gt;There, right, got it ngangenin gingsul toothed girl!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka.&quot;&gt;It is admirable of gingsul toothed girl is their confidence. &lt;/span&gt;&lt;span title=&quot;Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan.&quot;&gt;Rather than minder with one tooth position is not parallel, they are grateful as a sign of excess and grace of God. &lt;/span&gt;&lt;span title=&quot;Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri.&quot;&gt;Fortunately you have a girl toothed gingsul because in addition has a nice smile and attractive face, he also humorous and confident. &lt;/span&gt;&lt;span title=&quot;So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.\r\n\r\n\r\n&quot;&gt;So, you are toothed gingsul, which tried to smile ...:) Ah, sweet.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Neneng Pratiwi&quot;&gt;Taken from Hipwee By Neng Pratiwi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(13, 7, 1, 'Ingin Sukses Terapkan 7 Tips Sukses Oprah Winfrey', '&lt;p&gt;Kenal dengan Oprah Winfrey? Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu. Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal. Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya. Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.&lt;br /&gt;&lt;br /&gt;Nah, untuk kita anak muda. Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?&lt;br /&gt;&lt;br /&gt;1. Fokuslah pada tempatmu, bukan tempat orang lain&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi. Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita. Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).&lt;br /&gt;&lt;br /&gt;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain. &lt;br /&gt;&lt;br /&gt;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!&lt;br /&gt;&lt;br /&gt;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya tidak percaya akan kegagalan. Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan. Jika anda gagal, cobalah lakukan lagi. Lakukan lebih baik pada percobaan kedua. Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko. Ini adalah saatnya. Ambil kesempatan ini dan lakukan!&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Mulai saat ini jangan pernah takut gagal! Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan. Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.&lt;br /&gt;&lt;br /&gt;3. Rasa takut itu ada karena kamu membiarkannya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa. Dia di kos sendirian dan ada kecoa gede nongol di sampingnya. Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam). &lt;br /&gt;&lt;br /&gt;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya. Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya. Dengan apa? Sapu? Pedang? Bukan! Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu. Misal, kamu takut ketinggian. Coba main flying fox. Kamu takut kecoa, coba main sama kecoa. Beres, kan?&lt;br /&gt;&lt;br /&gt;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Buatlah aturan untuk dirimu sendiri. Jangan menunggu perintah dan aturan orang lain. Kenapa? Karena manusia cenderung untuk segan pada orang yang membuat perintah. Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri. Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.&lt;br /&gt;&lt;br /&gt;5. Kamu akan memanen apa yang kamu tanam&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Nah, di sini hukum alam berlaku. Jika kamu menanam pisang, yang kamu panen pasti pisang. Bukan mangga. Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik. &lt;br /&gt;&lt;br /&gt;Ngerti, nggak? Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh. Daripada urusannya panjang.&lt;br /&gt;&lt;br /&gt;6. Lupakan masa lalu! Karena kamu hidup di masa sekarang, bukan masa lalumu itu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&lt;br /&gt;&lt;br /&gt;Buat apa mengingat masa lalu? Kalau masa lalu itu hanya berisi hal-hal negatif? Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif. Yang hanya membuat semangat hidup kita turun. Misalnya, mantan. Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit? Gunanya apa, gitu? Mending fokus pada masa depanmu. Pada cewek atau cowok yang mungkin sekarang sedang menunggu. Fokus buat menjemputnya. Fokus untuk menjemput mimpimu!&lt;br /&gt;&lt;br /&gt;7. Tuhan itu penulis skenario. Kamu adalah pemegang kendalinya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Tuhan itu yang menciptakan manusia dan menulis takdirnya. Tapi, kita bisa mengubah takdir dengan berusaha. Karena sebenarnya kita punya kendali. Kita adalah sopirnya. Kita memegang setir mobilnya. Jadi, gak usah takut! Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.&lt;br /&gt;&lt;br /&gt;Gimana? Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah? Atau mungkin makin bingung? (Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya). Oh ya, selain ketujuh tips itu. Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle. Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes). Kalau nggak ada, kamu bisa beli lewat online. Ini bukan promosi loh, ya. Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mitha Tiara&lt;/p&gt;'),
(14, 7, 2, 'Want to success Apply 7 Tips for Success Oprah Winfrey', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kenal dengan Oprah Winfrey?&quot;&gt;Familiar with Oprah Winfrey? &lt;/span&gt;&lt;span title=&quot;Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu.&quot;&gt;If you do not know (yes acquaintances, dong), then start now perbanyaklah find out about the figure of the black woman. &lt;/span&gt;&lt;span title=&quot;Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal.&quot;&gt;His features were so generous, kind, makes it even more famous. &lt;/span&gt;&lt;span title=&quot;Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya.&quot;&gt;He is a humble figure behind all assets held. &lt;/span&gt;&lt;span title=&quot;Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.\r\n\r\n&quot;&gt;In fact, Oprah often provide outstanding motivations so that others are able to become successful like him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, untuk kita anak muda.&quot;&gt;Well, for our young people. &lt;/span&gt;&lt;span title=&quot;Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?\r\n\r\n&quot;&gt;Successful Tips from Oprah highly obliged you know, because there is no harm in it to learn from the success of others?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Fokuslah pada tempatmu, bukan tempat orang lain\r\n\r\n&quot;&gt;1. Focus on where you are, not where others&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi.&quot;&gt;&quot;Be grateful for everything you have, and you&#039;ll have some more. &lt;/span&gt;&lt;span title=&quot;Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;\r\n\r\n&quot;&gt;If you concentrate on what you do not have, you will never have enough. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita.&quot;&gt;Here Oprah wanted to say that we should focus on what is in us, the talent, ability, and whatever we have, as well as in our dreams. &lt;/span&gt;&lt;span title=&quot;Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).\r\n\r\n&quot;&gt;If we are able to focus on the main things, then the system SAR or the reticular activating system in the human mind will help find evidence (in this case the evidence of thought indicated by the search for solutions).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain.\r\n\r\n&quot;&gt;Now, with grateful we are more focused on what is inside of us and it just makes us appreciate ourselves or others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!\r\n\r\n&quot;&gt;So from now on, try to focus on yourself and your dreams!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu\r\n\r\n&quot;&gt;2. Understand the nature of the failure and the failure to realize that actually want to be nice to you&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya tidak percaya akan kegagalan.&quot;&gt;&quot;I do not believe in failure. &lt;/span&gt;&lt;span title=&quot;Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;\r\n\r\n&quot;&gt;Not a failure if you enjoy the process. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan.&quot;&gt;&quot;Do one thing that you think you can not do. &lt;/span&gt;&lt;span title=&quot;Jika anda gagal, cobalah lakukan lagi.&quot;&gt;If you fail, try again. &lt;/span&gt;&lt;span title=&quot;Lakukan lebih baik pada percobaan kedua.&quot;&gt;Do better in the second experiment. &lt;/span&gt;&lt;span title=&quot;Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko.&quot;&gt;People who have never fallen are those who never take risks. &lt;/span&gt;&lt;span title=&quot;Ini adalah saatnya.&quot;&gt;It is time. &lt;/span&gt;&lt;span title=&quot;Ambil kesempatan ini dan lakukan!&amp;rdquo;\r\n\r\n&quot;&gt;Take this opportunity and do! &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;I believe one of the biggest risk in life is not the courage to take risks.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulai saat ini jangan pernah takut gagal!&quot;&gt;From this moment never afraid to fail! &lt;/span&gt;&lt;span title=&quot;Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan.&quot;&gt;Enjoy aja process, as each process it must be a new lesson that you get. &lt;/span&gt;&lt;span title=&quot;Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.\r\n\r\n&quot;&gt;And the lesson so that&#039;s what your biggest capital to achieve success.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Rasa takut itu ada karena kamu membiarkannya\r\n\r\n&quot;&gt;3. Fear is there because you let&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Whatever you fear actually has no power over you - fear that control of yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa.&quot;&gt;For this case we suppose there was a girl afraid of cockroaches. &lt;/span&gt;&lt;span title=&quot;Dia di kos sendirian dan ada kecoa gede nongol di sampingnya.&quot;&gt;He was at boarding alone and there was a big cockroach appeared beside him. &lt;/span&gt;&lt;span title=&quot;Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam).\r\n\r\n&quot;&gt;Would not want him should kill a cockroach that even though he was afraid, lha wong is in his rented again there is not anybody (the story friend&#039;s apartment on pulkam).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya.&quot;&gt;Well, from the parable that we can know that fear is there because we were thinking about it. &lt;/span&gt;&lt;span title=&quot;Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya.&quot;&gt;So, if we want to kill the fear was so in only one way, namely to fight it. &lt;/span&gt;&lt;span title=&quot;Dengan apa?&quot;&gt;With what? &lt;/span&gt;&lt;span title=&quot;Sapu?&quot;&gt;Broom? &lt;/span&gt;&lt;span title=&quot;Pedang?&quot;&gt;Sword? &lt;/span&gt;&lt;span title=&quot;Bukan!&quot;&gt;Not! &lt;/span&gt;&lt;span title=&quot;Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu.&quot;&gt;Fight your fear that by doing things that you fear. &lt;/span&gt;&lt;span title=&quot;Misal, kamu takut ketinggian.&quot;&gt;For example, you are afraid of heights. &lt;/span&gt;&lt;span title=&quot;Coba main flying fox.&quot;&gt;Try playing the flying fox. &lt;/span&gt;&lt;span title=&quot;Kamu takut kecoa, coba main sama kecoa.&quot;&gt;You&#039;re afraid of cockroaches, try to play with a cockroach. &lt;/span&gt;&lt;span title=&quot;Beres, kan?\r\n\r\n&quot;&gt;Beres, right?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya\r\n\r\n&quot;&gt;4. Do your right thing, even if nobody else sees&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;The essence of integrity is doing the right thing, regardless of whether others know you do it or not.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buatlah aturan untuk dirimu sendiri.&quot;&gt;Make a rule for yourself. &lt;/span&gt;&lt;span title=&quot;Jangan menunggu perintah dan aturan orang lain.&quot;&gt;Do not wait for orders and rules of others. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena manusia cenderung untuk segan pada orang yang membuat perintah.&quot;&gt;Because humans tend to shy at the person who made the order. &lt;/span&gt;&lt;span title=&quot;Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri.&quot;&gt;If we make a rule for yourself, then we respect ourselves. &lt;/span&gt;&lt;span title=&quot;Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.\r\n\r\n&quot;&gt;Because of the good things that should be done to yourself first, then to others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kamu akan memanen apa yang kamu tanam\r\n\r\n&quot;&gt;5. You will reap what you plant&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;One thing I believe is what you give will come back to yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, di sini hukum alam berlaku.&quot;&gt;Well, here the laws of nature apply. &lt;/span&gt;&lt;span title=&quot;Jika kamu menanam pisang, yang kamu panen pasti pisang.&quot;&gt;If you cultivate banana, banana sure that you harvest. &lt;/span&gt;&lt;span title=&quot;Bukan mangga.&quot;&gt;Not mango. &lt;/span&gt;&lt;span title=&quot;Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik.\r\n\r\n&quot;&gt;If you do good, you definitely yes dapetnya also good.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ngerti, nggak?&quot;&gt;You know, no? &lt;/span&gt;&lt;span title=&quot;Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh.&quot;&gt;If you do not understand tanyain to the author personally aja, deh. &lt;/span&gt;&lt;span title=&quot;Daripada urusannya panjang.\r\n\r\n&quot;&gt;Instead of a long affair.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Lupakan masa lalu!&quot;&gt;6. Forget the past! &lt;/span&gt;&lt;span title=&quot;Karena kamu hidup di masa sekarang, bukan masa lalumu itu\r\n\r\n&quot;&gt;Because you live in the present, not your past that&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&gt;&quot;Take a breath, release, and remind yourself that now is the time you have for sure.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buat apa mengingat masa lalu?&quot;&gt;Why recall the past? &lt;/span&gt;&lt;span title=&quot;Kalau masa lalu itu hanya berisi hal-hal negatif?&quot;&gt;If the past it was only contain negative things? &lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif.&quot;&gt;Here Oprah wanted to say that we should forget the past are negative. &lt;/span&gt;&lt;span title=&quot;Yang hanya membuat semangat hidup kita turun.&quot;&gt;Which only makes the spirit of our lives down. &lt;/span&gt;&lt;span title=&quot;Misalnya, mantan.&quot;&gt;For example, ex. &lt;/span&gt;&lt;span title=&quot;Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit?&quot;&gt;Why should you try to remember that the former will only put you back on the pain? &lt;/span&gt;&lt;span title=&quot;Gunanya apa, gitu?&quot;&gt;What point, right? &lt;/span&gt;&lt;span title=&quot;Mending fokus pada masa depanmu.&quot;&gt;Mending focus on your future. &lt;/span&gt;&lt;span title=&quot;Pada cewek atau cowok yang mungkin sekarang sedang menunggu.&quot;&gt;On a girl or a boy who might now pending. &lt;/span&gt;&lt;span title=&quot;Fokus buat menjemputnya.&quot;&gt;Focus for picking her up. &lt;/span&gt;&lt;span title=&quot;Fokus untuk menjemput mimpimu!\r\n\r\n&quot;&gt;Focus to pick your dream!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Tuhan itu penulis skenario.&quot;&gt;7. God is the screenwriter. &lt;/span&gt;&lt;span title=&quot;Kamu adalah pemegang kendalinya\r\n\r\n&quot;&gt;You are a holder of control&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Each of us is responsible for our own lives - not anyone else.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tuhan itu yang menciptakan manusia dan menulis takdirnya.&quot;&gt;God that created man and wrote his destiny. &lt;/span&gt;&lt;span title=&quot;Tapi, kita bisa mengubah takdir dengan berusaha.&quot;&gt;But, we can change destiny by trying. &lt;/span&gt;&lt;span title=&quot;Karena sebenarnya kita punya kendali.&quot;&gt;Because actually we have no control. &lt;/span&gt;&lt;span title=&quot;Kita adalah sopirnya.&quot;&gt;We are the driver. &lt;/span&gt;&lt;span title=&quot;Kita memegang setir mobilnya.&quot;&gt;We are holding the steering wheel. &lt;/span&gt;&lt;span title=&quot;Jadi, gak usah takut!&quot;&gt;So, do not be afraid! &lt;/span&gt;&lt;span title=&quot;Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.\r\n\r\n&quot;&gt;Because this is your life and you are most familiar with what you want, not someone else.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gimana?&quot;&gt;How? &lt;/span&gt;&lt;span title=&quot;Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah?&quot;&gt;Already started to understand the perspective of success of Oprah? &lt;/span&gt;&lt;span title=&quot;Atau mungkin makin bingung?&quot;&gt;Or maybe even more confused? &lt;/span&gt;&lt;span title=&quot;(Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya).&quot;&gt;(Kan was already spelled out, if still confused nanya directly to the author). &lt;/span&gt;&lt;span title=&quot;Oh ya, selain ketujuh tips itu.&quot;&gt;Oh yes, in addition to the seven tips that. &lt;/span&gt;&lt;span title=&quot;Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle.&quot;&gt;Oprah advised to read one book called &quot;The New World&quot; ( &quot;New World&quot;) written by Eckhart Tolle. &lt;/span&gt;&lt;span title=&quot;Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes).&quot;&gt;You can get this book in bookstores (not a pharmacy or hardware store, gaes). &lt;/span&gt;&lt;span title=&quot;Kalau nggak ada, kamu bisa beli lewat online.&quot;&gt;If no, you can purchase through online. &lt;/span&gt;&lt;span title=&quot;Ini bukan promosi loh, ya.&quot;&gt;This is not a promotion tablets, yes. &lt;/span&gt;&lt;span title=&quot;Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.\r\n\r\n\r\n&quot;&gt;Just wanna love you guys know that weve wrote for his life again upset and want to live a happy life physically and mentally.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mitha Tiara&quot;&gt;Taken from Hipwee By Mitha Tiara&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(15, 8, 1, '7 Ide Beri Edukasi Keuangan Kepada Anak', '&lt;p&gt;Orangtua merupakan sosok utama yang dapat mengenalkan edukasi keuangan kepada anak.&lt;br /&gt;&lt;br /&gt;Cara ini dilakukan agar ketika anak mulai beranjak dewasa, ia akan bisa membuat keputusan yang baik mengenai keuangan.&lt;br /&gt;&lt;br /&gt;Bila dilihat dari segi waktu yang tepat dalam mengedukasi anak adalah ketika anak sudah masuk usia Sekolah dasar atau SD.&lt;br /&gt;&lt;br /&gt;Sebab di usia tersebut anak akan belajar matematika dasar seperti penambahan dan pengurangan angka yang dapat dilatih dan diterapkan dalam keseharian dengan cara menabung.&lt;br /&gt;&lt;br /&gt;Apabila di sekolahnya diajarkan menabung dengan dibuatkan buku tabungan, maka tugasnya orang tua hanya mengontrol saja agar pengeluarannya dari uang saku tetap ada, namun menabungnya pun juga tetap ada.&lt;br /&gt;&lt;br /&gt;Tentu sebagai orang tua tidak dapat mengandalkan sepenuhnya dalam pengajaran pendidikan khususnya untuk mendidik anak tentang keuangan sejak kecil.&lt;br /&gt;&lt;br /&gt;Oleh karena itu orang tua juga dapat mengajarkan pada anak usia dini untuk dapat mengelola keuangan yang dimiliki anak sejak dini, dengan cara berikut di antaranya&lt;br /&gt;&lt;br /&gt;1. Kenalkan dan Ajarkan Tentang Konsep Uang&lt;br /&gt;&lt;br /&gt;Ketika anak sudah mulai mampu berhitung, maka tidak ada salahnya mengajarkan atau mengenalkan anak tentang uang, misalnya dari pecahan kecil seperti uang lima ratus rupiah dan sejenisnya. Ajak anak berhitung selisih uang yang diberikan orang tua dan yang telah ia gunakan untuk jajan.&lt;br /&gt;&lt;br /&gt;2. Beri Pengajaran dengan Memberikan Uang Saku&lt;br /&gt;&lt;br /&gt;Dengan memberikannya uang saku, itu akan mengajak anak Anda untuk belajar dewasa mengatur keuangan. Sehingga secara perlahan ia akan mulai untuk mengelola keuangan yang dimilikinya.&lt;br /&gt;&lt;br /&gt;3. Ajarkan Anak untuk Terbiasa Menabung&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan anak menabung, maka anak akan lebih disiplin dalam mengontrol keuangan yang telah diberikan oleh orang tuanya.&lt;br /&gt;&lt;br /&gt;Berikanlah penjelasan sederhana dengan menabung anak akan mendapatkan sesuatu yang berharga di masa mendatang, serta ajarkan manfaat dari menyisihkan uang jajannya setiap hari dengan dimasukkan ke celengan terlebih dulu.&lt;br /&gt;&lt;br /&gt;Kemudian ketika beranjak dewasa, anak diajarkan untuk berinvestasi secara perlahan-lahan dengan mengajarkannya membeli reksa dana dan sejenisnya.&lt;br /&gt;&lt;br /&gt;4. Ajarkan Anak untuk Berbagi Pada Sesamanya&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan konsep berbagi dengan saudaranya, secara perlahan itu akan mengajarkan anak mengenai beramal yang identik dengan kegiatan keagamaan sehingga diharapkan ia akan menjadi lebih saleh.&lt;br /&gt;&lt;br /&gt;Dengan pemahaman mendasar tersebut mengajarkan anak agar dapat tetap berbagi dengan sesamanya di sekolah walaupun orang tuanya sedang tidak di dekatnya.&lt;br /&gt;&lt;br /&gt;Selain itu ajarkan pula nilai kemanusiaan bahwa tidak semua manusia memiliki nasib yang sama. Sehingga anak menyadari betapa pentingnya berbagi dengan sesama khususnya bagi mereka yang membutuhkan.&lt;br /&gt;&lt;br /&gt;5. Diajarkan Melalui Konsep Game atau Permainan&lt;br /&gt;&lt;br /&gt;Melalui permainan anak tanpa sadar sedang diajarkan tentang mengelola keuangan. Sebagai contoh dalam memainkan permainan monopoli, cashflow 101, dan masih banyak lagi.&lt;br /&gt;&lt;br /&gt;Manfaatkan permainan tersebut dengan lebih menyenangkan sehingga perlahan anak dapat menerapkannya dalam kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;6. Ajak Anak Ketika Belanja Bulanan&lt;br /&gt;&lt;br /&gt;Dengan mengajak anak berbelanja, secara tidak langsung itu akan mengenalkan angka secara riil di lapangan.&lt;br /&gt;&lt;br /&gt;Dengan begitu anak akan dapat secara otomatis berhitung jumlah barang yang dibeli orang tuanya dan jumlah uang yang dikeluarkannya.&lt;br /&gt;&lt;br /&gt;Selain itu anak pun menyaksikan langsung terjadinya transaksi jual beli mulai dari menanyakan harga, tawar menawar, hingga terjadinya pembelian.&lt;br /&gt;&lt;br /&gt;7. Ajarkan Mengenai Prioritas&lt;br /&gt;&lt;br /&gt;Bila secara langsung mengajarkan secara definisi dan teori memang anak tidak langsung dapat memahaminya. Namun bila diberikan pertanyaan terbuka seperti mau mainan atau jalan-jalan, maka anak akan memilih keduanya.&lt;br /&gt;&lt;br /&gt;Namun ajarkan anak untuk memilih salah satunya mana yang lebih didahulukan. Dengan begitu anak secara perlahan diajarkan untuk mana yang lebih prioritas untuk didahulukan tanpa harus mengajarkan secara formal.&lt;br /&gt;&lt;br /&gt;Biasakan Anak Anda Dalam Mengatur Keuangan&lt;br /&gt;&lt;br /&gt;Harapannya dengan menerapkan cara tersebut anak dapat segera memahami bagaimana cara mengelola keuangan yang baik sehingga tidak perlu lagi repot mengajarkannya secara khusus karena lebih tepat serta efisien bila mengajarkannya dengan membiasakan diri mengatur keuangan mulai dari uang sakunya di kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;Jadi tidak ada lagi anak yang hanya mampu menghamburkan uang yang diberikan oleh orang tuanya saja tanpa dikelola dengan baik karena orang tuanya telah mengajarkannya sejak dini.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Liputan 6 Oleh Agustina Melani&lt;/p&gt;'),
(16, 8, 2, '7 Idea Give Financial Education for Children', '&lt;p&gt;Parents are central figures to introduce financial education to children.&lt;br /&gt;&lt;br /&gt;How this is done so that when the children started growing up, he will be able to make good decisions regarding finances.&lt;br /&gt;&lt;br /&gt;When viewed in terms of a great time in educating children is when children have entered primary school or elementary school age.&lt;br /&gt;&lt;br /&gt;Because at that age children will learn basic math like addition and subtraction of numbers that can be trained and applied in everyday life by saving.&lt;br /&gt;&lt;br /&gt;When in school are taught savings passbook to be made, then the duty of parents to control only course that expenditure of the allowance remains, but to save it was also still there.&lt;br /&gt;&lt;br /&gt;Of course as parents can not rely entirely on teaching education, especially for educating children about finances since childhood.&lt;br /&gt;&lt;br /&gt;Therefore, parents can also teach in early childhood to be able to manage the financial owned since early childhood, in the following way in between&lt;br /&gt;&lt;br /&gt;1. Recommend and Teach About Money Concepts&lt;br /&gt;&lt;br /&gt;When the child has begun to count, then there is no harm in teaching or introducing kids about money, for example, from a small fraction as five hundred rupiah and the like. Encourage children to count the difference between the money given by parents and that he had used for snacks.&lt;br /&gt;&lt;br /&gt;2. Give Teaching by Giving Allowance&lt;br /&gt;&lt;br /&gt;By giving them pocket money, it will take your child to an adult learn to manage finances. So slowly it will start to manage its finances.&lt;br /&gt;&lt;br /&gt;3. Teach Kids for Saving Accustomed&lt;br /&gt;&lt;br /&gt;By teaching children to save, then the child will be more discipline in financial control which have been given by their parents.&lt;br /&gt;&lt;br /&gt;Give a simple explanation to save the child will get something valuable in the future, as well as teach the benefits of set aside allowance every day to put the piggy bank first.&lt;br /&gt;&lt;br /&gt;Then, as adults, children are taught to invest gradually to teach buy mutual funds and the like.&lt;br /&gt;&lt;br /&gt;4. Teach Kids to Share In neighbor&lt;br /&gt;&lt;br /&gt;By teaching the concept of sharing with his brother, slowly it will teach children about the charity that is synonymous with religious activities so hopefully it will become more pious.&lt;br /&gt;&lt;br /&gt;With a fundamental understanding of the teaching of children in order to keep share with others in the school even though his parents were not nearby.&lt;br /&gt;&lt;br /&gt;Besides teaching the value of humanity that not all humans have the same fate. So the children realize the importance of sharing with others, especially for those in need.&lt;br /&gt;&lt;br /&gt;5. Taught Through Concept Game or Games&lt;br /&gt;&lt;br /&gt;Through the game unwittingly being taught about managing finances. For example in playing the game of monopoly, cashflow 101, and many more.&lt;br /&gt;&lt;br /&gt;Make the game more fun with so slow a child can apply them in their daily lives.&lt;br /&gt;&lt;br /&gt;6. Encourage Kids When Shopping Monthly&lt;br /&gt;&lt;br /&gt;By taking children shopping, indirectly it will introduce the figure in real terms in the field.&lt;br /&gt;&lt;br /&gt;That way the child will be able to automatically count the number of items purchased parents and the amount of money spent.&lt;br /&gt;&lt;br /&gt;In addition, children also witnessed the sale and purchase transactions ranging from the asking price, bargaining, to the purchase.&lt;br /&gt;&lt;br /&gt;7. Teach About Priorities&lt;br /&gt;&lt;br /&gt;When directly taught by definition and theory does not direct the child can understand. However, when given an open question as would a toy or sightseeing, then the child will choose both.&lt;br /&gt;&lt;br /&gt;But teach a child to choose one which would take precedence. That way the child gradually taught to which more priority to the precedence without having taught formally.&lt;br /&gt;&lt;br /&gt;Familiarize Your Child In the Set Finance&lt;br /&gt;&lt;br /&gt;The expectation by adopting the child can immediately understand how to manage finances well so no need to bother to teach it specifically because it is more appropriate and efficient to teach them to get used to managing money from his pocket money in his daily life.&lt;br /&gt;&lt;br /&gt;So no more children were only able to spend money given by parents without a well run because his parents had taught him early on.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Taken from Liputan 6 By Agustina Melani&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_gallery`
--

CREATE TABLE `post_gallery` (
  `id_post_gallery` int(5) NOT NULL,
  `id_post` int(5) NOT NULL DEFAULT 0,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `groups` varchar(50) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `groups`, `options`, `value`) VALUES
(1, 'general', 'web_name', 'Kuro Vlog'),
(2, 'general', 'web_url', 'http://localhost/SMKBP2'),
(3, 'general', 'web_meta', 'Dokumentasi Dari Setiap Perjalanan Saya.'),
(4, 'general', 'web_keyword', 'popojicms buat sendiri rasa webmu'),
(5, 'general', 'web_owner', 'PopojiCMS'),
(6, 'general', 'email', 'kuromyname86@gmail.com'),
(7, 'general', 'telephone', '000-0000-0000'),
(8, 'general', 'fax', '000-0000-0000'),
(9, 'general', 'address', '&lt;strong&gt;Headquarters:&lt;/strong&gt;&lt;br&gt;\n795 Folsom Ave, Suite 600&lt;br&gt;\nSan Francisco, CA 94107'),
(10, 'general', 'geocode', 'latitude: -6.1753871, longitude: 106.8249641,'),
(11, 'image', 'favicon', 'favicon.png'),
(12, 'image', 'logo', 'logo.png'),
(13, 'image', 'img_medium', '640x480'),
(14, 'local', 'country', 'Indonesia'),
(15, 'local', 'region_state', 'Sulawesi Utara'),
(16, 'local', 'timezone', 'Pacific/Midway'),
(17, 'config', 'maintenance', 'N'),
(18, 'config', 'member_registration', 'N'),
(19, 'config', 'comment', 'N'),
(20, 'config', 'item_per_page', '5'),
(21, 'config', 'google_analytics', ''),
(22, 'config', 'recaptcha_sitekey', '6LckEgETAAAAAPdqrQSY_boMDLZRL1vpkAatVqKf'),
(23, 'config', 'recaptcha_secretkey', '6LckEgETAAAAAHqx4VFD4zNL96P9UEikD8BHfT28'),
(24, 'mail', 'mail_protocol', 'Mail'),
(25, 'mail', 'mail_hostname', ''),
(26, 'mail', 'mail_username', ''),
(27, 'mail', 'mail_password', ''),
(28, 'mail', 'mail_port', ''),
(29, 'config', 'permalink', 'slug/post-title'),
(30, 'config', 'slug_permalink', 'detailpost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe`
--

CREATE TABLE `subscribe` (
  `id_subscribe` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tag_seo` varchar(100) NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `title`, `tag_seo`, `count`) VALUES
(1, 'indonesia', 'indonesia', 8),
(2, 'wisata religi', 'wisata-religi', 5),
(3, 'toleransi beragama', 'toleransi-beragama', 5),
(4, 'manado', 'manado', 3),
(5, 'wisata manado', 'wisata-manado', 3),
(6, 'sulawesi utara', 'sulawesi-utara', 3),
(7, 'startup', 'startup', 6),
(8, 'impian', 'impian', 3),
(9, 'usaha kecil', 'usaha-kecil', 3),
(10, 'bisnis', 'bisnis', 3),
(11, 'cowok', 'cowok', 3),
(12, 'pendamping', 'pendamping', 6),
(13, 'cewek', 'cewek', 3),
(14, 'ginsul', 'ginsul', 3),
(15, 'sayang', 'sayang', 3),
(16, 'sukses', 'sukses', 3),
(17, 'tips sukses', 'tips-sukses', 3),
(18, 'edukasi anak', 'edukasi-anak', 4),
(19, 'keuangan', 'keuangan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `theme`
--

INSERT INTO `theme` (`id_theme`, `title`, `author`, `folder`, `active`) VALUES
(1, 'Chingsy', 'PopojiCMS', 'chingsy', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `traffic`
--

CREATE TABLE `traffic` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `traffic`
--

INSERT INTO `traffic` (`ip`, `browser`, `os`, `platform`, `country`, `city`, `date`, `hits`, `online`) VALUES
('::1', 'Firefox', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows', '', '', '2019-09-08', 1, '1568006391');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '2',
  `block` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `forget_key` varchar(100) DEFAULT NULL,
  `locktype` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `bio`, `picture`, `level`, `block`, `id_session`, `tgl_daftar`, `forget_key`, `locktype`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Super Administrator', 'kuromyname86@gmail.com', '000-0000-0000', 'No matter how exciting or significant a person\'s life is, a poorly written biography will make it seem like a snore. On the other hand, a good biographer can draw insight from an ordinary life-because they recognize that even the most exciting life is an ordinary life! After all, a biography isn\'t supposed to be a collection of facts assembled in chronological order; it\'s the biographer\'s interpretation of how that life was different and important.', '', '1', 'N', '0192023a7bbd73250516f069df18b500', '2019-09-08', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `menu` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`, `title`, `role`, `menu`) VALUES
(1, 'superadmin', 'Super Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1),
(2, 'admin', 'Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"1\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(3, 'manager', 'Manager', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(4, 'member', 'Member', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"component\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"contact\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"menumanager\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"oauth\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"user\",\"create\":\"0\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`id_category_description`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id_oauth`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indeks untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  ADD PRIMARY KEY (`id_pages_description`);

--
-- Indeks untuk tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indeks untuk tabel `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id_post_category`);

--
-- Indeks untuk tabel `post_description`
--
ALTER TABLE `post_description`
  ADD PRIMARY KEY (`id_post_description`);

--
-- Indeks untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  ADD PRIMARY KEY (`id_post_gallery`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id_subscribe`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category_description`
--
ALTER TABLE `category_description`
  MODIFY `id_category_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `component`
--
ALTER TABLE `component`
  MODIFY `id_component` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id_oauth` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id_pages` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  MODIFY `id_pages_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id_post_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_description`
--
ALTER TABLE `post_description`
  MODIFY `id_post_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  MODIFY `id_post_gallery` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id_subscribe` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `fitri`
--
CREATE DATABASE IF NOT EXISTS `fitri` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `fitri`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id_customer` int(11) NOT NULL,
  `nama_ekspedisi` varchar(50) NOT NULL,
  `nama_customer` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id_customer`, `nama_ekspedisi`, `nama_customer`, `alamat`, `no_hp`) VALUES
(0, '31', 'guztii setiawan', 'lio baru', '08128401905'),
(35, '35', 'Bee Bee Mart Akmal', 'Pekanbaru', '08964787338');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ekspedisi`
--

CREATE TABLE `ekspedisi` (
  `id_ekspedisi` int(11) NOT NULL,
  `nama_ekspedisi` varchar(50) NOT NULL,
  `alamat_e` varchar(50) NOT NULL,
  `telp` varchar(25) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `ekspedisi`
--

INSERT INTO `ekspedisi` (`id_ekspedisi`, `nama_ekspedisi`, `alamat_e`, `telp`) VALUES
(31, 'JNE', 'Cipondoh Indah', '089647807338'),
(35, 'Ratu Berlian Exspress', 'jakarta', '0213456789'),
(39, 'guztii setiawan', 'cimone', '08128401905');

-- --------------------------------------------------------

--
-- Struktur dari tabel `login`
--

CREATE TABLE `login` (
  `id_login` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `hak_akses` varchar(10) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `login`
--

INSERT INTO `login` (`id_login`, `nama`, `username`, `password`, `hak_akses`, `foto`) VALUES
(1, 'Accounting', 'Accounting', '827ccb0eea8a706c4c34a16891f84e7b', 'operator', ''),
(3, 'owner', 'owner', '827ccb0eea8a706c4c34a16891f84e7b', 'operator', 'file/foto_petugas/default_user.png');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nota`
--

CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `no_nota` varchar(10) NOT NULL,
  `tgl_nota` date NOT NULL,
  `jumlah_nota` double NOT NULL,
  `ongkir` double NOT NULL,
  `total_nota` double NOT NULL,
  `status` int(11) NOT NULL,
  `id_ekspedisi` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `nota`
--

INSERT INTO `nota` (`id_nota`, `id_customer`, `no_nota`, `tgl_nota`, `jumlah_nota`, `ongkir`, `total_nota`, `status`, `id_ekspedisi`) VALUES
(17, 35, '123', '2019-07-30', 100, 200, 300, 0, 31),
(18, 1, '888', '2019-07-30', 20000, 1000, 21000, 0, 31),
(20, 0, '001', '2019-07-31', 200000, 20000, 220000, 0, 31);

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_nota` int(11) NOT NULL,
  `tgl_pembayaran` date NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `cicilan_ke` int(2) NOT NULL,
  `Sisa_nota` double NOT NULL,
  `keterangan` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_nota`, `tgl_pembayaran`, `jumlah_bayar`, `cicilan_ke`, `Sisa_nota`, `keterangan`, `status`) VALUES
(8, 6, '2014-06-12', 7150000, 0, 0, '-', ''),
(9, 7, '2014-07-02', 7700000, 0, 0, '-', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indeks untuk tabel `ekspedisi`
--
ALTER TABLE `ekspedisi`
  ADD PRIMARY KEY (`id_ekspedisi`) USING BTREE;

--
-- Indeks untuk tabel `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id_login`);

--
-- Indeks untuk tabel `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`id_nota`),
  ADD KEY `id_merk` (`id_customer`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`),
  ADD KEY `id_pembelian` (`id_nota`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT untuk tabel `ekspedisi`
--
ALTER TABLE `ekspedisi`
  MODIFY `id_ekspedisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT untuk tabel `login`
--
ALTER TABLE `login`
  MODIFY `id_login` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `nota`
--
ALTER TABLE `nota`
  MODIFY `id_nota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- Database: `laravel_ujianonline-master`
--
CREATE DATABASE IF NOT EXISTS `laravel_ujianonline-master` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `laravel_ujianonline-master`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_04_24_020512_create_table_soals', 1),
(4, '2019_04_24_043046_create_table_pengaturans', 1),
(5, '2019_04_26_020927_create_table_nilais', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_nilais`
--

CREATE TABLE `table_nilais` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `benar` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salah` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kosong` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `score` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `keterangan` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `table_nilais`
--

INSERT INTO `table_nilais` (`id`, `id_user`, `benar`, `salah`, `kosong`, `score`, `keterangan`, `created_at`, `updated_at`) VALUES
(9, 3, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(10, 5, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(12, 7, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(13, 15, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(14, 16, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(15, 18, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(16, 4, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(17, 10, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(18, 8, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(19, 6, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(20, 3, '1', '2', '7', '11.1', 'TIDAK LULUS', NULL, NULL),
(25, 36, '7', '2', '1', '77.8', 'LULUS', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_pengaturans`
--

CREATE TABLE `table_pengaturans` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama_ujian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `waktu` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nilai_min` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `peraturan_ujian` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `table_pengaturans`
--

INSERT INTO `table_pengaturans` (`id`, `nama_ujian`, `waktu`, `nilai_min`, `peraturan_ujian`, `created_at`, `updated_at`) VALUES
(1, 'Ujian Online', '60', '30', 'Juwan Tillman II', '2019-04-25 20:24:05', '2019-05-02 23:56:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `table_soals`
--

CREATE TABLE `table_soals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `soal` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_a` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_b` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_c` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `jawaban_d` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `knc_jawaban` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Aktif','Tidak') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `table_soals`
--

INSERT INTO `table_soals` (`id`, `soal`, `jawaban_a`, `jawaban_b`, `jawaban_c`, `jawaban_d`, `knc_jawaban`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Rhianna Von', 'Araceli Blanda', 'Daphnee Hansen', 'Dr. Monica Olson V', 'Nico Larkin MD', 'b', 'Aktif', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(2, 'Andreane Bailey', 'Filomena Zboncak', 'Waino Schmidt', 'Mr. Benny Abshire II', 'Mr. Florian Pacocha I', 'b', 'Aktif', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(3, 'Gabe Krajcik', 'Dr. Novella Gislason IV', 'Loyce Berge', 'Gwen Kirlin', 'Daphnee Haley', 'b', 'Aktif', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(4, 'Marilou Graham', 'Miss Theresa Schamberger I', 'Kaycee Schroeder II', 'Ofelia Zboncak II', 'Eleanore Walsh', 'b', 'Aktif', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(5, 'Gilda Kilback Sr.', 'Karen Kuphal', 'Janet Strosin', 'Benedict Schaden', 'Alda Quitzon', 'c', 'Aktif', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(6, 'Mrs. Eliane Kautzer PhD', 'Prof. Ethan Waters', 'Prof. Abdul Powlowski DVM', 'Gonzalo Braun DDS', 'Mack Dooley', 'b', 'Tidak', '2019-04-25 20:24:04', '2019-04-28 20:35:53'),
(17, 'Eula Reichel', 'Valerie Macejkovic', 'Lemuel Brekke', 'Rico Erdman', 'Lera Douglas', 'b', 'Aktif', '2019-04-25 20:24:05', '2019-04-25 20:24:05'),
(18, 'Dustin Sauer', 'Emilio Raynor', 'Fletcher Tillman', 'Dallas Okuneva', 'Miss Angelita Littel DDS', 'b', 'Aktif', '2019-04-25 20:24:05', '2019-04-25 20:24:05'),
(19, 'Tate Lemke V', 'Euna Ondricka', 'Keyon Senger', 'Verna Harris Sr.', 'Wilburn Jerde', 'b', 'Aktif', '2019-04-25 20:24:05', '2019-04-25 20:24:05'),
(20, 'Zola Beatty', 'Stacey Skiles', 'Dakota Toy', 'Sabrina McLaughlin', 'Aletha Mraz', 'b', 'Aktif', '2019-04-25 20:24:05', '2019-04-25 20:24:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `android_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `username` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `kelas` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `nik` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `jenis_kelamin` enum('Laki-Laki','Perempuan') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('AKTIF','TIDAK AKTIF') COLLATE utf8mb4_unicode_ci DEFAULT 'AKTIF',
  `no_hp_ortu` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'text',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_Admin` tinyint(1) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `android_id`, `username`, `email`, `kelas`, `nik`, `jenis_kelamin`, `alamat`, `status`, `no_hp_ortu`, `email_verified_at`, `password`, `is_Admin`, `remember_token`, `created_at`, `updated_at`) VALUES
(2, 'Prof. Roosevelt Gusikowski', '23458', 'Davion Stiedemann Sr.', 'jacquelyn.oberbrunner@example.com', '3', '7', 'Laki-Laki', '775 Kara Port Suite 224\nFeeneyburgh, VA 35291-3415', 'AKTIF', '089638889862', '2019-04-25 20:24:00', '$2y$10$kXteEZ4FcmAGYa32UVzIIubXqClmKm.Jo/3A0K5wmWZ3Ef94.Aw26', 0, 'YWM3aIAgwG', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(3, 'Trevion Powlowski', '2322', 'Kiana Gulgowski', 'othompson@example.org', '1', '2', 'Laki-Laki', '656 Ursula Manors\nLindville, DE 51231-8915', 'AKTIF', '089638889862', '2019-04-25 20:24:00', '$2y$10$cDS84BT7o1B4gFLmATAduOeGW/3.pZulrMw/VJz.Z2.DF08TGqON2', 0, 'OFBx07wJF0', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(4, 'Mr. Elijah Heathcote', '090909', 'Millie Considine PhD', 'roma.lebsack@example.com', '3', '9', 'Laki-Laki', '4257 Elliott Lake\nCroninburgh, ID 84438', 'AKTIF', '089638889862', '2019-04-25 20:24:00', '$2y$10$lRFrArlt2vNELvUFb5ANhOBlxKxbXc.QvkBbIjBMrC96.dDDfuA5O', 0, 'CTnv3C6xrc', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(5, 'Turner Abbott', '12121212222', 'Mr. Darryl Raynor Jr.', 'ettie35@example.com', '2', '4', 'Laki-Laki', '1836 Gulgowski Mount Suite 823\nFionashire, KY 43982-7168', 'AKTIF', '089638889862', '2019-04-25 20:24:00', '$2y$10$SaV/rPtNKhie3RZD2knfwecj7Ehj/dYiBM8Y3/5hyE4KGEwAGmhaq', 0, 'k5DB1EYfN3', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(6, 'Gretchen Spinka', '121212122', 'Macie Keeling', 'chane@example.com', '1', '2', 'Laki-Laki', '348 Joy Unions Suite 458\nBergstromfurt, WI 35086', 'AKTIF', '089638889862', '2019-04-25 20:24:00', '$2y$10$1m3ibpEVa2WVfS5eg5UMveh0nPWW4fNA/.q1L4zcL0CCpefYlieAm', 0, 'Tq4Plz8USz', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(7, 'Yvette Gibson', '1212', 'Ricky Graham MD', 'wdamore@example.net', '3', '5', 'Laki-Laki', '3787 Herzog Highway Suite 293\nSmithhaven, AL 46155-9005', 'AKTIF', '089638889862', '2019-04-25 20:24:01', '$2y$10$G3OJrzalKAyorK2zLvtYGuOz6oa5MPCYiXfOgoO27YFaHLK2pILX2', 0, 'kA7TRQbHiR', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(8, 'Rahsaan West', '12121qw', 'Maymie Nolan', 'nicholas.morar@example.org', '3', '8', 'Laki-Laki', '27911 Franco Prairie\nLake Tyshawnville, KS 86556-5808', 'AKTIF', '089638889862', '2019-04-25 20:24:01', '$2y$10$hJryhi9aVMlqweZC0e8cKu5XC7Nvv7a3PpPKomdpUIYz3Bgrox3/i', 0, 'H5pNjjUW2G', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(9, 'Elisa Upton', 'sasas121212', 'Mazie Friesen', 'oceane.runolfsdottir@example.org', '2', '4', 'Laki-Laki', '80022 Wiegand Gardens Suite 434\nLake Emanuelside, CT 58642', 'AKTIF', '089638889862', '2019-04-25 20:24:01', '$2y$10$lF7BTdDSCoQWrxaEfevgiOgg0xCcM1P0/usEA/FRsa1Be8PCO73eC', 0, 'zLp1gCVwty', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(10, 'Prof. Clemens Deckow', '901991', 'Dulce Fritsch III', 'blanca.toy@example.com', '1', '8', 'Laki-Laki', '1601 Hermiston Ridge\nPort Jaidenside, CO 10443-0971', 'AKTIF', '089638889862', '2019-04-25 20:24:01', '$2y$10$1aqUvMikVftp6MliAJaxJOqhC2lhFq9PRMlFwrY8kt0faD7bZm4YG', 0, 'uOEnuy05by', '2019-04-25 20:24:03', '2019-04-25 20:24:03'),
(15, 'Dr. Joel Medhurst', '121212', 'Prof. Julie Schumm', 'klebsack@example.net', '1', '12121', 'Laki-Laki', '524 Parisian Road\nNorth Savionfort, GA 92909-8800 update', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$59kuh9vPErvp5JtJnp.yyOMPCdxkxsOLshsWdsoDPItVSFHTOAYfq', 0, 'yBgH43pkJ1', '2019-04-25 20:24:04', '2019-05-14 07:46:08'),
(16, 'Sydnie Haley II', '99999', 'Alysha Keeling I', 'usawayn@example.net', '1', '1', 'Laki-Laki', '630 Altenwerth Landing Suite 242\nLake Owenberg, CO 55920-3089', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$NZFL5aZfpzqvwBGJpeHXROvsagePB027fLxvmGgaaEQu5mzIJ5RNy', 0, 'fVEwuK4uxW', '2019-04-25 20:24:04', '2019-05-17 23:52:50'),
(17, 'Mr. Rashawn Moen DDS', '0909091', 'Akeem Stiedemann', 'shaylee62@example.com', '2', '8', 'Laki-Laki', '5471 Walton Garden Suite 573\nPort Kali, ND 78509', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$CqQ97yu0trEth2kR833U3uTtoDEmTdEDlOY9umKT/S/yVTLRS2Ep2', 0, 'HgkkFlsy7A', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(18, 'Mack Cassin', '11111o2', 'Prof. Russ Corwin', 'fullrich@example.net', '1', '7', 'Laki-Laki', '714 McKenzie Fort\nDinomouth, AR 98899-1782', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$yfA5RuwGNhsq2/uwoYi.D.VoxTMWiX96VmCusJMSOJXUakbJEYxeC', 0, 'vx7tMJATCz', '2019-04-25 20:24:04', '2019-05-17 23:52:45'),
(19, 'Kirk Rolfson', '121', 'Ms. Marjolaine Schroeder Sr.', 'caesar.ruecker@example.org', '3', '9', 'Laki-Laki', '25778 Keshawn Islands\nBlickburgh, AZ 60242', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$NG7N9oEb1j7QGM43cZaYQ.WqLf1IvuTN1STtjvR.Omlipp3SPigme', 0, 'nrbcqxuxkr', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(20, 'Mrs. Letha Dare PhD', '112121', 'Jude Muller', 'frieda08@example.com', '3', '5', 'Laki-Laki', '78879 Schmidt Trace\nWest Meghanmouth, KY 97419-6260', 'AKTIF', '089638889862', '2019-04-25 20:24:02', '$2y$10$YoEReLnMozZJzfub/PljIOKG.xzozte/2hIix0fUOqEhsiepbVyQC', 0, 'DpG52OFYrP', '2019-04-25 20:24:04', '2019-04-25 20:24:04'),
(36, 'android max', 'd19c16c6caf61e99', 'android andi', 'andromax@mail.com', '3', '089262', 'Laki-Laki', 'Universitas Pakuan Bogor', 'AKTIF', '089638889862', NULL, '$2y$10$uucdA9be8Q2G1i6mutIYLeM0d9xltBobvnwO0sHCo4PHgAexM9PUy', 0, NULL, '2019-05-08 10:03:59', '2019-05-17 23:53:38'),
(37, 'Andi', '219192811', 'hoerudin', 'andihoerudin24@gmail.com', '3', '18281', 'Laki-Laki', 'lINGKUNGAN JOGJAKARTA', 'AKTIF', '092828188181', NULL, '$2y$10$uucdA9be8Q2G1i6mutIYLeM0d9xltBobvnwO0sHCo4PHgAexM9PUy', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `table_nilais`
--
ALTER TABLE `table_nilais`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_nilais_id_user_foreign` (`id_user`);

--
-- Indeks untuk tabel `table_pengaturans`
--
ALTER TABLE `table_pengaturans`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `table_soals`
--
ALTER TABLE `table_soals`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `table_nilais`
--
ALTER TABLE `table_nilais`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT untuk tabel `table_pengaturans`
--
ALTER TABLE `table_pengaturans`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `table_soals`
--
ALTER TABLE `table_soals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `table_nilais`
--
ALTER TABLE `table_nilais`
  ADD CONSTRAINT `table_nilais_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data untuk tabel `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"off\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data untuk tabel `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'table', 'areta_pendaftaran', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"allrows\":\"1\",\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@TABLE@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Struktur tabel @TABLE@\",\"latex_structure_continued_caption\":\"Struktur tabel @TABLE@ (dilanjutkan)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Isi tabel @TABLE@\",\"latex_data_continued_caption\":\"Isi tabel @TABLE@ (dilanjutkan)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"xml_structure_or_data\":\"data\",\"xml_export_events\":\"something\",\"xml_export_functions\":\"something\",\"xml_export_procedures\":\"something\",\"xml_export_tables\":\"something\",\"xml_export_triggers\":\"something\",\"xml_export_views\":\"something\",\"xml_export_contents\":\"something\",\"yaml_structure_or_data\":\"data\",\"\":null,\"lock_tables\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data untuk tabel `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"areta_pendaftaran\",\"table\":\"jurusan\"},{\"db\":\"areta_pendaftaran\",\"table\":\"calon_mahasiswa\"},{\"db\":\"areta_pendaftaran\",\"table\":\"agama\"},{\"db\":\"areta_pendaftaran\",\"table\":\"dosen\"},{\"db\":\"areta_pendaftaran\",\"table\":\"admin\"},{\"db\":\"onlineclassindonesia\",\"table\":\"registrasi\"},{\"db\":\"onlineclassindonesia\",\"table\":\"Registrasi\"}]');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data untuk tabel `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2019-10-07 05:49:52', '{\"Console\\/Mode\":\"show\",\"lang\":\"id\",\"Console\\/Height\":-15}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Struktur dari tabel `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indeks untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indeks untuk tabel `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indeks untuk tabel `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indeks untuk tabel `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indeks untuk tabel `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indeks untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indeks untuk tabel `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indeks untuk tabel `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indeks untuk tabel `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indeks untuk tabel `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indeks untuk tabel `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `popojicms`
--
CREATE DATABASE IF NOT EXISTS `popojicms` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `popojicms`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `title`, `seotitle`, `active`) VALUES
(1, 'Pure', 'pure', 'Y'),
(2, 'Plain', 'plain', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `id_parent`, `seotitle`, `picture`, `active`) VALUES
(1, 0, 'indonesiaku', '', 'Y'),
(2, 0, 'motivasi', '', 'Y'),
(3, 0, 'hubungan', '', 'Y'),
(4, 0, 'sukses', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_description`
--

CREATE TABLE `category_description` (
  `id_category_description` int(5) NOT NULL,
  `id_category` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category_description`
--

INSERT INTO `category_description` (`id_category_description`, `id_category`, `id_language`, `title`) VALUES
(1, 1, 1, 'Indonesiaku'),
(2, 1, 2, 'My Indonesia'),
(3, 2, 1, 'Motivasi'),
(4, 2, 2, 'Motivation'),
(5, 3, 1, 'Hubungan'),
(6, 3, 2, 'Relationship'),
(7, 4, 1, 'Sukses'),
(8, 4, 2, 'Success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `id_post` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id_comment`, `id_parent`, `id_post`, `name`, `email`, `url`, `comment`, `date`, `time`, `active`, `status`) VALUES
(1, 0, 8, 'Jenuar Dalapang', 'djenuar@gmail.com', '', 'Edukasi keuangan terhadap anak memang penting sejak dini', '2016-07-28', '12:40:24', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `component`
--

CREATE TABLE `component` (
  `id_component` int(5) NOT NULL,
  `component` varchar(100) NOT NULL,
  `type` enum('component','widget') NOT NULL DEFAULT 'component',
  `datetime` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `component`
--

INSERT INTO `component` (`id_component`, `component`, `type`, `datetime`, `active`) VALUES
(1, 'gallery', 'component', '2016-03-11 10:00:00', 'Y'),
(2, 'contact', 'component', '2016-03-11 10:00:00', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `title`, `content`, `picture`) VALUES
(1, 1, 'Coloration', '', 'coloration.jpg'),
(2, 2, 'Legs On Table', '', 'legs_on_table.jpg'),
(3, 1, 'Shop Counter', '', 'shop_counter.jpg'),
(4, 2, 'Work Desk', '', 'work_desk.jpg'),
(5, 1, 'City From Sky', '', 'city_from_sky.jpg'),
(6, 2, 'Traction', '', 'traction.jpg'),
(7, 1, 'Still Life White', '', 'still_life_white.jpg'),
(8, 2, 'Coffee In Heart', '', 'coffee_in_heart.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `id_language` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`id_language`, `title`, `code`, `active`) VALUES
(1, 'Indonesia', 'id', 'Y'),
(2, 'English', 'gb', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `target` varchar(10) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`, `target`) VALUES
(1, 0, 'dashboard', 'admin.php?mod=home', 'fa-home', 1, 1, 'Y', 'none'),
(2, 0, 'post', 'admin.php?mod=post', 'fa-book', 2, 1, 'Y', 'none'),
(3, 2, 'addnew', 'admin.php?mod=post&act=addnew', '', 2, 1, 'Y', 'none'),
(4, 2, 'allpost', 'admin.php?mod=post', '', 1, 1, 'Y', 'none'),
(5, 0, 'category', 'admin.php?mod=category', 'fa-tasks', 3, 1, 'Y', 'none'),
(6, 5, 'allcategory', 'admin.php?mod=category', '', 1, 1, 'Y', 'none'),
(7, 5, 'addnew', 'admin.php?mod=category&act=addnew', '', 2, 1, 'Y', 'none'),
(8, 0, 'tag', 'admin.php?mod=tag', 'fa-tags', 4, 1, 'Y', 'none'),
(9, 8, 'alltag', 'admin.php?mod=tag', '', 1, 1, 'Y', 'none'),
(19, 8, 'addnew', 'admin.php?mod=tag&act=addnew', '', 2, 1, 'Y', 'none'),
(20, 0, 'pages', 'admin.php?mod=pages', 'fa-file', 6, 1, 'Y', 'none'),
(21, 20, 'allpages', 'admin.php?mod=pages', '', 1, 1, 'Y', 'none'),
(22, 20, 'addnew', 'admin.php?mod=pages&act=addnew', '', 2, 1, 'Y', 'none'),
(23, 0, 'library', 'admin.php?mod=library', 'fa-picture-o', 7, 1, 'Y', 'none'),
(27, 0, 'setting', 'admin.php?mod=setting', 'fa-cog', 8, 1, 'Y', 'none'),
(28, 0, 'theme', 'admin.php?mod=theme', 'fa-desktop', 9, 1, 'Y', 'none'),
(29, 28, 'alltheme', 'admin.php?mod=theme', '', 1, 1, 'Y', 'none'),
(30, 28, 'addnew', 'admin.php?mod=theme&act=addnew', '', 2, 1, 'Y', 'none'),
(31, 0, 'menumanager', 'admin.php?mod=menumanager', 'fa-sitemap', 10, 1, 'Y', 'none'),
(32, 0, 'component', 'admin.php?mod=component', 'fa-puzzle-piece', 11, 1, 'Y', 'none'),
(33, 32, 'allcomponent', 'admin.php?mod=component', '', 1, 1, 'Y', 'none'),
(34, 32, 'addnew', 'admin.php?mod=component&act=addnew', '', 2, 1, 'Y', 'none'),
(42, 0, 'comment', 'admin.php?mod=comment', 'fa-comments', 5, 1, 'Y', 'none'),
(43, 32, 'Galeri', 'admin.php?mod=gallery', '', 3, 1, 'Y', 'none'),
(44, 32, 'Kontak', 'admin.php?mod=contact', '', 4, 1, 'Y', 'none'),
(45, 0, 'user', 'admin.php?mod=user', 'fa-group', 12, 1, 'Y', 'none'),
(46, 45, 'alluser', 'admin.php?mod=user', '', 1, 1, 'Y', 'none'),
(47, 45, 'addnew', 'admin.php?mod=user&act=addnew', '', 2, 1, 'Y', 'none'),
(48, 0, 'Beranda', './', '', 1, 2, 'Y', 'none'),
(49, 0, 'Home', './', '', 1, 3, 'Y', 'none'),
(50, 0, 'Tentang Kami', 'pages/tentang-kami', '', 2, 2, 'Y', 'none'),
(51, 50, 'Layanan', 'pages/layanan', '', 1, 2, 'Y', 'none'),
(52, 0, 'Indonesiaku', 'category/indonesiaku', '', 49, 2, 'Y', 'none'),
(53, 0, 'Motivasi', 'category/motivasi', '', 49, 2, 'Y', 'none'),
(54, 0, 'Hubungan', 'category/hubungan', '', 49, 2, 'Y', 'none'),
(55, 0, 'Sukses', 'category/sukses', '', 49, 2, 'Y', 'none'),
(56, 0, 'Galeri', 'album', '', 49, 2, 'Y', 'none'),
(57, 0, 'Kontak', 'contact', '', 49, 2, 'Y', 'none'),
(58, 0, 'About Us', 'pages/tentang-kami', '', 2, 3, 'Y', 'none'),
(59, 58, 'Services', 'pages/layanan', '', 1, 3, 'Y', 'none'),
(60, 0, 'Indonesiaku', 'category/indonesiaku', '', 50, 3, 'Y', 'none'),
(61, 0, 'Motivation', 'category/motivasi', '', 50, 3, 'Y', 'none'),
(62, 0, 'Relationship', 'category/hubungan', '', 50, 3, 'Y', 'none'),
(63, 0, 'Success', 'category/sukses', '', 50, 3, 'Y', 'none'),
(64, 0, 'Gallery', 'album', '', 50, 3, 'Y', 'none'),
(65, 0, 'Contact', 'contact', '', 50, 3, 'Y', 'none');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_group`
--

CREATE TABLE `menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_group`
--

INSERT INTO `menu_group` (`id`, `title`) VALUES
(1, 'Dashboard'),
(2, 'id'),
(3, 'gb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth`
--

CREATE TABLE `oauth` (
  `id_oauth` int(5) NOT NULL,
  `oauth_type` varchar(10) NOT NULL,
  `oauth_key` text NOT NULL,
  `oauth_secret` text NOT NULL,
  `oauth_id` varchar(100) NOT NULL,
  `oauth_user` varchar(100) NOT NULL,
  `oauth_token1` text NOT NULL,
  `oauth_token2` text NOT NULL,
  `oauth_fbtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `oauth`
--

INSERT INTO `oauth` (`id_oauth`, `oauth_type`, `oauth_key`, `oauth_secret`, `oauth_id`, `oauth_user`, `oauth_token1`, `oauth_token2`, `oauth_fbtype`) VALUES
(1, 'facebook', '1379700562291163', '8fecea44bbbca74ce2cc1f0129f004bf', '', '', '', '', ''),
(2, 'twitter', 'uPXZGTJI2xcMcviHJdZxw', '9Jacq3buOEY39dWgCnuREbe5vMUnuDLP86daS7b1uw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id_pages` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id_pages`, `seotitle`, `picture`, `active`) VALUES
(1, 'tentang-kami', '', 'Y'),
(2, 'layanan', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages_description`
--

CREATE TABLE `pages_description` (
  `id_pages_description` int(5) NOT NULL,
  `id_pages` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages_description`
--

INSERT INTO `pages_description` (`id_pages_description`, `id_pages`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Tentang Kami', '&lt;p&gt;PopojiCMS adalah Content Management System yang dibuat dengan konsep yang sangat menarik dan mudah untuk digunakan. PopojiCMS dibuat dengan tampilan responsive dengan base bootstarp dan selain itu juga dilengkapi dengan banyak plugin jQuery.&lt;br /&gt;&lt;br /&gt;PopojiCMS dibangun di atas dasar OOP tetapi tetap tidak menghilangkan rasa native-nya, sehingga developer awam pun bisa dengan mudah menggunakannya. Semoga PopojiCMS dapat menjawab semua kebutuhan Anda tentang web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terima kasih,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(2, 1, 2, 'About Us', '&lt;p&gt;PopojiCMS is a Content Management System that is made with a very interesting concept and easy to use. PopojiCMS made its appearance bootstarp responsive to the base and it is also equipped with a lot of jQuery plugins.&lt;br /&gt;&lt;br /&gt;PopojiCMS built on a foundation of OOP, but still does not eliminate its native flavor, so the developer can easily to use. Hopefully PopojiCMS can answer all your needs on the web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Thank you,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(3, 2, 1, 'Layanan', '&lt;p&gt;PopojiCMS telah berkembang menjadi CMS besar selama 2 tahun terakhir ini, berbagai masukan dan perbaikan sana sini telah menjadikan PopojiCMS siap menjawab kebutuhan web Anda, dukungan komunitas yang luas dan tentunya keamanan web yang handal siap Anda dapatkan.&lt;br /&gt;&lt;br /&gt;Dengan dilengkapi oleh jQuery dan bootstrap, PopojiCMS tampil lebih hidup menghadirkan fitur yang tidak terbayangkan sebelumnya.&lt;br /&gt;&lt;br /&gt; PopojiCMS dibuat dengan tampilan responsive sehingga bisa dibuka pada ukuran layar manapun dan kapanpun.&lt;br /&gt;PopojiCMS didesain dengan tampilan modern yang cantik sehingga menarik pengguna web untuk selalu berkunjung.&lt;br /&gt;PopojiCMS dibuat dengan konsep OOP dengan rasa native sehingga developer awampun bisa mengcustom dengan mudah rasa webnya.&lt;/p&gt;'),
(4, 2, 2, 'Services', '&lt;p&gt;PopojiCMS has developed into a major CMS over the past 2 years, a variety of input and improvements here and there have made PopojiCMS ready to answer the needs of your web, broad community support and a reliable web security course is ready you get.&lt;br /&gt;&lt;br /&gt;With furnished by jQuery and Bootstrap, PopojiCMS more vivid brings the features previously unimaginable.&lt;br /&gt;&lt;br /&gt;PopojiCMS made its appearance responsive so that it can be opened on the screen size anytime and anywhere.&lt;br /&gt;PopojiCMS designed with a modern look that is beautiful that attract web users to always visit.&lt;br /&gt;PopojiCMS made with OOP concepts with native flavors so that developers can custom easily its flavor.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id_post` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `publishdate` datetime NOT NULL,
  `editor` int(5) NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `headline` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `picture` varchar(255) NOT NULL,
  `picture_description` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_category`
--

CREATE TABLE `post_category` (
  `id_post_category` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_description`
--

CREATE TABLE `post_description` (
  `id_post_description` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_gallery`
--

CREATE TABLE `post_gallery` (
  `id_post_gallery` int(5) NOT NULL,
  `id_post` int(5) NOT NULL DEFAULT 0,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `groups` varchar(50) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `groups`, `options`, `value`) VALUES
(1, 'general', 'web_name', 'SMK Bina Nusantara'),
(2, 'general', 'web_url', 'http://localhost/popojicms'),
(3, 'general', 'web_meta', 'Smk Bina Nusantara Official'),
(4, 'general', 'web_keyword', 'popojicms buat sendiri rasa webmu'),
(5, 'general', 'web_owner', 'PopojiCMS'),
(6, 'general', 'email', 'admin@smknusantara.com'),
(7, 'general', 'telephone', '000-0000-0000'),
(8, 'general', 'fax', '000-0000-0000'),
(9, 'general', 'address', '&lt;strong&gt;Headquarters:&lt;/strong&gt;&lt;br&gt;\n795 Folsom Ave, Suite 600&lt;br&gt;\nSan Francisco, CA 94107'),
(10, 'general', 'geocode', 'latitude: -6.1753871, longitude: 106.8249641,'),
(11, 'image', 'favicon', 'favicon.png'),
(12, 'image', 'logo', 'logo.png'),
(13, 'image', 'img_medium', '640x480'),
(14, 'local', 'country', 'Indonesia'),
(15, 'local', 'region_state', 'Sulawesi Utara'),
(16, 'local', 'timezone', 'Pacific/Midway'),
(17, 'config', 'maintenance', 'N'),
(18, 'config', 'member_registration', 'N'),
(19, 'config', 'comment', 'N'),
(20, 'config', 'item_per_page', '5'),
(21, 'config', 'google_analytics', ''),
(22, 'config', 'recaptcha_sitekey', '6LckEgETAAAAAPdqrQSY_boMDLZRL1vpkAatVqKf'),
(23, 'config', 'recaptcha_secretkey', '6LckEgETAAAAAHqx4VFD4zNL96P9UEikD8BHfT28'),
(24, 'mail', 'mail_protocol', 'Mail'),
(25, 'mail', 'mail_hostname', ''),
(26, 'mail', 'mail_username', ''),
(27, 'mail', 'mail_password', ''),
(28, 'mail', 'mail_port', ''),
(29, 'config', 'permalink', 'slug/post-title'),
(30, 'config', 'slug_permalink', 'detailpost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe`
--

CREATE TABLE `subscribe` (
  `id_subscribe` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tag_seo` varchar(100) NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `title`, `tag_seo`, `count`) VALUES
(1, 'indonesia', 'indonesia', 8),
(2, 'wisata religi', 'wisata-religi', 5),
(3, 'toleransi beragama', 'toleransi-beragama', 5),
(4, 'manado', 'manado', 3),
(5, 'wisata manado', 'wisata-manado', 3),
(6, 'sulawesi utara', 'sulawesi-utara', 3),
(7, 'startup', 'startup', 6),
(8, 'impian', 'impian', 3),
(9, 'usaha kecil', 'usaha-kecil', 3),
(10, 'bisnis', 'bisnis', 3),
(11, 'cowok', 'cowok', 3),
(12, 'pendamping', 'pendamping', 6),
(13, 'cewek', 'cewek', 3),
(14, 'ginsul', 'ginsul', 3),
(15, 'sayang', 'sayang', 3),
(16, 'sukses', 'sukses', 3),
(17, 'tips sukses', 'tips-sukses', 3),
(18, 'edukasi anak', 'edukasi-anak', 4),
(19, 'keuangan', 'keuangan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `theme`
--

INSERT INTO `theme` (`id_theme`, `title`, `author`, `folder`, `active`) VALUES
(1, 'Chingsy', 'PopojiCMS', 'chingsy', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `traffic`
--

CREATE TABLE `traffic` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `traffic`
--

INSERT INTO `traffic` (`ip`, `browser`, `os`, `platform`, `country`, `city`, `date`, `hits`, `online`) VALUES
('127.0.0.1', 'Firefox', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Windows', '', '', '2019-08-26', 2, '1566880456');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '2',
  `block` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `forget_key` varchar(100) DEFAULT NULL,
  `locktype` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `bio`, `picture`, `level`, `block`, `id_session`, `tgl_daftar`, `forget_key`, `locktype`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Super Administrator', 'admin@smknusantara.com', '000-0000-0000', 'No matter how exciting or significant a person\'s life is, a poorly written biography will make it seem like a snore. On the other hand, a good biographer can draw insight from an ordinary life-because they recognize that even the most exciting life is an ordinary life! After all, a biography isn\'t supposed to be a collection of facts assembled in chronological order; it\'s the biographer\'s interpretation of how that life was different and important.', '', '1', 'N', 'rn05ik5v37k1k3q8mb94t0pvc8', '2019-08-26', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `menu` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`, `title`, `role`, `menu`) VALUES
(1, 'superadmin', 'Super Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1),
(2, 'admin', 'Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"1\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(3, 'manager', 'Manager', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(4, 'member', 'Member', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"component\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"contact\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"menumanager\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"oauth\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"user\",\"create\":\"0\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`id_category_description`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id_oauth`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indeks untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  ADD PRIMARY KEY (`id_pages_description`);

--
-- Indeks untuk tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indeks untuk tabel `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id_post_category`);

--
-- Indeks untuk tabel `post_description`
--
ALTER TABLE `post_description`
  ADD PRIMARY KEY (`id_post_description`);

--
-- Indeks untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  ADD PRIMARY KEY (`id_post_gallery`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id_subscribe`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category_description`
--
ALTER TABLE `category_description`
  MODIFY `id_category_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `component`
--
ALTER TABLE `component`
  MODIFY `id_component` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id_oauth` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id_pages` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  MODIFY `id_pages_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id_post_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_description`
--
ALTER TABLE `post_description`
  MODIFY `id_post_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  MODIFY `id_post_gallery` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id_subscribe` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `popojicmsmaster`
--
CREATE DATABASE IF NOT EXISTS `popojicmsmaster` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `popojicmsmaster`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `title`, `seotitle`, `active`) VALUES
(1, 'Pure', 'pure', 'Y'),
(2, 'Plain', 'plain', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `id_parent`, `seotitle`, `picture`, `active`) VALUES
(1, 0, 'indonesiaku', '', 'Y'),
(2, 0, 'motivasi', '', 'Y'),
(3, 0, 'hubungan', '', 'Y'),
(4, 0, 'sukses', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_description`
--

CREATE TABLE `category_description` (
  `id_category_description` int(5) NOT NULL,
  `id_category` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category_description`
--

INSERT INTO `category_description` (`id_category_description`, `id_category`, `id_language`, `title`) VALUES
(1, 1, 1, 'Indonesiaku'),
(2, 1, 2, 'My Indonesia'),
(3, 2, 1, 'Motivasi'),
(4, 2, 2, 'Motivation'),
(5, 3, 1, 'Hubungan'),
(6, 3, 2, 'Relationship'),
(7, 4, 1, 'Sukses'),
(8, 4, 2, 'Success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `id_post` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id_comment`, `id_parent`, `id_post`, `name`, `email`, `url`, `comment`, `date`, `time`, `active`, `status`) VALUES
(1, 0, 8, 'Jenuar Dalapang', 'djenuar@gmail.com', '', 'Edukasi keuangan terhadap anak memang penting sejak dini', '2016-07-28', '12:40:24', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `component`
--

CREATE TABLE `component` (
  `id_component` int(5) NOT NULL,
  `component` varchar(100) NOT NULL,
  `type` enum('component','widget') NOT NULL DEFAULT 'component',
  `datetime` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `component`
--

INSERT INTO `component` (`id_component`, `component`, `type`, `datetime`, `active`) VALUES
(1, 'gallery', 'component', '2016-03-11 10:00:00', 'Y'),
(2, 'contact', 'component', '2016-03-11 10:00:00', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `title`, `content`, `picture`) VALUES
(1, 1, 'Coloration', '', 'coloration.jpg'),
(2, 2, 'Legs On Table', '', 'legs_on_table.jpg'),
(3, 1, 'Shop Counter', '', 'shop_counter.jpg'),
(4, 2, 'Work Desk', '', 'work_desk.jpg'),
(5, 1, 'City From Sky', '', 'city_from_sky.jpg'),
(6, 2, 'Traction', '', 'traction.jpg'),
(7, 1, 'Still Life White', '', 'still_life_white.jpg'),
(8, 2, 'Coffee In Heart', '', 'coffee_in_heart.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `id_language` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`id_language`, `title`, `code`, `active`) VALUES
(1, 'Indonesia', 'id', 'Y'),
(2, 'English', 'gb', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `target` varchar(10) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`, `target`) VALUES
(1, 0, 'dashboard', 'admin.php?mod=home', 'fa-home', 1, 1, 'Y', 'none'),
(2, 0, 'post', 'admin.php?mod=post', 'fa-book', 2, 1, 'Y', 'none'),
(3, 2, 'addnew', 'admin.php?mod=post&act=addnew', '', 2, 1, 'Y', 'none'),
(4, 2, 'allpost', 'admin.php?mod=post', '', 1, 1, 'Y', 'none'),
(5, 0, 'category', 'admin.php?mod=category', 'fa-tasks', 3, 1, 'Y', 'none'),
(6, 5, 'allcategory', 'admin.php?mod=category', '', 1, 1, 'Y', 'none'),
(7, 5, 'addnew', 'admin.php?mod=category&act=addnew', '', 2, 1, 'Y', 'none'),
(8, 0, 'tag', 'admin.php?mod=tag', 'fa-tags', 4, 1, 'Y', 'none'),
(9, 8, 'alltag', 'admin.php?mod=tag', '', 1, 1, 'Y', 'none'),
(19, 8, 'addnew', 'admin.php?mod=tag&act=addnew', '', 2, 1, 'Y', 'none'),
(20, 0, 'pages', 'admin.php?mod=pages', 'fa-file', 6, 1, 'Y', 'none'),
(21, 20, 'allpages', 'admin.php?mod=pages', '', 1, 1, 'Y', 'none'),
(22, 20, 'addnew', 'admin.php?mod=pages&act=addnew', '', 2, 1, 'Y', 'none'),
(23, 0, 'library', 'admin.php?mod=library', 'fa-picture-o', 7, 1, 'Y', 'none'),
(27, 0, 'setting', 'admin.php?mod=setting', 'fa-cog', 8, 1, 'Y', 'none'),
(28, 0, 'theme', 'admin.php?mod=theme', 'fa-desktop', 9, 1, 'Y', 'none'),
(29, 28, 'alltheme', 'admin.php?mod=theme', '', 1, 1, 'Y', 'none'),
(30, 28, 'addnew', 'admin.php?mod=theme&act=addnew', '', 2, 1, 'Y', 'none'),
(31, 0, 'menumanager', 'admin.php?mod=menumanager', 'fa-sitemap', 10, 1, 'Y', 'none'),
(32, 0, 'component', 'admin.php?mod=component', 'fa-puzzle-piece', 11, 1, 'Y', 'none'),
(33, 32, 'allcomponent', 'admin.php?mod=component', '', 1, 1, 'Y', 'none'),
(34, 32, 'addnew', 'admin.php?mod=component&act=addnew', '', 2, 1, 'Y', 'none'),
(42, 0, 'comment', 'admin.php?mod=comment', 'fa-comments', 5, 1, 'Y', 'none'),
(43, 32, 'Galeri', 'admin.php?mod=gallery', '', 3, 1, 'Y', 'none'),
(44, 32, 'Kontak', 'admin.php?mod=contact', '', 4, 1, 'Y', 'none'),
(45, 0, 'user', 'admin.php?mod=user', 'fa-group', 12, 1, 'Y', 'none'),
(46, 45, 'alluser', 'admin.php?mod=user', '', 1, 1, 'Y', 'none'),
(47, 45, 'addnew', 'admin.php?mod=user&act=addnew', '', 2, 1, 'Y', 'none'),
(48, 0, 'Beranda', './', '', 1, 2, 'Y', 'none'),
(49, 0, 'Home', './', '', 1, 3, 'Y', 'none'),
(50, 0, 'Tentang Kami', 'pages/tentang-kami', '', 2, 2, 'Y', 'none'),
(51, 50, 'Layanan', 'pages/layanan', '', 1, 2, 'Y', 'none'),
(52, 0, 'Indonesiaku', 'category/indonesiaku', '', 49, 2, 'Y', 'none'),
(53, 0, 'Motivasi', 'category/motivasi', '', 49, 2, 'Y', 'none'),
(54, 0, 'Hubungan', 'category/hubungan', '', 49, 2, 'Y', 'none'),
(55, 0, 'Sukses', 'category/sukses', '', 49, 2, 'Y', 'none'),
(56, 0, 'Galeri', 'album', '', 49, 2, 'Y', 'none'),
(57, 0, 'Kontak', 'contact', '', 49, 2, 'Y', 'none'),
(58, 0, 'About Us', 'pages/tentang-kami', '', 2, 3, 'Y', 'none'),
(59, 58, 'Services', 'pages/layanan', '', 1, 3, 'Y', 'none'),
(60, 0, 'Indonesiaku', 'category/indonesiaku', '', 50, 3, 'Y', 'none'),
(61, 0, 'Motivation', 'category/motivasi', '', 50, 3, 'Y', 'none'),
(62, 0, 'Relationship', 'category/hubungan', '', 50, 3, 'Y', 'none'),
(63, 0, 'Success', 'category/sukses', '', 50, 3, 'Y', 'none'),
(64, 0, 'Gallery', 'album', '', 50, 3, 'Y', 'none'),
(65, 0, 'Contact', 'contact', '', 50, 3, 'Y', 'none');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_group`
--

CREATE TABLE `menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_group`
--

INSERT INTO `menu_group` (`id`, `title`) VALUES
(1, 'Dashboard'),
(2, 'id'),
(3, 'gb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth`
--

CREATE TABLE `oauth` (
  `id_oauth` int(5) NOT NULL,
  `oauth_type` varchar(10) NOT NULL,
  `oauth_key` text NOT NULL,
  `oauth_secret` text NOT NULL,
  `oauth_id` varchar(100) NOT NULL,
  `oauth_user` varchar(100) NOT NULL,
  `oauth_token1` text NOT NULL,
  `oauth_token2` text NOT NULL,
  `oauth_fbtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `oauth`
--

INSERT INTO `oauth` (`id_oauth`, `oauth_type`, `oauth_key`, `oauth_secret`, `oauth_id`, `oauth_user`, `oauth_token1`, `oauth_token2`, `oauth_fbtype`) VALUES
(1, 'facebook', '1379700562291163', '8fecea44bbbca74ce2cc1f0129f004bf', '', '', '', '', ''),
(2, 'twitter', 'uPXZGTJI2xcMcviHJdZxw', '9Jacq3buOEY39dWgCnuREbe5vMUnuDLP86daS7b1uw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id_pages` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id_pages`, `seotitle`, `picture`, `active`) VALUES
(1, 'tentang-kami', '', 'Y'),
(2, 'layanan', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages_description`
--

CREATE TABLE `pages_description` (
  `id_pages_description` int(5) NOT NULL,
  `id_pages` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages_description`
--

INSERT INTO `pages_description` (`id_pages_description`, `id_pages`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Tentang Kami', '&lt;p&gt;PopojiCMS adalah Content Management System yang dibuat dengan konsep yang sangat menarik dan mudah untuk digunakan. PopojiCMS dibuat dengan tampilan responsive dengan base bootstarp dan selain itu juga dilengkapi dengan banyak plugin jQuery.&lt;br /&gt;&lt;br /&gt;PopojiCMS dibangun di atas dasar OOP tetapi tetap tidak menghilangkan rasa native-nya, sehingga developer awam pun bisa dengan mudah menggunakannya. Semoga PopojiCMS dapat menjawab semua kebutuhan Anda tentang web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terima kasih,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(2, 1, 2, 'About Us', '&lt;p&gt;PopojiCMS is a Content Management System that is made with a very interesting concept and easy to use. PopojiCMS made its appearance bootstarp responsive to the base and it is also equipped with a lot of jQuery plugins.&lt;br /&gt;&lt;br /&gt;PopojiCMS built on a foundation of OOP, but still does not eliminate its native flavor, so the developer can easily to use. Hopefully PopojiCMS can answer all your needs on the web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Thank you,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(3, 2, 1, 'Layanan', '&lt;p&gt;PopojiCMS telah berkembang menjadi CMS besar selama 2 tahun terakhir ini, berbagai masukan dan perbaikan sana sini telah menjadikan PopojiCMS siap menjawab kebutuhan web Anda, dukungan komunitas yang luas dan tentunya keamanan web yang handal siap Anda dapatkan.&lt;br /&gt;&lt;br /&gt;Dengan dilengkapi oleh jQuery dan bootstrap, PopojiCMS tampil lebih hidup menghadirkan fitur yang tidak terbayangkan sebelumnya.&lt;br /&gt;&lt;br /&gt; PopojiCMS dibuat dengan tampilan responsive sehingga bisa dibuka pada ukuran layar manapun dan kapanpun.&lt;br /&gt;PopojiCMS didesain dengan tampilan modern yang cantik sehingga menarik pengguna web untuk selalu berkunjung.&lt;br /&gt;PopojiCMS dibuat dengan konsep OOP dengan rasa native sehingga developer awampun bisa mengcustom dengan mudah rasa webnya.&lt;/p&gt;'),
(4, 2, 2, 'Services', '&lt;p&gt;PopojiCMS has developed into a major CMS over the past 2 years, a variety of input and improvements here and there have made PopojiCMS ready to answer the needs of your web, broad community support and a reliable web security course is ready you get.&lt;br /&gt;&lt;br /&gt;With furnished by jQuery and Bootstrap, PopojiCMS more vivid brings the features previously unimaginable.&lt;br /&gt;&lt;br /&gt;PopojiCMS made its appearance responsive so that it can be opened on the screen size anytime and anywhere.&lt;br /&gt;PopojiCMS designed with a modern look that is beautiful that attract web users to always visit.&lt;br /&gt;PopojiCMS made with OOP concepts with native flavors so that developers can custom easily its flavor.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id_post` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `publishdate` datetime NOT NULL,
  `editor` int(5) NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `headline` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `picture` varchar(255) NOT NULL,
  `picture_description` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`id_post`, `seotitle`, `tag`, `date`, `time`, `publishdate`, `editor`, `active`, `headline`, `comment`, `picture`, `picture_description`, `hits`) VALUES
(1, 'destinasi-wisata-tentang-toleransi-beragama-di-indonesia', 'indonesia,wisata-religi,toleransi-beragama', '2016-03-31', '10:06:17', '2016-03-31 10:06:17', 1, 'Y', 'Y', 'Y', 'bukit-kasih-kanonang.jpg', '', 17),
(2, 'wisata-alam-manado-maladewa-nya-indonesia', 'indonesia,manado,wisata-manado,sulawesi-utara', '2016-03-31', '06:34:27', '2016-03-31 06:34:27', 1, 'Y', 'Y', 'Y', 'pulau-nain.jpg', '', 4),
(3, 'bangun-lebih-pagi-agar-bisa-merealisasikan-startup-impianmu', 'startup,impian', '2016-03-31', '04:43:27', '2016-03-31 04:43:27', 1, 'Y', 'Y', 'Y', 'trik-bagun-lebih-pagi.jpg', '', 15),
(4, '5-alasan-kenapa-kamu-harus-membangun-usaha-kecil-bukan-startup', 'startup,bisnis,usaha-kecil', '2016-03-31', '08:54:26', '2016-03-31 08:54:26', 1, 'Y', 'N', 'Y', 'membangun-usaha-kecil.jpg', '', 5),
(5, 'cowok-cuek-justru-tepat-jadi-pendampingmu', 'cowok,pendamping', '2016-03-31', '05:04:09', '2016-03-31 05:04:09', 1, 'Y', 'Y', 'Y', 'cowok-cuek.jpg', '', 12),
(6, 'cewek-bergigi-gingsul-emang-layak-disayang', 'cewek,ginsul,sayang,pendamping', '2016-03-31', '10:12:10', '2016-03-31 10:12:10', 1, 'Y', 'N', 'Y', 'cewek-bergigi-gingsul.jpg', '', 8),
(7, 'ingin-sukses-terapkan-7-tips-sukses-oprah-winfrey', 'sukses,tips-sukses', '2016-03-31', '03:20:42', '2016-03-31 03:20:42', 1, 'Y', 'N', 'Y', 'tips-sukses.jpg', '', 4),
(8, '7-ide-beri-edukasi-keuangan-kepada-anak', 'edukasi-anak,keuangan', '2016-03-31', '01:32:45', '2016-03-31 01:32:45', 1, 'Y', 'Y', 'Y', 'edukasi-anak.jpg', '', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_category`
--

CREATE TABLE `post_category` (
  `id_post_category` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_category`
--

INSERT INTO `post_category` (`id_post_category`, `id_post`, `id_category`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_description`
--

CREATE TABLE `post_description` (
  `id_post_description` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_description`
--

INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Destinasi Wisata Tentang Toleransi Beragama di Indonesia', '&lt;p&gt;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan. Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.&lt;br /&gt;&lt;br /&gt;Tapi sebenarnya, toleransi itu masih ada kok. Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.&lt;br /&gt;&lt;br /&gt;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam. Di mana sajakah itu? Yuk, kita telusuri satu persatu.&lt;br /&gt;&lt;br /&gt;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.&lt;br /&gt;&lt;br /&gt;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral. Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya. Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno. Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.&lt;br /&gt;&lt;br /&gt;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya. Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.&lt;br /&gt;&lt;br /&gt;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia. Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara. Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien. Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.&lt;br /&gt;&lt;br /&gt;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami` yang bersanding berdampingan.&lt;br /&gt;&lt;br /&gt;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun. Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih dari 1 abad. Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat. Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.&lt;br /&gt;&lt;br /&gt;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.&lt;br /&gt;&lt;br /&gt;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik. Kenapa? Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia. Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa. Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan. Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.&lt;br /&gt;&lt;br /&gt;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl. Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian. Yang menjadikan tempat ini unik adalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no. 222.&lt;br /&gt;&lt;br /&gt;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.&lt;br /&gt;&lt;br /&gt;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama. Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia. Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.&lt;br /&gt;&lt;br /&gt;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung, kacang, dan telur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari content Hipwee oleh Reza Akhmad&lt;/p&gt;'),
(2, 1, 2, 'Sightseeing About Religious Tolerance in Indonesia', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan.&quot;&gt;Differences in belief in our country often leads to an unpleasant incident. &lt;/span&gt;&lt;span title=&quot;Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.\r\n\r\n&quot;&gt;Of the forced closure of places of worship to attack minorities home, internet and print media is filled with negative news which makes us pessimistic about the future of tolerance of religious life in Indonesia.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tapi sebenarnya, toleransi itu masih ada kok.&quot;&gt;But in fact, tolerance is still there anyway. &lt;/span&gt;&lt;span title=&quot;Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.\r\n\r\n&quot;&gt;At least the physical remains can you see the beauty of six religious tourist destinations in this article.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam.&quot;&gt;This time, the author will tell you all the places in Indonesia that you can go to prove that different is beautiful, if you think about it more deeply. &lt;/span&gt;&lt;span title=&quot;Di mana sajakah itu?&quot;&gt;Where are they? &lt;/span&gt;&lt;span title=&quot;Yuk, kita telusuri satu persatu.\r\n\r\n&quot;&gt;Let us examine one by one.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.\r\n\r\n&quot;&gt;1. At the center of the capital, two religious harmony shown by the Istiqlal Mosque and Jakarta Cathedral were built side by side.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral.&quot;&gt;One of the symbols of inter-religious harmony which is located in the center of the capital Jakarta was the Istiqlal Mosque and Cathedral Church. &lt;/span&gt;&lt;span title=&quot;Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya.&quot;&gt;They were built side by side, standing complement one another. &lt;/span&gt;&lt;span title=&quot;Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno.&quot;&gt;Cathedral Church itself was built since 1891 and its construction was stopped due to lack of funds in 1892. The Istiqlal Mosque is located not far from the Cathedral Church of development initiated by the President. &lt;/span&gt;&lt;span title=&quot;Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.\r\n\r\n&quot;&gt;The mosque itself was inaugurated on February 22, 1978. The location of the mosque adjoining the cathedral is chosen to symbolize the spirit of brotherhood, unity and religious tolerance corresponding values contained in Pancasila.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya.&quot;&gt;2. Jakarta also has evidence of other religious harmony. &lt;/span&gt;&lt;span title=&quot;Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.\r\n\r\n&quot;&gt;Examples Masjid Al-Muqarrabien and Christian Gospel Church in North Jakarta.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia.&quot;&gt;Jakarta still have other places that prove the existence of religious tolerance in Indonesia. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara.&quot;&gt;Two places of worship which became a symbol of harmony is located in Tanjung Priok, North Jakarta. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien.&quot;&gt;Two places of worship are Church of the Sangihe Talaud Mahanaim Christian Gospel and Al-Muqarrabien. &lt;/span&gt;&lt;span title=&quot;Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.\r\n\r\n&quot;&gt;Although built for two different beliefs, the two places of worship is only separated by a wall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami&amp;#96; yang bersanding berdampingan.\r\n\r\n&quot;&gt;3. In Malang, you can find GPIB Immanuel and Grand Jami` are coupled together.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun.&quot;&gt;In Malang, there is also a place of worship two buildings side by side, the two places of worship stood together for over 100 years. &lt;/span&gt;&lt;span title=&quot;Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih&quot;&gt;The location is both a place of worship is located in the heart of Malang, exactly in front of the town square, a church which was built in 1861 while the mosque was built in 1875, although only coincide separated by an insurance office in the middle, there was never any quarrels or squabbles over &lt;/span&gt;&lt;span title=&quot;dari 1 abad.&quot;&gt;from the 1st century. &lt;/span&gt;&lt;span title=&quot;Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat.&quot;&gt;Both administrators places of worship often work together and be tolerant with each other, when the celebration of Christmas arrived, the young man from the Ansar Ansar Barisan Multipurpose (Banser) and Youth Masjid help guard the security and the church parking lot. &lt;/span&gt;&lt;span title=&quot;Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.\r\n\r\n&quot;&gt;So even when the Id prayers arrived, the congregation could until spilling outside the mosque, and even some prayers at the front and side of the church.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.\r\n\r\n&quot;&gt;4. Complex Puja Mandala is evidence of religious harmony in Bali.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik.&quot;&gt;The complex houses of worship located in Nusa Dua, Bali is quite unique and interesting. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia.&quot;&gt;Because this is where the building is situated worship five religions in Indonesia are located in one complex, perhaps the only one in the world. &lt;/span&gt;&lt;span title=&quot;Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa.&quot;&gt;The location is in the hill region Kampial, which we used to skip if you want bervakansi to tourist areas Garuda Wisnu Kencana (GWK) of Tanjung Benoa. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan.&quot;&gt;We can see five religious buildings that line, starting from the mosque, the Catholic Church, Temple, Protestant Church, and Pura, maybe that&#039;s why this place is called by the name of Puja Mandala - which means room for worship. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.\r\n\r\n&quot;&gt;We can see religious tolerance when worship is in progress because every religion have a regular schedule of different worship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.\r\n\r\n&quot;&gt;5. GKL Joyodiningratan Building and Masjid Al-Hikmah sharing wall in Solo.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl.&quot;&gt;For those of you who live in Solo, may already be familiar with both the building located at Jl. &lt;/span&gt;&lt;span title=&quot;Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian.&quot;&gt;Gatot Subroto, major roads that divides the city of Solo southern half. &lt;/span&gt;&lt;span title=&quot;Yang menjadikan tempat ini unikadalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no.&quot;&gt;What makes this place unique is building Java Christian Church Joyodiningratan and Masjid Al-Hikmah are close and share a wall, more unique that the address of the two buildings is the same, namely at Jalan Gatot Subroto no. &lt;/span&gt;&lt;span title=&quot;222.\r\n\r\n&quot;&gt;222.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.\r\n\r\n&quot;&gt;6. In Minahasa, Tugu teaching of religion in Bukit Kasih 5 Kanonang become a symbol of the beauty of differences in beliefs.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama.&quot;&gt;Monument located in Bukit Kasih Kanonang, Minahasa, North Sulawesi is also popularly known as religious tolerance travel. &lt;/span&gt;&lt;span title=&quot;Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia.&quot;&gt;Points that can be addressed with a journey time of 2 hours from the city of Manado has a tower with a height of 22 meters with five field side of each side sculpted reliefs symbol of five major religions in Indonesia. &lt;/span&gt;&lt;span title=&quot;Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.\r\n\r\n&quot;&gt;In addition, sites built on land measuring 4 hectares was established in 2002 and has 5 places of worship for different religions 5 around him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung,&quot;&gt;In this place you can learn that human beings must respect each other and love, you also have to climb the stairs as much as 2,435 steps, do not worry, a sense capekmu will be replaced with the beauty of the crater sulfur around the stairs, where the water used by people to cook corn, &lt;/span&gt;&lt;span title=&quot;kacang, dan telur.\r\n\r\n\r\n&quot;&gt;nuts, and eggs.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari content Hipwee oleh Reza Akhmad&quot;&gt;Taken from the content Hipwee by Reza Akhmad&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(3, 2, 1, 'Wisata Alam Manado, Maladewa-nya Indonesia', '&lt;p&gt;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal. Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi. Apa saja sih 9 destinasi ini?&lt;br /&gt;&lt;br /&gt;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini&lt;br /&gt;&lt;br /&gt;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini. Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung. Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado. Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.&lt;br /&gt;&lt;br /&gt;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado. Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi. Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini. Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.&lt;br /&gt;&lt;br /&gt;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;Aer&quot; -- bukan &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan. Orang Manado bilang &quot;aer&quot;, bukan &quot;air&quot;, dan entah bagaimana asal-usulnya pantai ini dinamakan &quot;pantai aer&quot;. Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara. Hanya saja, pantai ini terletak di desa yang berbeda.&lt;br /&gt;&lt;br /&gt;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa. Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.&lt;br /&gt;&lt;br /&gt;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan. Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini. So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.&lt;br /&gt;&lt;br /&gt;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian&lt;br /&gt;&lt;br /&gt;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun? Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun. Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.&lt;br /&gt;&lt;br /&gt;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan. Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana. Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon. Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.&lt;br /&gt;&lt;br /&gt;Jalan awal memang berupa anak tangga yang agak terawat. Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.&lt;br /&gt;&lt;br /&gt;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa&lt;br /&gt;&lt;br /&gt;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas? Pergi saja ke Gunung Soputan. Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung. Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan. Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.&lt;br /&gt;&lt;br /&gt;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;nggembel&quot; atau dalam kamus bahasa Indonesianya numpang gratis di kampung terakhir sebelum pos pendakian. Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II. Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya. Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.&lt;br /&gt;&lt;br /&gt;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;leher unta&quot;&lt;br /&gt;&lt;br /&gt;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan. Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang. Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai. Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat. Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.&lt;br /&gt;&lt;br /&gt;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar. Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang. Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.&lt;br /&gt;&lt;br /&gt;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang&lt;br /&gt;&lt;br /&gt;Indonesia adalah negeri dengan ribuan pulau kecil. Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga. Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.&lt;br /&gt;&lt;br /&gt;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu. Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;Selamat Datang di Pulau Lihaga, Perombakan Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas. Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.&lt;br /&gt;&lt;br /&gt;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini. Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.&lt;br /&gt;&lt;br /&gt;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!&lt;br /&gt;&lt;br /&gt;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini. Peringatan berupa spanduk bergambar tengkorak&amp;nbsp; warna merah &quot;Dilarang mendaki kawah gunung lokon&quot; sepertinya kurang diperhatikan oleh para pendaki. Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.&lt;br /&gt;&lt;br /&gt;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal. Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam. Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.&lt;br /&gt;&lt;br /&gt;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa&lt;br /&gt;&lt;br /&gt;Pernahkan kamu pergi ke Maladewa? Wah mungkin terlalu jauh ya buat jalan-jalan ke sana. Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa. Orang Bajo Kampung Nain menyebutnya &quot;bungin pasir timbul&quot; yakni fenomena surutnya air laut secara maksimal ketika bulan purnama atau bulan mati.&lt;br /&gt;&lt;br /&gt;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;Maladewa-nya Indonesia&quot;. Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang. Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.&lt;br /&gt;&lt;br /&gt;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&amp;nbsp; Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.&lt;br /&gt;&lt;br /&gt;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta&lt;br /&gt;&lt;br /&gt;Bukan cuma manusia yang punya hati, bumipun punya. Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara. Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.&lt;br /&gt;&lt;br /&gt;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau. Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi. Sebagai tanda perbatasanNKRI, di pulau ini dibangun sebuah monumen bernama &quot;Monumen Kedaulatan Negara Kesatuan Republik Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat. Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat. Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak. Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat. &lt;br /&gt;&lt;br /&gt;Wah, siapa sangka? Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Qobul Pamuji&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(4, 2, 2, 'Nature Tour of Manado, Indonesia Maldives', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal.&quot;&gt;When wander or stroll in the city of Manado, you&#039;ll want to explore the natural beauty of the famous. &lt;/span&gt;&lt;span title=&quot;Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi.&quot;&gt;Well, among an assortment of natural beauty, there are 9 destinations that most makes you miss even wanted to return to Manado again. &lt;/span&gt;&lt;span title=&quot;Apa saja sih 9 destinasi ini?\r\n\r\n&quot;&gt;What the hell 9 this destination?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini\r\n\r\n&quot;&gt;1. Pall Coast, destination hits that make you linger here&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini.&quot;&gt;Formerly the hell is so deserted beach, was so lonely maybe only three or four people who visit this beach. &lt;/span&gt;&lt;span title=&quot;Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung.&quot;&gt;White sand was very soft and clean, with no trace of footprints visitors. &lt;/span&gt;&lt;span title=&quot;Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado.&quot;&gt;However, after some photos circulating on sosmed Pall Beach, this beach suddenly became a Top Hits new tourist destinations for residents of Manado. &lt;/span&gt;&lt;span title=&quot;Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.\r\n\r\n&quot;&gt;When the weekend, we often see congestion up to one kilometer to the entrance of Pall Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado.&quot;&gt;It is in the village of Marinsow, District Likupang East, North Minahasa Regency, not far from downtown Manado. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi.&quot;&gt;Not more than two hours, you can reach this beach with private vehicle. &lt;/span&gt;&lt;span title=&quot;Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini.&quot;&gt;Blue water, long shoreline and a variety of games that exist to make visitors linger on this beach. &lt;/span&gt;&lt;span title=&quot;Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.\r\n\r\n&quot;&gt;Well if you&#039;ve been here once, will definitely miss when you can stroll to the beach for the second time with my friends.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;&gt;2. Turkish Aer Pulisan, because the Manado bilangnya &quot;Aer&quot; - instead of &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan.&quot;&gt;Not far from the beach Pall, you can enjoy the natural attractions Pulisan Aer Beach. &lt;/span&gt;&lt;span title=&quot;Orang Manado bilang &quot;&gt;Manado people say &quot;aer&quot;, instead of &quot;water&quot;, and somehow its origins this beach called &quot;beach aer&quot;. &lt;/span&gt;&lt;span title=&quot;Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara.&quot;&gt;Aer beach is still located in the same district with Pall coast, namely North Minahasa regency. &lt;/span&gt;&lt;span title=&quot;Hanya saja, pantai ini terletak di desa yang berbeda.\r\n\r\n&quot;&gt;Only, this beach is located in a different village.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa.&quot;&gt;Small caves on the beach this is a characteristic that makes it very different from other beaches in Minahasa. &lt;/span&gt;&lt;span title=&quot;Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.\r\n\r\n&quot;&gt;Needless out a lot of money, you just pay for a long-tail boat Rp15,000 to get to the cave of Aer Pulisan Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan.&quot;&gt;The place is also a favorite destination for Manado citizens or immigrants who want refreshing after so long tired with the work. &lt;/span&gt;&lt;span title=&quot;Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini.&quot;&gt;The waves were calm and the clear sea water, it is suitable for you who like snorkeling or just playing water at this beach. &lt;/span&gt;&lt;span title=&quot;So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.\r\n\r\n&quot;&gt;So, do not miss this beach to be recorded in the list tripmu if you&#039;re visiting or wander in Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian\r\n\r\n&quot;&gt;3. Niagara Tekaan telu, like rafting-raft upstream swim to the shore&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun?&quot;&gt;Harder Where the heck, climbing a mountain or a walk to a waterfall? &lt;/span&gt;&lt;span title=&quot;Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun.&quot;&gt;Maybe for some people, it is more difficult to climb the mountain from the waterfall. &lt;/span&gt;&lt;span title=&quot;Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.\r\n\r\n&quot;&gt;But briefly, jajal Niagara Tinoor first before absolutely sure that the roads to the waterfall is easy.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan.&quot;&gt;Niagara Tinoor, or often referred to as Niagara Tekaan telu, pick a track that is very difficult to conquer. &lt;/span&gt;&lt;span title=&quot;Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana.&quot;&gt;In addition because the terrain is teetering on the edge, contour slippery rocks and soil erosive make a special experience that will not be forgotten when you finally get there. &lt;/span&gt;&lt;span title=&quot;Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon.&quot;&gt;It is quite close to the city of Manado, which is in the village of Tinoor, Tomohon district. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.\r\n\r\n&quot;&gt;Not more than an hour you came to the entrance of this waterfall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jalan awal memang berupa anak tangga yang agak terawat.&quot;&gt;Road early risers indeed be somewhat maintained. &lt;/span&gt;&lt;span title=&quot;Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.\r\n\r\n&quot;&gt;But after passing through the jungle, you will feel the sensation wild and difficult terrain that will make you more and more challenged to quickly get to it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa\r\n\r\n&quot;&gt;4. Soputan, a mountain of a million people for the people of Minahasa&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas?&quot;&gt;You simply pengin camping set up small tents, streets relieve fatigue, or sing accompanied by guitars in the wild? &lt;/span&gt;&lt;span title=&quot;Pergi saja ke Gunung Soputan.&quot;&gt;Just go to Soputan. &lt;/span&gt;&lt;span title=&quot;Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung.&quot;&gt;Spacious camping area with gently sloping terrain is suitable for you novice climbers who want to experience the adventure first to climb the mountain. &lt;/span&gt;&lt;span title=&quot;Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan.&quot;&gt;High mountain mdl 1784 is located in the district of Kawangkoan. &lt;/span&gt;&lt;span title=&quot;Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.\r\n\r\n&quot;&gt;From the city of Manado may take two hours by road.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;&gt;There are unique things done by the climbers Minahasa, namely &quot;nggembel&quot; or in Indonesian language dictionary free ride at the last village before heading ascent. &lt;/span&gt;&lt;span title=&quot;Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II.&quot;&gt;This active volcano has two peaks namely Puncak Puncak Soputan Soputan I and II. &lt;/span&gt;&lt;span title=&quot;Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya.&quot;&gt;Generally, the climbers reach the summit I could just as Peak II has a vertical terrain, slippery and dangerous. &lt;/span&gt;&lt;span title=&quot;Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.\r\n\r\n&quot;&gt;Having reached the peak I, you can pose with your friends or write words for someone and then uploaded on sosmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;&gt;5. Mount Threshold, the only mountain that has a &quot;neck camel&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan.&quot;&gt;Talking about mountain in North Sulawesi&#039;s not enough to just get Soputan. &lt;/span&gt;&lt;span title=&quot;Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang.&quot;&gt;In District Boltim (Boolang Mongondow East) there is a mountain that had a camel&#039;s neck, the Mount Threshold. &lt;/span&gt;&lt;span title=&quot;Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai.&quot;&gt;The volcano is still has the same characteristics as Soputan, namely mild and gentle terrain. &lt;/span&gt;&lt;span title=&quot;Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat.&quot;&gt;Although this mountain is a mountain of dead, the fumes coming out of the crater of Mount Threshold enough to sting. &lt;/span&gt;&lt;span title=&quot;Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.\r\n\r\n&quot;&gt;Mountains with an altitude of 1,795 mdl is located not far from Lake Moat, so you&#039;re going to get to see the lake from the top of the mountain Moat.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar.&quot;&gt;Extensive plantation residents along a hiking trail, trekking makes you more beautiful and not boring because you&#039;re going to meet with farmers who were harvesting his crop for sale at the market. &lt;/span&gt;&lt;span title=&quot;Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang.&quot;&gt;Something interesting from this mountain is the natural contours of the neck in the form of a camel that extends above the crater sulfur. &lt;/span&gt;&lt;span title=&quot;Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.\r\n\r\n&quot;&gt;Green hills and white color sulfur soil is suitable for being the object of photography for you that hunting hobby.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang\r\n\r\n&quot;&gt;6. Lihaga island, deserted islands that make you not want to go home&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Indonesia adalah negeri dengan ribuan pulau kecil.&quot;&gt;Indonesia is a country with thousands of small islands. &lt;/span&gt;&lt;span title=&quot;Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga.&quot;&gt;Well, for you who were in Manado, do not miss this one little island its name Lihaga Island. &lt;/span&gt;&lt;span title=&quot;Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.\r\n\r\n&quot;&gt;Tanjung Serei in North Minahasa is the dock of the most recommended for you who pengin ngetrip to this island except for the place broad selection of passenger ships leased by fishermen are also provided quite a lot so you are free to choose whichever you want.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu.&quot;&gt;Passenger boat trip to the island of Tanjung Serei Lihaga takes about 30 minutes, with a rental fee of 700-800 thousand. &lt;/span&gt;&lt;span title=&quot;Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;&gt;Arriving on this island, you&#039;re going to be greeted by a monument built of wood by saying &quot;Welcome to the island Lihaga, reshuffle Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas.&quot;&gt;Simply by paying 25,000 per person, you can enjoy all the natural beauty of this island with satisfaction. &lt;/span&gt;&lt;span title=&quot;Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.\r\n\r\n&quot;&gt;Starting from a stretch of soft white sand, crystal clear sea water or just sitting under the shady trees at a time when the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini.&quot;&gt;Skin has started to burn, the body is tired and hungry, you&#039;re still playing around the water on the island. &lt;/span&gt;&lt;span title=&quot;Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.\r\n\r\n&quot;&gt;Well, this island is very suitable for you who wanted to calm down from the bustle of the city of Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!\r\n\r\n&quot;&gt;7. Mount Lokon, though can not reach the top I&#039;m still proud to be mendakimu!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini.&quot;&gt;This mountain status of mid-2015 was never passed on from standby become wary that mean you are not allowed to climb this mountain. &lt;/span&gt;&lt;span title=&quot;Peringatan berupa spanduk bergambar tengkorak warna merah &quot;&gt;Warnings in the form of a skull red banners &quot;No to climb crater Lokon&quot; is less likely to be noticed by the climbers. &lt;/span&gt;&lt;span title=&quot;Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.\r\n\r\n&quot;&gt;Many climbers who remain desperate to climb to the crater of the mountain.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal.&quot;&gt;To climb the highest mountain in Tomohon is indeed not required physically strong, because the track is quite short and not so steep. &lt;/span&gt;&lt;span title=&quot;Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam.&quot;&gt;The challenge is lavas form of large rocks quite slippery and steep. &lt;/span&gt;&lt;span title=&quot;Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.\r\n\r\n&quot;&gt;Mount also has no water source, so the nature of kesetiakawananmu will be tested when there are friends who run out of drinking water.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa\r\n\r\n&quot;&gt;8. Nain Island, sand Bungin charm arises like the Maldives&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pernahkan kamu pergi ke Maladewa?&quot;&gt;Have you ever go to Maldives? &lt;/span&gt;&lt;span title=&quot;Wah mungkin terlalu jauh ya buat jalan-jalan ke sana.&quot;&gt;Wah perhaps too much so for a walk to get there. &lt;/span&gt;&lt;span title=&quot;Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa.&quot;&gt;But enough to Minahasa Utara Wori District precisely in Kampung Nain, you&#039;re going to enjoy the thrill of nature like in the Maldives. &lt;/span&gt;&lt;span title=&quot;Orang Bajo Kampung Nain menyebutnya &quot;&gt;Nain Kampung Bajo people call it &quot;sand Bungin raised&quot; the phenomenon of receding tides maximum when full moon or dark moon.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;&gt;White sand that will arise to the surface when the tide is very beautiful, well worth making this point is referred to as &quot;Maldives of its Indonesia&quot;. &lt;/span&gt;&lt;span title=&quot;Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang.&quot;&gt;Budget rental boats to this island is quite expensive: 2.5 million for vessels measuring 30 to 40 passengers. &lt;/span&gt;&lt;span title=&quot;Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.\r\n\r\n&quot;&gt;There are two access ports to get there, the port Bersehati Market and Port Wori Manado in North Minahasa.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&quot;&gt;Reflux Bungin peak is usually around 11:00 s.d 14:00 pm so, you must sunbathe new first to enjoy the beauty of this island. &lt;/span&gt;&lt;span title=&quot;Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.\r\n\r\n&quot;&gt;For you were afraid of the heat, it is advisable to use sunblock and a hat because there is no place to take shelter from the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta\r\n\r\n&quot;&gt;9. Lake of Love, from one end of the country&#039;s border beloved Indonesiaku&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan cuma manusia yang punya hati, bumipun punya.&quot;&gt;It&#039;s not just humans who have a heart, the earth has. &lt;/span&gt;&lt;span title=&quot;Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara.&quot;&gt;Heart Lake is located at the north end of the border of Indonesia and the Philippines, namely in Sitaro Islands regency, North Sulawesi. &lt;/span&gt;&lt;span title=&quot;Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.\r\n\r\n&quot;&gt;Here, there is a small island called Pulau Makalehi - inhabited by about 100 people Sangihe tribe citizens.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau.&quot;&gt;Access to this island of Manado is still difficult, there are only fast boat service that will take you from Manado harbor to the Port Ulu Siau. &lt;/span&gt;&lt;span title=&quot;Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi.&quot;&gt;After that you have to hire a boat for access to the island Makalehi. &lt;/span&gt;&lt;span title=&quot;Sebagai tanda perbatasan NKRI, di pulau ini dibangun sebuah monumen bernama &quot;&gt;As a sign of Homeland border, on the island was built a monument called &quot;Monument of Sovereignty of the Republic of Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat.&quot;&gt;For those of you who are hobby explore foreign places, Makalehi Island might be the right choice. &lt;/span&gt;&lt;span title=&quot;Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat.&quot;&gt;In addition to the access challenging, viscosity customs Makalehi residents are still very strong. &lt;/span&gt;&lt;span title=&quot;Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak.&quot;&gt;Before you trekking the hill to photograph the Lake of Love, you are going to be delivered by the citizens Makalehi towards a cave containing the skulls. &lt;/span&gt;&lt;span title=&quot;Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat.\r\n\r\n&quot;&gt;It is said that the skulls can spend one cigarette very quickly.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Wah, siapa sangka?&quot;&gt;Wow, who would have thought? &lt;/span&gt;&lt;span title=&quot;Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.\r\n\r\n\r\n&quot;&gt;Apparently on the northern tip of Indonesia&#039;s border stored cultural diversity and natural charm Heart Lake unparalleled.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Qobul Pamuji&quot;&gt;Taken from Hipwee By Qobul Pamuji&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(5, 3, 1, 'Bangun Lebih Pagi agar Bisa Merealisasikan Startup Impianmu', '&lt;p&gt;Apa rutinitas pagi kamu sehari-hari? Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.&lt;br /&gt;&lt;br /&gt;Siklus ini terus berlanjut dan berulang setiap hari. Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari. Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.&lt;br /&gt;&lt;br /&gt;Hidup kita tidak akan mengalami perubahan. Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja. Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Memulainya dengan bangun lebih pagi&lt;br /&gt;&lt;br /&gt;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor. Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.&lt;br /&gt;&lt;br /&gt;Bahkan saya sering lebih memilih untuk melanjutkan tidur. Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.&lt;br /&gt;&lt;br /&gt;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah. Namun saat kita mencoba, kenyataannya sangat sulit. Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.&lt;br /&gt;&lt;br /&gt;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama. Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi. Apakah mereka manusia normal seperti saya?&lt;br /&gt;&lt;br /&gt;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit. Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi. Atau menekan tombol snooze ketika kita harus mengejar kereta. Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pilihlah alarm yang canggih&lt;br /&gt;&lt;br /&gt;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik. Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan. Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.&lt;br /&gt;&lt;br /&gt;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya. Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.&lt;br /&gt;&lt;br /&gt;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga. Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.&lt;br /&gt;&lt;br /&gt;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly. Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lakukan LDR (hubungan jarak jauh) dengan alarm&lt;br /&gt;&lt;br /&gt;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan. Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan. Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:&lt;br /&gt;&lt;br /&gt;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin. Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples. Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Paksa diri kamu untuk minum secangkir kopi&lt;br /&gt;&lt;br /&gt;Setelah berhasil bangun pagi, muncul masalah baru. Bagaimana caranya agar kita tetap terjaga? Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur. Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.&lt;br /&gt;&lt;br /&gt;Apa yang terjadi setelah itu? Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali. Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.&lt;br /&gt;&lt;br /&gt;Minumlah kopi sesuai dengan selera dan kebiasaanmu. Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya. Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.&lt;br /&gt;&lt;br /&gt;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu. Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.&lt;br /&gt;&lt;br /&gt;Jika alarm kamu berdering, minumlah kopi. Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.&lt;br /&gt;&lt;br /&gt;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur. Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.&lt;br /&gt;&lt;br /&gt;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya. Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.&lt;br /&gt;&lt;br /&gt;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan? Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi. Manfaatkanlah itu untuk menyiapkan startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Alihkan dirimu untuk bangun&lt;br /&gt;&lt;br /&gt;Masih belum terbangun? Sedikit pengalihan mungkin akan berguna. Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.&lt;br /&gt;&lt;br /&gt;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG. Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.&lt;br /&gt;&lt;br /&gt;Jadi, mari kita lihat sisi positifnya. Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.&lt;br /&gt;&lt;br /&gt;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap. Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil&lt;br /&gt;&lt;br /&gt;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya. Mood kamu di pagi hari mungkin tidak sebagus biasanya. Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.&lt;br /&gt;&lt;br /&gt;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya. Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.&lt;br /&gt;&lt;br /&gt;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar. Kamu tidak mungkin membangun startup dalam satu hari. Kamu hanya harus memulainya terlebih dahulu. Setelah memulainya, akan lebih mudah untuk melanjutkannya.&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor. Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program. Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.&lt;br /&gt;&lt;br /&gt;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus. Ingat, tidak semua pekerjaan harus sempurna. Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Gunakan metode Lean Startup&lt;br /&gt;&lt;br /&gt;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan. Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas. Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.&lt;br /&gt;&lt;br /&gt;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch. Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries. Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.&lt;br /&gt;&lt;br /&gt;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan. Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup? Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?&lt;br /&gt;&lt;br /&gt;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan? Jangan sampai kamu keliru mengambil langkah.&lt;br /&gt;&lt;br /&gt;Jangan terlampau puas dengan apa yang sudah kamu kerjakan. Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil. Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog). Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.&lt;br /&gt;&lt;br /&gt;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform. Hasilnya? Mereka juga tidak tahu apa-apa tentang itu.&lt;br /&gt;&lt;br /&gt;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Publikasikan karya kamu&lt;br /&gt;&lt;br /&gt;Kita semua pasti memiliki sebuah ketakutan. Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan. Kenyataannya? Tidak ada yang peduli dengan itu.&lt;br /&gt;&lt;br /&gt;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya. Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.&lt;br /&gt;&lt;br /&gt;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu. Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan. Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.&lt;br /&gt;&lt;br /&gt;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya. Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.&lt;br /&gt;&lt;br /&gt;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter. Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi. Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi. Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Percayalah pada dirimu sendiri. Karya kamu luar biasa.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terobsesi dengan produktivitas&lt;br /&gt;&lt;br /&gt;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin. Saya memulai setiap pagi dengan menulis jurnal. Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini. Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.&lt;br /&gt;&lt;br /&gt;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai. Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna? Apakah saya harus beralih dari platform komentar WordPress ke Disqus?&lt;br /&gt;&lt;br /&gt;Apakah iklan Adsense masih baik digunakan dalam era Adblock? Kapan waktu terbaik untuk memublikasikan blog? Apa saja pekerjaan yang dapat saya otomatisasi? Apakah saya sudah gila dengan memulai bisnis sendiri?&lt;br /&gt;&lt;br /&gt;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob. Membangun blog yang bagus membutuhkan cukup banyak waktu. Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google. Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.&lt;br /&gt;&lt;br /&gt;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown. TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait. Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Persiapan untuk bekerja tanpa henti&lt;br /&gt;&lt;br /&gt;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu. Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari. Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.&lt;br /&gt;&lt;br /&gt;Mengerjakan startup butuh waktu, dan kamu butuh makan. Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko. Contohnya, membangun startup atau bermain bungee jumping. Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.&lt;br /&gt;&lt;br /&gt;Nikmati semua waktu kamu di dunia ini. Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Jadi, kapan kamu akan bangun?&lt;br /&gt;&lt;br /&gt;Rutinitas pagi di dunia startup akan berbeda. Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan. Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.&lt;br /&gt;&lt;br /&gt;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda. Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah. Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai. Bangunlah lebih pagi, dan mulailah membangun startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Min H. Park&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(6, 3, 2, 'More Morning Waking Order Startup Can Realize Your Dreams', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Apa rutinitas pagi kamu sehari-hari?&quot;&gt;What is your morning routine everyday? &lt;/span&gt;&lt;span title=&quot;Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.\r\n\r\n&quot;&gt;I myself used to get up at 7:00 am, showered, dressed, enjoying a cup of coffee, then go to the bus stop along with the other office employees.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Siklus ini terus berlanjut dan berulang setiap hari.&quot;&gt;This cycle continues and repeated every day. &lt;/span&gt;&lt;span title=&quot;Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari.&quot;&gt;Although want to get out of the routine, it is difficult to build a startup after a tired working eight hours a day. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.\r\n\r\n&quot;&gt;However, if we do not take the time to begin with, we will be trapped in the circle of the corporate world are endless.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hidup kita tidak akan mengalami perubahan.&quot;&gt;Our lives will not be amended. &lt;/span&gt;&lt;span title=&quot;Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja.&quot;&gt;Went to the office before 9:00 am, dealing with a manager who is always suppress, and patiently responded to comments and teasing from peers. &lt;/span&gt;&lt;span title=&quot;Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.\r\n\r\n\r\n&quot;&gt;For me, it does not sound like a pleasant life.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulainya dengan bangun lebih pagi\r\n\r\n&quot;&gt;Start by getting up early&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor.&quot;&gt;I then decided to get up early, at 5:00 am, and began to &quot;build&quot; my startup before getting ready for work. &lt;/span&gt;&lt;span title=&quot;Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.\r\n\r\n&quot;&gt;Initially I thought this is trivial and can run smoothly, until I realized that it was not easy to get up in the morning.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bahkan saya sering lebih memilih untuk melanjutkan tidur.&quot;&gt;In fact I often prefer to continue sleeping. &lt;/span&gt;&lt;span title=&quot;Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.\r\n\r\n&quot;&gt;Although in some occasions I managed to get up in the morning, I just spent time with the filmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah.&quot;&gt;Many blogs are made as though improving productivity is an easy thing. &lt;/span&gt;&lt;span title=&quot;Namun saat kita mencoba, kenyataannya sangat sulit.&quot;&gt;But when we try, the reality is very difficult. &lt;/span&gt;&lt;span title=&quot;Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.\r\n\r\n&quot;&gt;You will find a lot of this kind of writing, for example 8 Things Every Person Should Do Before 8 AM, 7 Things People Do Differently Morning, and Rev Insanely Productive People Get Up Early.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama.&quot;&gt;Sometimes, writing it makes me feel guilty enjoying a long sleep time. &lt;/span&gt;&lt;span title=&quot;Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi.&quot;&gt;The great man in the article already contribute substantially to the world even before 8 o&#039;clock. &lt;/span&gt;&lt;span title=&quot;Apakah mereka manusia normal seperti saya?\r\n\r\n&quot;&gt;Are they normal people like me?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit.&quot;&gt;In fact, getting up at 5:00 am it was very difficult. &lt;/span&gt;&lt;span title=&quot;Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi.&quot;&gt;We can turn off the alarm without knowing it, when we had an early morning meeting schedule. &lt;/span&gt;&lt;span title=&quot;Atau menekan tombol snooze ketika kita harus mengejar kereta.&quot;&gt;Or hit the snooze button when we had to catch a train. &lt;/span&gt;&lt;span title=&quot;Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.\r\n\r\n\r\n&quot;&gt;Seeing this incident, things we can do is to change the way we wake up.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pilihlah alarm yang canggih\r\n\r\n&quot;&gt;Choose a sophisticated alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik.&quot;&gt;I&#039;m not the kind of person who likes to be woken up suddenly by the noise. &lt;/span&gt;&lt;span title=&quot;Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan.&quot;&gt;I wake up in the morning with a feeling of surprised it&#039;s not fun. &lt;/span&gt;&lt;span title=&quot;Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.\r\n\r\n&quot;&gt;I think it would be better if we are looking for an alarm that woke us gradually, so that your mind will first prepare the body to actually wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya.&quot;&gt;You can try the coffee machine alarm automatically dispensing coffee and wake you from a deep sleep aroma. &lt;/span&gt;&lt;span title=&quot;Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.\r\n\r\n&quot;&gt;In addition, there is also alarm Philips Wake-Up Light will illuminate the face, giving the impression that it is the sun rises.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga.&quot;&gt;Alarm annular can also make you wake up in the morning through vibration, so that your partner do not have to come awakened too. &lt;/span&gt;&lt;span title=&quot;Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.\r\n\r\n&quot;&gt;Keep a pet like a dog or cat can also be an option to wake up at 5:00 am, given they like to lick and trample on our face to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly.&quot;&gt;In addition to using a conventional alarm, I also use Warmly. &lt;/span&gt;&lt;span title=&quot;Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.\r\n\r\n&quot;&gt;This app will give voice melodious birdsong in advance for five minutes, before finally woke me with the sound of the strings of the cello of Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!\r\n\r\n\r\n&quot;&gt;Try to beat the taste malasmu in the morning with a sophisticated alarm!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lakukan LDR (hubungan jarak jauh) dengan alarm\r\n\r\n&quot;&gt;Make LDR (long distance relationship) with alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan.&quot;&gt;Changing habits takes time and the process of course, can not be instant. &lt;/span&gt;&lt;span title=&quot;Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan.&quot;&gt;Build positive habits such as reading, exercising, and socializing, as well as changing bad habits such as drinking alcohol, smoking, and eating fast food definitely need to fight. &lt;/span&gt;&lt;span title=&quot;Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:\r\n\r\n&quot;&gt;I would like to quote from the blog posts Evernote before continuing:&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin.&quot;&gt;If you want to break the habit of turning off the alarm, so make it as difficult as possible. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples.&quot;&gt;You can put up multiple alarms at once, downloading apps with puzzle alarm, or insert your smartphone into a jar. &lt;/span&gt;&lt;span title=&quot;Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.\r\n\r\n\r\n&quot;&gt;If you want to get up in the morning, place your alarm in places difficult to reach.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Paksa diri kamu untuk minum secangkir kopi\r\n\r\n&quot;&gt;You force yourself to drink a cup of coffee&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Setelah berhasil bangun pagi, muncul masalah baru.&quot;&gt;After successfully waking up, new problems arise. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar kita tetap terjaga?&quot;&gt;How can we stay awake? &lt;/span&gt;&lt;span title=&quot;Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur.&quot;&gt;It was hard to get up at 5:00 am and resist the temptation to go back to sleep. &lt;/span&gt;&lt;span title=&quot;Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.\r\n\r\n&quot;&gt;And anyway, you might think to get up early &quot;tomorrow,&quot; do not have to begin from today.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apa yang terjadi setelah itu?&quot;&gt;What happened after that? &lt;/span&gt;&lt;span title=&quot;Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali.&quot;&gt;We will regret in the morning to follow the temptation to fall back asleep. &lt;/span&gt;&lt;span title=&quot;Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.\r\n\r\n&quot;&gt;So, before it all happens, drink a cup of coffee to keep you awake.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Minumlah kopi sesuai dengan selera dan kebiasaanmu.&quot;&gt;Drink coffee according to your tastes and habits. &lt;/span&gt;&lt;span title=&quot;Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya.&quot;&gt;If you are not used to drink coffee, do not have to force yourself to drink it. &lt;/span&gt;&lt;span title=&quot;Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.\r\n\r\n&quot;&gt;Do what you normally do after waking up, because the temptation to go back to sleep will still appear with or without a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu.&quot;&gt;Find a way to integrate the coffee directly into your morning routine. &lt;/span&gt;&lt;span title=&quot;Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.\r\n\r\n&quot;&gt;The goal is to create an alarm you become a trigger for a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika alarm kamu berdering, minumlah kopi.&quot;&gt;If your alarm rings, drink coffee. &lt;/span&gt;&lt;span title=&quot;Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.\r\n\r\n&quot;&gt;Try a few different ways that makes you automatically think for a coffee after waking.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur.&quot;&gt;Initially I tried to get up in the morning and dispensing coffee in the kitchen, I did not even make it to the kitchen. &lt;/span&gt;&lt;span title=&quot;Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.\r\n\r\n&quot;&gt;After that, I tried to prepare a cup of iced coffee at night before I sleep and put it on the table, I still did not manage to get to the table.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya.&quot;&gt;In the end, I put the coffee cup on top of my smartphone. &lt;/span&gt;&lt;span title=&quot;Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.\r\n\r\n&quot;&gt;So, to turn off the alarm, I had to lift the cup first.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan?&quot;&gt;When a coffee cup in hand, why not drink it, do not you? &lt;/span&gt;&lt;span title=&quot;Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi.&quot;&gt;Congratulations, now you&#039;ve managed to get up at 5:00 am. &lt;/span&gt;&lt;span title=&quot;Manfaatkanlah itu untuk menyiapkan startup kamu!\r\n\r\n\r\n&quot;&gt;Make use of it to set up your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alihkan dirimu untuk bangun\r\n\r\n&quot;&gt;Divert yourself to wake up&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Masih belum terbangun?&quot;&gt;Still not awake? &lt;/span&gt;&lt;span title=&quot;Sedikit pengalihan mungkin akan berguna.&quot;&gt;A little diversion might be useful. &lt;/span&gt;&lt;span title=&quot;Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.\r\n\r\n&quot;&gt;As a person who loves surfing the internet, I am probably not the best person to give advice improve productivity.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG.&quot;&gt;I spent a lot of time looking at pictures of cute cats on Reddit, Imgur, and 9GAG. &lt;/span&gt;&lt;span title=&quot;Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.\r\n\r\n&quot;&gt;Until finally I have seen all the contents and hope there is new content appears.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, mari kita lihat sisi positifnya.&quot;&gt;So, let&#039;s look at the positive side. &lt;/span&gt;&lt;span title=&quot;Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.\r\n\r\n&quot;&gt;If you see a cute cat pictures on the internet at night can cause us to experience insomnia, then check smartphone or computer in the morning can help us to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap.&quot;&gt;If you can not directly work on the preparation of startup you after you wake up, you can probably wait a few minutes past until you are really ready. &lt;/span&gt;&lt;span title=&quot;Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.\r\n\r\n\r\n&quot;&gt;Remember, there are two challenges that you must face, got up early and startup preparation installments.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil\r\n\r\n&quot;&gt;Your startup broke into small sections&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya.&quot;&gt;When just woken up in the morning, I do not want to directly confront the various problems in the preparation stage of my startup. &lt;/span&gt;&lt;span title=&quot;Mood kamu di pagi hari mungkin tidak sebagus biasanya.&quot;&gt;Your mood in the morning may not be as good as usual. &lt;/span&gt;&lt;span title=&quot;Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.\r\n\r\n&quot;&gt;So, do unpleasant things will only provoke you to get back to sleep.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya.&quot;&gt;Now I think almost everyone has failed to meet his new year&#039;s resolution. &lt;/span&gt;&lt;span title=&quot;Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.\r\n\r\n&quot;&gt;One reason may be because we choose something that is too big and hard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar.&quot;&gt;The Art of Manliness makes us realize that the habit of doing something small will lead to something bigger. &lt;/span&gt;&lt;span title=&quot;Kamu tidak mungkin membangun startup dalam satu hari.&quot;&gt;You can not build a startup in one day. &lt;/span&gt;&lt;span title=&quot;Kamu hanya harus memulainya terlebih dahulu.&quot;&gt;You just have to start it first. &lt;/span&gt;&lt;span title=&quot;Setelah memulainya, akan lebih mudah untuk melanjutkannya.\r\n\r\n&quot;&gt;Once started, it will be easier to continue.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor.&quot;&gt;Your startup broke into several small pieces that can be done the morning before going to the office. &lt;/span&gt;&lt;span title=&quot;Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program.&quot;&gt;For example, if you are a startup product application, every morning you can start writing a line of program code. &lt;/span&gt;&lt;span title=&quot;Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.\r\n\r\n&quot;&gt;Write a paragraph-if it is a blog, or create a product design.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus.&quot;&gt;It is better to do little by little gradually than spend a lot of time to do many things at once. &lt;/span&gt;&lt;span title=&quot;Ingat, tidak semua pekerjaan harus sempurna.&quot;&gt;Remember, not all jobs have to be perfect. &lt;/span&gt;&lt;span title=&quot;Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.\r\n\r\n\r\n&quot;&gt;Do disciplined and makeit into a new good habit.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gunakan metode Lean Startup\r\n\r\n&quot;&gt;Use Lean Startup method&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan.&quot;&gt;Believe it or not, at first no one actually knows what they finally did. &lt;/span&gt;&lt;span title=&quot;Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas.&quot;&gt;The unicorn startup even though it takes time to find a clear basis. &lt;/span&gt;&lt;span title=&quot;Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.\r\n\r\n&quot;&gt;Airbnb able to survive thanks to the sale of cereals political theme, that Obama O&#039;s and Cap&#039;n McCain&#039;s.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch.&quot;&gt;Slack founder, Stewart Butterfield, also initially failed to create a game called Glitch. &lt;/span&gt;&lt;span title=&quot;Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.\r\n\r\n&quot;&gt;In fact, YouTube was originally a video dating site Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries.&quot;&gt;Start working on your startup with a phased, detailed and focused according to the book The Lean Startup methodology popularized by Eric Ries. &lt;/span&gt;&lt;span title=&quot;Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.\r\n\r\n&quot;&gt;Thus, you will be easier to implement ideas and get quick feedback from users.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan.&quot;&gt;You already know that 75 percent of the startup in the world have failed. &lt;/span&gt;&lt;span title=&quot;Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup?&quot;&gt;So if you are willing to spend a hundred days working on the product you are covered? &lt;/span&gt;&lt;span title=&quot;Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?\r\n\r\n&quot;&gt;What if after you finished products, people do not like it?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan?&quot;&gt;Would not it be nice if you interact with others during the process, so that you know exactly what they need and want? &lt;/span&gt;&lt;span title=&quot;Jangan sampai kamu keliru mengambil langkah.\r\n\r\n&quot;&gt;Do not you dare take a step wrong.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jangan terlampau puas dengan apa yang sudah kamu kerjakan.&quot;&gt;Do not be too happy with what you&#039;ve done. &lt;/span&gt;&lt;span title=&quot;Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil.&quot;&gt;You should continue to test your products through a variety of small experiments. &lt;/span&gt;&lt;span title=&quot;Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog).&quot;&gt;When I first started Krown.io, I call it a Blogging Platform Annotation (annotation platform blog). &lt;/span&gt;&lt;span title=&quot;Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.\r\n\r\n&quot;&gt;Then I realized that most people still do not know what annotations.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform.&quot;&gt;We&#039;ve tried a variety of things such as Smart Blogging, Highlight Blogging, Blogs Feedback, and Contextual Blogging Platform. &lt;/span&gt;&lt;span title=&quot;Hasilnya?&quot;&gt;The result? &lt;/span&gt;&lt;span title=&quot;Mereka juga tidak tahu apa-apa tentang itu.\r\n\r\n&quot;&gt;They also do not know anything about it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.\r\n\r\n\r\n&quot;&gt;So we decided to add the explanation easier to understand, which is &quot;a highlight text and add comments directly on the highlighted text.&quot; You should always perform validation on hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Publikasikan karya kamu\r\n\r\n&quot;&gt;Publish your artwork&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kita semua pasti memiliki sebuah ketakutan.&quot;&gt;We all have a fear. &lt;/span&gt;&lt;span title=&quot;Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan.&quot;&gt;Perhaps you feel scared if the work you will be scorned and overthrown by the people after they are published. &lt;/span&gt;&lt;span title=&quot;Kenyataannya?&quot;&gt;The reality? &lt;/span&gt;&lt;span title=&quot;Tidak ada yang peduli dengan itu.\r\n\r\n&quot;&gt;No one bothered with it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya.&quot;&gt;In this world there are more than two million works published each day. &lt;/span&gt;&lt;span title=&quot;Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.\r\n\r\n&quot;&gt;The biggest challenge that you have to think about now is not the fear that is not proven that, but how do you work this can be published and the scrutiny of the public eye.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu.&quot;&gt;If the current course you are still difficult to get up early and work on your startup, you should not be too confusing content beforehand. &lt;/span&gt;&lt;span title=&quot;Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan.&quot;&gt;Begin everything gradually, not to worry excessively raised. &lt;/span&gt;&lt;span title=&quot;Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.\r\n\r\n&quot;&gt;It&#039;s just like learning to worry too much, as if the impact you will become a professor at Harvard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya.&quot;&gt;If you still have trouble to build your startup, the first solution you need to do is to wake up early and start working on it. &lt;/span&gt;&lt;span title=&quot;Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.\r\n\r\n&quot;&gt;It has been proven scientifically and not just based on my experience alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter.&quot;&gt;You can begin to publish your progress using a simple thing like Twitter. &lt;/span&gt;&lt;span title=&quot;Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi.&quot;&gt;Thomas Frank of College Info Geek using Twitter and Buffer to force him to get up early. &lt;/span&gt;&lt;span title=&quot;Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi.&quot;&gt;He scheduled a tweet that he would donate US $ 25 (about Rp327.000) every morning. &lt;/span&gt;&lt;span title=&quot;Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;\r\n\r\n&quot;&gt;So, he had to get up early before the tweet was &quot;on the air.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percayalah pada dirimu sendiri.&quot;&gt;Believe in yourself. &lt;/span&gt;&lt;span title=&quot;Karya kamu luar biasa.\r\n\r\n\r\n&quot;&gt;Your work is incredible.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terobsesi dengan produktivitas\r\n\r\n&quot;&gt;Obsessed with productivity&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin.&quot;&gt;Try to do as many things with minimum effort. &lt;/span&gt;&lt;span title=&quot;Saya memulai setiap pagi dengan menulis jurnal.&quot;&gt;I begin each morning with a journal. &lt;/span&gt;&lt;span title=&quot;Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini.&quot;&gt;If I write only for personal interest, I probably would not have this diligently. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.\r\n\r\n&quot;&gt;Keeping a journal has helped the development of my startup in three things at once.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai.&quot;&gt;First, write a journal in the morning helps me to see the progress that has been achieved. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna?&quot;&gt;How do I interact more with the users? &lt;/span&gt;&lt;span title=&quot;Apakah saya harus beralih dari platform komentar WordPress ke Disqus?\r\n\r\n&quot;&gt;Do I have to switch on the platform WordPress comments to Disqus?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apakah iklan Adsense masih baik digunakan dalam era Adblock?&quot;&gt;Is Adsense ads still well used in Adblock era? &lt;/span&gt;&lt;span title=&quot;Kapan waktu terbaik untuk memublikasikan blog?&quot;&gt;When is the best time to publish a blog? &lt;/span&gt;&lt;span title=&quot;Apa saja pekerjaan yang dapat saya otomatisasi?&quot;&gt;Any job that can be my automation? &lt;/span&gt;&lt;span title=&quot;Apakah saya sudah gila dengan memulai bisnis sendiri?\r\n\r\n&quot;&gt;Am I crazy to start your own business?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob.&quot;&gt;Second, write in a journal can help build content for my blog, TechMob. &lt;/span&gt;&lt;span title=&quot;Membangun blog yang bagus membutuhkan cukup banyak waktu.&quot;&gt;Building a good blog takes some time. &lt;/span&gt;&lt;span title=&quot;Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google.&quot;&gt;You need about a thousand articles to start getting traction from Google organic. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.\r\n\r\n&quot;&gt;Writing a journal every day helped us to build the foundation required content.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown.&quot;&gt;Finally, write a journal for public help me promote my blog annotation platform, Krown. &lt;/span&gt;&lt;span title=&quot;TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait.&quot;&gt;TechMob built from Krown and use the system to add a comment per sentence related information. &lt;/span&gt;&lt;span title=&quot;Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.\r\n\r\n\r\n&quot;&gt;Each article in TechMob will promote Krown through sub domains techmob.krown.io and call to action at the bottom of the article.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Persiapan untuk bekerja tanpa henti\r\n\r\n&quot;&gt;Preparation for work ceaselessly&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu.&quot;&gt;When the time is shown at 7:00 am, get ready to go to the office even though they want to work on your startup. &lt;/span&gt;&lt;span title=&quot;Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari.&quot;&gt;You have to keep working to meet your needs everyday. &lt;/span&gt;&lt;span title=&quot;Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.\r\n\r\n&quot;&gt;Working on a small fraction of the startup in the morning can be a preparation before you have to work from 9:00 until 5:00.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengerjakan startup butuh waktu, dan kamu butuh makan.&quot;&gt;Working startup takes time, and you need to eat. &lt;/span&gt;&lt;span title=&quot;Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko.&quot;&gt;Based on the barbell strategy (of the Anti-Fragile book by Nassim Taleb), you should allocate 20 percent of its resources for risky activity. &lt;/span&gt;&lt;span title=&quot;Contohnya, membangun startup atau bermain bungee jumping.&quot;&gt;For example, building a startup or play bungee jumping. &lt;/span&gt;&lt;span title=&quot;Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.\r\n\r\n&quot;&gt;Then invest 80 per cent of the remaining resources for things that are not at risk such as school, work, or dinner with the family.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nikmati semua waktu kamu di dunia ini.&quot;&gt;Enjoy all your time in this world. &lt;/span&gt;&lt;span title=&quot;Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.\r\n\r\n\r\n&quot;&gt;Build your startup as a side project, perform validation, and then began to plunge serious when you&#039;re ready.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, kapan kamu akan bangun?\r\n\r\n&quot;&gt;So, when are you going to wake up?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rutinitas pagi di dunia startup akan berbeda.&quot;&gt;A morning routine in the startup world will be different. &lt;/span&gt;&lt;span title=&quot;Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan.&quot;&gt;You should try to find a routine that can bring you closer to the goal. &lt;/span&gt;&lt;span title=&quot;Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.\r\n\r\n&quot;&gt;If you had to spend eight hours doing something you do not like, you at least have to invest one hour doing things that you like.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda.&quot;&gt;You can not do the same thing continuously and expecting different results. &lt;/span&gt;&lt;span title=&quot;Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah.&quot;&gt;Do not let the current situation is leading you down the wrong path. &lt;/span&gt;&lt;span title=&quot;Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai.&quot;&gt;Face the reality, live your life according to what you believe. &lt;/span&gt;&lt;span title=&quot;Bangunlah lebih pagi, dan mulailah membangun startup kamu!\r\n\r\n\r\n\r\n&quot;&gt;Get up early, and start building your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Min H. Park&quot;&gt;Taken from TechInAsia By Min H. Park&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(7, 4, 1, '5 Alasan Kenapa Kamu Harus Membangun Usaha Kecil, Bukan Startup', '&lt;p&gt;Saya mengerti, kita semua ingin melakukan sesuatu yang penting. Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar. Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.&lt;br /&gt;&lt;br /&gt;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Mampukah gagasan tersebut berkembang?&lt;br /&gt;&lt;br /&gt;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.&lt;br /&gt;&lt;br /&gt;Terkadang, kita bahkan menertawakannya. Saat kita melakukan hal tersebut, kita jadi orang yang brengsek. Benar-benar brengsek. Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama. Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.&lt;br /&gt;&lt;br /&gt;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak. Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn. Memang, apa bedanya?&lt;br /&gt;&lt;br /&gt;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.&lt;br /&gt;&lt;br /&gt;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.&lt;br /&gt;&lt;br /&gt;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau. Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa fokus pada kesederhanaan produk&lt;br /&gt;&lt;br /&gt;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas. Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.&lt;br /&gt;&lt;br /&gt;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang. Bisnis skala kecil tak punya kendala semacam itu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pegawai kamu lebih penting&lt;br /&gt;&lt;br /&gt;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu. Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan. Dalam bisnis skala kecil, para pegawai adalah yang utama.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lebih mudah dalam mengatur bisnis&lt;br /&gt;&lt;br /&gt;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk. Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar. Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil. Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kecil bukan berarti miskin&lt;br /&gt;&lt;br /&gt;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan. Bukan berarti juga kamu akan mati dalam keadaan miskin.&lt;br /&gt;&lt;br /&gt;Pendapatan kamu memang kecil, tentu saja. Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.&lt;br /&gt;&lt;br /&gt;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan. Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa mengembangkan bisnis kapan pun kamu siap&lt;br /&gt;&lt;br /&gt;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan. Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.&lt;br /&gt;&lt;br /&gt;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.&lt;br /&gt;&lt;br /&gt;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya. Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.&lt;br /&gt;&lt;br /&gt;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.&lt;br /&gt;&lt;br /&gt;Jika kamu melakukannya, kamu tak akan menjadi miliuner. Namun kamu bisa menjadi jutawan yang bahagia. Dan bagi saya, itu adalah pilihan yang sangat bagus.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Jon Westenberg&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(8, 4, 2, '5 Reasons Why You Should Build Your Small Business, Not Startup', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saya mengerti, kita semua ingin melakukan sesuatu yang penting.&quot;&gt;I understand, we all want to do something important. &lt;/span&gt;&lt;span title=&quot;Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar.&quot;&gt;We all want to create special products, establishing the company is worth, and do things that can change the world and have a huge impact. &lt;/span&gt;&lt;span title=&quot;Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.\r\n\r\n&quot;&gt;Things like this often I found in the community of entrepreneurs and technology.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:\r\n\r\n\r\n&quot;&gt;The questions we ask, when we hear an idea or a new idea-be it renewable energy to instant messaging applications, are the following:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mampukah gagasan tersebut berkembang?\r\n\r\n&quot;&gt;Can the idea evolve?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.\r\n\r\n&quot;&gt;When we feel we are considering the idea can not be developed to use one million users, and is not designed to achieve revenues of tens of trillions of rupiah, we forget about the idea.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang, kita bahkan menertawakannya.&quot;&gt;Sometimes, we even laugh about it. &lt;/span&gt;&lt;span title=&quot;Saat kita melakukan hal tersebut, kita jadi orang yang brengsek.&quot;&gt;When we do that, we become a jerk. &lt;/span&gt;&lt;span title=&quot;Benar-benar brengsek.&quot;&gt;Really a jerk. &lt;/span&gt;&lt;span title=&quot;Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama.&quot;&gt;Because establishing technology companies are large, grand and worth is not the main thing. &lt;/span&gt;&lt;span title=&quot;Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.\r\n\r\n&quot;&gt;And chose not to do so does not make us a fool.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak.&quot;&gt;To be honest, if you choose the opposite way, you&#039;re likely to be happier, rarely sick, richer, and far more wisely. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn.&quot;&gt;You can choose to set up a small online businesses rather than planning to build a startup unicorn. &lt;/span&gt;&lt;span title=&quot;Memang, apa bedanya?\r\n\r\n&quot;&gt;Indeed, what&#039;s the difference?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.\r\n\r\n&quot;&gt;Startup unicorn requires rapid growth and large, also requires an investment and should dominate.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.\r\n\r\n&quot;&gt;Small-scale online businesses only require growth in a clear boundaries, profit, and serve customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau.&quot;&gt;Plans to not target the extensive growth may be somewhat contrary to what you want. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.\r\n\r\n\r\n&quot;&gt;However, I am sure there are quite a lot of benefits that you can reap just by setting up small businesses.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa fokus pada kesederhanaan produk\r\n\r\n&quot;&gt;You can focus on the simplicity of the product&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas.&quot;&gt;Literally, you build something small, with restrictions and a clear benchmark. &lt;/span&gt;&lt;span title=&quot;Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.\r\n\r\n&quot;&gt;There is no greater pressure to add certain features of your product, which means you have the freedom to focus on the most essential part of the product for you and your customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang.&quot;&gt;Creating products that prioritizes simplicity is a big challenge for many companies large and growing. &lt;/span&gt;&lt;span title=&quot;Bisnis skala kecil tak punya kendala semacam itu.\r\n\r\n\r\n&quot;&gt;Small businesses have no such constraints.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pegawai kamu lebih penting\r\n\r\n&quot;&gt;Your employee is more important&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu.&quot;&gt;When you choose a small-scale business, you can spend time with employees, which means in your business. &lt;/span&gt;&lt;span title=&quot;Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan.&quot;&gt;Either the number of servants only one or five, people will be your main priority than if you hire many employees to pursue growth. &lt;/span&gt;&lt;span title=&quot;Dalam bisnis skala kecil, para pegawai adalah yang utama.\r\n\r\n\r\n&quot;&gt;In a small business, the employees are the main ones.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih mudah dalam mengatur bisnis\r\n\r\n&quot;&gt;It is easier to set up a business&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk.&quot;&gt;I love when she saw a personal touch to every business and products. &lt;/span&gt;&lt;span title=&quot;Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar.&quot;&gt;It was impossible happens when you ambition to set up a very large company. &lt;/span&gt;&lt;span title=&quot;Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil.&quot;&gt;But it was so very likely when you start by setting up something small. &lt;/span&gt;&lt;span title=&quot;Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.\r\n\r\n\r\n&quot;&gt;You can use your time to ensure that customers and consumers get attention every time.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kecil bukan berarti miskin\r\n\r\n&quot;&gt;Small does not mean poor&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan.&quot;&gt;Although your company is small and the products you use only a handful of people, it does not mean the company will not benefit you. &lt;/span&gt;&lt;span title=&quot;Bukan berarti juga kamu akan mati dalam keadaan miskin.\r\n\r\n&quot;&gt;Not that too you will die in a poor state.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendapatan kamu memang kecil, tentu saja.&quot;&gt;Your income is small, of course. &lt;/span&gt;&lt;span title=&quot;Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.\r\n\r\n&quot;&gt;But your chances to build companies worth billions of rupiah is much greater than the chance to set up a company worth trillions of rupiah.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan.&quot;&gt;By doing so, the operational cost you so much less, spending the company can be suppressed. &lt;/span&gt;&lt;span title=&quot;Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.\r\n\r\n\r\n&quot;&gt;You and your team a chance to enjoy all the benefits.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa mengembangkan bisnis kapan pun kamu siap\r\n\r\n&quot;&gt;You can grow your business whenever you&#039;re ready&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan.&quot;&gt;If you want your company develops, you have a better chance to do it with a smaller company but successful and able to generate a profit. &lt;/span&gt;&lt;span title=&quot;Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.\r\n\r\n&quot;&gt;When the product and the flow of funds you are already a more mature company, you not only become attractive in the eyes of investors, but also able to fund the company withyour own money.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.\r\n\r\n&quot;&gt;Not to mention the knowledge and learning you for running a small company can be a good capital when you want to develop your business.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya.&quot;&gt;Some people call bootstrapping, but I think the word was not yet fully represented. &lt;/span&gt;&lt;span title=&quot;Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.\r\n\r\n&quot;&gt;For me, the only meaningful bootstrapping your company funded independently.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.\r\n\r\n&quot;&gt;Starting a small business means to fund a company, determine the limits and standards, understand the product or service you are and what you want to achieve with the product or service and plan to reach the target.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu melakukannya, kamu tak akan menjadi miliuner.&quot;&gt;If you do, you will not become a millionaire. &lt;/span&gt;&lt;span title=&quot;Namun kamu bisa menjadi jutawan yang bahagia.&quot;&gt;However, you can become a millionaire happy. &lt;/span&gt;&lt;span title=&quot;Dan bagi saya, itu adalah pilihan yang sangat bagus.\r\n\r\n\r\n&quot;&gt;And for me, it is a very nice option.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Jon Westenberg&quot;&gt;Taken from TechInAsia By Jon Westenberg&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(9, 5, 1, 'Cowok Cuek Justru Tepat Jadi Pendampingmu', '&lt;p&gt;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu. Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu. Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek. Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...&lt;br /&gt;&lt;br /&gt;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu. Tapi. bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya. Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.&lt;br /&gt;&lt;br /&gt;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;. Tapi toh dia selalu ada saat benar-benar dibutuhkan.&lt;br /&gt;&lt;br /&gt;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya. Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja. Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini? Apa dia di sana memikirkan kamu?&lt;br /&gt;&lt;br /&gt;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam. Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu. Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu. Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.&lt;br /&gt;&lt;br /&gt;2. Cowok cuek jarang bertanya kabar. Percaya atau tidak, sikapnya ini justru membebaskan.&lt;br /&gt;&lt;br /&gt;Perihal dia menanyakan kabarmu juga jarang sekali. Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.&lt;br /&gt;&lt;br /&gt;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan. Karena percaya atau tidak, hal seperti ini justru terasa membebaskan. Gimana nggak bebas? Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu. Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa. Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.&lt;br /&gt;&lt;br /&gt;3. Dia punya cara unik untuk mengungkap rasa sayang. Walau jarang memberi bunga, dia gak suka melihatmu berduka.&lt;br /&gt;&lt;br /&gt;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;. Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga. Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.&lt;br /&gt;&lt;br /&gt;4. Kalian pun tak banyak pamer kemesraan. Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.&lt;br /&gt;&lt;br /&gt;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media. Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.&lt;br /&gt;&lt;br /&gt;Bukan, bukan karena dia malu dengan hubungan yang kalian punya. Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama. Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.&lt;br /&gt;&lt;br /&gt;5. Kadang malah kamu dikira tak punya pacar. Eh, itu artinya kamu mandiri! Bersamanya bisa, sendiri pun biasa saja.&lt;br /&gt;&lt;br /&gt;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri. Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu. Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu. Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.&lt;br /&gt;&lt;br /&gt;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.&lt;br /&gt;&lt;br /&gt;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele. Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik? Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.&lt;br /&gt;&lt;br /&gt;7. Ada saat tertentu dimana dia berusaha memanjakan. Nikmati saja; maklum, jarang-jarang!&lt;br /&gt;&lt;br /&gt;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi. Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu. Kamu ingin makan di tempat ini, dia langsung menurutinya. Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu. Pokoknya hari itu, kamu serasa jadi putri sehari.&lt;br /&gt;&lt;br /&gt;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya. Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe&lt;br /&gt;&lt;br /&gt;8. Tak perlu cemas dia tebar pesona sana-sini. Lihat saja sikapnya ke pacar sendiri!&lt;br /&gt;&lt;br /&gt;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem. Kamu nggak perlu cemas dia akan tebar pesona sana sini. Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.&lt;br /&gt;&lt;br /&gt;9. Dia memperjuangkanmu meski kamu tak selalu sadar. Sosoknya lebih suka mendoakanmu dalam diam.&lt;br /&gt;&lt;br /&gt;Kata siapa dia nggak berjuang untuk kamu? Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya. Dia itu sosok sederhana yang menjagamu cukup melalui doa. Karena, baginya doa itu lebih kuat dari apapun. Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.&lt;br /&gt;&lt;br /&gt;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya? Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya. Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mustika Karindra&lt;/p&gt;'),
(10, 5, 2, 'Cuek Guy Precisely Right So Best Man', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu.&quot;&gt;You have always wanted a guy who could devote more attention to yourself. &lt;/span&gt;&lt;span title=&quot;Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu.&quot;&gt;Often you daydream when attendance is able to fulfill your days. &lt;/span&gt;&lt;span title=&quot;Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek.&quot;&gt;However, in reality not all the boys can do it, especially when he referred types indifferent. &lt;/span&gt;&lt;span title=&quot;Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...\r\n\r\n&quot;&gt;When you hear the word ignorant is the one, it could be that comes to your head, Do not tell me he can not treat you with the best ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu.&quot;&gt;Uh, wait, although the nature of cueknya will make you often own sewatu-watu. &lt;/span&gt;&lt;span title=&quot;Tapi.&quot;&gt;But. &lt;/span&gt;&lt;span title=&quot;bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya.&quot;&gt;that does not mean he can not make you feel special and important to his life. &lt;/span&gt;&lt;span title=&quot;Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.\r\n\r\n&quot;&gt;That ye be sure to mention if the cuek is also worth to you later choose as a life companion, 9 this reason you need to know in advance.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;.&quot;&gt;1. Men may ignore often &quot;disappear&quot;. &lt;/span&gt;&lt;span title=&quot;Tapi toh dia selalu ada saat benar-benar dibutuhkan.\r\n\r\n&quot;&gt;But anyway he is always there when really needed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya.&quot;&gt;PhoneSee was almost deserted several days without news. &lt;/span&gt;&lt;span title=&quot;Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja.&quot;&gt;Some like the wind and your message is ignored. &lt;/span&gt;&lt;span title=&quot;Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini?&quot;&gt;It can not be denied you would often wonder to myself, What is she today? &lt;/span&gt;&lt;span title=&quot;Apa dia di sana memikirkan kamu?\r\n\r\n&quot;&gt;Is he in there thinking about you?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam.&quot;&gt;Homesick really, but you also know that he disappeared not because of all sorts. &lt;/span&gt;&lt;span title=&quot;Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu.&quot;&gt;One time, when you really need it, yet he will always be there for you. &lt;/span&gt;&lt;span title=&quot;Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu.&quot;&gt;Quiet, she&#039;s there was also thinking about you, just trust you high makes her not to worry too much about you. &lt;/span&gt;&lt;span title=&quot;Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.\r\n\r\n&quot;&gt;Moreover, he was there too sure if you are just seemed that trust completely against the couple.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Cowok cuek jarang bertanya kabar.&quot;&gt;2. Men rarely ask news indifferent. &lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, sikapnya ini justru membebaskan.\r\n\r\n&quot;&gt;Believe it or not, this attitude actually liberating.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perihal dia menanyakan kabarmu juga jarang sekali.&quot;&gt;Subject him see how you too rarely. &lt;/span&gt;&lt;span title=&quot;Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.\r\n\r\n&quot;&gt;Within a week sometimes only occasionally he asks about your health, news college or work, or other things that you and everyday when she was with you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan.&quot;&gt;Already lah, regarding news from him that rarely comes you should not worry about. &lt;/span&gt;&lt;span title=&quot;Karena percaya atau tidak, hal seperti ini justru terasa membebaskan.&quot;&gt;Because believe it or not, things like this just feels liberating. &lt;/span&gt;&lt;span title=&quot;Gimana nggak bebas?&quot;&gt;How not free? &lt;/span&gt;&lt;span title=&quot;Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu.&quot;&gt;If you do not have to bother replying to the messages each time. &lt;/span&gt;&lt;span title=&quot;Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa.&quot;&gt;Not at any time should also update will go anywhere, with whom, and no matter what. &lt;/span&gt;&lt;span title=&quot;Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.\r\n\r\n&quot;&gt;Remember, keposesifan also not a good thing for a relationship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Dia punya cara unik untuk mengungkap rasa sayang.&quot;&gt;3. He had a unique way to uncover affection. &lt;/span&gt;&lt;span title=&quot;Walau jarang memberi bunga, dia gak suka melihatmu berduka.\r\n\r\n&quot;&gt;Although rarely give flowers, he does not like to see you sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;.&quot;&gt;He seldom really say, &quot;I love you&quot;. &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga.&quot;&gt;Cueknya nature makes him think, if the feeling of love that there are many ways do not always say it directly or give cendramata like flowers. &lt;/span&gt;&lt;span title=&quot;Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.\r\n\r\n&quot;&gt;But one is for sure in his heart, he never like to see a grim and sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kalian pun tak banyak pamer kemesraan.&quot;&gt;4. You were not much show affection. &lt;/span&gt;&lt;span title=&quot;Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.\r\n\r\n&quot;&gt;He knew that love would not last much longer only because it is often exhibited in the virtual world.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media.&quot;&gt;When all of your friends show affection with a partner in every social media. &lt;/span&gt;&lt;span title=&quot;Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.\r\n\r\n&quot;&gt;You and he himself actually rarely do, even arguably moment you show the relationship in the virtual world can still be counted on the fingers alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan, bukan karena dia malu dengan hubungan yang kalian punya.&quot;&gt;No, not because she was embarrassed by the relationship you have. &lt;/span&gt;&lt;span title=&quot;Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama.&quot;&gt;He&#039;s just thinking, if showing off relationships in the virtual world is no guarantee of love that will last longer. &lt;/span&gt;&lt;span title=&quot;Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.\r\n\r\n&quot;&gt;Her love is simple, no snapping here and there, but felt by you and him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kadang malah kamu dikira tak punya pacar.&quot;&gt;5. Sometimes even you do not have a boyfriend calculated. &lt;/span&gt;&lt;span title=&quot;Eh, itu artinya kamu mandiri!&quot;&gt;Eh, it means that you are independent! &lt;/span&gt;&lt;span title=&quot;Bersamanya bisa, sendiri pun biasa saja.\r\n\r\n&quot;&gt;With him can, itself was mediocre.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri.&quot;&gt;An, why you have a boyfriend, but do not have a girlfriend like ya ... You see, you often really go anywhere alone. &lt;/span&gt;&lt;span title=&quot;Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu.&quot;&gt;Uh, think like that weve not only out of the mouth of one or two friends. &lt;/span&gt;&lt;span title=&quot;Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu.&quot;&gt;But, that does not mean something like this would be a burden dipikiranmu. &lt;/span&gt;&lt;span title=&quot;Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.\r\n\r\n&quot;&gt;You need to remember, the rarity of her presence beside it a marker, if you girls are independent and not always depend on her.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.\r\n\r\n&quot;&gt;6. And with cueknya nature, you will feel special when she remembers small details about you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele.&quot;&gt;He was cool, but that does not mean he&#039;s forgetful with things that are considered trivial. &lt;/span&gt;&lt;span title=&quot;Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik?&quot;&gt;When you have told it, he was minimally resepon, but what if it turns out all that he remembered so well? &lt;/span&gt;&lt;span title=&quot;Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.\r\n\r\n&quot;&gt;Imagine if he remembers small details such as eating habits, riwat your pain, or a story about the difficulties you had to go through.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Ada saat tertentu dimana dia berusaha memanjakan.&quot;&gt;7. There is a particular moment in which he tried to spoil. &lt;/span&gt;&lt;span title=&quot;Nikmati saja;&quot;&gt;Just enjoy it; &lt;/span&gt;&lt;span title=&quot;maklum, jarang-jarang!\r\n\r\n&quot;&gt;Feedback, rarely!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi.&quot;&gt;Suddenly he took you to a region that had long edge of town you want to visit. &lt;/span&gt;&lt;span title=&quot;Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu.&quot;&gt;To get there, he also devote attention to you. &lt;/span&gt;&lt;span title=&quot;Kamu ingin makan di tempat ini, dia langsung menurutinya.&quot;&gt;You want to eat at this place, he immediately complied. &lt;/span&gt;&lt;span title=&quot;Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu.&quot;&gt;You want to buy the stuff, he did not hesitate to buy it for you. &lt;/span&gt;&lt;span title=&quot;Pokoknya hari itu, kamu serasa jadi putri sehari.\r\n\r\n&quot;&gt;Anyway that day, you seemed to be princess day.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya.&quot;&gt;Already not be surprised anymore, dinikmatin wrote all his attention. &lt;/span&gt;&lt;span title=&quot;Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe\r\n\r\n&quot;&gt;While there, and rarely too right ... hehehe&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Tak perlu cemas dia tebar pesona sana-sini.&quot;&gt;8. Do not worry her charisma and there. &lt;/span&gt;&lt;span title=&quot;Lihat saja sikapnya ke pacar sendiri!\r\n\r\n&quot;&gt;Look at his attitude to his own girlfriend!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem.&quot;&gt;You also need to know, the advantage of a couple who ignore the others can not make your heart calm and cool and calm. &lt;/span&gt;&lt;span title=&quot;Kamu nggak perlu cemas dia akan tebar pesona sana sini.&quot;&gt;You do not need to worry he would charisma here and there. &lt;/span&gt;&lt;span title=&quot;Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.\r\n\r\n&quot;&gt;The reason is not only because of his work is pretty solid, but you check it out for yourselves sikapnnya perfunctory.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Dia memperjuangkanmu meski kamu tak selalu sadar.&quot;&gt;9. He memperjuangkanmu even if you were not always aware. &lt;/span&gt;&lt;span title=&quot;Sosoknya lebih suka mendoakanmu dalam diam.\r\n\r\n&quot;&gt;That figure is more like is praying in silence.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kata siapa dia nggak berjuang untuk kamu?&quot;&gt;Who says he does not fight for you? &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya.&quot;&gt;Cueknya nature makes him not an exaggeration to show cause. &lt;/span&gt;&lt;span title=&quot;Dia itu sosok sederhana yang menjagamu cukup melalui doa.&quot;&gt;He was a modest figure that take care simply through prayer. &lt;/span&gt;&lt;span title=&quot;Karena, baginya doa itu lebih kuat dari apapun.&quot;&gt;Because, her prayer is more powerful than anything. &lt;/span&gt;&lt;span title=&quot;Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.\r\n\r\n&quot;&gt;He believes God never sleeps to hear his prayers and take care of one form or another.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya?&quot;&gt;Duh, still not convinced with all sincerity that is hidden behind nature indifferently? &lt;/span&gt;&lt;span title=&quot;Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya.&quot;&gt;He was cool, but that does not mean he can not treat you well. &lt;/span&gt;&lt;span title=&quot;Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.\r\n\r\n\r\n&quot;&gt;It is precisely the way he treated you the difference it makes you more sure that she was &quot;the right person&quot; you are looking for.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mustika Karindra&quot;&gt;Taken from Hipwee By Mustika Karindra&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(11, 6, 1, 'Cewek Bergigi Gingsul Emang Layak Disayang', '&lt;p&gt;Pernah lihat cewek bergigi gingsul senyum nggak? Manis ya. Entah kenapa senyum cewek bergigi gingsul itu enak dilihat. Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang. Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik. Tunggu deh, btw maloklusi gigi itu apa ya artinya?&lt;br /&gt;&lt;br /&gt;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar. Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis. Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul. Mau tahu alasannya kenapa? Baca ya..&lt;br /&gt;&lt;br /&gt;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.&lt;br /&gt;&lt;br /&gt;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis. Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya. Senyumnya yang aduhai membuatmu enggan untuk berpaling.&lt;br /&gt;&lt;br /&gt;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda. Mereka terlihat lebih menarik.&lt;br /&gt;&lt;br /&gt;Cewek bergigi gingsul itu punya kecantikan yang beda lho. Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik. Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka. Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya. Diam-diam kamu suka mengambil fotonya saat senyum.&lt;br /&gt;&lt;br /&gt;3. Cewek bergigi gingsul adalah pribadi yang percaya diri. Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.&lt;br /&gt;&lt;br /&gt;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka. Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka. Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan. Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.&lt;br /&gt;&lt;br /&gt;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute. Imut banget.&lt;br /&gt;&lt;br /&gt;Gigi gingsulnya bikin wajah dia terlihat cute. Setuju nggak? via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute. Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka. Cute yang bikin gemes deh&amp;hellip;&lt;br /&gt;&lt;br /&gt;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris. Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.&lt;br /&gt;&lt;br /&gt;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris. Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh. Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas. Asyik kan punya pacar yang selow bin humoris?&lt;br /&gt;&lt;br /&gt;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia. Duh, ngangenin banget itu senyumnya&lt;br /&gt;&lt;br /&gt;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia. Sehari nggak lihat dia aja udah bikin kamu kangen. Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum. Tuh, kan, punya cewek bergigi gingsul itu ngangenin!&lt;br /&gt;&lt;br /&gt;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka. Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan. Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri. So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Neneng Pratiwi&lt;/p&gt;'),
(12, 6, 2, 'Toothed Chick Gingsul Weve Worth Dear', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Pernah lihat cewek bergigi gingsul senyum nggak?&quot;&gt;Ever see a girl toothed smile gingsul not? &lt;/span&gt;&lt;span title=&quot;Manis ya.&quot;&gt;Sweet yes. &lt;/span&gt;&lt;span title=&quot;Entah kenapa senyum cewek bergigi gingsul itu enak dilihat.&quot;&gt;Somehow the girl toothed smile gingsul it unsightly. &lt;/span&gt;&lt;span title=&quot;Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang.&quot;&gt;They have a distinctive beauty and make people never tire of looking at. &lt;/span&gt;&lt;span title=&quot;Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik.&quot;&gt;The emergence of a real gear including dental malocclusion is actually even make a girl more attractive. &lt;/span&gt;&lt;span title=&quot;Tunggu deh, btw maloklusi gigi itu apa ya artinya?\r\n\r\n&quot;&gt;Wait for me, btw dental malocclusion was what yes means?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar.&quot;&gt;Malocclusion is a condition when the teeth do not grow in the correct place and aligned. &lt;/span&gt;&lt;span title=&quot;Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis.&quot;&gt;Well, it means you are lucky toothed girl gingsul for dental conditions that are not aligned precisely even make your smile more sweet. &lt;/span&gt;&lt;span title=&quot;Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul.&quot;&gt;But, more fortunate you are the guy who has a toothed girl gingsul. &lt;/span&gt;&lt;span title=&quot;Mau tahu alasannya kenapa?&quot;&gt;Want to know the reason why? &lt;/span&gt;&lt;span title=&quot;Baca ya..\r\n\r\n&quot;&gt;Read ya ..&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.\r\n\r\n&quot;&gt;1. gingsul toothed girl has a nice smile, so it makes you feel at home to look at his face.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis.&quot;&gt;The growth of the tooth that is not aligned with the other teeth actually make gingsul toothed girl has a nice smile. &lt;/span&gt;&lt;span title=&quot;Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya.&quot;&gt;The gingsul teeth do not interfere but instead make you feel at home to look at his face. &lt;/span&gt;&lt;span title=&quot;Senyumnya yang aduhai membuatmu enggan untuk berpaling.\r\n\r\n&quot;&gt;How sad smile makes you reluctant to turn.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda.&quot;&gt;2. The presence of the teeth, which grow on other teeth actually make gingsul toothed girl had a different beauty. &lt;/span&gt;&lt;span title=&quot;Mereka terlihat lebih menarik.\r\n\r\n&quot;&gt;They look more attractive.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cewek bergigi gingsul itu punya kecantikan yang beda lho.&quot;&gt;Chick toothed gingsul it has a beauty that is different you know. &lt;/span&gt;&lt;span title=&quot;Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik.&quot;&gt;Gingsulnya gear arguably even make them aesthetically appealing. &lt;/span&gt;&lt;span title=&quot;Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka.&quot;&gt;Teeth are included malocclusion that just so they appeal. &lt;/span&gt;&lt;span title=&quot;Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya.&quot;&gt;Because beauty is different that makes you gatel, luggage always wanted to immortalize her smile. &lt;/span&gt;&lt;span title=&quot;Diam-diam kamu suka mengambil fotonya saat senyum.\r\n\r\n&quot;&gt;Secretly you love to take a picture when a smile.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Cewek bergigi gingsul adalah pribadi yang percaya diri.&quot;&gt;3. Women toothed gingsul is personal confidence. &lt;/span&gt;&lt;span title=&quot;Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.\r\n\r\n&quot;&gt;Because they chose not wearing braces to correct the position of teeth.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka.&quot;&gt;Many of the girls who accidentally lets toothed gingsul gingsul them. &lt;/span&gt;&lt;span title=&quot;Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka.&quot;&gt;Rather than wear braces to correct the position of teeth that are misaligned, they prefer to maintain their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan.&quot;&gt;They believe that gingsul teeth can be regarded as an excess and grace granted by God. &lt;/span&gt;&lt;span title=&quot;Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.\r\n\r\n&quot;&gt;It shows that they are personally confident and grateful for what has been given by God.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute.&quot;&gt;4. You would agree that gingsul toothed girl was cute. &lt;/span&gt;&lt;span title=&quot;Imut banget.\r\n\r\n&quot;&gt;So cute.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gigi gingsulnya bikin wajah dia terlihat cute.&quot;&gt;Dental gingsulnya face make her look cute. &lt;/span&gt;&lt;span title=&quot;Setuju nggak?&quot;&gt;Agree not? &lt;/span&gt;&lt;span title=&quot;via tidurdotcom.wordpress.com\r\n\r\n&quot;&gt;via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute.&quot;&gt;Somehow the girl toothed gingsul it looks more cute. &lt;/span&gt;&lt;span title=&quot;Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka.&quot;&gt;You would agree that their faces become more cute with their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Cute yang bikin gemes deh&amp;hellip;\r\n\r\n&quot;&gt;Cute that I gemes deh ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris.&quot;&gt;5. Not only has a sweet smile aja, toothed girl gingsul also selow and humorous. &lt;/span&gt;&lt;span title=&quot;Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.\r\n\r\n&quot;&gt;Let the word often dibecandain &#039;rice nyempil in the teeth&#039;, they relaxed wrote.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris.&quot;&gt;Not only has a sweet smile aja, toothed girl gingsul also arguably selow and humorous. &lt;/span&gt;&lt;span title=&quot;Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh.&quot;&gt;Although often dibecandain &#039;rice nyempil in the teeth&#039;, they selow aja tuh. &lt;/span&gt;&lt;span title=&quot;Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas.&quot;&gt;Instead of sulking because gingsulnya often diledekin, they would respond by laughter off. &lt;/span&gt;&lt;span title=&quot;Asyik kan punya pacar yang selow bin humoris?\r\n\r\n&quot;&gt;Not it be nice to have a boyfriend selow bin humorous?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;6. different beauty can make you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Duh, ngangenin banget itu senyumnya\r\n\r\n&quot;&gt;Duh, it&#039;s really ngangenin smile&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;Sweet smile, face interesting and cute, makes you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Sehari nggak lihat dia aja udah bikin kamu kangen.&quot;&gt;The day did not see him just&#039;ve made you miss. &lt;/span&gt;&lt;span title=&quot;Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum.&quot;&gt;Once apart at him, for a few moments you Mandangin photographs are again smiling. &lt;/span&gt;&lt;span title=&quot;Tuh, kan, punya cewek bergigi gingsul itu ngangenin!\r\n\r\n&quot;&gt;There, right, got it ngangenin gingsul toothed girl!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka.&quot;&gt;It is admirable of gingsul toothed girl is their confidence. &lt;/span&gt;&lt;span title=&quot;Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan.&quot;&gt;Rather than minder with one tooth position is not parallel, they are grateful as a sign of excess and grace of God. &lt;/span&gt;&lt;span title=&quot;Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri.&quot;&gt;Fortunately you have a girl toothed gingsul because in addition has a nice smile and attractive face, he also humorous and confident. &lt;/span&gt;&lt;span title=&quot;So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.\r\n\r\n\r\n&quot;&gt;So, you are toothed gingsul, which tried to smile ...:) Ah, sweet.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Neneng Pratiwi&quot;&gt;Taken from Hipwee By Neng Pratiwi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(13, 7, 1, 'Ingin Sukses Terapkan 7 Tips Sukses Oprah Winfrey', '&lt;p&gt;Kenal dengan Oprah Winfrey? Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu. Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal. Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya. Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.&lt;br /&gt;&lt;br /&gt;Nah, untuk kita anak muda. Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?&lt;br /&gt;&lt;br /&gt;1. Fokuslah pada tempatmu, bukan tempat orang lain&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi. Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita. Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).&lt;br /&gt;&lt;br /&gt;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain. &lt;br /&gt;&lt;br /&gt;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!&lt;br /&gt;&lt;br /&gt;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya tidak percaya akan kegagalan. Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan. Jika anda gagal, cobalah lakukan lagi. Lakukan lebih baik pada percobaan kedua. Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko. Ini adalah saatnya. Ambil kesempatan ini dan lakukan!&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Mulai saat ini jangan pernah takut gagal! Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan. Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.&lt;br /&gt;&lt;br /&gt;3. Rasa takut itu ada karena kamu membiarkannya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa. Dia di kos sendirian dan ada kecoa gede nongol di sampingnya. Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam). &lt;br /&gt;&lt;br /&gt;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya. Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya. Dengan apa? Sapu? Pedang? Bukan! Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu. Misal, kamu takut ketinggian. Coba main flying fox. Kamu takut kecoa, coba main sama kecoa. Beres, kan?&lt;br /&gt;&lt;br /&gt;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Buatlah aturan untuk dirimu sendiri. Jangan menunggu perintah dan aturan orang lain. Kenapa? Karena manusia cenderung untuk segan pada orang yang membuat perintah. Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri. Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.&lt;br /&gt;&lt;br /&gt;5. Kamu akan memanen apa yang kamu tanam&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Nah, di sini hukum alam berlaku. Jika kamu menanam pisang, yang kamu panen pasti pisang. Bukan mangga. Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik. &lt;br /&gt;&lt;br /&gt;Ngerti, nggak? Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh. Daripada urusannya panjang.&lt;br /&gt;&lt;br /&gt;6. Lupakan masa lalu! Karena kamu hidup di masa sekarang, bukan masa lalumu itu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&lt;br /&gt;&lt;br /&gt;Buat apa mengingat masa lalu? Kalau masa lalu itu hanya berisi hal-hal negatif? Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif. Yang hanya membuat semangat hidup kita turun. Misalnya, mantan. Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit? Gunanya apa, gitu? Mending fokus pada masa depanmu. Pada cewek atau cowok yang mungkin sekarang sedang menunggu. Fokus buat menjemputnya. Fokus untuk menjemput mimpimu!&lt;br /&gt;&lt;br /&gt;7. Tuhan itu penulis skenario. Kamu adalah pemegang kendalinya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Tuhan itu yang menciptakan manusia dan menulis takdirnya. Tapi, kita bisa mengubah takdir dengan berusaha. Karena sebenarnya kita punya kendali. Kita adalah sopirnya. Kita memegang setir mobilnya. Jadi, gak usah takut! Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.&lt;br /&gt;&lt;br /&gt;Gimana? Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah? Atau mungkin makin bingung? (Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya). Oh ya, selain ketujuh tips itu. Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle. Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes). Kalau nggak ada, kamu bisa beli lewat online. Ini bukan promosi loh, ya. Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mitha Tiara&lt;/p&gt;'),
(14, 7, 2, 'Want to success Apply 7 Tips for Success Oprah Winfrey', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kenal dengan Oprah Winfrey?&quot;&gt;Familiar with Oprah Winfrey? &lt;/span&gt;&lt;span title=&quot;Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu.&quot;&gt;If you do not know (yes acquaintances, dong), then start now perbanyaklah find out about the figure of the black woman. &lt;/span&gt;&lt;span title=&quot;Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal.&quot;&gt;His features were so generous, kind, makes it even more famous. &lt;/span&gt;&lt;span title=&quot;Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya.&quot;&gt;He is a humble figure behind all assets held. &lt;/span&gt;&lt;span title=&quot;Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.\r\n\r\n&quot;&gt;In fact, Oprah often provide outstanding motivations so that others are able to become successful like him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, untuk kita anak muda.&quot;&gt;Well, for our young people. &lt;/span&gt;&lt;span title=&quot;Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?\r\n\r\n&quot;&gt;Successful Tips from Oprah highly obliged you know, because there is no harm in it to learn from the success of others?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Fokuslah pada tempatmu, bukan tempat orang lain\r\n\r\n&quot;&gt;1. Focus on where you are, not where others&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi.&quot;&gt;&quot;Be grateful for everything you have, and you&#039;ll have some more. &lt;/span&gt;&lt;span title=&quot;Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;\r\n\r\n&quot;&gt;If you concentrate on what you do not have, you will never have enough. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita.&quot;&gt;Here Oprah wanted to say that we should focus on what is in us, the talent, ability, and whatever we have, as well as in our dreams. &lt;/span&gt;&lt;span title=&quot;Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).\r\n\r\n&quot;&gt;If we are able to focus on the main things, then the system SAR or the reticular activating system in the human mind will help find evidence (in this case the evidence of thought indicated by the search for solutions).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain.\r\n\r\n&quot;&gt;Now, with grateful we are more focused on what is inside of us and it just makes us appreciate ourselves or others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!\r\n\r\n&quot;&gt;So from now on, try to focus on yourself and your dreams!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu\r\n\r\n&quot;&gt;2. Understand the nature of the failure and the failure to realize that actually want to be nice to you&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya tidak percaya akan kegagalan.&quot;&gt;&quot;I do not believe in failure. &lt;/span&gt;&lt;span title=&quot;Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;\r\n\r\n&quot;&gt;Not a failure if you enjoy the process. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan.&quot;&gt;&quot;Do one thing that you think you can not do. &lt;/span&gt;&lt;span title=&quot;Jika anda gagal, cobalah lakukan lagi.&quot;&gt;If you fail, try again. &lt;/span&gt;&lt;span title=&quot;Lakukan lebih baik pada percobaan kedua.&quot;&gt;Do better in the second experiment. &lt;/span&gt;&lt;span title=&quot;Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko.&quot;&gt;People who have never fallen are those who never take risks. &lt;/span&gt;&lt;span title=&quot;Ini adalah saatnya.&quot;&gt;It is time. &lt;/span&gt;&lt;span title=&quot;Ambil kesempatan ini dan lakukan!&amp;rdquo;\r\n\r\n&quot;&gt;Take this opportunity and do! &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;I believe one of the biggest risk in life is not the courage to take risks.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulai saat ini jangan pernah takut gagal!&quot;&gt;From this moment never afraid to fail! &lt;/span&gt;&lt;span title=&quot;Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan.&quot;&gt;Enjoy aja process, as each process it must be a new lesson that you get. &lt;/span&gt;&lt;span title=&quot;Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.\r\n\r\n&quot;&gt;And the lesson so that&#039;s what your biggest capital to achieve success.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Rasa takut itu ada karena kamu membiarkannya\r\n\r\n&quot;&gt;3. Fear is there because you let&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Whatever you fear actually has no power over you - fear that control of yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa.&quot;&gt;For this case we suppose there was a girl afraid of cockroaches. &lt;/span&gt;&lt;span title=&quot;Dia di kos sendirian dan ada kecoa gede nongol di sampingnya.&quot;&gt;He was at boarding alone and there was a big cockroach appeared beside him. &lt;/span&gt;&lt;span title=&quot;Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam).\r\n\r\n&quot;&gt;Would not want him should kill a cockroach that even though he was afraid, lha wong is in his rented again there is not anybody (the story friend&#039;s apartment on pulkam).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya.&quot;&gt;Well, from the parable that we can know that fear is there because we were thinking about it. &lt;/span&gt;&lt;span title=&quot;Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya.&quot;&gt;So, if we want to kill the fear was so in only one way, namely to fight it. &lt;/span&gt;&lt;span title=&quot;Dengan apa?&quot;&gt;With what? &lt;/span&gt;&lt;span title=&quot;Sapu?&quot;&gt;Broom? &lt;/span&gt;&lt;span title=&quot;Pedang?&quot;&gt;Sword? &lt;/span&gt;&lt;span title=&quot;Bukan!&quot;&gt;Not! &lt;/span&gt;&lt;span title=&quot;Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu.&quot;&gt;Fight your fear that by doing things that you fear. &lt;/span&gt;&lt;span title=&quot;Misal, kamu takut ketinggian.&quot;&gt;For example, you are afraid of heights. &lt;/span&gt;&lt;span title=&quot;Coba main flying fox.&quot;&gt;Try playing the flying fox. &lt;/span&gt;&lt;span title=&quot;Kamu takut kecoa, coba main sama kecoa.&quot;&gt;You&#039;re afraid of cockroaches, try to play with a cockroach. &lt;/span&gt;&lt;span title=&quot;Beres, kan?\r\n\r\n&quot;&gt;Beres, right?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya\r\n\r\n&quot;&gt;4. Do your right thing, even if nobody else sees&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;The essence of integrity is doing the right thing, regardless of whether others know you do it or not.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buatlah aturan untuk dirimu sendiri.&quot;&gt;Make a rule for yourself. &lt;/span&gt;&lt;span title=&quot;Jangan menunggu perintah dan aturan orang lain.&quot;&gt;Do not wait for orders and rules of others. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena manusia cenderung untuk segan pada orang yang membuat perintah.&quot;&gt;Because humans tend to shy at the person who made the order. &lt;/span&gt;&lt;span title=&quot;Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri.&quot;&gt;If we make a rule for yourself, then we respect ourselves. &lt;/span&gt;&lt;span title=&quot;Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.\r\n\r\n&quot;&gt;Because of the good things that should be done to yourself first, then to others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kamu akan memanen apa yang kamu tanam\r\n\r\n&quot;&gt;5. You will reap what you plant&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;One thing I believe is what you give will come back to yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, di sini hukum alam berlaku.&quot;&gt;Well, here the laws of nature apply. &lt;/span&gt;&lt;span title=&quot;Jika kamu menanam pisang, yang kamu panen pasti pisang.&quot;&gt;If you cultivate banana, banana sure that you harvest. &lt;/span&gt;&lt;span title=&quot;Bukan mangga.&quot;&gt;Not mango. &lt;/span&gt;&lt;span title=&quot;Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik.\r\n\r\n&quot;&gt;If you do good, you definitely yes dapetnya also good.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ngerti, nggak?&quot;&gt;You know, no? &lt;/span&gt;&lt;span title=&quot;Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh.&quot;&gt;If you do not understand tanyain to the author personally aja, deh. &lt;/span&gt;&lt;span title=&quot;Daripada urusannya panjang.\r\n\r\n&quot;&gt;Instead of a long affair.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Lupakan masa lalu!&quot;&gt;6. Forget the past! &lt;/span&gt;&lt;span title=&quot;Karena kamu hidup di masa sekarang, bukan masa lalumu itu\r\n\r\n&quot;&gt;Because you live in the present, not your past that&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&gt;&quot;Take a breath, release, and remind yourself that now is the time you have for sure.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buat apa mengingat masa lalu?&quot;&gt;Why recall the past? &lt;/span&gt;&lt;span title=&quot;Kalau masa lalu itu hanya berisi hal-hal negatif?&quot;&gt;If the past it was only contain negative things? &lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif.&quot;&gt;Here Oprah wanted to say that we should forget the past are negative. &lt;/span&gt;&lt;span title=&quot;Yang hanya membuat semangat hidup kita turun.&quot;&gt;Which only makes the spirit of our lives down. &lt;/span&gt;&lt;span title=&quot;Misalnya, mantan.&quot;&gt;For example, ex. &lt;/span&gt;&lt;span title=&quot;Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit?&quot;&gt;Why should you try to remember that the former will only put you back on the pain? &lt;/span&gt;&lt;span title=&quot;Gunanya apa, gitu?&quot;&gt;What point, right? &lt;/span&gt;&lt;span title=&quot;Mending fokus pada masa depanmu.&quot;&gt;Mending focus on your future. &lt;/span&gt;&lt;span title=&quot;Pada cewek atau cowok yang mungkin sekarang sedang menunggu.&quot;&gt;On a girl or a boy who might now pending. &lt;/span&gt;&lt;span title=&quot;Fokus buat menjemputnya.&quot;&gt;Focus for picking her up. &lt;/span&gt;&lt;span title=&quot;Fokus untuk menjemput mimpimu!\r\n\r\n&quot;&gt;Focus to pick your dream!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Tuhan itu penulis skenario.&quot;&gt;7. God is the screenwriter. &lt;/span&gt;&lt;span title=&quot;Kamu adalah pemegang kendalinya\r\n\r\n&quot;&gt;You are a holder of control&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Each of us is responsible for our own lives - not anyone else.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tuhan itu yang menciptakan manusia dan menulis takdirnya.&quot;&gt;God that created man and wrote his destiny. &lt;/span&gt;&lt;span title=&quot;Tapi, kita bisa mengubah takdir dengan berusaha.&quot;&gt;But, we can change destiny by trying. &lt;/span&gt;&lt;span title=&quot;Karena sebenarnya kita punya kendali.&quot;&gt;Because actually we have no control. &lt;/span&gt;&lt;span title=&quot;Kita adalah sopirnya.&quot;&gt;We are the driver. &lt;/span&gt;&lt;span title=&quot;Kita memegang setir mobilnya.&quot;&gt;We are holding the steering wheel. &lt;/span&gt;&lt;span title=&quot;Jadi, gak usah takut!&quot;&gt;So, do not be afraid! &lt;/span&gt;&lt;span title=&quot;Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.\r\n\r\n&quot;&gt;Because this is your life and you are most familiar with what you want, not someone else.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gimana?&quot;&gt;How? &lt;/span&gt;&lt;span title=&quot;Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah?&quot;&gt;Already started to understand the perspective of success of Oprah? &lt;/span&gt;&lt;span title=&quot;Atau mungkin makin bingung?&quot;&gt;Or maybe even more confused? &lt;/span&gt;&lt;span title=&quot;(Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya).&quot;&gt;(Kan was already spelled out, if still confused nanya directly to the author). &lt;/span&gt;&lt;span title=&quot;Oh ya, selain ketujuh tips itu.&quot;&gt;Oh yes, in addition to the seven tips that. &lt;/span&gt;&lt;span title=&quot;Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle.&quot;&gt;Oprah advised to read one book called &quot;The New World&quot; ( &quot;New World&quot;) written by Eckhart Tolle. &lt;/span&gt;&lt;span title=&quot;Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes).&quot;&gt;You can get this book in bookstores (not a pharmacy or hardware store, gaes). &lt;/span&gt;&lt;span title=&quot;Kalau nggak ada, kamu bisa beli lewat online.&quot;&gt;If no, you can purchase through online. &lt;/span&gt;&lt;span title=&quot;Ini bukan promosi loh, ya.&quot;&gt;This is not a promotion tablets, yes. &lt;/span&gt;&lt;span title=&quot;Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.\r\n\r\n\r\n&quot;&gt;Just wanna love you guys know that weve wrote for his life again upset and want to live a happy life physically and mentally.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mitha Tiara&quot;&gt;Taken from Hipwee By Mitha Tiara&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(15, 8, 1, '7 Ide Beri Edukasi Keuangan Kepada Anak', '&lt;p&gt;Orangtua merupakan sosok utama yang dapat mengenalkan edukasi keuangan kepada anak.&lt;br /&gt;&lt;br /&gt;Cara ini dilakukan agar ketika anak mulai beranjak dewasa, ia akan bisa membuat keputusan yang baik mengenai keuangan.&lt;br /&gt;&lt;br /&gt;Bila dilihat dari segi waktu yang tepat dalam mengedukasi anak adalah ketika anak sudah masuk usia Sekolah dasar atau SD.&lt;br /&gt;&lt;br /&gt;Sebab di usia tersebut anak akan belajar matematika dasar seperti penambahan dan pengurangan angka yang dapat dilatih dan diterapkan dalam keseharian dengan cara menabung.&lt;br /&gt;&lt;br /&gt;Apabila di sekolahnya diajarkan menabung dengan dibuatkan buku tabungan, maka tugasnya orang tua hanya mengontrol saja agar pengeluarannya dari uang saku tetap ada, namun menabungnya pun juga tetap ada.&lt;br /&gt;&lt;br /&gt;Tentu sebagai orang tua tidak dapat mengandalkan sepenuhnya dalam pengajaran pendidikan khususnya untuk mendidik anak tentang keuangan sejak kecil.&lt;br /&gt;&lt;br /&gt;Oleh karena itu orang tua juga dapat mengajarkan pada anak usia dini untuk dapat mengelola keuangan yang dimiliki anak sejak dini, dengan cara berikut di antaranya&lt;br /&gt;&lt;br /&gt;1. Kenalkan dan Ajarkan Tentang Konsep Uang&lt;br /&gt;&lt;br /&gt;Ketika anak sudah mulai mampu berhitung, maka tidak ada salahnya mengajarkan atau mengenalkan anak tentang uang, misalnya dari pecahan kecil seperti uang lima ratus rupiah dan sejenisnya. Ajak anak berhitung selisih uang yang diberikan orang tua dan yang telah ia gunakan untuk jajan.&lt;br /&gt;&lt;br /&gt;2. Beri Pengajaran dengan Memberikan Uang Saku&lt;br /&gt;&lt;br /&gt;Dengan memberikannya uang saku, itu akan mengajak anak Anda untuk belajar dewasa mengatur keuangan. Sehingga secara perlahan ia akan mulai untuk mengelola keuangan yang dimilikinya.&lt;br /&gt;&lt;br /&gt;3. Ajarkan Anak untuk Terbiasa Menabung&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan anak menabung, maka anak akan lebih disiplin dalam mengontrol keuangan yang telah diberikan oleh orang tuanya.&lt;br /&gt;&lt;br /&gt;Berikanlah penjelasan sederhana dengan menabung anak akan mendapatkan sesuatu yang berharga di masa mendatang, serta ajarkan manfaat dari menyisihkan uang jajannya setiap hari dengan dimasukkan ke celengan terlebih dulu.&lt;br /&gt;&lt;br /&gt;Kemudian ketika beranjak dewasa, anak diajarkan untuk berinvestasi secara perlahan-lahan dengan mengajarkannya membeli reksa dana dan sejenisnya.&lt;br /&gt;&lt;br /&gt;4. Ajarkan Anak untuk Berbagi Pada Sesamanya&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan konsep berbagi dengan saudaranya, secara perlahan itu akan mengajarkan anak mengenai beramal yang identik dengan kegiatan keagamaan sehingga diharapkan ia akan menjadi lebih saleh.&lt;br /&gt;&lt;br /&gt;Dengan pemahaman mendasar tersebut mengajarkan anak agar dapat tetap berbagi dengan sesamanya di sekolah walaupun orang tuanya sedang tidak di dekatnya.&lt;br /&gt;&lt;br /&gt;Selain itu ajarkan pula nilai kemanusiaan bahwa tidak semua manusia memiliki nasib yang sama. Sehingga anak menyadari betapa pentingnya berbagi dengan sesama khususnya bagi mereka yang membutuhkan.&lt;br /&gt;&lt;br /&gt;5. Diajarkan Melalui Konsep Game atau Permainan&lt;br /&gt;&lt;br /&gt;Melalui permainan anak tanpa sadar sedang diajarkan tentang mengelola keuangan. Sebagai contoh dalam memainkan permainan monopoli, cashflow 101, dan masih banyak lagi.&lt;br /&gt;&lt;br /&gt;Manfaatkan permainan tersebut dengan lebih menyenangkan sehingga perlahan anak dapat menerapkannya dalam kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;6. Ajak Anak Ketika Belanja Bulanan&lt;br /&gt;&lt;br /&gt;Dengan mengajak anak berbelanja, secara tidak langsung itu akan mengenalkan angka secara riil di lapangan.&lt;br /&gt;&lt;br /&gt;Dengan begitu anak akan dapat secara otomatis berhitung jumlah barang yang dibeli orang tuanya dan jumlah uang yang dikeluarkannya.&lt;br /&gt;&lt;br /&gt;Selain itu anak pun menyaksikan langsung terjadinya transaksi jual beli mulai dari menanyakan harga, tawar menawar, hingga terjadinya pembelian.&lt;br /&gt;&lt;br /&gt;7. Ajarkan Mengenai Prioritas&lt;br /&gt;&lt;br /&gt;Bila secara langsung mengajarkan secara definisi dan teori memang anak tidak langsung dapat memahaminya. Namun bila diberikan pertanyaan terbuka seperti mau mainan atau jalan-jalan, maka anak akan memilih keduanya.&lt;br /&gt;&lt;br /&gt;Namun ajarkan anak untuk memilih salah satunya mana yang lebih didahulukan. Dengan begitu anak secara perlahan diajarkan untuk mana yang lebih prioritas untuk didahulukan tanpa harus mengajarkan secara formal.&lt;br /&gt;&lt;br /&gt;Biasakan Anak Anda Dalam Mengatur Keuangan&lt;br /&gt;&lt;br /&gt;Harapannya dengan menerapkan cara tersebut anak dapat segera memahami bagaimana cara mengelola keuangan yang baik sehingga tidak perlu lagi repot mengajarkannya secara khusus karena lebih tepat serta efisien bila mengajarkannya dengan membiasakan diri mengatur keuangan mulai dari uang sakunya di kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;Jadi tidak ada lagi anak yang hanya mampu menghamburkan uang yang diberikan oleh orang tuanya saja tanpa dikelola dengan baik karena orang tuanya telah mengajarkannya sejak dini.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Liputan 6 Oleh Agustina Melani&lt;/p&gt;'),
(16, 8, 2, '7 Idea Give Financial Education for Children', '&lt;p&gt;Parents are central figures to introduce financial education to children.&lt;br /&gt;&lt;br /&gt;How this is done so that when the children started growing up, he will be able to make good decisions regarding finances.&lt;br /&gt;&lt;br /&gt;When viewed in terms of a great time in educating children is when children have entered primary school or elementary school age.&lt;br /&gt;&lt;br /&gt;Because at that age children will learn basic math like addition and subtraction of numbers that can be trained and applied in everyday life by saving.&lt;br /&gt;&lt;br /&gt;When in school are taught savings passbook to be made, then the duty of parents to control only course that expenditure of the allowance remains, but to save it was also still there.&lt;br /&gt;&lt;br /&gt;Of course as parents can not rely entirely on teaching education, especially for educating children about finances since childhood.&lt;br /&gt;&lt;br /&gt;Therefore, parents can also teach in early childhood to be able to manage the financial owned since early childhood, in the following way in between&lt;br /&gt;&lt;br /&gt;1. Recommend and Teach About Money Concepts&lt;br /&gt;&lt;br /&gt;When the child has begun to count, then there is no harm in teaching or introducing kids about money, for example, from a small fraction as five hundred rupiah and the like. Encourage children to count the difference between the money given by parents and that he had used for snacks.&lt;br /&gt;&lt;br /&gt;2. Give Teaching by Giving Allowance&lt;br /&gt;&lt;br /&gt;By giving them pocket money, it will take your child to an adult learn to manage finances. So slowly it will start to manage its finances.&lt;br /&gt;&lt;br /&gt;3. Teach Kids for Saving Accustomed&lt;br /&gt;&lt;br /&gt;By teaching children to save, then the child will be more discipline in financial control which have been given by their parents.&lt;br /&gt;&lt;br /&gt;Give a simple explanation to save the child will get something valuable in the future, as well as teach the benefits of set aside allowance every day to put the piggy bank first.&lt;br /&gt;&lt;br /&gt;Then, as adults, children are taught to invest gradually to teach buy mutual funds and the like.&lt;br /&gt;&lt;br /&gt;4. Teach Kids to Share In neighbor&lt;br /&gt;&lt;br /&gt;By teaching the concept of sharing with his brother, slowly it will teach children about the charity that is synonymous with religious activities so hopefully it will become more pious.&lt;br /&gt;&lt;br /&gt;With a fundamental understanding of the teaching of children in order to keep share with others in the school even though his parents were not nearby.&lt;br /&gt;&lt;br /&gt;Besides teaching the value of humanity that not all humans have the same fate. So the children realize the importance of sharing with others, especially for those in need.&lt;br /&gt;&lt;br /&gt;5. Taught Through Concept Game or Games&lt;br /&gt;&lt;br /&gt;Through the game unwittingly being taught about managing finances. For example in playing the game of monopoly, cashflow 101, and many more.&lt;br /&gt;&lt;br /&gt;Make the game more fun with so slow a child can apply them in their daily lives.&lt;br /&gt;&lt;br /&gt;6. Encourage Kids When Shopping Monthly&lt;br /&gt;&lt;br /&gt;By taking children shopping, indirectly it will introduce the figure in real terms in the field.&lt;br /&gt;&lt;br /&gt;That way the child will be able to automatically count the number of items purchased parents and the amount of money spent.&lt;br /&gt;&lt;br /&gt;In addition, children also witnessed the sale and purchase transactions ranging from the asking price, bargaining, to the purchase.&lt;br /&gt;&lt;br /&gt;7. Teach About Priorities&lt;br /&gt;&lt;br /&gt;When directly taught by definition and theory does not direct the child can understand. However, when given an open question as would a toy or sightseeing, then the child will choose both.&lt;br /&gt;&lt;br /&gt;But teach a child to choose one which would take precedence. That way the child gradually taught to which more priority to the precedence without having taught formally.&lt;br /&gt;&lt;br /&gt;Familiarize Your Child In the Set Finance&lt;br /&gt;&lt;br /&gt;The expectation by adopting the child can immediately understand how to manage finances well so no need to bother to teach it specifically because it is more appropriate and efficient to teach them to get used to managing money from his pocket money in his daily life.&lt;br /&gt;&lt;br /&gt;So no more children were only able to spend money given by parents without a well run because his parents had taught him early on.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Taken from Liputan 6 By Agustina Melani&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_gallery`
--

CREATE TABLE `post_gallery` (
  `id_post_gallery` int(5) NOT NULL,
  `id_post` int(5) NOT NULL DEFAULT 0,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `groups` varchar(50) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `groups`, `options`, `value`) VALUES
(1, 'general', 'web_name', 'SMK Global Mandiri'),
(2, 'general', 'web_url', 'http://localhost/PopojiCMS-master'),
(3, 'general', 'web_meta', 'SMK Jaya'),
(4, 'general', 'web_keyword', 'popojicms buat sendiri rasa webmu'),
(5, 'general', 'web_owner', 'PopojiCMS'),
(6, 'general', 'email', 'admin@smkglobal.com'),
(7, 'general', 'telephone', '000-0000-0000'),
(8, 'general', 'fax', '000-0000-0000'),
(9, 'general', 'address', '&lt;strong&gt;Headquarters:&lt;/strong&gt;&lt;br&gt;\n795 Folsom Ave, Suite 600&lt;br&gt;\nSan Francisco, CA 94107'),
(10, 'general', 'geocode', 'latitude: -6.1753871, longitude: 106.8249641,'),
(11, 'image', 'favicon', 'favicon.png'),
(12, 'image', 'logo', 'logo.png'),
(13, 'image', 'img_medium', '640x480'),
(14, 'local', 'country', 'Indonesia'),
(15, 'local', 'region_state', 'Sulawesi Utara'),
(16, 'local', 'timezone', 'Pacific/Midway'),
(17, 'config', 'maintenance', 'N'),
(18, 'config', 'member_registration', 'N'),
(19, 'config', 'comment', 'N'),
(20, 'config', 'item_per_page', '5'),
(21, 'config', 'google_analytics', ''),
(22, 'config', 'recaptcha_sitekey', '6LckEgETAAAAAPdqrQSY_boMDLZRL1vpkAatVqKf'),
(23, 'config', 'recaptcha_secretkey', '6LckEgETAAAAAHqx4VFD4zNL96P9UEikD8BHfT28'),
(24, 'mail', 'mail_protocol', 'Mail'),
(25, 'mail', 'mail_hostname', ''),
(26, 'mail', 'mail_username', ''),
(27, 'mail', 'mail_password', ''),
(28, 'mail', 'mail_port', ''),
(29, 'config', 'permalink', 'slug/post-title'),
(30, 'config', 'slug_permalink', 'detailpost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe`
--

CREATE TABLE `subscribe` (
  `id_subscribe` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tag_seo` varchar(100) NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `title`, `tag_seo`, `count`) VALUES
(1, 'indonesia', 'indonesia', 8),
(2, 'wisata religi', 'wisata-religi', 5),
(3, 'toleransi beragama', 'toleransi-beragama', 5),
(4, 'manado', 'manado', 3),
(5, 'wisata manado', 'wisata-manado', 3),
(6, 'sulawesi utara', 'sulawesi-utara', 3),
(7, 'startup', 'startup', 6),
(8, 'impian', 'impian', 3),
(9, 'usaha kecil', 'usaha-kecil', 3),
(10, 'bisnis', 'bisnis', 3),
(11, 'cowok', 'cowok', 3),
(12, 'pendamping', 'pendamping', 6),
(13, 'cewek', 'cewek', 3),
(14, 'ginsul', 'ginsul', 3),
(15, 'sayang', 'sayang', 3),
(16, 'sukses', 'sukses', 3),
(17, 'tips sukses', 'tips-sukses', 3),
(18, 'edukasi anak', 'edukasi-anak', 4),
(19, 'keuangan', 'keuangan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `theme`
--

INSERT INTO `theme` (`id_theme`, `title`, `author`, `folder`, `active`) VALUES
(1, 'Chingsy', 'PopojiCMS', 'chingsy', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `traffic`
--

CREATE TABLE `traffic` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `traffic`
--

INSERT INTO `traffic` (`ip`, `browser`, `os`, `platform`, `country`, `city`, `date`, `hits`, `online`) VALUES
('::1', 'Firefox', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101 Firefox/68.0', 'Windows', '', '', '2019-08-27', 2, '1566982837'),
('::1', 'Firefox', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows', '', '', '2019-09-08', 2, '1568000745');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '2',
  `block` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `forget_key` varchar(100) DEFAULT NULL,
  `locktype` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `bio`, `picture`, `level`, `block`, `id_session`, `tgl_daftar`, `forget_key`, `locktype`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Super Administrator', 'admin@smkglobal.com', '000-0000-0000', 'No matter how exciting or significant a person\'s life is, a poorly written biography will make it seem like a snore. On the other hand, a good biographer can draw insight from an ordinary life-because they recognize that even the most exciting life is an ordinary life! After all, a biography isn\'t supposed to be a collection of facts assembled in chronological order; it\'s the biographer\'s interpretation of how that life was different and important.', '', '1', 'N', '9488hue33mc6t8ucq97k2go1f2', '2019-08-27', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `menu` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`, `title`, `role`, `menu`) VALUES
(1, 'superadmin', 'Super Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1),
(2, 'admin', 'Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"1\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(3, 'manager', 'Manager', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(4, 'member', 'Member', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"component\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"contact\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"menumanager\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"oauth\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"user\",\"create\":\"0\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`id_category_description`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id_oauth`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indeks untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  ADD PRIMARY KEY (`id_pages_description`);

--
-- Indeks untuk tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indeks untuk tabel `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id_post_category`);

--
-- Indeks untuk tabel `post_description`
--
ALTER TABLE `post_description`
  ADD PRIMARY KEY (`id_post_description`);

--
-- Indeks untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  ADD PRIMARY KEY (`id_post_gallery`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id_subscribe`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category_description`
--
ALTER TABLE `category_description`
  MODIFY `id_category_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `component`
--
ALTER TABLE `component`
  MODIFY `id_component` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id_oauth` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id_pages` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  MODIFY `id_pages_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id_post_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_description`
--
ALTER TABLE `post_description`
  MODIFY `id_post_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  MODIFY `id_post_gallery` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id_subscribe` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `popojismkbp`
--
CREATE DATABASE IF NOT EXISTS `popojismkbp` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `popojismkbp`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE `album` (
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`id_album`, `title`, `seotitle`, `active`) VALUES
(1, 'Pure', 'pure', 'Y'),
(2, 'Plain', 'plain', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category`
--

CREATE TABLE `category` (
  `id_category` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category`
--

INSERT INTO `category` (`id_category`, `id_parent`, `seotitle`, `picture`, `active`) VALUES
(1, 0, 'indonesiaku', '', 'Y'),
(2, 0, 'motivasi', '', 'Y'),
(3, 0, 'hubungan', '', 'Y'),
(4, 0, 'sukses', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `category_description`
--

CREATE TABLE `category_description` (
  `id_category_description` int(5) NOT NULL,
  `id_category` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `category_description`
--

INSERT INTO `category_description` (`id_category_description`, `id_category`, `id_language`, `title`) VALUES
(1, 1, 1, 'Indonesiaku'),
(2, 1, 2, 'My Indonesia'),
(3, 2, 1, 'Motivasi'),
(4, 2, 2, 'Motivation'),
(5, 3, 1, 'Hubungan'),
(6, 3, 2, 'Relationship'),
(7, 4, 1, 'Sukses'),
(8, 4, 2, 'Success');

-- --------------------------------------------------------

--
-- Struktur dari tabel `comment`
--

CREATE TABLE `comment` (
  `id_comment` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `id_post` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `url` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N',
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `comment`
--

INSERT INTO `comment` (`id_comment`, `id_parent`, `id_post`, `name`, `email`, `url`, `comment`, `date`, `time`, `active`, `status`) VALUES
(1, 0, 8, 'Jenuar Dalapang', 'djenuar@gmail.com', '', 'Edukasi keuangan terhadap anak memang penting sejak dini', '2016-07-28', '12:40:24', 'Y', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `component`
--

CREATE TABLE `component` (
  `id_component` int(5) NOT NULL,
  `component` varchar(100) NOT NULL,
  `type` enum('component','widget') NOT NULL DEFAULT 'component',
  `datetime` datetime NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `component`
--

INSERT INTO `component` (`id_component`, `component`, `type`, `datetime`, `active`) VALUES
(1, 'gallery', 'component', '2016-03-11 10:00:00', 'Y'),
(2, 'contact', 'component', '2016-03-11 10:00:00', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `contact`
--

CREATE TABLE `contact` (
  `id_contact` int(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `gallery`
--

CREATE TABLE `gallery` (
  `id_gallery` int(5) NOT NULL,
  `id_album` int(5) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `gallery`
--

INSERT INTO `gallery` (`id_gallery`, `id_album`, `title`, `content`, `picture`) VALUES
(1, 1, 'Coloration', '', 'coloration.jpg'),
(2, 2, 'Legs On Table', '', 'legs_on_table.jpg'),
(3, 1, 'Shop Counter', '', 'shop_counter.jpg'),
(4, 2, 'Work Desk', '', 'work_desk.jpg'),
(5, 1, 'City From Sky', '', 'city_from_sky.jpg'),
(6, 2, 'Traction', '', 'traction.jpg'),
(7, 1, 'Still Life White', '', 'still_life_white.jpg'),
(8, 2, 'Coffee In Heart', '', 'coffee_in_heart.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `language`
--

CREATE TABLE `language` (
  `id_language` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `code` varchar(3) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `language`
--

INSERT INTO `language` (`id_language`, `title`, `code`, `active`) VALUES
(1, 'Indonesia', 'id', 'Y'),
(2, 'English', 'gb', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` tinyint(3) UNSIGNED NOT NULL,
  `parent_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `class` varchar(255) NOT NULL DEFAULT '',
  `position` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `group_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `target` varchar(10) NOT NULL DEFAULT 'none'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `parent_id`, `title`, `url`, `class`, `position`, `group_id`, `active`, `target`) VALUES
(1, 0, 'dashboard', 'admin.php?mod=home', 'fa-home', 1, 1, 'Y', 'none'),
(2, 0, 'post', 'admin.php?mod=post', 'fa-book', 2, 1, 'Y', 'none'),
(3, 2, 'addnew', 'admin.php?mod=post&act=addnew', '', 2, 1, 'Y', 'none'),
(4, 2, 'allpost', 'admin.php?mod=post', '', 1, 1, 'Y', 'none'),
(5, 0, 'category', 'admin.php?mod=category', 'fa-tasks', 3, 1, 'Y', 'none'),
(6, 5, 'allcategory', 'admin.php?mod=category', '', 1, 1, 'Y', 'none'),
(7, 5, 'addnew', 'admin.php?mod=category&act=addnew', '', 2, 1, 'Y', 'none'),
(8, 0, 'tag', 'admin.php?mod=tag', 'fa-tags', 4, 1, 'Y', 'none'),
(9, 8, 'alltag', 'admin.php?mod=tag', '', 1, 1, 'Y', 'none'),
(19, 8, 'addnew', 'admin.php?mod=tag&act=addnew', '', 2, 1, 'Y', 'none'),
(20, 0, 'pages', 'admin.php?mod=pages', 'fa-file', 6, 1, 'Y', 'none'),
(21, 20, 'allpages', 'admin.php?mod=pages', '', 1, 1, 'Y', 'none'),
(22, 20, 'addnew', 'admin.php?mod=pages&act=addnew', '', 2, 1, 'Y', 'none'),
(23, 0, 'library', 'admin.php?mod=library', 'fa-picture-o', 7, 1, 'Y', 'none'),
(27, 0, 'setting', 'admin.php?mod=setting', 'fa-cog', 8, 1, 'Y', 'none'),
(28, 0, 'theme', 'admin.php?mod=theme', 'fa-desktop', 9, 1, 'Y', 'none'),
(29, 28, 'alltheme', 'admin.php?mod=theme', '', 1, 1, 'Y', 'none'),
(30, 28, 'addnew', 'admin.php?mod=theme&act=addnew', '', 2, 1, 'Y', 'none'),
(31, 0, 'menumanager', 'admin.php?mod=menumanager', 'fa-sitemap', 10, 1, 'Y', 'none'),
(32, 0, 'component', 'admin.php?mod=component', 'fa-puzzle-piece', 11, 1, 'Y', 'none'),
(33, 32, 'allcomponent', 'admin.php?mod=component', '', 1, 1, 'Y', 'none'),
(34, 32, 'addnew', 'admin.php?mod=component&act=addnew', '', 2, 1, 'Y', 'none'),
(42, 0, 'comment', 'admin.php?mod=comment', 'fa-comments', 5, 1, 'Y', 'none'),
(43, 32, 'Galeri', 'admin.php?mod=gallery', '', 3, 1, 'Y', 'none'),
(44, 32, 'Kontak', 'admin.php?mod=contact', '', 4, 1, 'Y', 'none'),
(45, 0, 'user', 'admin.php?mod=user', 'fa-group', 12, 1, 'Y', 'none'),
(46, 45, 'alluser', 'admin.php?mod=user', '', 1, 1, 'Y', 'none'),
(47, 45, 'addnew', 'admin.php?mod=user&act=addnew', '', 2, 1, 'Y', 'none'),
(48, 0, 'Beranda', './', '', 1, 2, 'Y', 'none'),
(49, 0, 'Home', './', '', 1, 3, 'Y', 'none'),
(50, 0, 'Tentang Kami', 'pages/tentang-kami', '', 2, 2, 'Y', 'none'),
(51, 50, 'Layanan', 'pages/layanan', '', 1, 2, 'Y', 'none'),
(52, 0, 'Indonesiaku', 'category/indonesiaku', '', 49, 2, 'Y', 'none'),
(53, 0, 'Motivasi', 'category/motivasi', '', 49, 2, 'Y', 'none'),
(54, 0, 'Hubungan', 'category/hubungan', '', 49, 2, 'Y', 'none'),
(55, 0, 'Sukses', 'category/sukses', '', 49, 2, 'Y', 'none'),
(56, 0, 'Galeri', 'album', '', 49, 2, 'Y', 'none'),
(57, 0, 'Kontak', 'contact', '', 49, 2, 'Y', 'none'),
(58, 0, 'About Us', 'pages/tentang-kami', '', 2, 3, 'Y', 'none'),
(59, 58, 'Services', 'pages/layanan', '', 1, 3, 'Y', 'none'),
(60, 0, 'Indonesiaku', 'category/indonesiaku', '', 50, 3, 'Y', 'none'),
(61, 0, 'Motivation', 'category/motivasi', '', 50, 3, 'Y', 'none'),
(62, 0, 'Relationship', 'category/hubungan', '', 50, 3, 'Y', 'none'),
(63, 0, 'Success', 'category/sukses', '', 50, 3, 'Y', 'none'),
(64, 0, 'Gallery', 'album', '', 50, 3, 'Y', 'none'),
(65, 0, 'Contact', 'contact', '', 50, 3, 'Y', 'none');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu_group`
--

CREATE TABLE `menu_group` (
  `id` smallint(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `menu_group`
--

INSERT INTO `menu_group` (`id`, `title`) VALUES
(1, 'Dashboard'),
(2, 'id'),
(3, 'gb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `oauth`
--

CREATE TABLE `oauth` (
  `id_oauth` int(5) NOT NULL,
  `oauth_type` varchar(10) NOT NULL,
  `oauth_key` text NOT NULL,
  `oauth_secret` text NOT NULL,
  `oauth_id` varchar(100) NOT NULL,
  `oauth_user` varchar(100) NOT NULL,
  `oauth_token1` text NOT NULL,
  `oauth_token2` text NOT NULL,
  `oauth_fbtype` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `oauth`
--

INSERT INTO `oauth` (`id_oauth`, `oauth_type`, `oauth_key`, `oauth_secret`, `oauth_id`, `oauth_user`, `oauth_token1`, `oauth_token2`, `oauth_fbtype`) VALUES
(1, 'facebook', '1379700562291163', '8fecea44bbbca74ce2cc1f0129f004bf', '', '', '', '', ''),
(2, 'twitter', 'uPXZGTJI2xcMcviHJdZxw', '9Jacq3buOEY39dWgCnuREbe5vMUnuDLP86daS7b1uw', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages`
--

CREATE TABLE `pages` (
  `id_pages` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages`
--

INSERT INTO `pages` (`id_pages`, `seotitle`, `picture`, `active`) VALUES
(1, 'tentang-kami', '', 'Y'),
(2, 'layanan', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pages_description`
--

CREATE TABLE `pages_description` (
  `id_pages_description` int(5) NOT NULL,
  `id_pages` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `pages_description`
--

INSERT INTO `pages_description` (`id_pages_description`, `id_pages`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Tentang Kami', '&lt;p&gt;PopojiCMS adalah Content Management System yang dibuat dengan konsep yang sangat menarik dan mudah untuk digunakan. PopojiCMS dibuat dengan tampilan responsive dengan base bootstarp dan selain itu juga dilengkapi dengan banyak plugin jQuery.&lt;br /&gt;&lt;br /&gt;PopojiCMS dibangun di atas dasar OOP tetapi tetap tidak menghilangkan rasa native-nya, sehingga developer awam pun bisa dengan mudah menggunakannya. Semoga PopojiCMS dapat menjawab semua kebutuhan Anda tentang web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terima kasih,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(2, 1, 2, 'About Us', '&lt;p&gt;PopojiCMS is a Content Management System that is made with a very interesting concept and easy to use. PopojiCMS made its appearance bootstarp responsive to the base and it is also equipped with a lot of jQuery plugins.&lt;br /&gt;&lt;br /&gt;PopojiCMS built on a foundation of OOP, but still does not eliminate its native flavor, so the developer can easily to use. Hopefully PopojiCMS can answer all your needs on the web.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Thank you,&lt;br /&gt;&lt;br /&gt;&lt;strong&gt;Jenuar Dwi Putra Dalapang a.k.a Dwira Survivor&lt;/strong&gt;&lt;/p&gt;'),
(3, 2, 1, 'Layanan', '&lt;p&gt;PopojiCMS telah berkembang menjadi CMS besar selama 2 tahun terakhir ini, berbagai masukan dan perbaikan sana sini telah menjadikan PopojiCMS siap menjawab kebutuhan web Anda, dukungan komunitas yang luas dan tentunya keamanan web yang handal siap Anda dapatkan.&lt;br /&gt;&lt;br /&gt;Dengan dilengkapi oleh jQuery dan bootstrap, PopojiCMS tampil lebih hidup menghadirkan fitur yang tidak terbayangkan sebelumnya.&lt;br /&gt;&lt;br /&gt; PopojiCMS dibuat dengan tampilan responsive sehingga bisa dibuka pada ukuran layar manapun dan kapanpun.&lt;br /&gt;PopojiCMS didesain dengan tampilan modern yang cantik sehingga menarik pengguna web untuk selalu berkunjung.&lt;br /&gt;PopojiCMS dibuat dengan konsep OOP dengan rasa native sehingga developer awampun bisa mengcustom dengan mudah rasa webnya.&lt;/p&gt;'),
(4, 2, 2, 'Services', '&lt;p&gt;PopojiCMS has developed into a major CMS over the past 2 years, a variety of input and improvements here and there have made PopojiCMS ready to answer the needs of your web, broad community support and a reliable web security course is ready you get.&lt;br /&gt;&lt;br /&gt;With furnished by jQuery and Bootstrap, PopojiCMS more vivid brings the features previously unimaginable.&lt;br /&gt;&lt;br /&gt;PopojiCMS made its appearance responsive so that it can be opened on the screen size anytime and anywhere.&lt;br /&gt;PopojiCMS designed with a modern look that is beautiful that attract web users to always visit.&lt;br /&gt;PopojiCMS made with OOP concepts with native flavors so that developers can custom easily its flavor.&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post`
--

CREATE TABLE `post` (
  `id_post` int(5) NOT NULL,
  `seotitle` varchar(255) NOT NULL,
  `tag` text NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `publishdate` datetime NOT NULL,
  `editor` int(5) NOT NULL DEFAULT 1,
  `active` enum('Y','N') NOT NULL DEFAULT 'Y',
  `headline` enum('Y','N') NOT NULL DEFAULT 'N',
  `comment` enum('Y','N') NOT NULL DEFAULT 'Y',
  `picture` varchar(255) NOT NULL,
  `picture_description` varchar(255) NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post`
--

INSERT INTO `post` (`id_post`, `seotitle`, `tag`, `date`, `time`, `publishdate`, `editor`, `active`, `headline`, `comment`, `picture`, `picture_description`, `hits`) VALUES
(1, 'destinasi-wisata-tentang-toleransi-beragama-di-indonesia', 'indonesia,wisata-religi,toleransi-beragama', '2016-03-31', '10:06:17', '2016-03-31 10:06:17', 1, 'Y', 'Y', 'Y', 'bukit-kasih-kanonang.jpg', '', 17),
(2, 'wisata-alam-manado-maladewa-nya-indonesia', 'indonesia,manado,wisata-manado,sulawesi-utara', '2016-03-31', '06:34:27', '2016-03-31 06:34:27', 1, 'Y', 'Y', 'Y', 'pulau-nain.jpg', '', 4),
(3, 'bangun-lebih-pagi-agar-bisa-merealisasikan-startup-impianmu', 'startup,impian', '2016-03-31', '04:43:27', '2016-03-31 04:43:27', 1, 'Y', 'Y', 'Y', 'trik-bagun-lebih-pagi.jpg', '', 15),
(4, '5-alasan-kenapa-kamu-harus-membangun-usaha-kecil-bukan-startup', 'startup,bisnis,usaha-kecil', '2016-03-31', '08:54:26', '2016-03-31 08:54:26', 1, 'Y', 'N', 'Y', 'membangun-usaha-kecil.jpg', '', 5),
(5, 'cowok-cuek-justru-tepat-jadi-pendampingmu', 'cowok,pendamping', '2016-03-31', '05:04:09', '2016-03-31 05:04:09', 1, 'Y', 'Y', 'Y', 'cowok-cuek.jpg', '', 12),
(6, 'cewek-bergigi-gingsul-emang-layak-disayang', 'cewek,ginsul,sayang,pendamping', '2016-03-31', '10:12:10', '2016-03-31 10:12:10', 1, 'Y', 'N', 'Y', 'cewek-bergigi-gingsul.jpg', '', 8),
(7, 'ingin-sukses-terapkan-7-tips-sukses-oprah-winfrey', 'sukses,tips-sukses', '2016-03-31', '03:20:42', '2016-03-31 03:20:42', 1, 'Y', 'N', 'Y', 'tips-sukses.jpg', '', 4),
(8, '7-ide-beri-edukasi-keuangan-kepada-anak', 'edukasi-anak,keuangan', '2016-03-31', '01:32:45', '2016-03-31 01:32:45', 1, 'Y', 'Y', 'Y', 'edukasi-anak.jpg', '', 6);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_category`
--

CREATE TABLE `post_category` (
  `id_post_category` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_category` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_category`
--

INSERT INTO `post_category` (`id_post_category`, `id_post`, `id_category`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 2),
(5, 5, 3),
(6, 6, 3),
(7, 7, 4),
(8, 8, 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_description`
--

CREATE TABLE `post_description` (
  `id_post_description` int(5) NOT NULL,
  `id_post` int(5) NOT NULL,
  `id_language` int(5) NOT NULL DEFAULT 1,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `post_description`
--

INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(1, 1, 1, 'Destinasi Wisata Tentang Toleransi Beragama di Indonesia', '&lt;p&gt;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan. Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.&lt;br /&gt;&lt;br /&gt;Tapi sebenarnya, toleransi itu masih ada kok. Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.&lt;br /&gt;&lt;br /&gt;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam. Di mana sajakah itu? Yuk, kita telusuri satu persatu.&lt;br /&gt;&lt;br /&gt;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.&lt;br /&gt;&lt;br /&gt;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral. Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya. Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno. Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.&lt;br /&gt;&lt;br /&gt;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya. Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.&lt;br /&gt;&lt;br /&gt;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia. Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara. Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien. Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.&lt;br /&gt;&lt;br /&gt;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami` yang bersanding berdampingan.&lt;br /&gt;&lt;br /&gt;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun. Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih dari 1 abad. Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat. Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.&lt;br /&gt;&lt;br /&gt;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.&lt;br /&gt;&lt;br /&gt;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik. Kenapa? Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia. Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa. Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan. Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.&lt;br /&gt;&lt;br /&gt;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl. Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian. Yang menjadikan tempat ini unik adalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no. 222.&lt;br /&gt;&lt;br /&gt;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.&lt;br /&gt;&lt;br /&gt;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama. Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia. Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.&lt;br /&gt;&lt;br /&gt;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung, kacang, dan telur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari content Hipwee oleh Reza Akhmad&lt;/p&gt;'),
(2, 1, 2, 'Sightseeing About Religious Tolerance in Indonesia', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Perbedaan keyakinan di negeri kita kerap berujung pada kejadian yang tak mengenakkan.&quot;&gt;Differences in belief in our country often leads to an unpleasant incident. &lt;/span&gt;&lt;span title=&quot;Dari penutupan paksa tempat ibadah sampai penyerangan rumah warga minoritas, internet dan media cetak dipenuhi dengan berita negatif yang membuat kita pesimis akan masa depan toleransi hidup beragama di Indonesia.\r\n\r\n&quot;&gt;Of the forced closure of places of worship to attack minorities home, internet and print media is filled with negative news which makes us pessimistic about the future of tolerance of religious life in Indonesia.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tapi sebenarnya, toleransi itu masih ada kok.&quot;&gt;But in fact, tolerance is still there anyway. &lt;/span&gt;&lt;span title=&quot;Setidaknya sisa-sisanya masih bisa kamu lihat dalam keindahan enam destinasi wisata religi di artikel ini.\r\n\r\n&quot;&gt;At least the physical remains can you see the beauty of six religious tourist destinations in this article.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kali ini, penulis akan memberitahu ke kamu tempat-tempat di Indonesia yang dapat kamu kunjungi untuk membuktikan bahwa perbedaan itu indah, jika kamu memikirkannya lebih dalam.&quot;&gt;This time, the author will tell you all the places in Indonesia that you can go to prove that different is beautiful, if you think about it more deeply. &lt;/span&gt;&lt;span title=&quot;Di mana sajakah itu?&quot;&gt;Where are they? &lt;/span&gt;&lt;span title=&quot;Yuk, kita telusuri satu persatu.\r\n\r\n&quot;&gt;Let us examine one by one.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Di pusat ibukota, harmoni dua agama ditunjukkan oleh Masjid Istiqlal dan Katedral Jakarta yang dibangun saling berdampingan.\r\n\r\n&quot;&gt;1. At the center of the capital, two religious harmony shown by the Istiqlal Mosque and Jakarta Cathedral were built side by side.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Salah satu simbol kerukunan umat antar agama yang terletak di pusat Ibukota Jakarta adalah Masjid Istiqlal dan Gereja Katedral.&quot;&gt;One of the symbols of inter-religious harmony which is located in the center of the capital Jakarta was the Istiqlal Mosque and Cathedral Church. &lt;/span&gt;&lt;span title=&quot;Mereka dibangun berdampingan, berdiri melengkapi satu dan lainnya.&quot;&gt;They were built side by side, standing complement one another. &lt;/span&gt;&lt;span title=&quot;Gereja Katedral sendiri mulai dibangun sejak tahun 1891 dan sempat terhenti pembangunannya karena kekurangan biaya pada tahun 1892. Sedangkan Masjid Istiqlal yang terletak tidak jauh dari Gereja Katedral diprakarsai pembangunannya oleh Presiden Soekarno.&quot;&gt;Cathedral Church itself was built since 1891 and its construction was stopped due to lack of funds in 1892. The Istiqlal Mosque is located not far from the Cathedral Church of development initiated by the President. &lt;/span&gt;&lt;span title=&quot;Masjid ini sendiri diresmikan pada 22 Februari 1978. Lokasi pembangunan masjid yang berdampingan dengan Gereja Katedral ini dipilih untuk melambangkan semangat persaudaraan, persatuan, dan toleransi umat beragama sesuai nilai-nilai yang terdapat dalam Pancasila.\r\n\r\n&quot;&gt;The mosque itself was inaugurated on February 22, 1978. The location of the mosque adjoining the cathedral is chosen to symbolize the spirit of brotherhood, unity and religious tolerance corresponding values contained in Pancasila.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Jakarta juga punya bukti kerukunan umat beragama yang lainnya.&quot;&gt;2. Jakarta also has evidence of other religious harmony. &lt;/span&gt;&lt;span title=&quot;Contohnya Masjid Al-Muqarrabien dan Gereja Masehi Injil di Jakarta Utara.\r\n\r\n&quot;&gt;Examples Masjid Al-Muqarrabien and Christian Gospel Church in North Jakarta.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jakarta masih punya tempat lain yang membuktikan adanya toleransi umat beragama di Indonesia.&quot;&gt;Jakarta still have other places that prove the existence of religious tolerance in Indonesia. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah yang menjadi simbol kerukunan tersebut terletak di kawasan Tanjung Priok, Jakarta Utara.&quot;&gt;Two places of worship which became a symbol of harmony is located in Tanjung Priok, North Jakarta. &lt;/span&gt;&lt;span title=&quot;Dua tempat ibadah tersebut adalah Gereja Masehi Injil Sangihe Talaud Mahanaim dan Masjid Al-Muqarrabien.&quot;&gt;Two places of worship are Church of the Sangihe Talaud Mahanaim Christian Gospel and Al-Muqarrabien. &lt;/span&gt;&lt;span title=&quot;Walau dibangun untuk dua keyakinan yang berbeda, dua tempat ibadah ini hanya terpisah oleh dinding.\r\n\r\n&quot;&gt;Although built for two different beliefs, the two places of worship is only separated by a wall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Di Malang, kamu bisa menemukan GPIB Immanuel dan Masjid Agung Jami&amp;#96; yang bersanding berdampingan.\r\n\r\n&quot;&gt;3. In Malang, you can find GPIB Immanuel and Grand Jami` are coupled together.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di Malang, juga terdapat dua bangunan tempat beribadah yang saling berdampingan, kedua tempat ibadah tersebut berdiri berdekatan selama lebih dari 100 tahun.&quot;&gt;In Malang, there is also a place of worship two buildings side by side, the two places of worship stood together for over 100 years. &lt;/span&gt;&lt;span title=&quot;Lokasi kedua tempat beribadah ini terletak di jantung kota Malang, tepatnya di depan alun-alun kota, gereja yang dibangun pada tahun 1861 sedangkan masjid dibangun pada tahun 1875, meski hanya berhimpitan dipisahkan oleh kantor asuransi di tengahnya, tidak pernah ada pertengkaran ataupun percekcokan selama lebih&quot;&gt;The location is both a place of worship is located in the heart of Malang, exactly in front of the town square, a church which was built in 1861 while the mosque was built in 1875, although only coincide separated by an insurance office in the middle, there was never any quarrels or squabbles over &lt;/span&gt;&lt;span title=&quot;dari 1 abad.&quot;&gt;from the 1st century. &lt;/span&gt;&lt;span title=&quot;Kedua pengurus tempat ibadat sering bekerja sama dan bertoleransi antara satu dengan yang lain, ketika perayaan natal tiba, pemuda Anshar dari Barisan Anshar Serbaguna (Banser) dan Remaja Masjid membantu berjaga keamanan dan tempat parkir jemaat.&quot;&gt;Both administrators places of worship often work together and be tolerant with each other, when the celebration of Christmas arrived, the young man from the Ansar Ansar Barisan Multipurpose (Banser) and Youth Masjid help guard the security and the church parking lot. &lt;/span&gt;&lt;span title=&quot;Begitu pun ketika sholat Id tiba, jamaah bisa sampe meluber di luar bangunan masjid, bahkan sebagian sholat di depan dan samping gereja.\r\n\r\n&quot;&gt;So even when the Id prayers arrived, the congregation could until spilling outside the mosque, and even some prayers at the front and side of the church.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kompleks Puja Mandala adalah bukti kerukunan umat beragama di Bali.\r\n\r\n&quot;&gt;4. Complex Puja Mandala is evidence of religious harmony in Bali.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kompleks rumah ibadah yang terletak di kawasan Nusa Dua, Bali ini tergolong unik dan menarik.&quot;&gt;The complex houses of worship located in Nusa Dua, Bali is quite unique and interesting. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena di tempat inilah terletak bangunan beribadah lima agama yang ada di Indonesia yang terletak dalam satu kompleks, mungkin juga hanya satu-satunya di dunia.&quot;&gt;Because this is where the building is situated worship five religions in Indonesia are located in one complex, perhaps the only one in the world. &lt;/span&gt;&lt;span title=&quot;Lokasinya berada di kawasan bukit Kampial, yang biasa kita lewati jika hendak bervakansi ke kawasan wisata Garuda Wisnu Kencana (GWK) dari Tanjung Benoa.&quot;&gt;The location is in the hill region Kampial, which we used to skip if you want bervakansi to tourist areas Garuda Wisnu Kencana (GWK) of Tanjung Benoa. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat lima bangunan peribadatan yang berderet, mulai dari Masjid, Gereja Katolik, Wihara, Gereja Kristen Protestan, dan Pura, mungkin karena itulah tempat ini disebut dengan nama Puja Mandala &amp;mdash; yang artinya ruang untuk melakukan persembahyangan.&quot;&gt;We can see five religious buildings that line, starting from the mosque, the Catholic Church, Temple, Protestant Church, and Pura, maybe that&#039;s why this place is called by the name of Puja Mandala - which means room for worship. &lt;/span&gt;&lt;span title=&quot;Kita dapat melihat toleransi beragama ketika ibadah sedang berlangsung karena setiap agama mempunyai jadwal rutin yang berbeda dalam beribadah.\r\n\r\n&quot;&gt;We can see religious tolerance when worship is in progress because every religion have a regular schedule of different worship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Bangunan GKL Joyodiningratan dan Masjid Al-Hikmah saling berbagi tembok di Solo.\r\n\r\n&quot;&gt;5. GKL Joyodiningratan Building and Masjid Al-Hikmah sharing wall in Solo.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang berdomisili di Solo, mungkin sudah tidak asing lagi dengan kedua bangunan yang terletak di Jl.&quot;&gt;For those of you who live in Solo, may already be familiar with both the building located at Jl. &lt;/span&gt;&lt;span title=&quot;Gatot Subroto, jalan besar yang membelah kota Solo bagian selatan menjadi dua bagian.&quot;&gt;Gatot Subroto, major roads that divides the city of Solo southern half. &lt;/span&gt;&lt;span title=&quot;Yang menjadikan tempat ini unikadalah bangunan Gereja Kristen Jawa Joyodiningratan dan Masjid Al-Hikmah yang berdempetan dan saling berbagi tembok, lebih unik lagi ternyata alamat dari dua bangunan ini sama, yaitu di Jalan Gatot Subroto no.&quot;&gt;What makes this place unique is building Java Christian Church Joyodiningratan and Masjid Al-Hikmah are close and share a wall, more unique that the address of the two buildings is the same, namely at Jalan Gatot Subroto no. &lt;/span&gt;&lt;span title=&quot;222.\r\n\r\n&quot;&gt;222.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Di Minahasa, Tugu ajaran 5 agama di Bukit Kasih Kanonang menjadi simbol indahnya perbedaan keyakinan.\r\n\r\n&quot;&gt;6. In Minahasa, Tugu teaching of religion in Bukit Kasih 5 Kanonang become a symbol of the beauty of differences in beliefs.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tugu yang terletak di Bukit Kasih Kanonang, kabupaten Minahasa, Sulawesi Utara ini juga populer dengan sebutan wisata toleransi beragama.&quot;&gt;Monument located in Bukit Kasih Kanonang, Minahasa, North Sulawesi is also popularly known as religious tolerance travel. &lt;/span&gt;&lt;span title=&quot;Tempat yang bisa dituju dengan waktu perjalanan selama 2 jam dari kota Manado ini memiliki menara dengan tinggi 22 meter dengan lima bidang sisi yang masing-masing sisinya terpahat relief simbol dari 5 agama besar di Indonesia.&quot;&gt;Points that can be addressed with a journey time of 2 hours from the city of Manado has a tower with a height of 22 meters with five field side of each side sculpted reliefs symbol of five major religions in Indonesia. &lt;/span&gt;&lt;span title=&quot;Selain itu, tempat wisata yang dibangun diatas tanah berukuran 4 hektar ini didirikan pada tahun 2002 dan memiliki 5 tempat ibadah bagi 5 agama yang berbeda di sekelilingnya.\r\n\r\n&quot;&gt;In addition, sites built on land measuring 4 hectares was established in 2002 and has 5 places of worship for different religions 5 around him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di tempat ini kamu dapat belajar, bahwa sesama manusia harus saling menghormati dan menyayangi, kamu juga harus menaiki tangga sebanyak 2.435 anak tangga, tak usah khawatir, rasa capekmu akan tergantikan dengan indahnya kawah belerang di sekitar tangga, yang airnya digunakan warga untuk memasak jagung,&quot;&gt;In this place you can learn that human beings must respect each other and love, you also have to climb the stairs as much as 2,435 steps, do not worry, a sense capekmu will be replaced with the beauty of the crater sulfur around the stairs, where the water used by people to cook corn, &lt;/span&gt;&lt;span title=&quot;kacang, dan telur.\r\n\r\n\r\n&quot;&gt;nuts, and eggs.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari content Hipwee oleh Reza Akhmad&quot;&gt;Taken from the content Hipwee by Reza Akhmad&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(3, 2, 1, 'Wisata Alam Manado, Maladewa-nya Indonesia', '&lt;p&gt;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal. Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi. Apa saja sih 9 destinasi ini?&lt;br /&gt;&lt;br /&gt;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini&lt;br /&gt;&lt;br /&gt;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini. Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung. Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado. Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.&lt;br /&gt;&lt;br /&gt;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado. Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi. Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini. Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.&lt;br /&gt;&lt;br /&gt;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;Aer&quot; -- bukan &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan. Orang Manado bilang &quot;aer&quot;, bukan &quot;air&quot;, dan entah bagaimana asal-usulnya pantai ini dinamakan &quot;pantai aer&quot;. Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara. Hanya saja, pantai ini terletak di desa yang berbeda.&lt;br /&gt;&lt;br /&gt;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa. Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.&lt;br /&gt;&lt;br /&gt;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan. Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini. So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.&lt;br /&gt;&lt;br /&gt;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian&lt;br /&gt;&lt;br /&gt;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun? Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun. Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.&lt;br /&gt;&lt;br /&gt;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan. Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana. Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon. Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.&lt;br /&gt;&lt;br /&gt;Jalan awal memang berupa anak tangga yang agak terawat. Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.&lt;br /&gt;&lt;br /&gt;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa&lt;br /&gt;&lt;br /&gt;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas? Pergi saja ke Gunung Soputan. Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung. Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan. Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.&lt;br /&gt;&lt;br /&gt;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;nggembel&quot; atau dalam kamus bahasa Indonesianya numpang gratis di kampung terakhir sebelum pos pendakian. Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II. Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya. Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.&lt;br /&gt;&lt;br /&gt;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;leher unta&quot;&lt;br /&gt;&lt;br /&gt;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan. Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang. Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai. Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat. Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.&lt;br /&gt;&lt;br /&gt;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar. Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang. Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.&lt;br /&gt;&lt;br /&gt;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang&lt;br /&gt;&lt;br /&gt;Indonesia adalah negeri dengan ribuan pulau kecil. Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga. Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.&lt;br /&gt;&lt;br /&gt;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu. Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;Selamat Datang di Pulau Lihaga, Perombakan Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas. Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.&lt;br /&gt;&lt;br /&gt;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini. Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.&lt;br /&gt;&lt;br /&gt;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!&lt;br /&gt;&lt;br /&gt;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini. Peringatan berupa spanduk bergambar tengkorak&amp;nbsp; warna merah &quot;Dilarang mendaki kawah gunung lokon&quot; sepertinya kurang diperhatikan oleh para pendaki. Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.&lt;br /&gt;&lt;br /&gt;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal. Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam. Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.&lt;br /&gt;&lt;br /&gt;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa&lt;br /&gt;&lt;br /&gt;Pernahkan kamu pergi ke Maladewa? Wah mungkin terlalu jauh ya buat jalan-jalan ke sana. Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa. Orang Bajo Kampung Nain menyebutnya &quot;bungin pasir timbul&quot; yakni fenomena surutnya air laut secara maksimal ketika bulan purnama atau bulan mati.&lt;br /&gt;&lt;br /&gt;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;Maladewa-nya Indonesia&quot;. Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang. Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.&lt;br /&gt;&lt;br /&gt;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&amp;nbsp; Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.&lt;br /&gt;&lt;br /&gt;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta&lt;br /&gt;&lt;br /&gt;Bukan cuma manusia yang punya hati, bumipun punya. Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara. Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.&lt;br /&gt;&lt;br /&gt;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau. Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi. Sebagai tanda perbatasanNKRI, di pulau ini dibangun sebuah monumen bernama &quot;Monumen Kedaulatan Negara Kesatuan Republik Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat. Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat. Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak. Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat. &lt;br /&gt;&lt;br /&gt;Wah, siapa sangka? Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Qobul Pamuji&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(4, 2, 2, 'Nature Tour of Manado, Indonesia Maldives', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saat merantau atau jalan-jalan di kota Manado, kamu pasti ingin menjelajahi keindahan alamnya yang terkenal.&quot;&gt;When wander or stroll in the city of Manado, you&#039;ll want to explore the natural beauty of the famous. &lt;/span&gt;&lt;span title=&quot;Nah, di antara bermacam-macam keindahan alam itu, ada 9 destinasi yang paling bikin kamu kangen bahkan ingin balik ke Manado lagi.&quot;&gt;Well, among an assortment of natural beauty, there are 9 destinations that most makes you miss even wanted to return to Manado again. &lt;/span&gt;&lt;span title=&quot;Apa saja sih 9 destinasi ini?\r\n\r\n&quot;&gt;What the hell 9 this destination?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Pantai Pall, destinasi hits yang bikin kamu betah berlama-lama di sini\r\n\r\n&quot;&gt;1. Pall Coast, destination hits that make you linger here&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dulunya sih pantai ini begitu sepi, saking sepinya mungkin hanya ada tiga atau empat orang yang berkunjung ke pantai ini.&quot;&gt;Formerly the hell is so deserted beach, was so lonely maybe only three or four people who visit this beach. &lt;/span&gt;&lt;span title=&quot;Hamparan pasir putihnya masih sangat lembut dan bersih, tanpa ada bekas jejak kaki para pengunjung.&quot;&gt;White sand was very soft and clean, with no trace of footprints visitors. &lt;/span&gt;&lt;span title=&quot;Namun, setelah beberapa foto Pantai Pall beredar di sosmed, pantai ini tiba-tiba menjadi Top Hits destinasi wisata baru bagi warga Manado.&quot;&gt;However, after some photos circulating on sosmed Pall Beach, this beach suddenly became a Top Hits new tourist destinations for residents of Manado. &lt;/span&gt;&lt;span title=&quot;Tatkala weekend, tak jarang kita melihat kemacetan sampai satu kilometer menuju pintu masuk Pantai Pall.\r\n\r\n&quot;&gt;When the weekend, we often see congestion up to one kilometer to the entrance of Pall Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Letaknya di Desa Marinsow, Kecamatan Likupang Timur, Kabupaten Minahasa Utara, tak begitu jauh dari pusat kota Manado.&quot;&gt;It is in the village of Marinsow, District Likupang East, North Minahasa Regency, not far from downtown Manado. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari dua jam, kamu sudah bisa mencapai pantai ini dengan kendaraan pribadi.&quot;&gt;Not more than two hours, you can reach this beach with private vehicle. &lt;/span&gt;&lt;span title=&quot;Birunya air laut, panjangnya bibir pantai dan berbagai wahana permainan yang ada membuat para pengunjung betah berlama-lama di pantai ini.&quot;&gt;Blue water, long shoreline and a variety of games that exist to make visitors linger on this beach. &lt;/span&gt;&lt;span title=&quot;Nah jika kamu sudah pernah kesini satu kali, pasti akan kangen kapan bisa jalan-jalan ke pantai ini untuk kedua kalinya bareng teman-teman.\r\n\r\n&quot;&gt;Well if you&#039;ve been here once, will definitely miss when you can stroll to the beach for the second time with my friends.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pantai Aer Pulisan, karena orang Manado bilangnya &quot;&gt;2. Turkish Aer Pulisan, because the Manado bilangnya &quot;Aer&quot; - instead of &quot;Air&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tak jauh dari Pantai Pall, kamu bisa menikmati wisata alam Pantai Aer Pulisan.&quot;&gt;Not far from the beach Pall, you can enjoy the natural attractions Pulisan Aer Beach. &lt;/span&gt;&lt;span title=&quot;Orang Manado bilang &quot;&gt;Manado people say &quot;aer&quot;, instead of &quot;water&quot;, and somehow its origins this beach called &quot;beach aer&quot;. &lt;/span&gt;&lt;span title=&quot;Pantai Aer masih terletak di Kabupaten yang sama dengan Pantai Pall, yakni Kabupaten Minahasa Utara.&quot;&gt;Aer beach is still located in the same district with Pall coast, namely North Minahasa regency. &lt;/span&gt;&lt;span title=&quot;Hanya saja, pantai ini terletak di desa yang berbeda.\r\n\r\n&quot;&gt;Only, this beach is located in a different village.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Goa kecil di pantai ini adalah ciri khas yang membuatnya sangat berbeda dengan pantai-pantai lainnya di Minahasa.&quot;&gt;Small caves on the beach this is a characteristic that makes it very different from other beaches in Minahasa. &lt;/span&gt;&lt;span title=&quot;Tak perlu keluar banyak uang, kamu cukup membayar ongkos kapal ketinting sebesar Rp15.000 untuk menuju goa dari Pantai Aer Pulisan.\r\n\r\n&quot;&gt;Needless out a lot of money, you just pay for a long-tail boat Rp15,000 to get to the cave of Aer Pulisan Beach.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tempat ini juga menjadi destinasi favorit bagi warga Manado atau para perantau yang ingin refreshing setelah sekian lama penat dengan kerjaan.&quot;&gt;The place is also a favorite destination for Manado citizens or immigrants who want refreshing after so long tired with the work. &lt;/span&gt;&lt;span title=&quot;Ombaknya yang tenang dan beningnya air laut, sangat cocok buat kamu yang suka snorkling atau sekedar bermain air di pantai ini.&quot;&gt;The waves were calm and the clear sea water, it is suitable for you who like snorkeling or just playing water at this beach. &lt;/span&gt;&lt;span title=&quot;So, jangan lewatkan pantai ini untuk dicatat dalam list tripmu jika kamu sedang berkunjung atau merantau di Manado.\r\n\r\n&quot;&gt;So, do not miss this beach to be recorded in the list tripmu if you&#039;re visiting or wander in Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Air Terjun Tekaan Telu, layaknya berakit-rakit ke hulu berenang-renang ke tepian\r\n\r\n&quot;&gt;3. Niagara Tekaan telu, like rafting-raft upstream swim to the shore&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih susah mana sih, mendaki gunung atau jalan-jalan ke air terjun?&quot;&gt;Harder Where the heck, climbing a mountain or a walk to a waterfall? &lt;/span&gt;&lt;span title=&quot;Mungkin bagi beberapa orang, mendaki gunung itu lebih susah dari pada ke air terjun.&quot;&gt;Maybe for some people, it is more difficult to climb the mountain from the waterfall. &lt;/span&gt;&lt;span title=&quot;Tapi sebentar, jajal dulu Air Terjun Tinoor ini sebelum benar-benar yakin bahwa jalan-jalan ke air terjun itu gampang.\r\n\r\n&quot;&gt;But briefly, jajal Niagara Tinoor first before absolutely sure that the roads to the waterfall is easy.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Air Terjun Tinoor, atau sering disebut sebagai Air Terjun Tekaan Telu, memilik trek yang sangat sulit untuk ditaklukan.&quot;&gt;Niagara Tinoor, or often referred to as Niagara Tekaan telu, pick a track that is very difficult to conquer. &lt;/span&gt;&lt;span title=&quot;Selain karena medannya yang berada di tepi jurang, kontur bebatuan licin dan tanah yang mudah longsor menjadikan pengalaman tersendiri yang tak akan terlupakan ketika kamu akhirnya bisa sampai ke sana.&quot;&gt;In addition because the terrain is teetering on the edge, contour slippery rocks and soil erosive make a special experience that will not be forgotten when you finally get there. &lt;/span&gt;&lt;span title=&quot;Letaknya cukup dekat dari Kota Manado, yakni di Desa Tinoor, Kabupaten Tomohon.&quot;&gt;It is quite close to the city of Manado, which is in the village of Tinoor, Tomohon district. &lt;/span&gt;&lt;span title=&quot;Tak lebih dari satu jam kamu sudah sampai ke pintu masuk air terjun ini.\r\n\r\n&quot;&gt;Not more than an hour you came to the entrance of this waterfall.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jalan awal memang berupa anak tangga yang agak terawat.&quot;&gt;Road early risers indeed be somewhat maintained. &lt;/span&gt;&lt;span title=&quot;Namun setelah melewati hutan rimba, kamu baru akan merasakan sensasinya alam liar dan sulitnya medan yang akan membuatmu makin tertantang untuk segera sampai ke sana.\r\n\r\n&quot;&gt;But after passing through the jungle, you will feel the sensation wild and difficult terrain that will make you more and more challenged to quickly get to it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Gunung Soputan, gunung sejuta umat bagi warga Minahasa\r\n\r\n&quot;&gt;4. Soputan, a mountain of a million people for the people of Minahasa&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu pengin sekadar camping mendirikan tenda-tenda kecil, jalan-jalan melepas kepenatan, atau bernyanyi diiringi petikan gitar di alam bebas?&quot;&gt;You simply pengin camping set up small tents, streets relieve fatigue, or sing accompanied by guitars in the wild? &lt;/span&gt;&lt;span title=&quot;Pergi saja ke Gunung Soputan.&quot;&gt;Just go to Soputan. &lt;/span&gt;&lt;span title=&quot;Area tempat camping yang luas dengan medan yang landai sangat cocok buat kamu para pendaki pemula yang ingin merasakan petualangan pertama mendaki gunung.&quot;&gt;Spacious camping area with gently sloping terrain is suitable for you novice climbers who want to experience the adventure first to climb the mountain. &lt;/span&gt;&lt;span title=&quot;Gunung dengan tinggi 1.784 mdl ini berada di Kabupaten Kawangkoan.&quot;&gt;High mountain mdl 1784 is located in the district of Kawangkoan. &lt;/span&gt;&lt;span title=&quot;Dari Kota Manado mungkin membutuhkan waktu dua jam perjalanan darat.\r\n\r\n&quot;&gt;From the city of Manado may take two hours by road.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ada hal unik yang dilakukan oleh kalangan pendaki asal Minahasa, yaitu &quot;&gt;There are unique things done by the climbers Minahasa, namely &quot;nggembel&quot; or in Indonesian language dictionary free ride at the last village before heading ascent. &lt;/span&gt;&lt;span title=&quot;Gunung aktif ini memiliki dua puncak yakni Puncak Soputan I dan Puncak Soputan II.&quot;&gt;This active volcano has two peaks namely Puncak Puncak Soputan Soputan I and II. &lt;/span&gt;&lt;span title=&quot;Umumnya, para pendaki hanya bisa mencapai Puncak I karena Puncak II punya medan yang vertikal, licin, dan berbahaya.&quot;&gt;Generally, the climbers reach the summit I could just as Peak II has a vertical terrain, slippery and dangerous. &lt;/span&gt;&lt;span title=&quot;Setelah sampai di Puncak I, kamu dapat berpose bersama teman-temanmu atau menulis kata-kata buat seseorang kemudian diupload pada sosmed.\r\n\r\n&quot;&gt;Having reached the peak I, you can pose with your friends or write words for someone and then uploaded on sosmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Gunung Ambang, satu-satunya gunung yang memiliki &quot;&gt;5. Mount Threshold, the only mountain that has a &quot;neck camel&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Berbicara masalah Gunung di Sulawesi Utara tak cukup hanya sampai di Gunung Soputan.&quot;&gt;Talking about mountain in North Sulawesi&#039;s not enough to just get Soputan. &lt;/span&gt;&lt;span title=&quot;Di Kabupaten Boltim (Boolang Mongondow Timur) ada sebuah gunung yang memiliki leher unta, yakni Gunung Ambang.&quot;&gt;In District Boltim (Boolang Mongondow East) there is a mountain that had a camel&#039;s neck, the Mount Threshold. &lt;/span&gt;&lt;span title=&quot;Gunung ini masih memiliki karakteristik yang sama dengan Gunung Soputan, yakni medan yang ringan dan landai.&quot;&gt;The volcano is still has the same characteristics as Soputan, namely mild and gentle terrain. &lt;/span&gt;&lt;span title=&quot;Meskipun gunung ini merupakan gunung mati, asap belerang yang keluar dari kawah Gunung Ambang cukup menyengat.&quot;&gt;Although this mountain is a mountain of dead, the fumes coming out of the crater of Mount Threshold enough to sting. &lt;/span&gt;&lt;span title=&quot;Gunung dengan ketinggian 1.795 mdl ini letaknya tak jauh dari Danau Moat, sehingga kamu bakalan bisa melihat Danau Moat dari atas gunung.\r\n\r\n&quot;&gt;Mountains with an altitude of 1,795 mdl is located not far from Lake Moat, so you&#039;re going to get to see the lake from the top of the mountain Moat.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lahan perkebunan warga yang luas sepanjang jalur pendakian, menjadikan trekking kamu makin indah dan gak membosankan karena kamu bakalan bertemu dengan para petani yang sedang memanen hasil kebunnya untuk dijual di pasar.&quot;&gt;Extensive plantation residents along a hiking trail, trekking makes you more beautiful and not boring because you&#039;re going to meet with farmers who were harvesting his crop for sale at the market. &lt;/span&gt;&lt;span title=&quot;Sesuatu yang menarik dari gunung ini adalah adanya kontur alam berupa leher unta yang memanjang diatas kawah belerang.&quot;&gt;Something interesting from this mountain is the natural contours of the neck in the form of a camel that extends above the crater sulfur. &lt;/span&gt;&lt;span title=&quot;Perbukitan hijau dan warna tanah belerang yang putih sangat cocok untuk dijadikan objek fotografi buat kamu yang hobby hunting.\r\n\r\n&quot;&gt;Green hills and white color sulfur soil is suitable for being the object of photography for you that hunting hobby.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Pulau Lihaga, pulau kosong yang membuatmu gak mau pulang\r\n\r\n&quot;&gt;6. Lihaga island, deserted islands that make you not want to go home&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Indonesia adalah negeri dengan ribuan pulau kecil.&quot;&gt;Indonesia is a country with thousands of small islands. &lt;/span&gt;&lt;span title=&quot;Nah buat kamu yang sedang berada di Manado, jangan lewatkan pulau kecil yang satu ini namanya Pulau Lihaga.&quot;&gt;Well, for you who were in Manado, do not miss this one little island its name Lihaga Island. &lt;/span&gt;&lt;span title=&quot;Tanjung Serei di Minahasa Utara adalah dermaga yang paling direkomendasikan buat kamu yang pengin ngetrip ke pulau ini selain karena tempatnya yang luas, pilihan kapal penumpang yang disewakan oleh para nelayan juga tersedia cukup banyak sehingga kamu bebas memilih mana saja yang kamu mau.\r\n\r\n&quot;&gt;Tanjung Serei in North Minahasa is the dock of the most recommended for you who pengin ngetrip to this island except for the place broad selection of passenger ships leased by fishermen are also provided quite a lot so you are free to choose whichever you want.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perjalanan kapal penumpang dari Tanjung Serei menuju Pulau Lihaga membutuhkan waktu sekitar 30 menit, dengan ongkos sewa sebesar 700-800 ribu.&quot;&gt;Passenger boat trip to the island of Tanjung Serei Lihaga takes about 30 minutes, with a rental fee of 700-800 thousand. &lt;/span&gt;&lt;span title=&quot;Sesampainya di pulau ini, kamu bakalan disambut oleh tugu yang dibangun dari kayu dengan bertuliskan &quot;&gt;Arriving on this island, you&#039;re going to be greeted by a monument built of wood by saying &quot;Welcome to the island Lihaga, reshuffle Dotu Kuada&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cukup dengan membayar 25.000 per orang, kamu sudah bisa menikmati segala keindahan alam di pulau ini dengan puas.&quot;&gt;Simply by paying 25,000 per person, you can enjoy all the natural beauty of this island with satisfaction. &lt;/span&gt;&lt;span title=&quot;Mulai dari hamparan pasir putih yang lembut, jernihnya air laut atau hanya sekedar duduk dibawah pepohonan rindang di kala terik matahari.\r\n\r\n&quot;&gt;Starting from a stretch of soft white sand, crystal clear sea water or just sitting under the shady trees at a time when the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kulit sudah mulai hangus, badan sudah capai dan lapar, kamu masih saja bermain-main air di pulau ini.&quot;&gt;Skin has started to burn, the body is tired and hungry, you&#039;re still playing around the water on the island. &lt;/span&gt;&lt;span title=&quot;Yah, pulau ini memang sangat cocok buat kamu yang pengin menenangkan diri dari hiruk pikuk Kota Manado.\r\n\r\n&quot;&gt;Well, this island is very suitable for you who wanted to calm down from the bustle of the city of Manado.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Gunung Lokon, meski tak bisa mencapai puncak aku tetap bangga bisa mendakimu!\r\n\r\n&quot;&gt;7. Mount Lokon, though can not reach the top I&#039;m still proud to be mendakimu!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Status Gunung ini dari pertengahan tahun 2015 memang tidak pernah diturunkan dari siaga menjadi waspada itu artinya kamu tidak diperbolehkan untuk mendaki gunung ini.&quot;&gt;This mountain status of mid-2015 was never passed on from standby become wary that mean you are not allowed to climb this mountain. &lt;/span&gt;&lt;span title=&quot;Peringatan berupa spanduk bergambar tengkorak warna merah &quot;&gt;Warnings in the form of a skull red banners &quot;No to climb crater Lokon&quot; is less likely to be noticed by the climbers. &lt;/span&gt;&lt;span title=&quot;Banyak pendaki yang tetap nekad untuk mendaki ke kawah gunung ini.\r\n\r\n&quot;&gt;Many climbers who remain desperate to climb to the crater of the mountain.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk mendaki gunung tertinggi di Tomohon ini memang tidak dibutuhkan fisik yang kuat, karena jalurnya cukup pendek dan tidak begitu terjal.&quot;&gt;To climb the highest mountain in Tomohon is indeed not required physically strong, because the track is quite short and not so steep. &lt;/span&gt;&lt;span title=&quot;Tantangannya adalah jalur lava berupa batuan-batuan besar yang cukup licin dan curam.&quot;&gt;The challenge is lavas form of large rocks quite slippery and steep. &lt;/span&gt;&lt;span title=&quot;Gunung ini juga tidak memiliki sumber air, jadi sifat kesetiakawananmu akan semakin diuji tatkala ada temanmu yang kehabisan air minum.\r\n\r\n&quot;&gt;Mount also has no water source, so the nature of kesetiakawananmu will be tested when there are friends who run out of drinking water.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Pulau Nain, pesona bungin pasir timbul layaknya Maladewa\r\n\r\n&quot;&gt;8. Nain Island, sand Bungin charm arises like the Maldives&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pernahkan kamu pergi ke Maladewa?&quot;&gt;Have you ever go to Maldives? &lt;/span&gt;&lt;span title=&quot;Wah mungkin terlalu jauh ya buat jalan-jalan ke sana.&quot;&gt;Wah perhaps too much so for a walk to get there. &lt;/span&gt;&lt;span title=&quot;Tapi cukup ke Minahasa Utara tepatnya di Kecamatan Wori Kampung Nain, kamu bakalan menikmati sensasi alam layaknya di Maladewa.&quot;&gt;But enough to Minahasa Utara Wori District precisely in Kampung Nain, you&#039;re going to enjoy the thrill of nature like in the Maldives. &lt;/span&gt;&lt;span title=&quot;Orang Bajo Kampung Nain menyebutnya &quot;&gt;Nain Kampung Bajo people call it &quot;sand Bungin raised&quot; the phenomenon of receding tides maximum when full moon or dark moon.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pasir putih yang akan timbul ke permukaan ketika air laut surut sangat indah, layak membuat tempat ini disebut sebagai &quot;&gt;White sand that will arise to the surface when the tide is very beautiful, well worth making this point is referred to as &quot;Maldives of its Indonesia&quot;. &lt;/span&gt;&lt;span title=&quot;Anggaran sewa kapal menuju pulau ini memang cukup mahal: 2,5 juta untuk kapal berukuran 30 sampai 40 penumpang.&quot;&gt;Budget rental boats to this island is quite expensive: 2.5 million for vessels measuring 30 to 40 passengers. &lt;/span&gt;&lt;span title=&quot;Ada dua akses pelabuhan untuk menuju kesana, pelabuhan Pasar Bersehati Manado dan Pelabuhan Wori di Minahasa Utara.\r\n\r\n&quot;&gt;There are two access ports to get there, the port Bersehati Market and Port Wori Manado in North Minahasa.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Puncak surutnya bungin ini biasanya sekitar pukul 11.00 s.d 14.00 WITA jadi, kamu mesti berpanas-panas dahulu baru untuk menikmati indahnya pulau ini.&quot;&gt;Reflux Bungin peak is usually around 11:00 s.d 14:00 pm so, you must sunbathe new first to enjoy the beauty of this island. &lt;/span&gt;&lt;span title=&quot;Buat kamu yang takut panas, sangat disarankan untuk menggunakan sunblock dan topi karena tidak ada tempat untuk berteduh dari teriknya matahari.\r\n\r\n&quot;&gt;For you were afraid of the heat, it is advisable to use sunblock and a hat because there is no place to take shelter from the sun.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Danau Cinta, dari ujung perbatasan negeri untuk Indonesiaku tercinta\r\n\r\n&quot;&gt;9. Lake of Love, from one end of the country&#039;s border beloved Indonesiaku&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan cuma manusia yang punya hati, bumipun punya.&quot;&gt;It&#039;s not just humans who have a heart, the earth has. &lt;/span&gt;&lt;span title=&quot;Danau Hati berada di ujung utara perbatasan Indonesia dengan Filipina, yaitu di Kabupaten Kepulauan Sitaro, Sulawesi Utara.&quot;&gt;Heart Lake is located at the north end of the border of Indonesia and the Philippines, namely in Sitaro Islands regency, North Sulawesi. &lt;/span&gt;&lt;span title=&quot;Di sini, ada sebuah pulau kecil bernama Pulau Makalehi -- yang dihuni oleh sekitar 100 jiwa warga Suku sangihe.\r\n\r\n&quot;&gt;Here, there is a small island called Pulau Makalehi - inhabited by about 100 people Sangihe tribe citizens.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Akses menuju pulau ini dari Manado masih sulit, hanya ada jasa kapal cepat yang akan mengantarmu dari Pelabuhan Manado menuju Pelabuhan Ulu Siau.&quot;&gt;Access to this island of Manado is still difficult, there are only fast boat service that will take you from Manado harbor to the Port Ulu Siau. &lt;/span&gt;&lt;span title=&quot;Setelah itu kamu harus menyewa kapal untuk akses menuju Pulau Makalehi.&quot;&gt;After that you have to hire a boat for access to the island Makalehi. &lt;/span&gt;&lt;span title=&quot;Sebagai tanda perbatasan NKRI, di pulau ini dibangun sebuah monumen bernama &quot;&gt;As a sign of Homeland border, on the island was built a monument called &quot;Monument of Sovereignty of the Republic of Indonesia&quot;.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bagi kamu yang hobby explore tempat asing, Pulau Makalehi mungkin menjadi pilihan yang tepat.&quot;&gt;For those of you who are hobby explore foreign places, Makalehi Island might be the right choice. &lt;/span&gt;&lt;span title=&quot;Selain karena aksesnya yang menantang, kekentalan adat istiadat warga makalehi juga masih sangat kuat.&quot;&gt;In addition to the access challenging, viscosity customs Makalehi residents are still very strong. &lt;/span&gt;&lt;span title=&quot;Sebelum kamu trekking bukit untuk memotret Danau Cinta, kamu bakalan diantar oleh warga Makalehi menuju suatu goa yang berisi tengkorak.&quot;&gt;Before you trekking the hill to photograph the Lake of Love, you are going to be delivered by the citizens Makalehi towards a cave containing the skulls. &lt;/span&gt;&lt;span title=&quot;Konon tengkorak-tengkorak itu dapat menghabiskan satu batang rokok dengan sangat cepat.\r\n\r\n&quot;&gt;It is said that the skulls can spend one cigarette very quickly.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Wah, siapa sangka?&quot;&gt;Wow, who would have thought? &lt;/span&gt;&lt;span title=&quot;Ternyata di ujung utara perbatasan Indonesia tersimpan keanekaragaman budaya dan pesona alam Danau Hati yang tak ada duanya.\r\n\r\n\r\n&quot;&gt;Apparently on the northern tip of Indonesia&#039;s border stored cultural diversity and natural charm Heart Lake unparalleled.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Qobul Pamuji&quot;&gt;Taken from Hipwee By Qobul Pamuji&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(5, 3, 1, 'Bangun Lebih Pagi agar Bisa Merealisasikan Startup Impianmu', '&lt;p&gt;Apa rutinitas pagi kamu sehari-hari? Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.&lt;br /&gt;&lt;br /&gt;Siklus ini terus berlanjut dan berulang setiap hari. Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari. Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.&lt;br /&gt;&lt;br /&gt;Hidup kita tidak akan mengalami perubahan. Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja. Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Memulainya dengan bangun lebih pagi&lt;br /&gt;&lt;br /&gt;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor. Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.&lt;br /&gt;&lt;br /&gt;Bahkan saya sering lebih memilih untuk melanjutkan tidur. Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.&lt;br /&gt;&lt;br /&gt;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah. Namun saat kita mencoba, kenyataannya sangat sulit. Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.&lt;br /&gt;&lt;br /&gt;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama. Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi. Apakah mereka manusia normal seperti saya?&lt;br /&gt;&lt;br /&gt;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit. Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi. Atau menekan tombol snooze ketika kita harus mengejar kereta. Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pilihlah alarm yang canggih&lt;br /&gt;&lt;br /&gt;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik. Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan. Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.&lt;br /&gt;&lt;br /&gt;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya. Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.&lt;br /&gt;&lt;br /&gt;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga. Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.&lt;br /&gt;&lt;br /&gt;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly. Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lakukan LDR (hubungan jarak jauh) dengan alarm&lt;br /&gt;&lt;br /&gt;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan. Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan. Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:&lt;br /&gt;&lt;br /&gt;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin. Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples. Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Paksa diri kamu untuk minum secangkir kopi&lt;br /&gt;&lt;br /&gt;Setelah berhasil bangun pagi, muncul masalah baru. Bagaimana caranya agar kita tetap terjaga? Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur. Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.&lt;br /&gt;&lt;br /&gt;Apa yang terjadi setelah itu? Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali. Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.&lt;br /&gt;&lt;br /&gt;Minumlah kopi sesuai dengan selera dan kebiasaanmu. Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya. Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.&lt;br /&gt;&lt;br /&gt;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu. Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.&lt;br /&gt;&lt;br /&gt;Jika alarm kamu berdering, minumlah kopi. Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.&lt;br /&gt;&lt;br /&gt;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur. Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.&lt;br /&gt;&lt;br /&gt;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya. Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.&lt;br /&gt;&lt;br /&gt;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan? Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi. Manfaatkanlah itu untuk menyiapkan startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Alihkan dirimu untuk bangun&lt;br /&gt;&lt;br /&gt;Masih belum terbangun? Sedikit pengalihan mungkin akan berguna. Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.&lt;br /&gt;&lt;br /&gt;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG. Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.&lt;br /&gt;&lt;br /&gt;Jadi, mari kita lihat sisi positifnya. Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.&lt;br /&gt;&lt;br /&gt;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap. Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil&lt;br /&gt;&lt;br /&gt;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya. Mood kamu di pagi hari mungkin tidak sebagus biasanya. Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.&lt;br /&gt;&lt;br /&gt;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya. Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.&lt;br /&gt;&lt;br /&gt;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar. Kamu tidak mungkin membangun startup dalam satu hari. Kamu hanya harus memulainya terlebih dahulu. Setelah memulainya, akan lebih mudah untuk melanjutkannya.&lt;br /&gt;&lt;br /&gt;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor. Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program. Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.&lt;br /&gt;&lt;br /&gt;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus. Ingat, tidak semua pekerjaan harus sempurna. Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Gunakan metode Lean Startup&lt;br /&gt;&lt;br /&gt;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan. Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas. Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.&lt;br /&gt;&lt;br /&gt;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch. Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries. Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.&lt;br /&gt;&lt;br /&gt;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan. Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup? Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?&lt;br /&gt;&lt;br /&gt;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan? Jangan sampai kamu keliru mengambil langkah.&lt;br /&gt;&lt;br /&gt;Jangan terlampau puas dengan apa yang sudah kamu kerjakan. Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil. Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog). Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.&lt;br /&gt;&lt;br /&gt;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform. Hasilnya? Mereka juga tidak tahu apa-apa tentang itu.&lt;br /&gt;&lt;br /&gt;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Publikasikan karya kamu&lt;br /&gt;&lt;br /&gt;Kita semua pasti memiliki sebuah ketakutan. Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan. Kenyataannya? Tidak ada yang peduli dengan itu.&lt;br /&gt;&lt;br /&gt;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya. Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.&lt;br /&gt;&lt;br /&gt;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu. Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan. Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.&lt;br /&gt;&lt;br /&gt;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya. Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.&lt;br /&gt;&lt;br /&gt;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter. Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi. Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi. Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Percayalah pada dirimu sendiri. Karya kamu luar biasa.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Terobsesi dengan produktivitas&lt;br /&gt;&lt;br /&gt;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin. Saya memulai setiap pagi dengan menulis jurnal. Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini. Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.&lt;br /&gt;&lt;br /&gt;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai. Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna? Apakah saya harus beralih dari platform komentar WordPress ke Disqus?&lt;br /&gt;&lt;br /&gt;Apakah iklan Adsense masih baik digunakan dalam era Adblock? Kapan waktu terbaik untuk memublikasikan blog? Apa saja pekerjaan yang dapat saya otomatisasi? Apakah saya sudah gila dengan memulai bisnis sendiri?&lt;br /&gt;&lt;br /&gt;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob. Membangun blog yang bagus membutuhkan cukup banyak waktu. Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google. Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.&lt;br /&gt;&lt;br /&gt;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown. TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait. Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Persiapan untuk bekerja tanpa henti&lt;br /&gt;&lt;br /&gt;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu. Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari. Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.&lt;br /&gt;&lt;br /&gt;Mengerjakan startup butuh waktu, dan kamu butuh makan. Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko. Contohnya, membangun startup atau bermain bungee jumping. Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.&lt;br /&gt;&lt;br /&gt;Nikmati semua waktu kamu di dunia ini. Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Jadi, kapan kamu akan bangun?&lt;br /&gt;&lt;br /&gt;Rutinitas pagi di dunia startup akan berbeda. Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan. Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.&lt;br /&gt;&lt;br /&gt;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda. Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah. Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai. Bangunlah lebih pagi, dan mulailah membangun startup kamu!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Min H. Park&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(6, 3, 2, 'More Morning Waking Order Startup Can Realize Your Dreams', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Apa rutinitas pagi kamu sehari-hari?&quot;&gt;What is your morning routine everyday? &lt;/span&gt;&lt;span title=&quot;Saya sendiri terbiasa untuk bangun pukul 7.00 pagi, mandi, berpakaian, menikmati secangkir kopi, lalu pergi menuju halte bus bersama dengan para pegawai kantoran lainnya.\r\n\r\n&quot;&gt;I myself used to get up at 7:00 am, showered, dressed, enjoying a cup of coffee, then go to the bus stop along with the other office employees.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Siklus ini terus berlanjut dan berulang setiap hari.&quot;&gt;This cycle continues and repeated every day. &lt;/span&gt;&lt;span title=&quot;Walaupun ingin keluar dari rutinitas, rasanya sulit untuk membangun startup setelah lelah bekerja delapan jam sehari.&quot;&gt;Although want to get out of the routine, it is difficult to build a startup after a tired working eight hours a day. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, jika kita tidak menyisihkan waktu untuk memulainya, kita akan terperangkap dalam lingkaran dunia korporat yang tak ada habisnya.\r\n\r\n&quot;&gt;However, if we do not take the time to begin with, we will be trapped in the circle of the corporate world are endless.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hidup kita tidak akan mengalami perubahan.&quot;&gt;Our lives will not be amended. &lt;/span&gt;&lt;span title=&quot;Pergi ke kantor sebelum pukul 9.00 pagi, berurusan dengan manajer yang selalu menekan, dan dengan sabarnya menanggapi komentar serta sindiran dari rekan kerja.&quot;&gt;Went to the office before 9:00 am, dealing with a manager who is always suppress, and patiently responded to comments and teasing from peers. &lt;/span&gt;&lt;span title=&quot;Bagi saya, itu tidak terdengar seperti kehidupan yang menyenangkan.\r\n\r\n\r\n&quot;&gt;For me, it does not sound like a pleasant life.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulainya dengan bangun lebih pagi\r\n\r\n&quot;&gt;Start by getting up early&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya kemudian memutuskan untuk bangun lebih awal, pukul 5.00 pagi, dan mulai &amp;ldquo;membangun&amp;rdquo; startup saya sebelum bersiap-siap ke kantor.&quot;&gt;I then decided to get up early, at 5:00 am, and began to &quot;build&quot; my startup before getting ready for work. &lt;/span&gt;&lt;span title=&quot;Awalnya saya pikir ini adalah hal yang sepele dan dapat berjalan dengan mulus, sampai saya sadar bahwa bangun pagi itu tidak mudah.\r\n\r\n&quot;&gt;Initially I thought this is trivial and can run smoothly, until I realized that it was not easy to get up in the morning.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bahkan saya sering lebih memilih untuk melanjutkan tidur.&quot;&gt;In fact I often prefer to continue sleeping. &lt;/span&gt;&lt;span title=&quot;Meskipun dalam beberapa kesempatan saya berhasil bangun pagi, saya hanya menghabiskan waktu dengan bengong.\r\n\r\n&quot;&gt;Although in some occasions I managed to get up in the morning, I just spent time with the filmed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak blog yang membuat seolah-olah meningkatkan produktivitas adalah hal yang mudah.&quot;&gt;Many blogs are made as though improving productivity is an easy thing. &lt;/span&gt;&lt;span title=&quot;Namun saat kita mencoba, kenyataannya sangat sulit.&quot;&gt;But when we try, the reality is very difficult. &lt;/span&gt;&lt;span title=&quot;Kamu akan menemukan banyak sekali tulisan semacam ini, contohnya 8 Things Every Person Should Do Before 8 AM, 7 Things Morning People Do Differently, dan Why Productive People Get Up Insanely Early.\r\n\r\n&quot;&gt;You will find a lot of this kind of writing, for example 8 Things Every Person Should Do Before 8 AM, 7 Things People Do Differently Morning, and Rev Insanely Productive People Get Up Early.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang , tulisan itu membuat saya merasa bersalah menikmati waktu tidur yang lama.&quot;&gt;Sometimes, writing it makes me feel guilty enjoying a long sleep time. &lt;/span&gt;&lt;span title=&quot;Para orang hebat dalam tulisan itu bahkan sudah bersumbangsih pada dunia sebelum jam 8 pagi.&quot;&gt;The great man in the article already contribute substantially to the world even before 8 o&#039;clock. &lt;/span&gt;&lt;span title=&quot;Apakah mereka manusia normal seperti saya?\r\n\r\n&quot;&gt;Are they normal people like me?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada kenyataannya, bangun pukul 5.00 pagi itu sangat sulit.&quot;&gt;In fact, getting up at 5:00 am it was very difficult. &lt;/span&gt;&lt;span title=&quot;Kita dapat mematikan alarm tanpa sadar, padahal kita punya jadwal rapat pagi.&quot;&gt;We can turn off the alarm without knowing it, when we had an early morning meeting schedule. &lt;/span&gt;&lt;span title=&quot;Atau menekan tombol snooze ketika kita harus mengejar kereta.&quot;&gt;Or hit the snooze button when we had to catch a train. &lt;/span&gt;&lt;span title=&quot;Melihat kejadian ini, hal yang dapat kita lakukan adalah dengan mengubah cara kita bangun tidur.\r\n\r\n\r\n&quot;&gt;Seeing this incident, things we can do is to change the way we wake up.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pilihlah alarm yang canggih\r\n\r\n&quot;&gt;Choose a sophisticated alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya bukanlah tipe orang yang senang dibangunkan tiba-tiba dengan suara berisik.&quot;&gt;I&#039;m not the kind of person who likes to be woken up suddenly by the noise. &lt;/span&gt;&lt;span title=&quot;Bangun tidur di pagi hari dengan perasaan terkejut rasanya tidak menyenangkan.&quot;&gt;I wake up in the morning with a feeling of surprised it&#039;s not fun. &lt;/span&gt;&lt;span title=&quot;Saya rasa akan lebih baik jika kita mencari alarm yang membangunkan kita secara bertahap, sehingga pikiran kamu akan terlebih dahulu menyiapkan tubuh untuk benar-benar bangun.\r\n\r\n&quot;&gt;I think it would be better if we are looking for an alarm that woke us gradually, so that your mind will first prepare the body to actually wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mencoba alarm mesin kopi yang secara otomatis meracik kopi dan membangunkanmu dari tidur nyenyak aromanya.&quot;&gt;You can try the coffee machine alarm automatically dispensing coffee and wake you from a deep sleep aroma. &lt;/span&gt;&lt;span title=&quot;Selain itu, ada juga alarm Philips Wake-Up Light yang akan menyinari wajah, memberi kesan kalau itu adalah sinar matahari terbit.\r\n\r\n&quot;&gt;In addition, there is also alarm Philips Wake-Up Light will illuminate the face, giving the impression that it is the sun rises.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alarm berbentuk gelang juga dapat membuatmu bangun pagi melalui getaran, sehingga pasangan kamu tidak harus ikut terbangun juga.&quot;&gt;Alarm annular can also make you wake up in the morning through vibration, so that your partner do not have to come awakened too. &lt;/span&gt;&lt;span title=&quot;Memelihara hewan peliharaan seperti anjing atau kucing juga dapat menjadi salah satu pilihan untuk bangun jam 5.00 pagi, mengingat mereka suka menjilat dan menginjak-injak wajah kita hingga terbangun.\r\n\r\n&quot;&gt;Keep a pet like a dog or cat can also be an option to wake up at 5:00 am, given they like to lick and trample on our face to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Selain menggunakan alarm konvensional, saya juga menggunakan Warmly.&quot;&gt;In addition to using a conventional alarm, I also use Warmly. &lt;/span&gt;&lt;span title=&quot;Aplikasi ini akan mengeluarkan suara kicauan burung yang merdu terlebih dahulu selama lima menit, sebelum akhirnya membangunkan saya dengan alunan dawai selo dari Yo-Yo Ma.\r\n\r\n&quot;&gt;This app will give voice melodious birdsong in advance for five minutes, before finally woke me with the sound of the strings of the cello of Yo-Yo Ma.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Coba kalahkan rasa malasmu di pagi hari dengan alarm yang canggih!\r\n\r\n\r\n&quot;&gt;Try to beat the taste malasmu in the morning with a sophisticated alarm!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lakukan LDR (hubungan jarak jauh) dengan alarm\r\n\r\n&quot;&gt;Make LDR (long distance relationship) with alarm&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengubah kebiasaan tentu membutuhkan waktu dan proses, tidak bisa instan.&quot;&gt;Changing habits takes time and the process of course, can not be instant. &lt;/span&gt;&lt;span title=&quot;Membangun kebiasaan positif seperti membaca buku, berolahraga, dan bersosialisasi, serta mengubah kebiasaan buruk seperti minum alkohol, merokok, dan mengonsumsi makanan cepat saji pasti butuh perjuangan.&quot;&gt;Build positive habits such as reading, exercising, and socializing, as well as changing bad habits such as drinking alcohol, smoking, and eating fast food definitely need to fight. &lt;/span&gt;&lt;span title=&quot;Saya ingin mengutip tulisan dari blog Evernote sebelum melanjutkan:\r\n\r\n&quot;&gt;I would like to quote from the blog posts Evernote before continuing:&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu mau menghilangkan kebiasaan mematikan alarm, maka buatlah hal itu sesulit mungkin.&quot;&gt;If you want to break the habit of turning off the alarm, so make it as difficult as possible. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memasang beberapa alarm sekaligus, mengunduh aplikasi alarm dengan puzzle, atau memasukkan smartphone kamu ke dalam sebuah toples.&quot;&gt;You can put up multiple alarms at once, downloading apps with puzzle alarm, or insert your smartphone into a jar. &lt;/span&gt;&lt;span title=&quot;Jika ingin bangun pagi, letakkan alarm kamu di tempat yang sulit dijangkau.\r\n\r\n\r\n&quot;&gt;If you want to get up in the morning, place your alarm in places difficult to reach.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Paksa diri kamu untuk minum secangkir kopi\r\n\r\n&quot;&gt;You force yourself to drink a cup of coffee&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Setelah berhasil bangun pagi, muncul masalah baru.&quot;&gt;After successfully waking up, new problems arise. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar kita tetap terjaga?&quot;&gt;How can we stay awake? &lt;/span&gt;&lt;span title=&quot;Rasanya sulit untuk bangun pukul 5.00 pagi dan menahan godaan untuk kembali tidur.&quot;&gt;It was hard to get up at 5:00 am and resist the temptation to go back to sleep. &lt;/span&gt;&lt;span title=&quot;Lagipula, kamu bisa saja berpikiran untuk bangun pagi &amp;ldquo;besok saja,&amp;rdquo; tidak perlu dimulai dari hari ini.\r\n\r\n&quot;&gt;And anyway, you might think to get up early &quot;tomorrow,&quot; do not have to begin from today.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apa yang terjadi setelah itu?&quot;&gt;What happened after that? &lt;/span&gt;&lt;span title=&quot;Kita akan menyesal telah mengikuti godaan di pagi hari untuk tidur kembali.&quot;&gt;We will regret in the morning to follow the temptation to fall back asleep. &lt;/span&gt;&lt;span title=&quot;Jadi, sebelum itu semua terjadi, minumlah secangkir kopi untuk membuatmu tetap terjaga.\r\n\r\n&quot;&gt;So, before it all happens, drink a cup of coffee to keep you awake.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Minumlah kopi sesuai dengan selera dan kebiasaanmu.&quot;&gt;Drink coffee according to your tastes and habits. &lt;/span&gt;&lt;span title=&quot;Jika kamu tidak terbiasa minum kopi, tidak perlu memaksakan diri untuk meminumnya.&quot;&gt;If you are not used to drink coffee, do not have to force yourself to drink it. &lt;/span&gt;&lt;span title=&quot;Lakukanlah apa yang biasanya kamu lakukan setelah bangun tidur, karena godaan untuk kembali tidur akan tetap muncul dengan atau tanpa minum kopi.\r\n\r\n&quot;&gt;Do what you normally do after waking up, because the temptation to go back to sleep will still appear with or without a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Temukan cara untuk langsung mengintegrasikan kopi ke rutinitas pagi kamu.&quot;&gt;Find a way to integrate the coffee directly into your morning routine. &lt;/span&gt;&lt;span title=&quot;Tujuannya adalah untuk membuat alarm kamu menjadi sebuah pemicu untuk meminum kopi.\r\n\r\n&quot;&gt;The goal is to create an alarm you become a trigger for a cup of coffee.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika alarm kamu berdering, minumlah kopi.&quot;&gt;If your alarm rings, drink coffee. &lt;/span&gt;&lt;span title=&quot;Cobalah beberapa cara berbeda supaya membuat kamu otomatis berpikir untuk minum kopi setelah bangun tidur.\r\n\r\n&quot;&gt;Try a few different ways that makes you automatically think for a coffee after waking.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Awalnya saya mencoba untuk bangun pagi dan meracik kopi di dapur, saya bahkan tidak berhasil sampai ke dapur.&quot;&gt;Initially I tried to get up in the morning and dispensing coffee in the kitchen, I did not even make it to the kitchen. &lt;/span&gt;&lt;span title=&quot;Setelah itu, saya coba menyiapkan secangkir es kopi di malam hari sebelum saya tidur dan menaruhnya di meja, saya masih tidak berhasil untuk sampai ke meja.\r\n\r\n&quot;&gt;After that, I tried to prepare a cup of iced coffee at night before I sleep and put it on the table, I still did not manage to get to the table.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pada akhirnya, saya meletakkan cangkir kopi tersebut di atas smartphone saya.&quot;&gt;In the end, I put the coffee cup on top of my smartphone. &lt;/span&gt;&lt;span title=&quot;Jadi, untuk mematikan alarm, saya harus mengangkat cangkir kopi itu terlebih dahulu.\r\n\r\n&quot;&gt;So, to turn off the alarm, I had to lift the cup first.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika cangkir kopi sudah di tangan, mengapa tidak sekalian meminumnya, bukan?&quot;&gt;When a coffee cup in hand, why not drink it, do not you? &lt;/span&gt;&lt;span title=&quot;Selamat, kini kamu telah berhasil bangun pukul 5.00 pagi.&quot;&gt;Congratulations, now you&#039;ve managed to get up at 5:00 am. &lt;/span&gt;&lt;span title=&quot;Manfaatkanlah itu untuk menyiapkan startup kamu!\r\n\r\n\r\n&quot;&gt;Make use of it to set up your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Alihkan dirimu untuk bangun\r\n\r\n&quot;&gt;Divert yourself to wake up&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Masih belum terbangun?&quot;&gt;Still not awake? &lt;/span&gt;&lt;span title=&quot;Sedikit pengalihan mungkin akan berguna.&quot;&gt;A little diversion might be useful. &lt;/span&gt;&lt;span title=&quot;Sebagai orang yang sangat suka berselancar di internet, saya mungkin bukan orang terbaik untuk memberi saran meningkatkan produktivitas.\r\n\r\n&quot;&gt;As a person who loves surfing the internet, I am probably not the best person to give advice improve productivity.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya menghabiskan banyak waktu melihat gambar-gambar kucing lucu di Reddit, Imgur, dan 9GAG.&quot;&gt;I spent a lot of time looking at pictures of cute cats on Reddit, Imgur, and 9GAG. &lt;/span&gt;&lt;span title=&quot;Hingga akhirnya saya telah melihat semua isinya dan berharap ada konten baru yang muncul.\r\n\r\n&quot;&gt;Until finally I have seen all the contents and hope there is new content appears.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, mari kita lihat sisi positifnya.&quot;&gt;So, let&#039;s look at the positive side. &lt;/span&gt;&lt;span title=&quot;Jika melihat gambar kucing lucu di internet pada malam hari bisa menyebabkan kita mengalami insomnia, maka mengecek smartphone atau komputer kita di pagi hari dapat membantu kita untuk bangun.\r\n\r\n&quot;&gt;If you see a cute cat pictures on the internet at night can cause us to experience insomnia, then check smartphone or computer in the morning can help us to wake up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu tidak bisa langsung mengerjakan persiapan startup kamu setelah bangun tidur, kamu mungkin bisa menunggu beberapa menit dulu hingga kamu memang benar-benar siap.&quot;&gt;If you can not directly work on the preparation of startup you after you wake up, you can probably wait a few minutes past until you are really ready. &lt;/span&gt;&lt;span title=&quot;Ingat, ada dua tantangan yang harus kamu hadapi, bangun pagi dan mencicil persiapan startup.\r\n\r\n\r\n&quot;&gt;Remember, there are two challenges that you must face, got up early and startup preparation installments.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil\r\n\r\n&quot;&gt;Your startup broke into small sections&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika baru bangun tidur di pagi hari, saya tidak ingin langsung menghadapi berbagai masalah di tahap persiapan startup saya.&quot;&gt;When just woken up in the morning, I do not want to directly confront the various problems in the preparation stage of my startup. &lt;/span&gt;&lt;span title=&quot;Mood kamu di pagi hari mungkin tidak sebagus biasanya.&quot;&gt;Your mood in the morning may not be as good as usual. &lt;/span&gt;&lt;span title=&quot;Jadi, mengerjakan hal yang tidak menyenangkan hanya akan memancing kamu untuk kembali tidur.\r\n\r\n&quot;&gt;So, do unpleasant things will only provoke you to get back to sleep.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sekarang saya rasa hampir semua orang telah gagal memenuhi resolusi tahun barunya.&quot;&gt;Now I think almost everyone has failed to meet his new year&#039;s resolution. &lt;/span&gt;&lt;span title=&quot;Salah satu alasannya mungkin karena kita memilih sesuatu yang terlalu besar dan sulit.\r\n\r\n&quot;&gt;One reason may be because we choose something that is too big and hard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;The Art of Manliness menyadarkan kita bahwa kebiasaan untuk mengerjakan sesuatu yang kecil akan menuntun ke sesuatu yang lebih besar.&quot;&gt;The Art of Manliness makes us realize that the habit of doing something small will lead to something bigger. &lt;/span&gt;&lt;span title=&quot;Kamu tidak mungkin membangun startup dalam satu hari.&quot;&gt;You can not build a startup in one day. &lt;/span&gt;&lt;span title=&quot;Kamu hanya harus memulainya terlebih dahulu.&quot;&gt;You just have to start it first. &lt;/span&gt;&lt;span title=&quot;Setelah memulainya, akan lebih mudah untuk melanjutkannya.\r\n\r\n&quot;&gt;Once started, it will be easier to continue.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pecah startup kamu menjadi beberapa bagian kecil yang dapat dikerjakan pagi hari sebelum berangkat ke kantor.&quot;&gt;Your startup broke into several small pieces that can be done the morning before going to the office. &lt;/span&gt;&lt;span title=&quot;Sebagai contoh, jika produk startup kamu adalah aplikasi, setiap pagi kamu bisa mulai menulis sebaris kode program.&quot;&gt;For example, if you are a startup product application, every morning you can start writing a line of program code. &lt;/span&gt;&lt;span title=&quot;Tulislah satu paragraf&amp;mdash;jika itu adalah blog, atau buatlah satu desain produk.\r\n\r\n&quot;&gt;Write a paragraph-if it is a blog, or create a product design.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih baik untuk mengerjakan sedikit demi sedikit secara bertahap dibandingkan menghabiskan banyak waktu untuk mengerjakan banyak hal sekaligus.&quot;&gt;It is better to do little by little gradually than spend a lot of time to do many things at once. &lt;/span&gt;&lt;span title=&quot;Ingat, tidak semua pekerjaan harus sempurna.&quot;&gt;Remember, not all jobs have to be perfect. &lt;/span&gt;&lt;span title=&quot;Kerjakan secara disiplin dan buatlah menjadi sebuah kebiasaan baik yang baru.\r\n\r\n\r\n&quot;&gt;Do disciplined and makeit into a new good habit.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gunakan metode Lean Startup\r\n\r\n&quot;&gt;Use Lean Startup method&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, pada awalnya tidak ada orang yang sebenarnya tahu apa yang akhirnya mereka lakukan.&quot;&gt;Believe it or not, at first no one actually knows what they finally did. &lt;/span&gt;&lt;span title=&quot;Bahkan startup unicorn terbesar sekalipun membutuhkan banyak waktu untuk mencari dasar yang jelas.&quot;&gt;The unicorn startup even though it takes time to find a clear basis. &lt;/span&gt;&lt;span title=&quot;Airbnb dapat bertahan berkat penjualan sereal bertema politik, yaitu Obama O&amp;rsquo;s and Cap&amp;rsquo;n McCain&amp;rsquo;s.\r\n\r\n&quot;&gt;Airbnb able to survive thanks to the sale of cereals political theme, that Obama O&#039;s and Cap&#039;n McCain&#039;s.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendiri Slack, Stewart Butterfield, juga pada awalnya membuat sebuah game gagal bernama Glitch.&quot;&gt;Slack founder, Stewart Butterfield, also initially failed to create a game called Glitch. &lt;/span&gt;&lt;span title=&quot;Bahkan, YouTube pada awalnya merupakan sebuah situs kencan video Tune in Hook Up.\r\n\r\n&quot;&gt;In fact, YouTube was originally a video dating site Tune in Hook Up.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulailah mengerjakan startup kamu dengan bertahap, terperinci, dan terfokus sesuai dengan metodologi buku The Lean Startup yang dipopulerkan oleh Eric Ries.&quot;&gt;Start working on your startup with a phased, detailed and focused according to the book The Lean Startup methodology popularized by Eric Ries. &lt;/span&gt;&lt;span title=&quot;Dengan demikian, kamu akan lebih mudah mengimplementasikan ide-ide dan mendapatkan timbal balik yang cepat dari pengguna.\r\n\r\n&quot;&gt;Thus, you will be easier to implement ideas and get quick feedback from users.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tentu sudah tahu bahwa 75 persen startup di dunia mengalami kegagalan.&quot;&gt;You already know that 75 percent of the startup in the world have failed. &lt;/span&gt;&lt;span title=&quot;Jadi apakah kamu tetap mau menghabiskan seratus hari mengerjakan produk kamu secara tertutup?&quot;&gt;So if you are willing to spend a hundred days working on the product you are covered? &lt;/span&gt;&lt;span title=&quot;Bagaimana jika setelah produk kamu selesai, orang-orang tidak menyukainya?\r\n\r\n&quot;&gt;What if after you finished products, people do not like it?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukankah lebih baik jika kamu berinteraksi dengan orang lain selama proses pengerjaan, sehingga kamu tahu pasti apa yang mereka butuhkan dan inginkan?&quot;&gt;Would not it be nice if you interact with others during the process, so that you know exactly what they need and want? &lt;/span&gt;&lt;span title=&quot;Jangan sampai kamu keliru mengambil langkah.\r\n\r\n&quot;&gt;Do not you dare take a step wrong.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jangan terlampau puas dengan apa yang sudah kamu kerjakan.&quot;&gt;Do not be too happy with what you&#039;ve done. &lt;/span&gt;&lt;span title=&quot;Kamu harus terus menguji produk kamu melalui berbagai eksperimen kecil.&quot;&gt;You should continue to test your products through a variety of small experiments. &lt;/span&gt;&lt;span title=&quot;Ketika saya pertama kali memulai Krown.io, saya menyebutnya sebagai Annotation Blogging Platform (platform anotasi blog).&quot;&gt;When I first started Krown.io, I call it a Blogging Platform Annotation (annotation platform blog). &lt;/span&gt;&lt;span title=&quot;Kemudian saya sadar bahwa sebagian besar masyarakat masih belum tahu apa itu anotasi.\r\n\r\n&quot;&gt;Then I realized that most people still do not know what annotations.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kami sudah mencoba berbagai hal seperti Smart Blogging, Highlight Blogging, Feedback Blogs, dan Contextual Blogging Platform.&quot;&gt;We&#039;ve tried a variety of things such as Smart Blogging, Highlight Blogging, Blogs Feedback, and Contextual Blogging Platform. &lt;/span&gt;&lt;span title=&quot;Hasilnya?&quot;&gt;The result? &lt;/span&gt;&lt;span title=&quot;Mereka juga tidak tahu apa-apa tentang itu.\r\n\r\n&quot;&gt;They also do not know anything about it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi kami memutuskan untuk menambahkan penjelasan yang lebih mudah dimengerti, yaitu &amp;ldquo;highlight a text and add comments directly on the highlighted text.&amp;rdquo; Kamu harus selalu melakukan validasi atas hipotesismu.\r\n\r\n\r\n&quot;&gt;So we decided to add the explanation easier to understand, which is &quot;a highlight text and add comments directly on the highlighted text.&quot; You should always perform validation on hipotesismu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Publikasikan karya kamu\r\n\r\n&quot;&gt;Publish your artwork&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kita semua pasti memiliki sebuah ketakutan.&quot;&gt;We all have a fear. &lt;/span&gt;&lt;span title=&quot;Mungkin kamu merasa takut jika karya kamu akan dicemooh dan dijatuhkan oleh orang-orang setelah dipublikasikan.&quot;&gt;Perhaps you feel scared if the work you will be scorned and overthrown by the people after they are published. &lt;/span&gt;&lt;span title=&quot;Kenyataannya?&quot;&gt;The reality? &lt;/span&gt;&lt;span title=&quot;Tidak ada yang peduli dengan itu.\r\n\r\n&quot;&gt;No one bothered with it.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di dunia ini ada lebih dari dua juta karya yang dipublikasikan setiap harinya.&quot;&gt;In this world there are more than two million works published each day. &lt;/span&gt;&lt;span title=&quot;Tantangan terbesar yang harus kamu pikirkan saat ini bukanlah ketakutan yang tidak terbukti itu, tetapi bagaimana caranya agar karya kamu ini dapat dipublikasikan dan mendapat sorotan dari mata masyarakat.\r\n\r\n&quot;&gt;The biggest challenge that you have to think about now is not the fear that is not proven that, but how do you work this can be published and the scrutiny of the public eye.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika sekarang saja kamu masih kesulitan untuk bangun pagi dan mengerjakan startup kamu, sebaiknya jangan terlalu memusingkan konten terlebih dahulu.&quot;&gt;If the current course you are still difficult to get up early and work on your startup, you should not be too confusing content beforehand. &lt;/span&gt;&lt;span title=&quot;Mulailah semuanya secara bertahap, jangan sampai timbul rasa khawatir berlebihan.&quot;&gt;Begin everything gradually, not to worry excessively raised. &lt;/span&gt;&lt;span title=&quot;Itu sama saja seperti khawatir terlalu banyak belajar, seakan-akan imbasnya kamu akan menjadi profesor di Harvard.\r\n\r\n&quot;&gt;It&#039;s just like learning to worry too much, as if the impact you will become a professor at Harvard.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu masih kesulitan untuk membangun startup kamu, solusi pertama yang perlu dilakukan adalah bangun lebih pagi dan mulai mengerjakannya.&quot;&gt;If you still have trouble to build your startup, the first solution you need to do is to wake up early and start working on it. &lt;/span&gt;&lt;span title=&quot;Ini sudah terbukti secara ilmiah, bukan hanya berdasarkan pengalaman saya saja.\r\n\r\n&quot;&gt;It has been proven scientifically and not just based on my experience alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu dapat mulai untuk memublikasikan kemajuanmu menggunakan hal yang sederhana seperti Twitter.&quot;&gt;You can begin to publish your progress using a simple thing like Twitter. &lt;/span&gt;&lt;span title=&quot;Thomas Frank dari College Info Geek menggunakan Twitter dan Buffer untuk memaksa dia bangun pagi.&quot;&gt;Thomas Frank of College Info Geek using Twitter and Buffer to force him to get up early. &lt;/span&gt;&lt;span title=&quot;Ia menjadwalkan tweet berisi bahwa ia akan mendonasikan US$25 (sekitar Rp327.000)tiap pagi.&quot;&gt;He scheduled a tweet that he would donate US $ 25 (about Rp327.000) every morning. &lt;/span&gt;&lt;span title=&quot;Jadi, ia harus bangun pagi sebelum tweet itu &amp;ldquo;mengudara.&amp;rdquo;\r\n\r\n&quot;&gt;So, he had to get up early before the tweet was &quot;on the air.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Percayalah pada dirimu sendiri.&quot;&gt;Believe in yourself. &lt;/span&gt;&lt;span title=&quot;Karya kamu luar biasa.\r\n\r\n\r\n&quot;&gt;Your work is incredible.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terobsesi dengan produktivitas\r\n\r\n&quot;&gt;Obsessed with productivity&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cobalah melakukan sebanyak mungkin hal dengan usaha yang seminim mungkin.&quot;&gt;Try to do as many things with minimum effort. &lt;/span&gt;&lt;span title=&quot;Saya memulai setiap pagi dengan menulis jurnal.&quot;&gt;I begin each morning with a journal. &lt;/span&gt;&lt;span title=&quot;Jika saya menulis hanya untuk kepentingan pribadi, saya mungkin tidak akan serajin ini.&quot;&gt;If I write only for personal interest, I probably would not have this diligently. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal telah membantu pengembangan startup saya dalam tiga hal sekaligus.\r\n\r\n&quot;&gt;Keeping a journal has helped the development of my startup in three things at once.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertama, menulis jurnal di pagi hari membantu saya untuk melihat perkembangan yang telah dicapai.&quot;&gt;First, write a journal in the morning helps me to see the progress that has been achieved. &lt;/span&gt;&lt;span title=&quot;Bagaimana caranya agar saya bisa lebih banyak berinteraksi dengan pengguna?&quot;&gt;How do I interact more with the users? &lt;/span&gt;&lt;span title=&quot;Apakah saya harus beralih dari platform komentar WordPress ke Disqus?\r\n\r\n&quot;&gt;Do I have to switch on the platform WordPress comments to Disqus?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Apakah iklan Adsense masih baik digunakan dalam era Adblock?&quot;&gt;Is Adsense ads still well used in Adblock era? &lt;/span&gt;&lt;span title=&quot;Kapan waktu terbaik untuk memublikasikan blog?&quot;&gt;When is the best time to publish a blog? &lt;/span&gt;&lt;span title=&quot;Apa saja pekerjaan yang dapat saya otomatisasi?&quot;&gt;Any job that can be my automation? &lt;/span&gt;&lt;span title=&quot;Apakah saya sudah gila dengan memulai bisnis sendiri?\r\n\r\n&quot;&gt;Am I crazy to start your own business?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kedua, menulis jurnal dapat membantu membangun konten untuk blog saya, TechMob.&quot;&gt;Second, write in a journal can help build content for my blog, TechMob. &lt;/span&gt;&lt;span title=&quot;Membangun blog yang bagus membutuhkan cukup banyak waktu.&quot;&gt;Building a good blog takes some time. &lt;/span&gt;&lt;span title=&quot;Kamu butuh sekitar seribu artikel untuk mulai mendapatkan traksi organik dari Google.&quot;&gt;You need about a thousand articles to start getting traction from Google organic. &lt;/span&gt;&lt;span title=&quot;Menulis jurnal setiap hari membantu kita untuk membangun dasar konten yang diperlukan.\r\n\r\n&quot;&gt;Writing a journal every day helped us to build the foundation required content.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terakhir, menulis jurnal untuk publik membantu saya mempromosikan platform anotasi blog saya, Krown.&quot;&gt;Finally, write a journal for public help me promote my blog annotation platform, Krown. &lt;/span&gt;&lt;span title=&quot;TechMob dibangun dari Krown dan menggunakan sistem komentar per kalimat untuk menambahkan informasi terkait.&quot;&gt;TechMob built from Krown and use the system to add a comment per sentence related information. &lt;/span&gt;&lt;span title=&quot;Setiap tulisan di TechMob akan mempromosikan Krown melalui sub domain techmob.krown.io dan call to action di bagian bawah artikel.\r\n\r\n\r\n&quot;&gt;Each article in TechMob will promote Krown through sub domains techmob.krown.io and call to action at the bottom of the article.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Persiapan untuk bekerja tanpa henti\r\n\r\n&quot;&gt;Preparation for work ceaselessly&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika waktu sudah menunjukkan pukul 7.00 pagi, bersiap-siaplah untuk berangkat ke kantor meskipun masih ingin mengerjakan startup kamu.&quot;&gt;When the time is shown at 7:00 am, get ready to go to the office even though they want to work on your startup. &lt;/span&gt;&lt;span title=&quot;Kamu harus tetap bekerja untuk memenuhi kebutuhanmu sehari-hari.&quot;&gt;You have to keep working to meet your needs everyday. &lt;/span&gt;&lt;span title=&quot;Mengerjakan pecahan kecil startup di pagi hari dapat menjadi persiapan sebelum kamu harus bekerja dari jam 9.00 sampai 5.00.\r\n\r\n&quot;&gt;Working on a small fraction of the startup in the morning can be a preparation before you have to work from 9:00 until 5:00.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mengerjakan startup butuh waktu, dan kamu butuh makan.&quot;&gt;Working startup takes time, and you need to eat. &lt;/span&gt;&lt;span title=&quot;Berdasarkan strategi barbel (dari buku Anti-Fragile oleh Nassim Taleb), kamu harus mengalokasikan 20 persen sumber daya yang dimiliki untuk aktivitas berisiko.&quot;&gt;Based on the barbell strategy (of the Anti-Fragile book by Nassim Taleb), you should allocate 20 percent of its resources for risky activity. &lt;/span&gt;&lt;span title=&quot;Contohnya, membangun startup atau bermain bungee jumping.&quot;&gt;For example, building a startup or play bungee jumping. &lt;/span&gt;&lt;span title=&quot;Lalu investasikan 80 persen sumber daya yang tersisa untuk hal yang tidak berisiko seperti sekolah, bekerja, atau makan malam bersama keluarga.\r\n\r\n&quot;&gt;Then invest 80 per cent of the remaining resources for things that are not at risk such as school, work, or dinner with the family.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nikmati semua waktu kamu di dunia ini.&quot;&gt;Enjoy all your time in this world. &lt;/span&gt;&lt;span title=&quot;Bangunlah startup kamu sebagai proyek sampingan, lakukan validasi, lalu mulai terjun serius ketika kamu sudah siap.\r\n\r\n\r\n&quot;&gt;Build your startup as a side project, perform validation, and then began to plunge serious when you&#039;re ready.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi, kapan kamu akan bangun?\r\n\r\n&quot;&gt;So, when are you going to wake up?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rutinitas pagi di dunia startup akan berbeda.&quot;&gt;A morning routine in the startup world will be different. &lt;/span&gt;&lt;span title=&quot;Kamu harus coba mencari rutinitas yang dapat membawamu semakin dekat dengan tujuan.&quot;&gt;You should try to find a routine that can bring you closer to the goal. &lt;/span&gt;&lt;span title=&quot;Jika kamu harus menghabiskan delapan jam mengerjakan sesuatu yang tidak disukai, kamu setidaknya harus menginvestasikan satu jam melakukan hal yang kamu sukai.\r\n\r\n&quot;&gt;If you had to spend eight hours doing something you do not like, you at least have to invest one hour doing things that you like.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu tidak dapat melakukan hal yang sama terus menerus dan mengharapkan hasil yang berbeda.&quot;&gt;You can not do the same thing continuously and expecting different results. &lt;/span&gt;&lt;span title=&quot;Jangan biarkan situasi yang ada saat ini menuntunmu ke jalan yang salah.&quot;&gt;Do not let the current situation is leading you down the wrong path. &lt;/span&gt;&lt;span title=&quot;Hadapi kenyataan, jalani hidup kamu sesuai dengan apa yang kamu percayai.&quot;&gt;Face the reality, live your life according to what you believe. &lt;/span&gt;&lt;span title=&quot;Bangunlah lebih pagi, dan mulailah membangun startup kamu!\r\n\r\n\r\n\r\n&quot;&gt;Get up early, and start building your startup!&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Min H. Park&quot;&gt;Taken from TechInAsia By Min H. Park&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(7, 4, 1, '5 Alasan Kenapa Kamu Harus Membangun Usaha Kecil, Bukan Startup', '&lt;p&gt;Saya mengerti, kita semua ingin melakukan sesuatu yang penting. Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar. Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.&lt;br /&gt;&lt;br /&gt;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Mampukah gagasan tersebut berkembang?&lt;br /&gt;&lt;br /&gt;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.&lt;br /&gt;&lt;br /&gt;Terkadang, kita bahkan menertawakannya. Saat kita melakukan hal tersebut, kita jadi orang yang brengsek. Benar-benar brengsek. Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama. Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.&lt;br /&gt;&lt;br /&gt;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak. Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn. Memang, apa bedanya?&lt;br /&gt;&lt;br /&gt;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.&lt;br /&gt;&lt;br /&gt;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.&lt;br /&gt;&lt;br /&gt;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau. Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa fokus pada kesederhanaan produk&lt;br /&gt;&lt;br /&gt;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas. Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.&lt;br /&gt;&lt;br /&gt;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang. Bisnis skala kecil tak punya kendala semacam itu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Pegawai kamu lebih penting&lt;br /&gt;&lt;br /&gt;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu. Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan. Dalam bisnis skala kecil, para pegawai adalah yang utama.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Lebih mudah dalam mengatur bisnis&lt;br /&gt;&lt;br /&gt;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk. Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar. Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil. Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kecil bukan berarti miskin&lt;br /&gt;&lt;br /&gt;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan. Bukan berarti juga kamu akan mati dalam keadaan miskin.&lt;br /&gt;&lt;br /&gt;Pendapatan kamu memang kecil, tentu saja. Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.&lt;br /&gt;&lt;br /&gt;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan. Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Kamu bisa mengembangkan bisnis kapan pun kamu siap&lt;br /&gt;&lt;br /&gt;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan. Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.&lt;br /&gt;&lt;br /&gt;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.&lt;br /&gt;&lt;br /&gt;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya. Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.&lt;br /&gt;&lt;br /&gt;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.&lt;br /&gt;&lt;br /&gt;Jika kamu melakukannya, kamu tak akan menjadi miliuner. Namun kamu bisa menjadi jutawan yang bahagia. Dan bagi saya, itu adalah pilihan yang sangat bagus.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari TechInAsia Oleh Jon Westenberg&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(8, 4, 2, '5 Reasons Why You Should Build Your Small Business, Not Startup', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Saya mengerti, kita semua ingin melakukan sesuatu yang penting.&quot;&gt;I understand, we all want to do something important. &lt;/span&gt;&lt;span title=&quot;Kita semua ingin menciptakan produk istimewa, mendirikan perusahaan bernilai, dan mengerjakan hal-hal yang dapat mengubah dunia serta punya dampak sangat besar.&quot;&gt;We all want to create special products, establishing the company is worth, and do things that can change the world and have a huge impact. &lt;/span&gt;&lt;span title=&quot;Hal-hal seperti ini kerap kali saya temukan di komunitas wirausahawan dan teknologi.\r\n\r\n&quot;&gt;Things like this often I found in the community of entrepreneurs and technology.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pertanyaan yang kami ajukan, tatkala kami mendengar sebuah gagasan maupun ide baru&amp;mdash;entah itu energi terbarukan hingga aplikasi pesan instan, adalah berikut ini:\r\n\r\n\r\n&quot;&gt;The questions we ask, when we hear an idea or a new idea-be it renewable energy to instant messaging applications, are the following:&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mampukah gagasan tersebut berkembang?\r\n\r\n&quot;&gt;Can the idea evolve?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kita merasa gagasan yang sedang kita pikirkan tak dapat berkembang hingga digunakan satu juta pengguna, dan tidak dirancang untuk meraih pendapatan puluhan triliun rupiah, kita pun melupakan gagasan tersebut.\r\n\r\n&quot;&gt;When we feel we are considering the idea can not be developed to use one million users, and is not designed to achieve revenues of tens of trillions of rupiah, we forget about the idea.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Terkadang, kita bahkan menertawakannya.&quot;&gt;Sometimes, we even laugh about it. &lt;/span&gt;&lt;span title=&quot;Saat kita melakukan hal tersebut, kita jadi orang yang brengsek.&quot;&gt;When we do that, we become a jerk. &lt;/span&gt;&lt;span title=&quot;Benar-benar brengsek.&quot;&gt;Really a jerk. &lt;/span&gt;&lt;span title=&quot;Karena mendirikan perusahaan teknologi yang besar, megah, dan bernilai bukanlah hal yang paling utama.&quot;&gt;Because establishing technology companies are large, grand and worth is not the main thing. &lt;/span&gt;&lt;span title=&quot;Dan memilih untuk tidak melakukannya tak membuat kita menjadi orang yang bodoh.\r\n\r\n&quot;&gt;And chose not to do so does not make us a fool.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sejujurnya, jika kamu memilih jalan yang berlawanan, kamu berpeluang untuk dapat lebih bahagia, jarang sakit-sakitan, lebih kaya, dan jauh lebih bijak.&quot;&gt;To be honest, if you choose the opposite way, you&#039;re likely to be happier, rarely sick, richer, and far more wisely. &lt;/span&gt;&lt;span title=&quot;Kamu bisa memilih untuk mendirikan usaha online kecil-kecilan ketimbang berencana membangun startup unicorn.&quot;&gt;You can choose to set up a small online businesses rather than planning to build a startup unicorn. &lt;/span&gt;&lt;span title=&quot;Memang, apa bedanya?\r\n\r\n&quot;&gt;Indeed, what&#039;s the difference?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Startup unicorn memerlukan pertumbuhan pesat dan besar, juga memerlukan investasi dan harus mendominasi.\r\n\r\n&quot;&gt;Startup unicorn requires rapid growth and large, also requires an investment and should dominate.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Usaha online berskala kecil hanya memerlukan pertumbuhan dalam batasan yang jelas, meraih keuntungan, dan melayani pelanggan.\r\n\r\n&quot;&gt;Small-scale online businesses only require growth in a clear boundaries, profit, and serve customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rencana untuk tidak menargetkan pertumbuhan yang luas mungkin agak berlawanan dengan apa yang kamu mau.&quot;&gt;Plans to not target the extensive growth may be somewhat contrary to what you want. &lt;/span&gt;&lt;span title=&quot;Akan tetapi, saya yakin ada cukup banyak manfaat yang bisa kamu petik hanya dengan mendirikan usaha kecil.\r\n\r\n\r\n&quot;&gt;However, I am sure there are quite a lot of benefits that you can reap just by setting up small businesses.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa fokus pada kesederhanaan produk\r\n\r\n&quot;&gt;You can focus on the simplicity of the product&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Secara harfiah, kamu membangun sesuatu yang kecil, dengan batasan dan patokan yang jelas.&quot;&gt;Literally, you build something small, with restrictions and a clear benchmark. &lt;/span&gt;&lt;span title=&quot;Tak ada tekanan yang besar untuk menambahkan fitur tertentu pada produk kamu, yang berarti kamu punya kebebasan untuk fokus terhadap bagian produk yang paling esensial bagi kamu dan pelanggan.\r\n\r\n&quot;&gt;There is no greater pressure to add certain features of your product, which means you have the freedom to focus on the most essential part of the product for you and your customers.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Menciptakan produk yang mengutamakan kesederhanaan adalah tantangan besar bagi banyak perusahaan besar dan berkembang.&quot;&gt;Creating products that prioritizes simplicity is a big challenge for many companies large and growing. &lt;/span&gt;&lt;span title=&quot;Bisnis skala kecil tak punya kendala semacam itu.\r\n\r\n\r\n&quot;&gt;Small businesses have no such constraints.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pegawai kamu lebih penting\r\n\r\n&quot;&gt;Your employee is more important&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ketika kamu memilih usaha skala kecil, kamu bisa habiskan waktumu dengan para pegawai yang berarti dalam bisnis kamu.&quot;&gt;When you choose a small-scale business, you can spend time with employees, which means in your business. &lt;/span&gt;&lt;span title=&quot;Entah jumlah pegawaimu hanya satu atau lima, orang-orang itu akan menjadi prioritas utama kamu daripada jika kamu mempekerjakan banyak pegawai untuk mengejar pertumbuhan.&quot;&gt;Either the number of servants only one or five, people will be your main priority than if you hire many employees to pursue growth. &lt;/span&gt;&lt;span title=&quot;Dalam bisnis skala kecil, para pegawai adalah yang utama.\r\n\r\n\r\n&quot;&gt;In a small business, the employees are the main ones.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Lebih mudah dalam mengatur bisnis\r\n\r\n&quot;&gt;It is easier to set up a business&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saya suka saat melihat sentuhan pribadi pada setiap bisnis dan produk.&quot;&gt;I love when she saw a personal touch to every business and products. &lt;/span&gt;&lt;span title=&quot;Hal itu mustahil terjadi ketika kamu berambisi mendirikan perusahaan yang sangat besar.&quot;&gt;It was impossible happens when you ambition to set up a very large company. &lt;/span&gt;&lt;span title=&quot;Namun hal itu jadi sangat mungkin ketika kamu mulai dengan mendirikan sesuatu yang kecil.&quot;&gt;But it was so very likely when you start by setting up something small. &lt;/span&gt;&lt;span title=&quot;Kamu bisa gunakan waktumu untuk memastikan bahwa para pelanggan dan konsumen mendapat perhatian setiap waktu.\r\n\r\n\r\n&quot;&gt;You can use your time to ensure that customers and consumers get attention every time.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kecil bukan berarti miskin\r\n\r\n&quot;&gt;Small does not mean poor&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Meski perusahaan kamu kecil dan produk kamu hanya digunakan segelintir orang, bukan berarti perusahaan kamu tak akan meraih keuntungan.&quot;&gt;Although your company is small and the products you use only a handful of people, it does not mean the company will not benefit you. &lt;/span&gt;&lt;span title=&quot;Bukan berarti juga kamu akan mati dalam keadaan miskin.\r\n\r\n&quot;&gt;Not that too you will die in a poor state.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Pendapatan kamu memang kecil, tentu saja.&quot;&gt;Your income is small, of course. &lt;/span&gt;&lt;span title=&quot;Namun peluang kamu untuk membangun perusahaan bernilai miliaran rupiah jauh lebih besar dibandingkan peluang untuk mendirikan perusahaan bernilai triliunan rupiah.\r\n\r\n&quot;&gt;But your chances to build companies worth billions of rupiah is much greater than the chance to set up a company worth trillions of rupiah.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dengan begitu, biaya operasional kamu jadi lebih sedikit, pengeluaran perusahaan dapat lebih ditekan.&quot;&gt;By doing so, the operational cost you so much less, spending the company can be suppressed. &lt;/span&gt;&lt;span title=&quot;Kamu beserta tim berpeluang menikmati semua keuntungan yang diperoleh.\r\n\r\n\r\n&quot;&gt;You and your team a chance to enjoy all the benefits.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu bisa mengembangkan bisnis kapan pun kamu siap\r\n\r\n&quot;&gt;You can grow your business whenever you&#039;re ready&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kalau kamu ingin perusahaan kamu berkembang, kamu punya peluang lebih baik dengan melakukannya bersama perusahaan yang lebih kecil namun sukses dan mampu menghasilkan keuntungan.&quot;&gt;If you want your company develops, you have a better chance to do it with a smaller company but successful and able to generate a profit. &lt;/span&gt;&lt;span title=&quot;Ketika produk dan aliran dana perusahaan kamu sudah lebih matang, kamu tak hanya jadi menarik di mata investor, namun kamu juga bisa mendanai perusahaan dengan uang kamu sendiri.\r\n\r\n&quot;&gt;When the product and the flow of funds you are already a more mature company, you not only become attractive in the eyes of investors, but also able to fund the company withyour own money.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Belum lagi pengetahuan dan pembelajaran kamu selama menjalankan perusahaan kecil bisa menjadi modal bagus saat ingin mengembangkan bisnismu.\r\n\r\n&quot;&gt;Not to mention the knowledge and learning you for running a small company can be a good capital when you want to develop your business.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Beberapa orang menyebutnya bootstrapping, namun saya pikir kata itu belum mewakili sepenuhnya.&quot;&gt;Some people call bootstrapping, but I think the word was not yet fully represented. &lt;/span&gt;&lt;span title=&quot;Bagi saya, bootstrapping hanya bermakna mendanai perusahaan kamu secara mandiri.\r\n\r\n&quot;&gt;For me, the only meaningful bootstrapping your company funded independently.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Memulai bisnis berskala kecil berarti mendanai sebuah perusahaan, menentukan batasan dan patokan, memahami produk atau layanan kamu, serta apa yang ingin kamu raih dengan produk atau layanan tersebut dan menyusun rencana untuk mencapai target.\r\n\r\n&quot;&gt;Starting a small business means to fund a company, determine the limits and standards, understand the product or service you are and what you want to achieve with the product or service and plan to reach the target.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jika kamu melakukannya, kamu tak akan menjadi miliuner.&quot;&gt;If you do, you will not become a millionaire. &lt;/span&gt;&lt;span title=&quot;Namun kamu bisa menjadi jutawan yang bahagia.&quot;&gt;However, you can become a millionaire happy. &lt;/span&gt;&lt;span title=&quot;Dan bagi saya, itu adalah pilihan yang sangat bagus.\r\n\r\n\r\n&quot;&gt;And for me, it is a very nice option.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari TechInAsia Oleh Jon Westenberg&quot;&gt;Taken from TechInAsia By Jon Westenberg&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(9, 5, 1, 'Cowok Cuek Justru Tepat Jadi Pendampingmu', '&lt;p&gt;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu. Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu. Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek. Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...&lt;br /&gt;&lt;br /&gt;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu. Tapi. bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya. Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.&lt;br /&gt;&lt;br /&gt;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;. Tapi toh dia selalu ada saat benar-benar dibutuhkan.&lt;br /&gt;&lt;br /&gt;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya. Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja. Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini? Apa dia di sana memikirkan kamu?&lt;br /&gt;&lt;br /&gt;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam. Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu. Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu. Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.&lt;br /&gt;&lt;br /&gt;2. Cowok cuek jarang bertanya kabar. Percaya atau tidak, sikapnya ini justru membebaskan.&lt;br /&gt;&lt;br /&gt;Perihal dia menanyakan kabarmu juga jarang sekali. Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.&lt;br /&gt;&lt;br /&gt;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan. Karena percaya atau tidak, hal seperti ini justru terasa membebaskan. Gimana nggak bebas? Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu. Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa. Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.&lt;br /&gt;&lt;br /&gt;3. Dia punya cara unik untuk mengungkap rasa sayang. Walau jarang memberi bunga, dia gak suka melihatmu berduka.&lt;br /&gt;&lt;br /&gt;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;. Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga. Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.&lt;br /&gt;&lt;br /&gt;4. Kalian pun tak banyak pamer kemesraan. Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.&lt;br /&gt;&lt;br /&gt;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media. Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.&lt;br /&gt;&lt;br /&gt;Bukan, bukan karena dia malu dengan hubungan yang kalian punya. Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama. Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.&lt;br /&gt;&lt;br /&gt;5. Kadang malah kamu dikira tak punya pacar. Eh, itu artinya kamu mandiri! Bersamanya bisa, sendiri pun biasa saja.&lt;br /&gt;&lt;br /&gt;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri. Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu. Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu. Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.&lt;br /&gt;&lt;br /&gt;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.&lt;br /&gt;&lt;br /&gt;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele. Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik? Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.&lt;br /&gt;&lt;br /&gt;7. Ada saat tertentu dimana dia berusaha memanjakan. Nikmati saja; maklum, jarang-jarang!&lt;br /&gt;&lt;br /&gt;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi. Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu. Kamu ingin makan di tempat ini, dia langsung menurutinya. Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu. Pokoknya hari itu, kamu serasa jadi putri sehari.&lt;br /&gt;&lt;br /&gt;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya. Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe&lt;br /&gt;&lt;br /&gt;8. Tak perlu cemas dia tebar pesona sana-sini. Lihat saja sikapnya ke pacar sendiri!&lt;br /&gt;&lt;br /&gt;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem. Kamu nggak perlu cemas dia akan tebar pesona sana sini. Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.&lt;br /&gt;&lt;br /&gt;9. Dia memperjuangkanmu meski kamu tak selalu sadar. Sosoknya lebih suka mendoakanmu dalam diam.&lt;br /&gt;&lt;br /&gt;Kata siapa dia nggak berjuang untuk kamu? Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya. Dia itu sosok sederhana yang menjagamu cukup melalui doa. Karena, baginya doa itu lebih kuat dari apapun. Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.&lt;br /&gt;&lt;br /&gt;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya? Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya. Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mustika Karindra&lt;/p&gt;'),
(10, 5, 2, 'Cuek Guy Precisely Right So Best Man', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kamu selalu mendambakan seorang cowok yang bisa mencurahkan perhatian yang lebih ke dirimu.&quot;&gt;You have always wanted a guy who could devote more attention to yourself. &lt;/span&gt;&lt;span title=&quot;Sering juga kamu berangan-angan kalau kehadirannya mampu memenuhi hari-harimu.&quot;&gt;Often you daydream when attendance is able to fulfill your days. &lt;/span&gt;&lt;span title=&quot;Namun, kenyataannya nggak semua cowok bisa melakukan hal itu, terlebih kalau dia termaksud tipe-tipe yang cuek.&quot;&gt;However, in reality not all the boys can do it, especially when he referred types indifferent. &lt;/span&gt;&lt;span title=&quot;Saat mendengar kata cuek ini lah, bisa jadi yang terlintas dikepalamu, Jangan-jangan dia nggak bisa memperlakukanmu dengan sebaik-baiknya...\r\n\r\n&quot;&gt;When you hear the word ignorant is the one, it could be that comes to your head, Do not tell me he can not treat you with the best ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Eh, tunggu dulu, meski sifat cueknya akan membuat kamu sering sendiri sewatu-watu.&quot;&gt;Uh, wait, although the nature of cueknya will make you often own sewatu-watu. &lt;/span&gt;&lt;span title=&quot;Tapi.&quot;&gt;But. &lt;/span&gt;&lt;span title=&quot;bukan berarti dia nggak bisa membuatmu merasa spesial dan penting untuk hidupnya.&quot;&gt;that does not mean he can not make you feel special and important to his life. &lt;/span&gt;&lt;span title=&quot;Supaya kamu lebih yakin lagi kalau si cuek ini juga layak untuk kamu pilih sebagai pendamping hidupmu kelak, 9 alasan ini perlu kamu tahu sebelumnya.\r\n\r\n&quot;&gt;That ye be sure to mention if the cuek is also worth to you later choose as a life companion, 9 this reason you need to know in advance.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cowok cuek mungkin sering &amp;ldquo;menghilang&amp;rdquo;.&quot;&gt;1. Men may ignore often &quot;disappear&quot;. &lt;/span&gt;&lt;span title=&quot;Tapi toh dia selalu ada saat benar-benar dibutuhkan.\r\n\r\n&quot;&gt;But anyway he is always there when really needed.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ponselmu sudah hampir beberapa hari ini sepi tanpa kabarnya.&quot;&gt;PhoneSee was almost deserted several days without news. &lt;/span&gt;&lt;span title=&quot;Beberapa pesanmu seperti angin lalu yang terabaikan begitu saja.&quot;&gt;Some like the wind and your message is ignored. &lt;/span&gt;&lt;span title=&quot;Nggak bisa dipungkiri kamu pun sering bertanya-tanya dalam hati, Apa kabarnya dia hari ini?&quot;&gt;It can not be denied you would often wonder to myself, What is she today? &lt;/span&gt;&lt;span title=&quot;Apa dia di sana memikirkan kamu?\r\n\r\n&quot;&gt;Is he in there thinking about you?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Rindu sih, tapi kamu juga tahu dia menghilang bukan karena hal yang macam-macam.&quot;&gt;Homesick really, but you also know that he disappeared not because of all sorts. &lt;/span&gt;&lt;span title=&quot;Suatu waktu, saat kamu benar-benar membutuhkannya, toh dia pasti akan selalu ada untukmu.&quot;&gt;One time, when you really need it, yet he will always be there for you. &lt;/span&gt;&lt;span title=&quot;Tenang, dia di sana juga memikirkanmu, hanya saja kepercayaannya kepadamu yang tinggi membuat dia nggak terlalu khawatir terhadapmu.&quot;&gt;Quiet, she&#039;s there was also thinking about you, just trust you high makes her not to worry too much about you. &lt;/span&gt;&lt;span title=&quot;Terlebih, dia di sana pun yakin jika kamu sama sepertinya yang percaya sepenuhnya terhadap pasangan.\r\n\r\n&quot;&gt;Moreover, he was there too sure if you are just seemed that trust completely against the couple.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Cowok cuek jarang bertanya kabar.&quot;&gt;2. Men rarely ask news indifferent. &lt;/span&gt;&lt;span title=&quot;Percaya atau tidak, sikapnya ini justru membebaskan.\r\n\r\n&quot;&gt;Believe it or not, this attitude actually liberating.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Perihal dia menanyakan kabarmu juga jarang sekali.&quot;&gt;Subject him see how you too rarely. &lt;/span&gt;&lt;span title=&quot;Dalam seminggu kadang hanya sesekali dia bertanya tentang kesehatanmu, kabar kuliah atau pekerjaanmu, atau hal-hal lain yang kamu lalu sehari-hari saat dia tak bersamamu.\r\n\r\n&quot;&gt;Within a week sometimes only occasionally he asks about your health, news college or work, or other things that you and everyday when she was with you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Sudah lah, perihal kabar dari dia yang jarang datang nggak seharusnya kamu risaukan.&quot;&gt;Already lah, regarding news from him that rarely comes you should not worry about. &lt;/span&gt;&lt;span title=&quot;Karena percaya atau tidak, hal seperti ini justru terasa membebaskan.&quot;&gt;Because believe it or not, things like this just feels liberating. &lt;/span&gt;&lt;span title=&quot;Gimana nggak bebas?&quot;&gt;How not free? &lt;/span&gt;&lt;span title=&quot;Kalau kamu nggak perlu repot membalas pesan-pesannya setiap waktu.&quot;&gt;If you do not have to bother replying to the messages each time. &lt;/span&gt;&lt;span title=&quot;Nggak harus juga setiap saat mengabari akan pergi kemana, sama siapa, dan ada urusan apa.&quot;&gt;Not at any time should also update will go anywhere, with whom, and no matter what. &lt;/span&gt;&lt;span title=&quot;Ingat, keposesifan juga bukan hal yang baik untuk sebuah hubungan.\r\n\r\n&quot;&gt;Remember, keposesifan also not a good thing for a relationship.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Dia punya cara unik untuk mengungkap rasa sayang.&quot;&gt;3. He had a unique way to uncover affection. &lt;/span&gt;&lt;span title=&quot;Walau jarang memberi bunga, dia gak suka melihatmu berduka.\r\n\r\n&quot;&gt;Although rarely give flowers, he does not like to see you sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia jarang banget bilang, &amp;ldquo;aku sayang kamu&amp;rdquo;.&quot;&gt;He seldom really say, &quot;I love you&quot;. &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia berpikir, jika mengungkapkan rasa sayang itu ada banyak cara nggak selalu mengatakannya secara langsung atau memberikan cendramata seperti bunga.&quot;&gt;Cueknya nature makes him think, if the feeling of love that there are many ways do not always say it directly or give cendramata like flowers. &lt;/span&gt;&lt;span title=&quot;Tapi, satu yang pasti di dalam hatinya, dia nggak pernah suka melihatmu muram dan berduka.\r\n\r\n&quot;&gt;But one is for sure in his heart, he never like to see a grim and sad.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kalian pun tak banyak pamer kemesraan.&quot;&gt;4. You were not much show affection. &lt;/span&gt;&lt;span title=&quot;Dia tahu, cinta tak akan bertahan lebih lama hanya karena sering dipamerkan di dunia maya.\r\n\r\n&quot;&gt;He knew that love would not last much longer only because it is often exhibited in the virtual world.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Saat semua teman-temanmu pamer kemesraan bersama pasangannya di setiap sosial media.&quot;&gt;When all of your friends show affection with a partner in every social media. &lt;/span&gt;&lt;span title=&quot;Kamu dan dia sendiri justru jarang sekali melakukannya, malah bisa dibilang momen kalian menunjukan hubungan di dunia maya masih dapat dihitung dengan jari saja.\r\n\r\n&quot;&gt;You and he himself actually rarely do, even arguably moment you show the relationship in the virtual world can still be counted on the fingers alone.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Bukan, bukan karena dia malu dengan hubungan yang kalian punya.&quot;&gt;No, not because she was embarrassed by the relationship you have. &lt;/span&gt;&lt;span title=&quot;Dia cuma berpikir, kalau pamer hubungan di dunia maya itu bukan jaminan cinta yang akan bertahan lebih lama.&quot;&gt;He&#039;s just thinking, if showing off relationships in the virtual world is no guarantee of love that will last longer. &lt;/span&gt;&lt;span title=&quot;Buatnya cinta itu sederhana, tak perlu umbar sana sini, tapi cukup dirasakan oleh kamu dan dia.\r\n\r\n&quot;&gt;Her love is simple, no snapping here and there, but felt by you and him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kadang malah kamu dikira tak punya pacar.&quot;&gt;5. Sometimes even you do not have a boyfriend calculated. &lt;/span&gt;&lt;span title=&quot;Eh, itu artinya kamu mandiri!&quot;&gt;Eh, it means that you are independent! &lt;/span&gt;&lt;span title=&quot;Bersamanya bisa, sendiri pun biasa saja.\r\n\r\n&quot;&gt;With him can, itself was mediocre.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;An, kok kamu punya pacar, tapi kayak nggak punya pacar ya&amp;hellip; Soalnya, kamu sering banget kemana-mana sendiri.&quot;&gt;An, why you have a boyfriend, but do not have a girlfriend like ya ... You see, you often really go anywhere alone. &lt;/span&gt;&lt;span title=&quot;Eh, pendapat seperti itu emang nggak cuma keluar dari satu atau dua mulut temanmu.&quot;&gt;Uh, think like that weve not only out of the mouth of one or two friends. &lt;/span&gt;&lt;span title=&quot;Tapi, bukan berarti hal seperti ini akan menjadi beban dipikiranmu.&quot;&gt;But, that does not mean something like this would be a burden dipikiranmu. &lt;/span&gt;&lt;span title=&quot;Perlu kamu ingat, jarangnya kehadiran dia di sampingmu itu menjadi penanda, jika kamu cewek yang mandiri dan nggak selalu bergantung kepadanya.\r\n\r\n&quot;&gt;You need to remember, the rarity of her presence beside it a marker, if you girls are independent and not always depend on her.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Dan dengan sifat cueknya, kamu akan merasa spesial saat dia ingat detil-detil kecil tentang dirimu.\r\n\r\n&quot;&gt;6. And with cueknya nature, you will feel special when she remembers small details about you.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Dia memang cuek, tapi bukan berarti dia pelupa dengan hal-hal yang dianggap sepele.&quot;&gt;He was cool, but that does not mean he&#039;s forgetful with things that are considered trivial. &lt;/span&gt;&lt;span title=&quot;Saat kamu bercerita ini itu, resepon dia memang sekadarnya saja, tapi bagaimana kalau ternyata semua itu diingatnya dengan sangat baik?&quot;&gt;When you have told it, he was minimally resepon, but what if it turns out all that he remembered so well? &lt;/span&gt;&lt;span title=&quot;Bayangkan kalau dia ingat detil-detil kecil seperti kebiasaan makanmu, riwat sakitmu, atau ceritamu tentang kesulitan yang sempat kamu lalui.\r\n\r\n&quot;&gt;Imagine if he remembers small details such as eating habits, riwat your pain, or a story about the difficulties you had to go through.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Ada saat tertentu dimana dia berusaha memanjakan.&quot;&gt;7. There is a particular moment in which he tried to spoil. &lt;/span&gt;&lt;span title=&quot;Nikmati saja;&quot;&gt;Just enjoy it; &lt;/span&gt;&lt;span title=&quot;maklum, jarang-jarang!\r\n\r\n&quot;&gt;Feedback, rarely!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tiba-tiba dia mengajakmu ke sebuah daerah dipinggir kota yang sudah lama ingin kamu kunjungi.&quot;&gt;Suddenly he took you to a region that had long edge of town you want to visit. &lt;/span&gt;&lt;span title=&quot;Sampai di sana, dia juga mencurahkan segenap perhatiannya ke kamu.&quot;&gt;To get there, he also devote attention to you. &lt;/span&gt;&lt;span title=&quot;Kamu ingin makan di tempat ini, dia langsung menurutinya.&quot;&gt;You want to eat at this place, he immediately complied. &lt;/span&gt;&lt;span title=&quot;Kamu ingin membeli barang itu, dia pun tak segan membelikannya untukmu.&quot;&gt;You want to buy the stuff, he did not hesitate to buy it for you. &lt;/span&gt;&lt;span title=&quot;Pokoknya hari itu, kamu serasa jadi putri sehari.\r\n\r\n&quot;&gt;Anyway that day, you seemed to be princess day.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Udah nggak usah kaget lagi, dinikmatin aja semua perhatiannya.&quot;&gt;Already not be surprised anymore, dinikmatin wrote all his attention. &lt;/span&gt;&lt;span title=&quot;Mumpung ada, dan jarang-jarang juga kan&amp;hellip; hehehe\r\n\r\n&quot;&gt;While there, and rarely too right ... hehehe&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;8. Tak perlu cemas dia tebar pesona sana-sini.&quot;&gt;8. Do not worry her charisma and there. &lt;/span&gt;&lt;span title=&quot;Lihat saja sikapnya ke pacar sendiri!\r\n\r\n&quot;&gt;Look at his attitude to his own girlfriend!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kamu juga perlu tahu, keuntungan punya pasangan yang cuek itu nggak lain bisa buat hati kamu tenang dan adem ayem.&quot;&gt;You also need to know, the advantage of a couple who ignore the others can not make your heart calm and cool and calm. &lt;/span&gt;&lt;span title=&quot;Kamu nggak perlu cemas dia akan tebar pesona sana sini.&quot;&gt;You do not need to worry he would charisma here and there. &lt;/span&gt;&lt;span title=&quot;Alasannya juga bukan cuma karena kesibukannya yang cukup padat, tapi kamu lihat aja sikapnnya ke kamu sendiri ala kadarnya.\r\n\r\n&quot;&gt;The reason is not only because of his work is pretty solid, but you check it out for yourselves sikapnnya perfunctory.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;9. Dia memperjuangkanmu meski kamu tak selalu sadar.&quot;&gt;9. He memperjuangkanmu even if you were not always aware. &lt;/span&gt;&lt;span title=&quot;Sosoknya lebih suka mendoakanmu dalam diam.\r\n\r\n&quot;&gt;That figure is more like is praying in silence.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Kata siapa dia nggak berjuang untuk kamu?&quot;&gt;Who says he does not fight for you? &lt;/span&gt;&lt;span title=&quot;Sifat cueknya membuat dia nggak berlebihan untuk memperlihatkan perjuangannya.&quot;&gt;Cueknya nature makes him not an exaggeration to show cause. &lt;/span&gt;&lt;span title=&quot;Dia itu sosok sederhana yang menjagamu cukup melalui doa.&quot;&gt;He was a modest figure that take care simply through prayer. &lt;/span&gt;&lt;span title=&quot;Karena, baginya doa itu lebih kuat dari apapun.&quot;&gt;Because, her prayer is more powerful than anything. &lt;/span&gt;&lt;span title=&quot;Dia percaya Tuhan tak pernah tidur untuk mendengar doanya dan menjagamu dengan caraNya.\r\n\r\n&quot;&gt;He believes God never sleeps to hear his prayers and take care of one form or another.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Duh, masih belum yakin juga dengan semua ketulusannya yang tersembunyi di balik sifat cueknya?&quot;&gt;Duh, still not convinced with all sincerity that is hidden behind nature indifferently? &lt;/span&gt;&lt;span title=&quot;Dia cuek, tapi bukan berarti dia tidak bisa memperlakukanmu dengan sebaik-baiknya.&quot;&gt;He was cool, but that does not mean he can not treat you well. &lt;/span&gt;&lt;span title=&quot;Justru cara dia memperlakukanmu yang beda itu, membuat kamu tambah yakin kalau dia &amp;ldquo;the right person&amp;rdquo; yang kamu cari.\r\n\r\n\r\n&quot;&gt;It is precisely the way he treated you the difference it makes you more sure that she was &quot;the right person&quot; you are looking for.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mustika Karindra&quot;&gt;Taken from Hipwee By Mustika Karindra&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(11, 6, 1, 'Cewek Bergigi Gingsul Emang Layak Disayang', '&lt;p&gt;Pernah lihat cewek bergigi gingsul senyum nggak? Manis ya. Entah kenapa senyum cewek bergigi gingsul itu enak dilihat. Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang. Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik. Tunggu deh, btw maloklusi gigi itu apa ya artinya?&lt;br /&gt;&lt;br /&gt;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar. Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis. Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul. Mau tahu alasannya kenapa? Baca ya..&lt;br /&gt;&lt;br /&gt;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.&lt;br /&gt;&lt;br /&gt;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis. Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya. Senyumnya yang aduhai membuatmu enggan untuk berpaling.&lt;br /&gt;&lt;br /&gt;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda. Mereka terlihat lebih menarik.&lt;br /&gt;&lt;br /&gt;Cewek bergigi gingsul itu punya kecantikan yang beda lho. Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik. Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka. Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya. Diam-diam kamu suka mengambil fotonya saat senyum.&lt;br /&gt;&lt;br /&gt;3. Cewek bergigi gingsul adalah pribadi yang percaya diri. Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.&lt;br /&gt;&lt;br /&gt;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka. Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka. Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan. Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.&lt;br /&gt;&lt;br /&gt;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute. Imut banget.&lt;br /&gt;&lt;br /&gt;Gigi gingsulnya bikin wajah dia terlihat cute. Setuju nggak? via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute. Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka. Cute yang bikin gemes deh&amp;hellip;&lt;br /&gt;&lt;br /&gt;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris. Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.&lt;br /&gt;&lt;br /&gt;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris. Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh. Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas. Asyik kan punya pacar yang selow bin humoris?&lt;br /&gt;&lt;br /&gt;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia. Duh, ngangenin banget itu senyumnya&lt;br /&gt;&lt;br /&gt;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia. Sehari nggak lihat dia aja udah bikin kamu kangen. Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum. Tuh, kan, punya cewek bergigi gingsul itu ngangenin!&lt;br /&gt;&lt;br /&gt;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka. Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan. Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri. So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Neneng Pratiwi&lt;/p&gt;'),
(12, 6, 2, 'Toothed Chick Gingsul Weve Worth Dear', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Pernah lihat cewek bergigi gingsul senyum nggak?&quot;&gt;Ever see a girl toothed smile gingsul not? &lt;/span&gt;&lt;span title=&quot;Manis ya.&quot;&gt;Sweet yes. &lt;/span&gt;&lt;span title=&quot;Entah kenapa senyum cewek bergigi gingsul itu enak dilihat.&quot;&gt;Somehow the girl toothed smile gingsul it unsightly. &lt;/span&gt;&lt;span title=&quot;Mereka punya kecantikan yang khas dan bikin orang tak bosan untuk memandang.&quot;&gt;They have a distinctive beauty and make people never tire of looking at. &lt;/span&gt;&lt;span title=&quot;Kemunculan satu gigi yang sebenarnya termasuk maloklusi gigi tersebut justru malah bikin seorang cewek makin menarik.&quot;&gt;The emergence of a real gear including dental malocclusion is actually even make a girl more attractive. &lt;/span&gt;&lt;span title=&quot;Tunggu deh, btw maloklusi gigi itu apa ya artinya?\r\n\r\n&quot;&gt;Wait for me, btw dental malocclusion was what yes means?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Maloklusi adalah suatu kondisi ketika gigi tidak tumbuh di tempat yang benar dan sejajar.&quot;&gt;Malocclusion is a condition when the teeth do not grow in the correct place and aligned. &lt;/span&gt;&lt;span title=&quot;Wah, berarti beruntunglah kamu cewek bergigi gingsul karena kondisi gigi yang tidak sejajar justru malah bikin senyummu makin manis.&quot;&gt;Well, it means you are lucky toothed girl gingsul for dental conditions that are not aligned precisely even make your smile more sweet. &lt;/span&gt;&lt;span title=&quot;Tapi, lebih beruntung lagi kamu para cowok yang memiliki cewek bergigi gingsul.&quot;&gt;But, more fortunate you are the guy who has a toothed girl gingsul. &lt;/span&gt;&lt;span title=&quot;Mau tahu alasannya kenapa?&quot;&gt;Want to know the reason why? &lt;/span&gt;&lt;span title=&quot;Baca ya..\r\n\r\n&quot;&gt;Read ya ..&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Cewek bergigi gingsul punya senyum yang manis, jadi bikin kamu betah untuk memandang wajahnya.\r\n\r\n&quot;&gt;1. gingsul toothed girl has a nice smile, so it makes you feel at home to look at his face.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tumbuhnya satu gigi yang tidak sejajar dengan gigi lainnya justru bikin cewek bergigi gingsul punya senyum yang manis.&quot;&gt;The growth of the tooth that is not aligned with the other teeth actually make gingsul toothed girl has a nice smile. &lt;/span&gt;&lt;span title=&quot;Gigi gingsul tersebut nggak mengganggu tapi malah bikin kamu betah untuk memandang wajahnya.&quot;&gt;The gingsul teeth do not interfere but instead make you feel at home to look at his face. &lt;/span&gt;&lt;span title=&quot;Senyumnya yang aduhai membuatmu enggan untuk berpaling.\r\n\r\n&quot;&gt;How sad smile makes you reluctant to turn.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Adanya satu gigi yang tumbuh di atas gigi lainnya justru bikin cewek bergigi gingsul punya kecantikan yang berbeda.&quot;&gt;2. The presence of the teeth, which grow on other teeth actually make gingsul toothed girl had a different beauty. &lt;/span&gt;&lt;span title=&quot;Mereka terlihat lebih menarik.\r\n\r\n&quot;&gt;They look more attractive.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Cewek bergigi gingsul itu punya kecantikan yang beda lho.&quot;&gt;Chick toothed gingsul it has a beauty that is different you know. &lt;/span&gt;&lt;span title=&quot;Bisa dibilang gigi gingsulnya malah bikin mereka telihat menarik.&quot;&gt;Gingsulnya gear arguably even make them aesthetically appealing. &lt;/span&gt;&lt;span title=&quot;Gigi yang termasuk maloklusi itu justru jadi daya tariknya mereka.&quot;&gt;Teeth are included malocclusion that just so they appeal. &lt;/span&gt;&lt;span title=&quot;Karena kecantikannya yang beda itu membuatmu jadi gatel, bawaannya ingin selalu mengabadikan senyumnya.&quot;&gt;Because beauty is different that makes you gatel, luggage always wanted to immortalize her smile. &lt;/span&gt;&lt;span title=&quot;Diam-diam kamu suka mengambil fotonya saat senyum.\r\n\r\n&quot;&gt;Secretly you love to take a picture when a smile.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Cewek bergigi gingsul adalah pribadi yang percaya diri.&quot;&gt;3. Women toothed gingsul is personal confidence. &lt;/span&gt;&lt;span title=&quot;Karena mereka memilih nggak pakai behel untuk memperbaiki posisi gigi.\r\n\r\n&quot;&gt;Because they chose not wearing braces to correct the position of teeth.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Banyak dari cewek bergigi gingsul yang sengaja membiarkan gingsul mereka.&quot;&gt;Many of the girls who accidentally lets toothed gingsul gingsul them. &lt;/span&gt;&lt;span title=&quot;Ketimbang pakai behel untuk memperbaiki posisi gigi yang tidak sejajar, mereka lebih memilih untuk mempertahankan gigi gingsul mereka.&quot;&gt;Rather than wear braces to correct the position of teeth that are misaligned, they prefer to maintain their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Mereka yakin bahwa gigi gingsul bisa dikatakan sebagai sebuah kelebihan dan anugerah yang diberikan oleh Tuhan.&quot;&gt;They believe that gingsul teeth can be regarded as an excess and grace granted by God. &lt;/span&gt;&lt;span title=&quot;Hal tersebut menunjukkan bahwa mereka adalah pribadi yang percaya diri dan mensyukuri apa yang sudah diberikan oleh Tuhan.\r\n\r\n&quot;&gt;It shows that they are personally confident and grateful for what has been given by God.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Kamu pasti setuju kalau cewek bergigi gingsul itu cute.&quot;&gt;4. You would agree that gingsul toothed girl was cute. &lt;/span&gt;&lt;span title=&quot;Imut banget.\r\n\r\n&quot;&gt;So cute.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gigi gingsulnya bikin wajah dia terlihat cute.&quot;&gt;Dental gingsulnya face make her look cute. &lt;/span&gt;&lt;span title=&quot;Setuju nggak?&quot;&gt;Agree not? &lt;/span&gt;&lt;span title=&quot;via tidurdotcom.wordpress.com\r\n\r\n&quot;&gt;via tidurdotcom.wordpress.com&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Entah kenapa cewek yang bergigi gingsul itu terlihat lebih cute.&quot;&gt;Somehow the girl toothed gingsul it looks more cute. &lt;/span&gt;&lt;span title=&quot;Kamu pasti setuju kalau wajah mereka jadi lebih imut dengan gigi gingsul mereka.&quot;&gt;You would agree that their faces become more cute with their gingsul teeth. &lt;/span&gt;&lt;span title=&quot;Cute yang bikin gemes deh&amp;hellip;\r\n\r\n&quot;&gt;Cute that I gemes deh ...&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga selow dan humoris.&quot;&gt;5. Not only has a sweet smile aja, toothed girl gingsul also selow and humorous. &lt;/span&gt;&lt;span title=&quot;Biar kata sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka santai aja.\r\n\r\n&quot;&gt;Let the word often dibecandain &#039;rice nyempil in the teeth&#039;, they relaxed wrote.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nggak cuma punya senyum yang manis aja, cewek bergigi gingsul juga bisa dibilang selow dan humoris.&quot;&gt;Not only has a sweet smile aja, toothed girl gingsul also arguably selow and humorous. &lt;/span&gt;&lt;span title=&quot;Walaupun sering dibecandain &amp;lsquo;nasi yang nyempil di gigi&amp;rsquo;, mereka selow aja tuh.&quot;&gt;Although often dibecandain &#039;rice nyempil in the teeth&#039;, they selow aja tuh. &lt;/span&gt;&lt;span title=&quot;Alih-alih ngambek karena gingsulnya sering diledekin, mereka justru menanggapinya dengan tawa lepas.&quot;&gt;Instead of sulking because gingsulnya often diledekin, they would respond by laughter off. &lt;/span&gt;&lt;span title=&quot;Asyik kan punya pacar yang selow bin humoris?\r\n\r\n&quot;&gt;Not it be nice to have a boyfriend selow bin humorous?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Kecantikannya yang beda bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;6. different beauty can make you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Duh, ngangenin banget itu senyumnya\r\n\r\n&quot;&gt;Duh, it&#039;s really ngangenin smile&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Senyum yang manis, wajah yang menarik sekaligus cute, bikin kamu nggak mau jauh-jauh dari dia.&quot;&gt;Sweet smile, face interesting and cute, makes you not want to stay away from him. &lt;/span&gt;&lt;span title=&quot;Sehari nggak lihat dia aja udah bikin kamu kangen.&quot;&gt;The day did not see him just&#039;ve made you miss. &lt;/span&gt;&lt;span title=&quot;Sekalinya berjauhan sama dia, sebentar-bentar kamu mandangin fotonya yang lagi tersenyum.&quot;&gt;Once apart at him, for a few moments you Mandangin photographs are again smiling. &lt;/span&gt;&lt;span title=&quot;Tuh, kan, punya cewek bergigi gingsul itu ngangenin!\r\n\r\n&quot;&gt;There, right, got it ngangenin gingsul toothed girl!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Hal yang patut diacungi jempol dari seorang cewek bergigi gingsul adalah kepercayaan diri mereka.&quot;&gt;It is admirable of gingsul toothed girl is their confidence. &lt;/span&gt;&lt;span title=&quot;Ketimbang minder dengan satu gigi yang posisinya tidak sejajar, mereka justru mensyukurinya sebagi suatu kelebihan dan anugerah dari Tuhan.&quot;&gt;Rather than minder with one tooth position is not parallel, they are grateful as a sign of excess and grace of God. &lt;/span&gt;&lt;span title=&quot;Beruntunglah kamu yang punya cewek bergigi gingsul karena selain punya senyum yang manis dan wajah yang menarik, dia juga humoris dan percaya diri.&quot;&gt;Fortunately you have a girl toothed gingsul because in addition has a nice smile and attractive face, he also humorous and confident. &lt;/span&gt;&lt;span title=&quot;So, kamu yang bergigi gingsul, coba mana senyumnya&amp;hellip; :) Aduhai, manisnya.\r\n\r\n\r\n&quot;&gt;So, you are toothed gingsul, which tried to smile ...:) Ah, sweet.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Neneng Pratiwi&quot;&gt;Taken from Hipwee By Neng Pratiwi&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;');
INSERT INTO `post_description` (`id_post_description`, `id_post`, `id_language`, `title`, `content`) VALUES
(13, 7, 1, 'Ingin Sukses Terapkan 7 Tips Sukses Oprah Winfrey', '&lt;p&gt;Kenal dengan Oprah Winfrey? Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu. Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal. Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya. Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.&lt;br /&gt;&lt;br /&gt;Nah, untuk kita anak muda. Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?&lt;br /&gt;&lt;br /&gt;1. Fokuslah pada tempatmu, bukan tempat orang lain&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi. Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita. Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).&lt;br /&gt;&lt;br /&gt;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain. &lt;br /&gt;&lt;br /&gt;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!&lt;br /&gt;&lt;br /&gt;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya tidak percaya akan kegagalan. Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan. Jika anda gagal, cobalah lakukan lagi. Lakukan lebih baik pada percobaan kedua. Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko. Ini adalah saatnya. Ambil kesempatan ini dan lakukan!&amp;rdquo;&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Mulai saat ini jangan pernah takut gagal! Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan. Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.&lt;br /&gt;&lt;br /&gt;3. Rasa takut itu ada karena kamu membiarkannya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa. Dia di kos sendirian dan ada kecoa gede nongol di sampingnya. Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam). &lt;br /&gt;&lt;br /&gt;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya. Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya. Dengan apa? Sapu? Pedang? Bukan! Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu. Misal, kamu takut ketinggian. Coba main flying fox. Kamu takut kecoa, coba main sama kecoa. Beres, kan?&lt;br /&gt;&lt;br /&gt;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Buatlah aturan untuk dirimu sendiri. Jangan menunggu perintah dan aturan orang lain. Kenapa? Karena manusia cenderung untuk segan pada orang yang membuat perintah. Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri. Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.&lt;br /&gt;&lt;br /&gt;5. Kamu akan memanen apa yang kamu tanam&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Nah, di sini hukum alam berlaku. Jika kamu menanam pisang, yang kamu panen pasti pisang. Bukan mangga. Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik. &lt;br /&gt;&lt;br /&gt;Ngerti, nggak? Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh. Daripada urusannya panjang.&lt;br /&gt;&lt;br /&gt;6. Lupakan masa lalu! Karena kamu hidup di masa sekarang, bukan masa lalumu itu&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&lt;br /&gt;&lt;br /&gt;Buat apa mengingat masa lalu? Kalau masa lalu itu hanya berisi hal-hal negatif? Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif. Yang hanya membuat semangat hidup kita turun. Misalnya, mantan. Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit? Gunanya apa, gitu? Mending fokus pada masa depanmu. Pada cewek atau cowok yang mungkin sekarang sedang menunggu. Fokus buat menjemputnya. Fokus untuk menjemput mimpimu!&lt;br /&gt;&lt;br /&gt;7. Tuhan itu penulis skenario. Kamu adalah pemegang kendalinya&lt;br /&gt;&lt;br /&gt;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;&lt;br /&gt;&lt;br /&gt;Tuhan itu yang menciptakan manusia dan menulis takdirnya. Tapi, kita bisa mengubah takdir dengan berusaha. Karena sebenarnya kita punya kendali. Kita adalah sopirnya. Kita memegang setir mobilnya. Jadi, gak usah takut! Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.&lt;br /&gt;&lt;br /&gt;Gimana? Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah? Atau mungkin makin bingung? (Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya). Oh ya, selain ketujuh tips itu. Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle. Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes). Kalau nggak ada, kamu bisa beli lewat online. Ini bukan promosi loh, ya. Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Hipwee Oleh Mitha Tiara&lt;/p&gt;'),
(14, 7, 2, 'Want to success Apply 7 Tips for Success Oprah Winfrey', '&lt;p&gt;&lt;span id=&quot;result_box&quot; class=&quot;&quot; lang=&quot;en&quot;&gt;&lt;span title=&quot;Kenal dengan Oprah Winfrey?&quot;&gt;Familiar with Oprah Winfrey? &lt;/span&gt;&lt;span title=&quot;Jika kamu nggak kenal (ya kenalan, dong), maka mulai sekarang perbanyaklah mencari tahu tentang sosok wanita berkulit hitam itu.&quot;&gt;If you do not know (yes acquaintances, dong), then start now perbanyaklah find out about the figure of the black woman. &lt;/span&gt;&lt;span title=&quot;Sosoknya yang begitu dermawan, baik hati, membuatnya semakin terkenal.&quot;&gt;His features were so generous, kind, makes it even more famous. &lt;/span&gt;&lt;span title=&quot;Dia adalah sosok yang rendah hati di balik semua kekayaan yang dimilikinya.&quot;&gt;He is a humble figure behind all assets held. &lt;/span&gt;&lt;span title=&quot;Bahkan, Oprah sering memberikan motivasi-motivasi luar biasa agar orang lain mampu menjadi sukses seperti dirinya.\r\n\r\n&quot;&gt;In fact, Oprah often provide outstanding motivations so that others are able to become successful like him.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, untuk kita anak muda.&quot;&gt;Well, for our young people. &lt;/span&gt;&lt;span title=&quot;Tips sukses dari Oprah sangat wajib kamu tahu, karena tidak ada salahnya kan belajar dari kesuksesan orang lain?\r\n\r\n&quot;&gt;Successful Tips from Oprah highly obliged you know, because there is no harm in it to learn from the success of others?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;1. Fokuslah pada tempatmu, bukan tempat orang lain\r\n\r\n&quot;&gt;1. Focus on where you are, not where others&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Bersyukurlah atas segala hal yang anda miliki, dan anda akan memiliki lebih banyak lagi.&quot;&gt;&quot;Be grateful for everything you have, and you&#039;ll have some more. &lt;/span&gt;&lt;span title=&quot;Jika anda berkonsentrasi pada apa yang tidak anda miliki, anda tidak akan pernah berkecukupan.&amp;rdquo;\r\n\r\n&quot;&gt;If you concentrate on what you do not have, you will never have enough. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus fokus pada apa yang ada pada diri kita, pada bakat, kemampuan, dan apapun yang kita miliki, serta pada impian kita.&quot;&gt;Here Oprah wanted to say that we should focus on what is in us, the talent, ability, and whatever we have, as well as in our dreams. &lt;/span&gt;&lt;span title=&quot;Jika kita mampu fokus pada hal-hal utama tersebut, maka sistem SAR atau Sistem Aktivasi Retikular dalam pikiran manusia akan membantu mencari bukti (dalam hal ini bukti pemikiran yang ditunjukkan dengan pencarian solusi).\r\n\r\n&quot;&gt;If we are able to focus on the main things, then the system SAR or the reticular activating system in the human mind will help find evidence (in this case the evidence of thought indicated by the search for solutions).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dengan bersyukur kita akan lebih fokus pada apa yang ada dalam diri kita dan hal itu justru yang membuat kita lebih menghargai diri sendiri bahkan orang lain.\r\n\r\n&quot;&gt;Now, with grateful we are more focused on what is inside of us and it just makes us appreciate ourselves or others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Jadi mulai sekarang, coba fokus pada dirimu dan impianmu!\r\n\r\n&quot;&gt;So from now on, try to focus on yourself and your dreams!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;2. Pahami hakikat kegagalan dan sadari bahwa kegagalan itu sebenarnya ingin bersikap baik padamu\r\n\r\n&quot;&gt;2. Understand the nature of the failure and the failure to realize that actually want to be nice to you&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya tidak percaya akan kegagalan.&quot;&gt;&quot;I do not believe in failure. &lt;/span&gt;&lt;span title=&quot;Bukanlah kegagalan jika anda menikmati prosesnya.&amp;rdquo;\r\n\r\n&quot;&gt;Not a failure if you enjoy the process. &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Lakukan satu hal yang menurut anda tidak bisa anda lakukan.&quot;&gt;&quot;Do one thing that you think you can not do. &lt;/span&gt;&lt;span title=&quot;Jika anda gagal, cobalah lakukan lagi.&quot;&gt;If you fail, try again. &lt;/span&gt;&lt;span title=&quot;Lakukan lebih baik pada percobaan kedua.&quot;&gt;Do better in the second experiment. &lt;/span&gt;&lt;span title=&quot;Orang yang tidak pernah terjatuh adalah orang yang tidak pernah mengambil risiko.&quot;&gt;People who have never fallen are those who never take risks. &lt;/span&gt;&lt;span title=&quot;Ini adalah saatnya.&quot;&gt;It is time. &lt;/span&gt;&lt;span title=&quot;Ambil kesempatan ini dan lakukan!&amp;rdquo;\r\n\r\n&quot;&gt;Take this opportunity and do! &quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Saya percaya salah satu risiko terbesar dalam kehidupan adalah tidak adanya keberanian untuk mengambil risiko.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;I believe one of the biggest risk in life is not the courage to take risks.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Mulai saat ini jangan pernah takut gagal!&quot;&gt;From this moment never afraid to fail! &lt;/span&gt;&lt;span title=&quot;Nikmati aja prosesnya, karena tiap proses itu pasti ada pelajaran baru yang kamu dapatkan.&quot;&gt;Enjoy aja process, as each process it must be a new lesson that you get. &lt;/span&gt;&lt;span title=&quot;Dan pelajaran itulah yang jadi modal terbesarmu untuk meraih kesuksesan.\r\n\r\n&quot;&gt;And the lesson so that&#039;s what your biggest capital to achieve success.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;3. Rasa takut itu ada karena kamu membiarkannya\r\n\r\n&quot;&gt;3. Fear is there because you let&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Apapun yang anda takuti sebenarnya tidak memiliki kuasa atas anda &amp;ndash; rasa takutlah yang menguasai diri anda.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Whatever you fear actually has no power over you - fear that control of yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Untuk kasus ini kita misalkan saja ada seorang cewek takut kecoa.&quot;&gt;For this case we suppose there was a girl afraid of cockroaches. &lt;/span&gt;&lt;span title=&quot;Dia di kos sendirian dan ada kecoa gede nongol di sampingnya.&quot;&gt;He was at boarding alone and there was a big cockroach appeared beside him. &lt;/span&gt;&lt;span title=&quot;Mau gak mau dia harus bunuh kecoa itu walaupun dia takut, lha wong memang di kosnya lagi gak ada siapa-siapa (ceritanya temen-temennya pada pulkam).\r\n\r\n&quot;&gt;Would not want him should kill a cockroach that even though he was afraid, lha wong is in his rented again there is not anybody (the story friend&#039;s apartment on pulkam).&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, dari perumpamaan itu kita bisa tahu bahwa rasa takut itu ada karena kita yang memikirkannya.&quot;&gt;Well, from the parable that we can know that fear is there because we were thinking about it. &lt;/span&gt;&lt;span title=&quot;Jadi, kalau kita mau membunuh rasa takut itu ya hanya dengan satu cara, yaitu melawannya.&quot;&gt;So, if we want to kill the fear was so in only one way, namely to fight it. &lt;/span&gt;&lt;span title=&quot;Dengan apa?&quot;&gt;With what? &lt;/span&gt;&lt;span title=&quot;Sapu?&quot;&gt;Broom? &lt;/span&gt;&lt;span title=&quot;Pedang?&quot;&gt;Sword? &lt;/span&gt;&lt;span title=&quot;Bukan!&quot;&gt;Not! &lt;/span&gt;&lt;span title=&quot;Perangi rasa takutmu itu dengan melakukan hal yang kamu takuti itu.&quot;&gt;Fight your fear that by doing things that you fear. &lt;/span&gt;&lt;span title=&quot;Misal, kamu takut ketinggian.&quot;&gt;For example, you are afraid of heights. &lt;/span&gt;&lt;span title=&quot;Coba main flying fox.&quot;&gt;Try playing the flying fox. &lt;/span&gt;&lt;span title=&quot;Kamu takut kecoa, coba main sama kecoa.&quot;&gt;You&#039;re afraid of cockroaches, try to play with a cockroach. &lt;/span&gt;&lt;span title=&quot;Beres, kan?\r\n\r\n&quot;&gt;Beres, right?&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;4. Berbuatlah hal yang benar, walaupun tidak ada orang lain yang melihatnya\r\n\r\n&quot;&gt;4. Do your right thing, even if nobody else sees&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Inti dari integritas adalah melakukan hal yang benar, terlepas dari apakah orang lain mengetahui anda melakukannya atau tidak.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;The essence of integrity is doing the right thing, regardless of whether others know you do it or not.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buatlah aturan untuk dirimu sendiri.&quot;&gt;Make a rule for yourself. &lt;/span&gt;&lt;span title=&quot;Jangan menunggu perintah dan aturan orang lain.&quot;&gt;Do not wait for orders and rules of others. &lt;/span&gt;&lt;span title=&quot;Kenapa?&quot;&gt;Why? &lt;/span&gt;&lt;span title=&quot;Karena manusia cenderung untuk segan pada orang yang membuat perintah.&quot;&gt;Because humans tend to shy at the person who made the order. &lt;/span&gt;&lt;span title=&quot;Jika kita membuat aturan untuk diri sendiri, maka kita menyegani diri kita sendiri.&quot;&gt;If we make a rule for yourself, then we respect ourselves. &lt;/span&gt;&lt;span title=&quot;Karena hal baik itu harusnya dilakukan untuk diri sendiri dulu, baru untuk orang lain.\r\n\r\n&quot;&gt;Because of the good things that should be done to yourself first, then to others.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;5. Kamu akan memanen apa yang kamu tanam\r\n\r\n&quot;&gt;5. You will reap what you plant&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Satu hal yang saya yakini adalah apa yang anda berikan akan kembali pada diri anda sendiri.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;One thing I believe is what you give will come back to yourself.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Nah, di sini hukum alam berlaku.&quot;&gt;Well, here the laws of nature apply. &lt;/span&gt;&lt;span title=&quot;Jika kamu menanam pisang, yang kamu panen pasti pisang.&quot;&gt;If you cultivate banana, banana sure that you harvest. &lt;/span&gt;&lt;span title=&quot;Bukan mangga.&quot;&gt;Not mango. &lt;/span&gt;&lt;span title=&quot;Kalau kamu berbuat baik, ya pasti kamu dapetnya juga yang baik.\r\n\r\n&quot;&gt;If you do good, you definitely yes dapetnya also good.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Ngerti, nggak?&quot;&gt;You know, no? &lt;/span&gt;&lt;span title=&quot;Kalau nggak ngerti tanyain ke penulisnya secara pribadi aja, deh.&quot;&gt;If you do not understand tanyain to the author personally aja, deh. &lt;/span&gt;&lt;span title=&quot;Daripada urusannya panjang.\r\n\r\n&quot;&gt;Instead of a long affair.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;6. Lupakan masa lalu!&quot;&gt;6. Forget the past! &lt;/span&gt;&lt;span title=&quot;Karena kamu hidup di masa sekarang, bukan masa lalumu itu\r\n\r\n&quot;&gt;Because you live in the present, not your past that&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Ambil nafas, lepaskan, dan ingatkan diri anda bahwa saat ini merupakan waktu yang anda miliki dengan pasti.&quot;&gt;&quot;Take a breath, release, and remind yourself that now is the time you have for sure.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Buat apa mengingat masa lalu?&quot;&gt;Why recall the past? &lt;/span&gt;&lt;span title=&quot;Kalau masa lalu itu hanya berisi hal-hal negatif?&quot;&gt;If the past it was only contain negative things? &lt;/span&gt;&lt;span title=&quot;Di sini Oprah ingin mengatakan bahwa kita harus melupakan masa lalu yang negatif.&quot;&gt;Here Oprah wanted to say that we should forget the past are negative. &lt;/span&gt;&lt;span title=&quot;Yang hanya membuat semangat hidup kita turun.&quot;&gt;Which only makes the spirit of our lives down. &lt;/span&gt;&lt;span title=&quot;Misalnya, mantan.&quot;&gt;For example, ex. &lt;/span&gt;&lt;span title=&quot;Ngapain coba kamu mengingat mantan kalau hanya akan mengembalikanmu pada rasa sakit?&quot;&gt;Why should you try to remember that the former will only put you back on the pain? &lt;/span&gt;&lt;span title=&quot;Gunanya apa, gitu?&quot;&gt;What point, right? &lt;/span&gt;&lt;span title=&quot;Mending fokus pada masa depanmu.&quot;&gt;Mending focus on your future. &lt;/span&gt;&lt;span title=&quot;Pada cewek atau cowok yang mungkin sekarang sedang menunggu.&quot;&gt;On a girl or a boy who might now pending. &lt;/span&gt;&lt;span title=&quot;Fokus buat menjemputnya.&quot;&gt;Focus for picking her up. &lt;/span&gt;&lt;span title=&quot;Fokus untuk menjemput mimpimu!\r\n\r\n&quot;&gt;Focus to pick your dream!&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;7. Tuhan itu penulis skenario.&quot;&gt;7. God is the screenwriter. &lt;/span&gt;&lt;span title=&quot;Kamu adalah pemegang kendalinya\r\n\r\n&quot;&gt;You are a holder of control&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;&amp;ldquo;Setiap dari kita bertanggung jawab atas kehidupan kita sendiri &amp;ndash; bukan orang lain.&amp;rdquo;\r\n\r\n&quot;&gt;&quot;Each of us is responsible for our own lives - not anyone else.&quot;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Tuhan itu yang menciptakan manusia dan menulis takdirnya.&quot;&gt;God that created man and wrote his destiny. &lt;/span&gt;&lt;span title=&quot;Tapi, kita bisa mengubah takdir dengan berusaha.&quot;&gt;But, we can change destiny by trying. &lt;/span&gt;&lt;span title=&quot;Karena sebenarnya kita punya kendali.&quot;&gt;Because actually we have no control. &lt;/span&gt;&lt;span title=&quot;Kita adalah sopirnya.&quot;&gt;We are the driver. &lt;/span&gt;&lt;span title=&quot;Kita memegang setir mobilnya.&quot;&gt;We are holding the steering wheel. &lt;/span&gt;&lt;span title=&quot;Jadi, gak usah takut!&quot;&gt;So, do not be afraid! &lt;/span&gt;&lt;span title=&quot;Karena ini kehidupanmu dan kamu yang paling paham dengan apa yang kamu mau, bukan orang lain.\r\n\r\n&quot;&gt;Because this is your life and you are most familiar with what you want, not someone else.&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Gimana?&quot;&gt;How? &lt;/span&gt;&lt;span title=&quot;Udah mulai ngerti dengan cara pandang kesuksesan seorang Oprah?&quot;&gt;Already started to understand the perspective of success of Oprah? &lt;/span&gt;&lt;span title=&quot;Atau mungkin makin bingung?&quot;&gt;Or maybe even more confused? &lt;/span&gt;&lt;span title=&quot;(Kan tadi udah dibilang, kalau masih bingung nanya langsung ke penulisnya).&quot;&gt;(Kan was already spelled out, if still confused nanya directly to the author). &lt;/span&gt;&lt;span title=&quot;Oh ya, selain ketujuh tips itu.&quot;&gt;Oh yes, in addition to the seven tips that. &lt;/span&gt;&lt;span title=&quot;Oprah menyarankan untuk membaca salah satu buku yang berjudul &amp;rdquo;The New World&amp;rdquo; (&amp;ldquo;Dunia yang Baru&amp;rdquo;) karangan Eckhart Tolle.&quot;&gt;Oprah advised to read one book called &quot;The New World&quot; ( &quot;New World&quot;) written by Eckhart Tolle. &lt;/span&gt;&lt;span title=&quot;Kamu bisa dapatkan buku ini di toko-toko buku (bukan apotek atau toko bangunan, gaes).&quot;&gt;You can get this book in bookstores (not a pharmacy or hardware store, gaes). &lt;/span&gt;&lt;span title=&quot;Kalau nggak ada, kamu bisa beli lewat online.&quot;&gt;If no, you can purchase through online. &lt;/span&gt;&lt;span title=&quot;Ini bukan promosi loh, ya.&quot;&gt;This is not a promotion tablets, yes. &lt;/span&gt;&lt;span title=&quot;Cuma mau kasih tau aja buat kalian yang emang hidupnya lagi galau dan pengen hidup bahagia lahir batin.\r\n\r\n\r\n&quot;&gt;Just wanna love you guys know that weve wrote for his life again upset and want to live a happy life physically and mentally.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;&lt;/span&gt;&lt;span title=&quot;Diambil dari Hipwee Oleh Mitha Tiara&quot;&gt;Taken from Hipwee By Mitha Tiara&lt;/span&gt;&lt;/span&gt;&lt;/p&gt;'),
(15, 8, 1, '7 Ide Beri Edukasi Keuangan Kepada Anak', '&lt;p&gt;Orangtua merupakan sosok utama yang dapat mengenalkan edukasi keuangan kepada anak.&lt;br /&gt;&lt;br /&gt;Cara ini dilakukan agar ketika anak mulai beranjak dewasa, ia akan bisa membuat keputusan yang baik mengenai keuangan.&lt;br /&gt;&lt;br /&gt;Bila dilihat dari segi waktu yang tepat dalam mengedukasi anak adalah ketika anak sudah masuk usia Sekolah dasar atau SD.&lt;br /&gt;&lt;br /&gt;Sebab di usia tersebut anak akan belajar matematika dasar seperti penambahan dan pengurangan angka yang dapat dilatih dan diterapkan dalam keseharian dengan cara menabung.&lt;br /&gt;&lt;br /&gt;Apabila di sekolahnya diajarkan menabung dengan dibuatkan buku tabungan, maka tugasnya orang tua hanya mengontrol saja agar pengeluarannya dari uang saku tetap ada, namun menabungnya pun juga tetap ada.&lt;br /&gt;&lt;br /&gt;Tentu sebagai orang tua tidak dapat mengandalkan sepenuhnya dalam pengajaran pendidikan khususnya untuk mendidik anak tentang keuangan sejak kecil.&lt;br /&gt;&lt;br /&gt;Oleh karena itu orang tua juga dapat mengajarkan pada anak usia dini untuk dapat mengelola keuangan yang dimiliki anak sejak dini, dengan cara berikut di antaranya&lt;br /&gt;&lt;br /&gt;1. Kenalkan dan Ajarkan Tentang Konsep Uang&lt;br /&gt;&lt;br /&gt;Ketika anak sudah mulai mampu berhitung, maka tidak ada salahnya mengajarkan atau mengenalkan anak tentang uang, misalnya dari pecahan kecil seperti uang lima ratus rupiah dan sejenisnya. Ajak anak berhitung selisih uang yang diberikan orang tua dan yang telah ia gunakan untuk jajan.&lt;br /&gt;&lt;br /&gt;2. Beri Pengajaran dengan Memberikan Uang Saku&lt;br /&gt;&lt;br /&gt;Dengan memberikannya uang saku, itu akan mengajak anak Anda untuk belajar dewasa mengatur keuangan. Sehingga secara perlahan ia akan mulai untuk mengelola keuangan yang dimilikinya.&lt;br /&gt;&lt;br /&gt;3. Ajarkan Anak untuk Terbiasa Menabung&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan anak menabung, maka anak akan lebih disiplin dalam mengontrol keuangan yang telah diberikan oleh orang tuanya.&lt;br /&gt;&lt;br /&gt;Berikanlah penjelasan sederhana dengan menabung anak akan mendapatkan sesuatu yang berharga di masa mendatang, serta ajarkan manfaat dari menyisihkan uang jajannya setiap hari dengan dimasukkan ke celengan terlebih dulu.&lt;br /&gt;&lt;br /&gt;Kemudian ketika beranjak dewasa, anak diajarkan untuk berinvestasi secara perlahan-lahan dengan mengajarkannya membeli reksa dana dan sejenisnya.&lt;br /&gt;&lt;br /&gt;4. Ajarkan Anak untuk Berbagi Pada Sesamanya&lt;br /&gt;&lt;br /&gt;Dengan mengajarkan konsep berbagi dengan saudaranya, secara perlahan itu akan mengajarkan anak mengenai beramal yang identik dengan kegiatan keagamaan sehingga diharapkan ia akan menjadi lebih saleh.&lt;br /&gt;&lt;br /&gt;Dengan pemahaman mendasar tersebut mengajarkan anak agar dapat tetap berbagi dengan sesamanya di sekolah walaupun orang tuanya sedang tidak di dekatnya.&lt;br /&gt;&lt;br /&gt;Selain itu ajarkan pula nilai kemanusiaan bahwa tidak semua manusia memiliki nasib yang sama. Sehingga anak menyadari betapa pentingnya berbagi dengan sesama khususnya bagi mereka yang membutuhkan.&lt;br /&gt;&lt;br /&gt;5. Diajarkan Melalui Konsep Game atau Permainan&lt;br /&gt;&lt;br /&gt;Melalui permainan anak tanpa sadar sedang diajarkan tentang mengelola keuangan. Sebagai contoh dalam memainkan permainan monopoli, cashflow 101, dan masih banyak lagi.&lt;br /&gt;&lt;br /&gt;Manfaatkan permainan tersebut dengan lebih menyenangkan sehingga perlahan anak dapat menerapkannya dalam kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;6. Ajak Anak Ketika Belanja Bulanan&lt;br /&gt;&lt;br /&gt;Dengan mengajak anak berbelanja, secara tidak langsung itu akan mengenalkan angka secara riil di lapangan.&lt;br /&gt;&lt;br /&gt;Dengan begitu anak akan dapat secara otomatis berhitung jumlah barang yang dibeli orang tuanya dan jumlah uang yang dikeluarkannya.&lt;br /&gt;&lt;br /&gt;Selain itu anak pun menyaksikan langsung terjadinya transaksi jual beli mulai dari menanyakan harga, tawar menawar, hingga terjadinya pembelian.&lt;br /&gt;&lt;br /&gt;7. Ajarkan Mengenai Prioritas&lt;br /&gt;&lt;br /&gt;Bila secara langsung mengajarkan secara definisi dan teori memang anak tidak langsung dapat memahaminya. Namun bila diberikan pertanyaan terbuka seperti mau mainan atau jalan-jalan, maka anak akan memilih keduanya.&lt;br /&gt;&lt;br /&gt;Namun ajarkan anak untuk memilih salah satunya mana yang lebih didahulukan. Dengan begitu anak secara perlahan diajarkan untuk mana yang lebih prioritas untuk didahulukan tanpa harus mengajarkan secara formal.&lt;br /&gt;&lt;br /&gt;Biasakan Anak Anda Dalam Mengatur Keuangan&lt;br /&gt;&lt;br /&gt;Harapannya dengan menerapkan cara tersebut anak dapat segera memahami bagaimana cara mengelola keuangan yang baik sehingga tidak perlu lagi repot mengajarkannya secara khusus karena lebih tepat serta efisien bila mengajarkannya dengan membiasakan diri mengatur keuangan mulai dari uang sakunya di kehidupan sehari-harinya.&lt;br /&gt;&lt;br /&gt;Jadi tidak ada lagi anak yang hanya mampu menghamburkan uang yang diberikan oleh orang tuanya saja tanpa dikelola dengan baik karena orang tuanya telah mengajarkannya sejak dini.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Diambil dari Liputan 6 Oleh Agustina Melani&lt;/p&gt;'),
(16, 8, 2, '7 Idea Give Financial Education for Children', '&lt;p&gt;Parents are central figures to introduce financial education to children.&lt;br /&gt;&lt;br /&gt;How this is done so that when the children started growing up, he will be able to make good decisions regarding finances.&lt;br /&gt;&lt;br /&gt;When viewed in terms of a great time in educating children is when children have entered primary school or elementary school age.&lt;br /&gt;&lt;br /&gt;Because at that age children will learn basic math like addition and subtraction of numbers that can be trained and applied in everyday life by saving.&lt;br /&gt;&lt;br /&gt;When in school are taught savings passbook to be made, then the duty of parents to control only course that expenditure of the allowance remains, but to save it was also still there.&lt;br /&gt;&lt;br /&gt;Of course as parents can not rely entirely on teaching education, especially for educating children about finances since childhood.&lt;br /&gt;&lt;br /&gt;Therefore, parents can also teach in early childhood to be able to manage the financial owned since early childhood, in the following way in between&lt;br /&gt;&lt;br /&gt;1. Recommend and Teach About Money Concepts&lt;br /&gt;&lt;br /&gt;When the child has begun to count, then there is no harm in teaching or introducing kids about money, for example, from a small fraction as five hundred rupiah and the like. Encourage children to count the difference between the money given by parents and that he had used for snacks.&lt;br /&gt;&lt;br /&gt;2. Give Teaching by Giving Allowance&lt;br /&gt;&lt;br /&gt;By giving them pocket money, it will take your child to an adult learn to manage finances. So slowly it will start to manage its finances.&lt;br /&gt;&lt;br /&gt;3. Teach Kids for Saving Accustomed&lt;br /&gt;&lt;br /&gt;By teaching children to save, then the child will be more discipline in financial control which have been given by their parents.&lt;br /&gt;&lt;br /&gt;Give a simple explanation to save the child will get something valuable in the future, as well as teach the benefits of set aside allowance every day to put the piggy bank first.&lt;br /&gt;&lt;br /&gt;Then, as adults, children are taught to invest gradually to teach buy mutual funds and the like.&lt;br /&gt;&lt;br /&gt;4. Teach Kids to Share In neighbor&lt;br /&gt;&lt;br /&gt;By teaching the concept of sharing with his brother, slowly it will teach children about the charity that is synonymous with religious activities so hopefully it will become more pious.&lt;br /&gt;&lt;br /&gt;With a fundamental understanding of the teaching of children in order to keep share with others in the school even though his parents were not nearby.&lt;br /&gt;&lt;br /&gt;Besides teaching the value of humanity that not all humans have the same fate. So the children realize the importance of sharing with others, especially for those in need.&lt;br /&gt;&lt;br /&gt;5. Taught Through Concept Game or Games&lt;br /&gt;&lt;br /&gt;Through the game unwittingly being taught about managing finances. For example in playing the game of monopoly, cashflow 101, and many more.&lt;br /&gt;&lt;br /&gt;Make the game more fun with so slow a child can apply them in their daily lives.&lt;br /&gt;&lt;br /&gt;6. Encourage Kids When Shopping Monthly&lt;br /&gt;&lt;br /&gt;By taking children shopping, indirectly it will introduce the figure in real terms in the field.&lt;br /&gt;&lt;br /&gt;That way the child will be able to automatically count the number of items purchased parents and the amount of money spent.&lt;br /&gt;&lt;br /&gt;In addition, children also witnessed the sale and purchase transactions ranging from the asking price, bargaining, to the purchase.&lt;br /&gt;&lt;br /&gt;7. Teach About Priorities&lt;br /&gt;&lt;br /&gt;When directly taught by definition and theory does not direct the child can understand. However, when given an open question as would a toy or sightseeing, then the child will choose both.&lt;br /&gt;&lt;br /&gt;But teach a child to choose one which would take precedence. That way the child gradually taught to which more priority to the precedence without having taught formally.&lt;br /&gt;&lt;br /&gt;Familiarize Your Child In the Set Finance&lt;br /&gt;&lt;br /&gt;The expectation by adopting the child can immediately understand how to manage finances well so no need to bother to teach it specifically because it is more appropriate and efficient to teach them to get used to managing money from his pocket money in his daily life.&lt;br /&gt;&lt;br /&gt;So no more children were only able to spend money given by parents without a well run because his parents had taught him early on.&lt;br /&gt;&lt;br /&gt;&lt;br /&gt;Taken from Liputan 6 By Agustina Melani&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Struktur dari tabel `post_gallery`
--

CREATE TABLE `post_gallery` (
  `id_post_gallery` int(5) NOT NULL,
  `id_post` int(5) NOT NULL DEFAULT 0,
  `picture` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `setting`
--

CREATE TABLE `setting` (
  `id_setting` int(5) NOT NULL,
  `groups` varchar(50) NOT NULL,
  `options` varchar(100) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `setting`
--

INSERT INTO `setting` (`id_setting`, `groups`, `options`, `value`) VALUES
(1, 'general', 'web_name', 'SMK BHAKTI PERTIWI'),
(2, 'general', 'web_url', 'http://localhost/SMK-BP'),
(3, 'general', 'web_meta', 'Sekolah TEKAJE'),
(4, 'general', 'web_keyword', 'popojicms buat sendiri rasa webmu'),
(5, 'general', 'web_owner', 'PopojiCMS'),
(6, 'general', 'email', 'kuromyname86@gmail.com'),
(7, 'general', 'telephone', '000-0000-0000'),
(8, 'general', 'fax', '000-0000-0000'),
(9, 'general', 'address', '&lt;strong&gt;Headquarters:&lt;/strong&gt;&lt;br&gt;\n795 Folsom Ave, Suite 600&lt;br&gt;\nSan Francisco, CA 94107'),
(10, 'general', 'geocode', 'latitude: -6.1753871, longitude: 106.8249641,'),
(11, 'image', 'favicon', 'favicon.png'),
(12, 'image', 'logo', 'logo.png'),
(13, 'image', 'img_medium', '640x480'),
(14, 'local', 'country', 'Indonesia'),
(15, 'local', 'region_state', 'Sulawesi Utara'),
(16, 'local', 'timezone', 'Pacific/Midway'),
(17, 'config', 'maintenance', 'N'),
(18, 'config', 'member_registration', 'N'),
(19, 'config', 'comment', 'N'),
(20, 'config', 'item_per_page', '5'),
(21, 'config', 'google_analytics', ''),
(22, 'config', 'recaptcha_sitekey', '6LckEgETAAAAAPdqrQSY_boMDLZRL1vpkAatVqKf'),
(23, 'config', 'recaptcha_secretkey', '6LckEgETAAAAAHqx4VFD4zNL96P9UEikD8BHfT28'),
(24, 'mail', 'mail_protocol', 'Mail'),
(25, 'mail', 'mail_hostname', ''),
(26, 'mail', 'mail_username', ''),
(27, 'mail', 'mail_password', ''),
(28, 'mail', 'mail_port', ''),
(29, 'config', 'permalink', 'slug/post-title'),
(30, 'config', 'slug_permalink', 'detailpost');

-- --------------------------------------------------------

--
-- Struktur dari tabel `subscribe`
--

CREATE TABLE `subscribe` (
  `id_subscribe` int(5) NOT NULL,
  `email` varchar(100) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tag`
--

CREATE TABLE `tag` (
  `id_tag` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `tag_seo` varchar(100) NOT NULL,
  `count` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `tag`
--

INSERT INTO `tag` (`id_tag`, `title`, `tag_seo`, `count`) VALUES
(1, 'indonesia', 'indonesia', 8),
(2, 'wisata religi', 'wisata-religi', 5),
(3, 'toleransi beragama', 'toleransi-beragama', 5),
(4, 'manado', 'manado', 3),
(5, 'wisata manado', 'wisata-manado', 3),
(6, 'sulawesi utara', 'sulawesi-utara', 3),
(7, 'startup', 'startup', 6),
(8, 'impian', 'impian', 3),
(9, 'usaha kecil', 'usaha-kecil', 3),
(10, 'bisnis', 'bisnis', 3),
(11, 'cowok', 'cowok', 3),
(12, 'pendamping', 'pendamping', 6),
(13, 'cewek', 'cewek', 3),
(14, 'ginsul', 'ginsul', 3),
(15, 'sayang', 'sayang', 3),
(16, 'sukses', 'sukses', 3),
(17, 'tips sukses', 'tips-sukses', 3),
(18, 'edukasi anak', 'edukasi-anak', 4),
(19, 'keuangan', 'keuangan', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `theme`
--

CREATE TABLE `theme` (
  `id_theme` int(5) NOT NULL,
  `title` varchar(50) NOT NULL,
  `author` varchar(50) NOT NULL,
  `folder` varchar(20) NOT NULL,
  `active` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `theme`
--

INSERT INTO `theme` (`id_theme`, `title`, `author`, `folder`, `active`) VALUES
(1, 'Chingsy', 'PopojiCMS', 'chingsy', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `traffic`
--

CREATE TABLE `traffic` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `browser` varchar(255) NOT NULL,
  `os` varchar(255) NOT NULL,
  `platform` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT 1,
  `online` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `traffic`
--

INSERT INTO `traffic` (`ip`, `browser`, `os`, `platform`, `country`, `city`, `date`, `hits`, `online`) VALUES
('::1', 'Firefox', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:69.0) Gecko/20100101 Firefox/69.0', 'Windows', '', '', '2019-09-08', 1, '1568004857');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama_lengkap` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `no_telp` varchar(20) NOT NULL,
  `bio` text NOT NULL,
  `picture` varchar(255) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT '2',
  `block` enum('Y','N') NOT NULL DEFAULT 'N',
  `id_session` varchar(100) NOT NULL,
  `tgl_daftar` date NOT NULL,
  `forget_key` varchar(100) DEFAULT NULL,
  `locktype` varchar(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telp`, `bio`, `picture`, `level`, `block`, `id_session`, `tgl_daftar`, `forget_key`, `locktype`) VALUES
(1, 'admin', '0192023a7bbd73250516f069df18b500', 'Super Administrator', 'kuromyname86@gmail.com', '000-0000-0000', 'No matter how exciting or significant a person\'s life is, a poorly written biography will make it seem like a snore. On the other hand, a good biographer can draw insight from an ordinary life-because they recognize that even the most exciting life is an ordinary life! After all, a biography isn\'t supposed to be a collection of facts assembled in chronological order; it\'s the biographer\'s interpretation of how that life was different and important.', '', '1', 'N', '0192023a7bbd73250516f069df18b500', '2019-09-08', NULL, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user_level`
--

CREATE TABLE `user_level` (
  `id_level` int(5) NOT NULL,
  `level` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `role` text NOT NULL,
  `menu` int(5) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data untuk tabel `user_level`
--

INSERT INTO `user_level` (`id_level`, `level`, `title`, `role`, `menu`) VALUES
(1, 'superadmin', 'Super Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1),
(2, 'admin', 'Administrator', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"1\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(3, 'manager', 'Manager', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"component\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"contact\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"menumanager\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"oauth\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"user\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"0\"}]', 1),
(4, 'member', 'Member', '[{\"component\":\"category\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"comment\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"component\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"contact\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"gallery\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"home\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"library\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"menumanager\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"oauth\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"pages\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"post\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"setting\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"tag\",\"create\":\"1\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"},{\"component\":\"theme\",\"create\":\"0\",\"read\":\"0\",\"update\":\"0\",\"delete\":\"0\"},{\"component\":\"user\",\"create\":\"0\",\"read\":\"1\",\"update\":\"1\",\"delete\":\"1\"}]', 1);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `album`
--
ALTER TABLE `album`
  ADD PRIMARY KEY (`id_album`);

--
-- Indeks untuk tabel `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_category`);

--
-- Indeks untuk tabel `category_description`
--
ALTER TABLE `category_description`
  ADD PRIMARY KEY (`id_category_description`);

--
-- Indeks untuk tabel `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id_comment`);

--
-- Indeks untuk tabel `component`
--
ALTER TABLE `component`
  ADD PRIMARY KEY (`id_component`);

--
-- Indeks untuk tabel `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id_contact`);

--
-- Indeks untuk tabel `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id_gallery`);

--
-- Indeks untuk tabel `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`id_language`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `oauth`
--
ALTER TABLE `oauth`
  ADD PRIMARY KEY (`id_oauth`);

--
-- Indeks untuk tabel `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id_pages`);

--
-- Indeks untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  ADD PRIMARY KEY (`id_pages_description`);

--
-- Indeks untuk tabel `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id_post`);

--
-- Indeks untuk tabel `post_category`
--
ALTER TABLE `post_category`
  ADD PRIMARY KEY (`id_post_category`);

--
-- Indeks untuk tabel `post_description`
--
ALTER TABLE `post_description`
  ADD PRIMARY KEY (`id_post_description`);

--
-- Indeks untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  ADD PRIMARY KEY (`id_post_gallery`);

--
-- Indeks untuk tabel `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`id_setting`);

--
-- Indeks untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`id_subscribe`);

--
-- Indeks untuk tabel `tag`
--
ALTER TABLE `tag`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indeks untuk tabel `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id_theme`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`username`);

--
-- Indeks untuk tabel `user_level`
--
ALTER TABLE `user_level`
  ADD PRIMARY KEY (`id_level`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `album`
--
ALTER TABLE `album`
  MODIFY `id_album` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `category`
--
ALTER TABLE `category`
  MODIFY `id_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `category_description`
--
ALTER TABLE `category_description`
  MODIFY `id_category_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `comment`
--
ALTER TABLE `comment`
  MODIFY `id_comment` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `component`
--
ALTER TABLE `component`
  MODIFY `id_component` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `contact`
--
ALTER TABLE `contact`
  MODIFY `id_contact` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id_gallery` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `language`
--
ALTER TABLE `language`
  MODIFY `id_language` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` tinyint(3) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT untuk tabel `menu_group`
--
ALTER TABLE `menu_group`
  MODIFY `id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `oauth`
--
ALTER TABLE `oauth`
  MODIFY `id_oauth` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages`
--
ALTER TABLE `pages`
  MODIFY `id_pages` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pages_description`
--
ALTER TABLE `pages_description`
  MODIFY `id_pages_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `post`
--
ALTER TABLE `post`
  MODIFY `id_post` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_category`
--
ALTER TABLE `post_category`
  MODIFY `id_post_category` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `post_description`
--
ALTER TABLE `post_description`
  MODIFY `id_post_description` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `post_gallery`
--
ALTER TABLE `post_gallery`
  MODIFY `id_post_gallery` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `setting`
--
ALTER TABLE `setting`
  MODIFY `id_setting` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT untuk tabel `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `id_subscribe` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tag`
--
ALTER TABLE `tag`
  MODIFY `id_tag` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT untuk tabel `theme`
--
ALTER TABLE `theme`
  MODIFY `id_theme` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `user_level`
--
ALTER TABLE `user_level`
  MODIFY `id_level` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- Database: `sekolah`
--
CREATE DATABASE IF NOT EXISTS `sekolah` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sekolah`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `guru`
--

CREATE TABLE `guru` (
  `nip` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telp` char(15) DEFAULT NULL,
  `tgl_masuk` date DEFAULT NULL,
  `jk` enum('L','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `nis` varchar(10) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `alamat` varchar(100) DEFAULT NULL,
  `no_telp` char(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `mahasiswa`
--

INSERT INTO `mahasiswa` (`nis`, `nama`, `alamat`, `no_telp`, `email`, `tgl_lahir`) VALUES
('201901', 'Budi', 'Jakarta', '0811234', 'budi@mail.com', '1985-01-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `matkul`
--

CREATE TABLE `matkul` (
  `kode_matkul` int(3) DEFAULT NULL,
  `sks` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
--
-- Database: `siakad`
--
CREATE DATABASE IF NOT EXISTS `siakad` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `siakad`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_absensi_guru`
--

CREATE TABLE `rb_absensi_guru` (
  `id_absensi_guru` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nip` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_absensi_siswa`
--

CREATE TABLE `rb_absensi_siswa` (
  `id_absensi_siswa` int(5) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kehadiran` varchar(5) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_agama`
--

CREATE TABLE `rb_agama` (
  `id_agama` int(5) NOT NULL,
  `nama_agama` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_agama`
--

INSERT INTO `rb_agama` (`id_agama`, `nama_agama`) VALUES
(1, 'Islam'),
(2, 'Kristen'),
(3, 'Hindu'),
(4, 'Budha');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_elearning`
--

CREATE TABLE `rb_elearning` (
  `id_elearning` int(10) NOT NULL,
  `id_kategori_elearning` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `file_upload` text NOT NULL,
  `tanggal_tugas` datetime NOT NULL,
  `tanggal_selesai` datetime NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_elearning`
--

INSERT INTO `rb_elearning` (`id_elearning`, `id_kategori_elearning`, `kodejdwl`, `nama_file`, `file_upload`, `tanggal_tugas`, `tanggal_selesai`, `keterangan`) VALUES
(13, 1, 7, 'File Upload Materi 1', 'Contoh_Kasus_AHP.docx', '2015-12-09 08:07:15', '0000-00-00 00:00:00', ''),
(22, 2, 7, 'Tugas Untuk Siswa Kelompok yang Malas', 'cover_Pidana_korupsi.docx', '2015-12-09 22:37:51', '2015-12-23 13:07:09', 'Tolong Dikerjakan, Kalau Tidak Maka nilai Raport anda merah..'),
(23, 2, 7, 'Tugas Pertama ', 'Surat-Keterangan-Kepsek.docx', '2015-12-13 15:02:00', '2016-01-22 15:02:00', 'Selesaikan Secepatnya,..!'),
(24, 1, 5, 'Bahan Untuk Tugas Semester 2', 'journal_profile_matching_beasiswa.pdf', '2016-02-23 09:04:22', '2016-12-23 11:04:22', 'Bahan Untuk Tugas Semester 2 ini tolong dipelajari karena akan banyak keluar di ujian semester nanti.'),
(25, 2, 5, 'Tugas Semester 1 Tahun Ajaran 2015/2016', 'Metode-Profile-Matching.pdf', '2015-12-23 09:11:15', '2016-04-25 09:11:15', 'Silahkan Dijawab dan unutk jawaban di upload disini paling lambat sesuai tanggal selesai..'),
(26, 1, 13, 'Bahan Unutk Peljaran Besok', '20160311072304-Tugas_laura.docx', '2016-03-11 07:22:32', '2016-03-11 07:22:32', ''),
(27, 2, 13, 'Tugas Unutk Dikumpul Besok 12 Maret 2016', '20160311072502-Aturan Main Projects.docx', '2016-03-11 07:24:16', '2016-03-13 07:24:16', ''),
(28, 1, 13, 'kjbkjbkbk', '20160311143928-HITUNG NILAI RAPORT.docx', '2016-03-11 14:39:09', '2016-03-11 14:39:09', 'kjbkbk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_elearning_jawab`
--

CREATE TABLE `rb_elearning_jawab` (
  `id_elearning_jawab` int(5) NOT NULL,
  `id_elearning` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `file_tugas` varchar(255) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_elearning_jawab`
--

INSERT INTO `rb_elearning_jawab` (`id_elearning_jawab`, `id_elearning`, `nisn`, `keterangan`, `file_tugas`, `waktu`) VALUES
(3, 25, '9991268756', 'Ini buk Guru tugas dari saya, Tolong diperiksa,..', '20160309112015-Nilai_Siswa_9982679070.pdf', '2016-03-09 11:20:15'),
(4, 27, '9991268756', 'Ini Tugas saya buk..', '20160311072733-Pengembangan Members.txt', '2016-03-11 07:27:33');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_forum_komentar`
--

CREATE TABLE `rb_forum_komentar` (
  `id_forum_komentar` int(10) NOT NULL,
  `id_forum_topic` int(10) NOT NULL,
  `nisn_nip` varchar(20) NOT NULL,
  `isi_komentar` text NOT NULL,
  `waktu_komentar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_forum_komentar`
--

INSERT INTO `rb_forum_komentar` (`id_forum_komentar`, `id_forum_topic`, `nisn_nip`, `isi_komentar`, `waktu_komentar`) VALUES
(1, 3, '9980707189', 'Senangi dulu pelajaran yang diharapkan nilainya bagus. Tanpa menyenangi pelajaran tersebut, maka hasil yang diperoleh melalui belajar tidak akan maksimal. Paling tidak, jangan sampai membenci pelajarannya. Hal ini karena akan tidak mungkin seseorang bisa betah lama-lama belajar materi suatu mata pelajaran yang dibencinya, apalagi untuk memahaminya.', '2015-12-12 05:09:15'),
(7, 1, '9980722436', 'Hallo teman teman, Numpang share lowongan ya. lagi di butuhkan segera nih buat posisi Full Time Web Developer/ Web Programmer.', '2016-02-26 00:34:01'),
(13, 1, '9991268756', 'Kami hanya ingin berdoa, ingin beribadah dan menjalankan ibadat kami. Kami tidak pernah menggangu apalagi berusaha untuk mengganggu umat beragama lain apalagi melakukan kristenisasi. Berpikir untuk itu saja kami tidak pernah.', '2016-03-09 10:38:51'),
(12, 1, '195704111980032004', 'Kami cuma ingin memiliki rumah ibadat agar kami dapat berdoa kepada Tuhan kami dengan khusuk. Dosakah itu? apakah itu terlarang di negara yag berazaskan Pancasila ini? Dimanakah rasa damai dan keadilan itu? Masih adakah toleransi di negara ini?', '2016-03-09 10:36:22'),
(3, 3, '9980722436', 'Milikilah rasa ingin tahu yang besar, karena hanya orang-orang yang memiliki rasa ingin tahu yang besar dalam banyak hal lah yang akan selalu senang dalam belajar, dan selalu ingin mempelajari dan memahami hal-hal baru dan banyak hal yang ia temui.', '2015-12-11 17:09:55');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_forum_topic`
--

CREATE TABLE `rb_forum_topic` (
  `id_forum_topic` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `judul_topic` varchar(255) NOT NULL,
  `isi_topic` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_forum_topic`
--

INSERT INTO `rb_forum_topic` (`id_forum_topic`, `kodejdwl`, `judul_topic`, `isi_topic`, `waktu`) VALUES
(1, 33, 'Cara Unutk Memahami Rumus Pitagoras dengan mudah.', 'Dalam matematika, teorema Pythagoras adalah suatu keterkaitan dalam geometri Euklides antara tiga sisi sebuah segitiga siku-siku. Teorema ini dinamakan menurut nama filsuf dan matematikawan Yunani abad ke-6 SM, Pythagoras. . Pythagoras mendapat kredit karena ialah yang pertama membuktikan kebenaran universal dari teorema ini melalui pembuktian matematis.', '2015-12-11 08:08:18'),
(2, 7, 'Rumus untuk menghitung pendapatan perkapita', 'Pendapatan per kapita adalah jumlah (nilai) barang dan jasa rata-rata yang tersedia bagi setiap penduduk suatu negara pada suatu periode tertentu.\r\n\r\nPendapatan per kapita dapat digunakan untuk membandingkan kesejahteraan atau standar hidup suatu negara dari tahun ke tahun. Dengan melakukan perbandingan seperti itu, kita dapat mengamati apakah kesejahteraan masyarakat pada suatu negara secara rata-rata telah meningkat. Pendapatan per kapita yang meningkat merupakan salah satu tanda bahwa rata-rata kesejahteraan penduduk telah meningkat. Pendapatan per kapita menunjukkan pula apakah pembangunan yang telah dilaksanakan oleh pemerintah telah berhasil, berapa besar keberhasilan tersebut, dan akibat apa yang timbul oleh peningkatan tersebut.', '2015-12-12 13:13:27'),
(3, 7, 'Cara Mendapatkan Nilai Bagus Dan Menjadi Juara Kelas Di Sekolah', 'Bagaimana caranya agar nilai rapor mata pelajaran di sekolah hasilnya baik dan bagus sehingga syukur-syukur bisa menjadi juara kelas ? Ikuti tips di bawah ini yang didasarkan pada sebuah pengalaman nyata bertahun-tahun dari berbagai sumber. \r\n\r\nPerlu untuk digaris-bawahi, tak dibutuhkan otak yang pintar atau jenius untuk mendapatkan nilai yang bagus di sekolah ataupun untuk menjadi seorang juara kelas. Seseorang yang kemampuan otaknya biasa-biasa saja akan bisa memperoleh hasil yang bagus asalkan ia memiliki niat, kemauan, maupun sikap yang tepat dalam mewujudkan ambisinya.', '2015-12-11 16:20:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_gedung`
--

CREATE TABLE `rb_gedung` (
  `kode_gedung` varchar(10) NOT NULL,
  `nama_gedung` varchar(100) NOT NULL,
  `jumlah_lantai` varchar(20) NOT NULL,
  `panjang` varchar(20) NOT NULL,
  `tinggi` varchar(20) NOT NULL,
  `lebar` varchar(20) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Y','N') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_gedung`
--

INSERT INTO `rb_gedung` (`kode_gedung`, `nama_gedung`, `jumlah_lantai`, `panjang`, `tinggi`, `lebar`, `keterangan`, `aktif`) VALUES
('G001', 'Gedung A', '2', '100', '50', '50', '', 'Y'),
('G002', 'Gedung B', '3', '50', '80', '30', '', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_golongan`
--

CREATE TABLE `rb_golongan` (
  `id_golongan` int(5) NOT NULL,
  `nama_golongan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_golongan`
--

INSERT INTO `rb_golongan` (`id_golongan`, `nama_golongan`, `keterangan`) VALUES
(1, 'IV/a', 'Golongan IV/a');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_guru`
--

CREATE TABLE `rb_guru` (
  `nip` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama_guru` varchar(150) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(150) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `niy_nigk` varchar(50) NOT NULL,
  `nuptk` varchar(50) NOT NULL,
  `id_status_kepegawaian` int(5) NOT NULL,
  `id_jenis_ptk` int(5) NOT NULL,
  `pengawas_bidang_studi` varchar(150) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `alamat_jalan` varchar(255) NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `nama_dusun` varchar(100) NOT NULL,
  `desa_kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `tugas_tambahan` varchar(100) NOT NULL,
  `id_status_keaktifan` int(5) NOT NULL,
  `sk_cpns` varchar(150) NOT NULL,
  `tanggal_cpns` date NOT NULL,
  `sk_pengangkatan` varchar(150) NOT NULL,
  `tmt_pengangkatan` date NOT NULL,
  `lembaga_pengangkatan` varchar(150) NOT NULL,
  `id_golongan` int(5) NOT NULL,
  `keahlian_laboratorium` varchar(150) NOT NULL,
  `sumber_gaji` varchar(150) NOT NULL,
  `nama_ibu_kandung` varchar(100) NOT NULL,
  `id_status_pernikahan` int(5) NOT NULL,
  `nama_suami_istri` varchar(100) NOT NULL,
  `nip_suami_istri` varchar(30) NOT NULL,
  `pekerjaan_suami_istri` varchar(100) NOT NULL,
  `tmt_pns` date NOT NULL,
  `lisensi_kepsek` varchar(20) NOT NULL,
  `jumlah_sekolah_binaan` int(5) NOT NULL,
  `diklat_kepengawasan` varchar(20) NOT NULL,
  `mampu_handle_kk` varchar(20) NOT NULL,
  `keahlian_breile` varchar(20) NOT NULL,
  `keahlian_bahasa_isyarat` varchar(20) NOT NULL,
  `npwp` varchar(50) NOT NULL,
  `kewarganegaraan` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_guru`
--

INSERT INTO `rb_guru` (`nip`, `password`, `nama_guru`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `id_status_kepegawaian`, `id_jenis_ptk`, `pengawas_bidang_studi`, `id_agama`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `telepon`, `hp`, `email`, `tugas_tambahan`, `id_status_keaktifan`, `sk_cpns`, `tanggal_cpns`, `sk_pengangkatan`, `tmt_pengangkatan`, `lembaga_pengangkatan`, `id_golongan`, `keahlian_laboratorium`, `sumber_gaji`, `nama_ibu_kandung`, `id_status_pernikahan`, `nama_suami_istri`, `nip_suami_istri`, `pekerjaan_suami_istri`, `tmt_pns`, `lisensi_kepsek`, `jumlah_sekolah_binaan`, `diklat_kepengawasan`, `mampu_handle_kk`, `keahlian_breile`, `keahlian_bahasa_isyarat`, `npwp`, `kewarganegaraan`, `foto`) VALUES
('195704111980032004', '12169300491', 'April Daniati', 2, 'Padang Panjang', '1957-04-11', '1374025104571989', '', '1743735636300012', 3, 2, '', 1, 'Jl.Perintis Kemerdekaan No.121 B', '3', '0', '', 'Balai-Balai', 'Kec. Padang Panjang Barat', 27114, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Laboratorium', 1, '56483/C/2/80', '1980-03-01', '56483/C/2/80', '1980-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Hj. Djawana', 1, 'Zainudin, S.PD.I', '', 'Wiraswasta', '1981-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984032002', '6883346563', 'Aisyah', 2, 'Bukittinggi', '1958-06-16', '1374025104571989', '', '3948736639300012', 3, 2, '', 1, 'Birugo Puhun 80.266', '0', '0', '', 'Tarok Dipo', 'Kec. Aur Birugo Tigo Baleh', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/1412/III-BKD-2005', '2005-12-23', '822/1412/III-BKD-2005', '1983-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Djuniar', 1, 'Mufti SH, S.Pd', '', '3/TNI/Polri', '2006-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928198202000', 'INDONESIA', ''),
('195806161984000001', '12177967191', 'Aina Yonavia', 2, 'Bukittinggi', '1989-02-28', '1374025104571989', '', '', 2, 2, '', 1, 'Jl.bonjo Baru By Pass', '3', '5', '', 'Tarok DIpo', 'Kec. Guguk Panjang', 26122, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '', '2015-07-13', 'Kepala Sekolah', 1, '', 'Sekolah', 'Nuraida', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196209051987031007', '8066957354', 'Amri Jaya', 1, 'Jakarta', '1962-09-05', '1374025104571989', '', '1237740641300043', 3, 2, '', 1, 'Jorong Biaro', '0', '0', '', 'Biaro Gadang', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Sekolah', 1, '1402/IV.E/KWPK-1987', '1987-03-01', '821.20/05/III-BKD-2013', '2013-03-05', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Nurhayati', 1, 'Erni', '', '3/TNI/Polri', '1988-07-01', 'YA', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984000016', '11435453225', 'Agus Musanib', 1, 'Bali', '1950-02-02', '1374025104571989', '', '', 1, 1, '', 1, 'Prof.M.Yamin, SH', '4', '4', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.sma.3.bkt', '2004-05-05', 'Kepala Sekolah', 1, '', 'Sekolah', 'Hy', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195901241986032002', '7438122975', 'Asbaidar', 2, 'Pakan Kamis', '1959-01-24', '1374025104571989', '', '6456737638300012', 3, 2, '', 1, 'Bukareh', '0', '0', '', 'Bukareh', 'Kec. Tilatang Kamang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '873/IV.E/Kwpk-1986', '1986-03-01', '873/IV.E/Kwpk-1986', '1986-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Nuraini', 1, 'Mawardi', '195906071987031005', '3/TNI/Polri', '1988-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928271202000', 'INDONESIA', ''),
('196703011992031006', '10518823227', 'Azwaldi', 1, 'Agam', '1967-03-01', '1374025104571989', '', '5633745648200022', 3, 2, '', 1, 'Jorong Aia Kaciak', '0', '0', '', 'Nagari Kubang Putiah', 'Kec. Banuhampu', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '2746/IV/KWPK-1993', '1992-03-01', '2746/IV/KWPK-1993', '1993-07-29', 'Pemerintah Pusat', 1, '', 'APBN', 'Zurada', 1, 'Ermawati', '197003271994122001', '3/TNI/Polri', '1994-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '698210374202000', 'INDONESIA', ''),
('196812211997022002', '11376043945', 'Darmawati', 2, 'Bukittinggi', '1968-12-21', '1374025104571989', '', '8553746649300023', 3, 2, '', 1, 'Jl.Syekh Arrasuli No.66E', '4', '1', '', 'Aur Tajungkang Tengah Saw', 'Kec. Guguk Panjang', 26111, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '16872/A2/Kp/1997', '1997-02-01', '16872/A2/Kp/1997', '1997-02-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Asmiar', 1, 'Herman Arif', '', 'Wiraswasta', '1998-05-06', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '150070308202000', 'INDONESIA', ''),
('196312041987031000', '6420046780', 'Dasmir', 1, 'Magek,Agam', '1963-03-04', '1374025104571989', '', '0536741643200023', 3, 2, '', 1, 'Jln. Sawah Dangka No. 58 A III Kampung Gadut', '0', '0', '', 'Koto Tangah', 'Kec. Tilatang Kamang', 26152, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '501/IV.E/Kwpk-1987', '1987-03-01', '501/W.E/Kwpk-1987', '1987-03-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Syamsiar', 1, 'Almiati', '196809081989032004', '3/TNI/Polri', '1988-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '146058979202000', 'INDONESIA', ''),
('198406142009012003', '12241237914', 'Dellya', 2, 'Bukittinggi', '1984-06-14', '1374025104571989', '', '3946762664210112', 3, 3, '', 1, 'Parak Kongsi Jorong Parik Putuih', '0', '0', '', 'Ampang Gadang', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/022-5D/BKD-2009', '2009-01-01', '813/022-5D/BKD-2009', '2009-01-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Yarmini', 1, 'Syawaldi', '', 'Karyawan Swasta', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('198012112005012005', '9773210321', 'Desi Eriani', 2, 'Payakumbuh', '1980-12-11', '1374025104571989', '', '7543758660300113', 3, 2, '', 1, 'Balai Nan Duo No.57', '3', '1', '', 'Balai Nan Duo', 'Kec. Payakumbuh Barat', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/034/5D-BKD/2005', '2005-01-01', '813/034/5D-BKD/2005', '2005-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Warnidawati', 1, 'ROBBY EFENDI', '198107132005011002', '3/TNI/Polri', '2006-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928404202000', 'INDONESIA', ''),
('196305141990032003', '6507770244', 'Desmainil', 2, 'Barulak', '1963-05-14', '1374025104571989', '', '', 3, 1, '', 1, 'Komplek Taman Asri Blok E.1 ', '0', '0', 'Parik Putuih', 'Ampang Gadang', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '167/IV-A/KWPK-1990', '1990-03-01', '167/IV-A/KWPK-1990', '1990-03-01', 'Pemerintah Propinsi', 1, '', 'APBD Kabupaten/Kota', 'Nufiar', 1, 'Zulferis, SE', '', 'Lainnya', '1990-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('198312252009022007', '10853788285', 'Destri Eka Putri', 2, 'Kambing VII', '1983-12-25', '1374025104571989', '', '6557761663300133', 3, 2, '', 1, 'Jl Prof M Yamin SH Gang Langsat No 78', '2', '2', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26132, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813.3/56/KKD-SWL/2009', '2009-02-01', '824.3/2169/BKD-2014', '2014-08-01', 'Pemerintah Propinsi', 1, '', 'APBD Kabupaten/Kota', 'Yusna', 1, 'Ferdi Rahadian', '198003062005011005', '3/TNI/Polri', '2010-11-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '780971883203000', 'INDONESIA', ''),
('195806161984000002', '9207359605', 'Dian Lestari', 1, 'Bukittinggi', '1989-08-03', '1374025104571989', '', '', 2, 2, '', 1, 'Jalan Ahmad Karim Nomor 96', '2', '4', '', 'Benteng Pasar Atas', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.001.SMA.3.BKT.2013', '2013-01-07', 'Kepala Sekolah', 1, '', 'Sekolah', 'Zelniar Zen', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195912121986021004', '7840865552', 'Edwardi', 1, 'Sungai Landir', '1959-12-12', '1374025104571989', '', '4544737639200063', 3, 2, '', 1, 'Jl.Pakoan Indah II No.83 Jorong Aro Kandikir', '0', '0', '', 'Gaduik', 'Kec. Guguk Panjang', 26122, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/979/III-bkd-2005', '2006-02-01', '822/979/III-bkd-2005', '2006-02-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Sareda', 1, 'ny edwardi', '', 'Tidak bekerja', '2006-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197411132000032007', '5947681324', 'Efayanti', 2, 'Balingka', '1974-11-13', '1374025104571989', '', '4445752654300023', 3, 2, '', 1, 'Jl.Pakoan Indah III Gang Arwana No.1 Jorong Aro Kandikir', '0', '0', '', 'Gaduik', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '8527/A2/kp/2000', '2000-03-01', '001/2/II-Bkd/2001', '2002-02-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Ratna', 1, 'Defia', '', 'Wiraswasta', '2002-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470810202000', 'INDONESIA', ''),
('197110292005011003', '7215810171', 'Efrizal M', 1, 'Bukittinggi', '1971-10-29', '1374025104571989', '', '1361749652200013', 3, 2, '', 1, 'Jl;.Raya Tigo Baleh No.8', '1', '6', '', 'Pakan Labuah', 'Kec. Aur Birugo Tigo Baleh', 26134, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, 'bkd.049/813.3/Kep/Wako-2005', '2005-01-01', '188.45/159/821.13/kpts/bsl/bkd-2006', '2006-03-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Sariaji', 1, 'Hafnesi', '', 'Karyawan Swasta', '2006-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984000003', '5966871440', 'Ega Nerifalinda', 2, 'Pekan Kamis', '1983-03-20', '1374025104571989', '', '', 2, 2, '', 1, 'Jorong Padang Canting', '0', '0', '', 'Kapau', 'Kec. Tilatang Kamang', 26152, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.642.SMA.3.BKT-2015', '2015-07-06', 'Kepala Sekolah', 1, '', 'Sekolah', 'Rifdayati', 1, 'Abdul Halim', '', 'Karyawan Swasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196709021991032006', '9186926890', 'Eli Noverma', 2, 'Ampalu Gurun, Batusa', '1967-09-02', '1374025104571989', '', '6234745648300033', 3, 2, '', 1, 'Jl.Haji Miskin No. 91A Palolok', '0', '0', '', 'Campago Ipuh', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Laboratorium', 1, '822/005/disdikpora.bkt/skt-200', '2009-03-01', '822/005/disdikpora.bkt/skt-200', '2009-03-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Ratna', 1, '', '', 'Tidak bekerja', '2009-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197004031997022001', '9130316866', 'Elianis', 2, 'Pasanehan', '1970-04-03', '1374025104571989', '', '0735748650300032', 3, 2, '', 1, 'Bonjo Alam', '0', '0', '', 'Ampang Gadang', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '16858/A2.KP.1997', '1997-02-01', '2335/IV/Kwpk-1998', '1998-06-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Djarnian', 1, 'Salmetri', '196804271992031004', '3/TNI/Polri', '1998-06-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196709271989031003', '5821668218', 'Elno', 1, 'Agam', '1967-09-27', '1374025104571989', '', '5259745646200003', 3, 2, '', 1, 'Perumahan Pasia Permai No.7', '0', '0', 'Cibuak Ameh', 'Pasia', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah Kesiswaan', 1, '1474/IV.E/KWP-1989', '1989-03-01', '1474/ME/KWP-29', '1989-06-29', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'NURHEMA', 1, 'Maulida Patriana', '196805251995032002', '3/TNI/Polri', '1991-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928412202000', 'INDONESIA', ''),
('196109191988031006', '9351958521', 'Elza Refni', 1, 'Padang Lawas', '1961-09-19', '1374025104571989', '', '8251739641200023', 3, 3, '', 1, 'Komplek Veteran Guguk Randah Jl.Ak Gani', '5', '2', '', 'Campago Guguak Bulek', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah Humas', 1, '760/IV.E/Kwpk-1988', '1988-03-01', '760/IV.E/Kwpk-1988', '1988-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Hj. Nurmelis', 1, 'Retni Akmalia', '196412231987032004', '3/TNI/Polri', '1989-09-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928172202000', 'INDONESIA', ''),
('195806161984000004', '10391084688', 'Erdison', 1, 'Sungai Liku', '1981-01-03', '1374025104571989', '', '', 1, 1, '', 1, 'Birugo Bungo', '2', '1', '', 'Birugo', 'Kec. Aur Birugo Tigo Baleh', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.sma.3.bkt-2010', '2010-07-01', 'Kepala Sekolah', 1, '', 'Sekolah', 'Siti', 1, 'Yulisna', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196202191990032001', '11630412432', 'Erlis', 2, 'Tampunik, Agam', '1962-02-19', '1374025104571989', '', '8551740641300032', 3, 2, '', 1, 'Tampunik', '0', '0', '', 'Tampunik', 'Kec. Tilatang Kamang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '525/IV.E/Kwpk-1990', '1990-03-01', '525/IV.E/Kwpk-1990', '1990-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Rosmaniar', 1, 'Jaya Putra', '-                 ', 'Wiraswasta', '1991-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928438202000', 'INDONESIA', ''),
('196308051983012001', '8075104832', 'Ernawilis', 2, 'Palembayan', '1963-09-05', '1374025104571989', '', '7137741642300043', 3, 1, '', 1, 'Perumnas Blok H7 ', '0', '0', 'Jorong Kudang Duo', 'Bukik Batabuah', 'Kec. Candung', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '1357/c/3/1982', '1983-03-01', '2485/4/Kwpk-1984', '1984-08-01', 'Pemerintah Propinsi', 1, '', 'APBD Provinsi', 'Siti Budiman', 1, 'Suarni, SH', '196212311983031128', '3/TNI/Polri', '1984-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476474077202000', 'INDONESIA', ''),
('197305312014061001', '6484287069', 'Erwin', 1, 'Bandung', '1973-05-31', '1374025104571989', '', '5863751653200002', 5, 1, '', 1, 'Jl.Merapi 2986', '1', '4', '', 'Puhun Tembok', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/043-5D/BKD-2014', '2014-06-01', '82.800.SMA.3-Bkt-2004', '2004-03-01', 'Kepala Sekolah', 1, '', 'APBN', 'Erwani Noer', 1, 'Febriyanti Novita Mara', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195712091982022001', '9196121053', 'Faridawaty', 2, 'Tanjung Karang', '1957-12-09', '1374025104571989', '', '2541735636300013', 3, 2, '', 1, 'Perumahan Kubang Duo B.12 Koto Panjang', '0', '0', '', 'Bukik Batabuah', 'Kec. Candung', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Perpustakaan', 1, '40250/C/2/82', '1982-02-01', '3730/III/KWPK-82', '1982-11-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Bawai Yahya', 1, 'Adwar. Bac', '', 'Karyawan Swasta', '1983-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928370202000', 'INDONESIA', ''),
('195806161984000005', '7624040793', 'Fauzana Fitri zalona', 1, 'Bukittinggi', '1988-05-27', '1374025104571989', '', '', 2, 3, '', 1, 'Jl.Soekarno Hatta No.17', '4', '0', '', 'Bukit Surungan', 'Kec. Padang Panjang Barat', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '', '2015-07-13', 'Kepala Sekolah', 1, '', 'Sekolah', 'Floria Napolis', 1, 'Ahmad SYukri', '', 'Karyawan Swasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196307251987112001', '11531841010', 'Firdawati', 2, 'Bukittinggi', '1963-07-25', '1374025104571989', '', '7057741642300003', 3, 2, '', 1, 'Jl.Hamka No.15', '3', '6', '', 'tarok dipo', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '1000/IV.E/Kwpk-1987', '1987-11-01', '1989', '1989-05-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Rosmanidar', 1, 'Syuhrawardi', '', 'Pensiunan', '1989-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '152702387202000', 'INDONESIA', ''),
('197908232006042004', '9248811582', 'Fitria Lisa', 2, 'Sungai Tanang', '1979-08-23', '1374025104571989', '', '4155757659302005', 3, 2, '', 1, 'Pandan Gadang', '0', '0', '', 'Sungai Tanang', 'Kec. Banuhampu', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/007-5D/BKD-2006', '2006-04-01', '813/007-5D/BKD-2006', '2007-08-01', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Yarmiati', 1, 'Asrial', '', 'Wiraswasta', '2007-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476473566202000', 'INDONESIA', ''),
('196005151984032003', '6013967263', 'Floria Napolis', 2, 'Tanjung Pandan', '1960-05-15', '1374025104571989', '', '5847738639300052', 3, 2, '', 1, 'Jl.Soekarno Hatta No.17', '0', '0', '', 'Bukit Surungan', 'Kec. Padang Panjang Barat', 21175, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Laboratorium', 1, '78167/C/K.IV.I/84', '1984-03-01', '812/IV/KWPK-86', '1986-02-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Marni', 2, '', '', 'Tidak bekerja', '1986-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928339202000', 'INDONESIA', ''),
('197305292003122001', '9957969597', 'Frimayasti', 2, 'Bukittinggi', '1973-05-29', '1374025104571989', '', '3861751653300012', 3, 2, '', 1, 'Jl.Bahder Johan No.43', '2', '5', '', 'Puhun Tembok', 'Kec. Mandiangin Koto Selayan', 26124, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '800.05/25/WK-PYK/2004', '2003-12-01', '800', '2003-12-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Wanimar', 1, 'A.Chandra', '', 'Wiraswasta', '2005-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '671678688204000', 'INDONESIA', ''),
('196310031988032002', '6209675109', 'Hanifah', 2, 'Bukittinggi', '1963-10-03', '1374025104571989', '', '4335741644300013', 3, 2, '', 1, 'Sanjai Dalam No.32', '0', '0', '', 'Manggis Ganting', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '53766/A.2.IV/c/1998', '1998-03-01', '53766/A.2.IV/c/1998', '1998-03-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Upik', 1, 'Ari Candra', '196401311988031003', '3/TNI/Polri', '1989-07-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('198105182009011003', '8809034779', 'Herman Novia Rozi', 1, 'Kab.Lima Puluh Kota', '1981-05-18', '1374025104571989', '', '8850759660200002', 3, 2, '', 1, 'Jl. Nurul Huda No. 32 S', '2', '5', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Kepala Laboratorium', 1, '813/081-5D/BKD-2009', '2009-01-01', '813/081-5D/BKD-2009', '2009-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Yurnelis', 1, 'Syafria', '197905272006042003', '3/TNI/Polri', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149385536202000', 'INDONESIA', ''),
('198512152009012003', '6512445304', 'Indrawati', 2, 'Pasaman', '1985-12-15', '1374025104571989', '', '9547763664210073', 3, 2, '', 1, 'Bukit Ambacang', '6', '1', '', 'Kubu Gulai Bancah', 'Kec. Mandiangin Koto Selayan', 26122, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813.3/128/BKPL-2009', '2009-01-01', '813.3/113/BKPL-2010', '2010-10-01', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Helma', 1, 'Faishal Yasin', '', 'Lainnya', '2010-10-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '153409362202000', 'INDONESIA', ''),
('196712271991012002', '7135122386', 'Irma Hadi Surya', 2, 'Bukittinggi', '1967-12-27', '1374025104571989', '', '7559745647300033', 3, 2, '', 1, 'Jl. Bantolaweh 4c', '2', '1', '', 'Kayu Kubu', 'Kec. Guguk Panjang', 26115, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '5182/A2IV/IC/1991', '1991-01-01', '5182/A2IV/IC/1991', '1991-01-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Syamsidar', 1, 'Darwin', '', 'Wiraswasta', '1992-07-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '776386260202000', 'INDONESIA', ''),
('198401272005012003', '10503708401', 'Irma Yunita', 2, 'Kab. Agam', '1984-01-27', '1374025104571989', '', '', 3, 1, '', 1, 'Jl.Jendral Sudirman', '2', '2', '', 'Birugo', 'Kec. Aur Birugo Tigo Baleh', 26138, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813-117/5D-BKD/2005', '2005-01-01', '821/106-3D/BKD-2006', '2006-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Suryati', 1, 'Muhammad Fauzi Zen', '198408252005011003', '3/TNI/Polri', '2006-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '165216417202000', 'INDONESIA', ''),
('195806161984000006', '12209471584', 'Jusnawita', 2, 'Bukittinggi', '1976-09-22', '1374025104571989', '', '2754754658300002', 4, 2, '', 1, 'Jl.Raya Tigo Baleh No.B', '0', '0', '', 'Pakan Labuah', 'Kec. Aur Birugo Tigo Baleh', 26134, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '', '2015-07-13', 'Ketua Yayasan', 1, '', 'Yayasan', 'Suarni', 1, 'Hendri Satria', '', 'Wiraswasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196207071989032002', '10632529451', 'Khairiati', 2, 'Curup', '1962-07-07', '1374025104571989', '', '8039740641300033', 3, 2, '', 1, 'Jl.Merak No. 185 Perumnas Kubang Putih', '0', '0', 'Kampuang Nan V', 'Kubang Putih', 'Kec. Banuhampu', 26181, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '881/IV.E/Kwpk-1989', '1989-03-01', '881/IV.E/Kwpk-1989', '1989-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Kamiar', 1, 'Anwar', '196501041987081001', '3/TNI/Polri', '1990-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928297202000', 'INDONESIA', ''),
('197705032009012002', '10899664884', 'Khairina Hafni', 2, 'Bukittinggi', '1977-05-03', '1374025104571989', '', '8835755657300022', 3, 2, '', 1, 'Jorong Sungai Tanang Ketek', '0', '0', '', 'Sungai Tanang', 'Kec. Banuhampu', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/100-5D/BKD-2009', '2009-01-01', '821/060-3D/BKD-2010', '2010-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Suhasma', 1, 'Aruza', '', 'Karyawan Swasta', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149385528202000', 'INDONESIA', ''),
('195904211984031004', '10331600624', 'Krisnal Razali', 1, 'Lubuk Basung', '1959-04-21', '1374025104571989', '', '5753737638200022', 3, 2, '', 1, 'Komplek PU 2977 Merapi', '0', '0', '', 'Puhun Tembok', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/876/DISDIKBKT/TU-08', '2008-01-16', '822/876/DISDIKBKT/TU-08', '2008-01-16', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Jawaher', 1, 'NIBRAS', '196209071984032001', '3/TNI/Polri', '2008-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '473928371202000', 'INDONESIA', ''),
('198011132009012004', '6689873028', 'Kurnia Mira Lestari', 2, 'Payakumbuh', '1980-11-13', '1374025104571989', '', '4445758660300033', 3, 2, '', 1, 'Jl.Ipuh Mandiangin', '6', '2', '', 'Campago Ipuh', 'Kec. Mandiangin Koto Selayan', 26121, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813.3/142/BKPL-2009', '2009-01-01', '813.3/304/BKPL-2010', '2010-10-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Nursyamsianis', 1, 'Husnul Qadry', '', 'Sudah Meninggal', '2010-10-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197001122007012005', '10089131297', 'Lasmiyenti', 2, 'Bukittinggi', '1970-01-12', '1374025104571989', '', '5444748650300002', 3, 2, '', 1, 'Ladang Cangkiah', '2', '2', '', 'Ladang Cangkiah', 'Kec. Aur Birugo Tigo Baleh', 26135, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/255-5D/BKD-2007', '2007-01-01', '821/171-3D/BKD.2008', '2007-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Nurbaiti', 1, 'Firdaus', '', 'Wiraswasta', '2008-11-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149838688200200', 'INDONESIA', ''),
('196411041994122001', '11472334134', 'Leli Novianti', 2, 'Bukittinggi', '1964-11-04', '1374025104571989', '', '3436742644300033', 3, 2, '', 1, 'Jl.Jambu No.22', '2', '3', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '85052Acc1994', '1994-12-01', '83052/al/1994', '1994-11-12', 'Ketua Yayasan', 1, '', 'APBN', 'Nurjanah Amin', 1, 'Zaifuli Anri Kasiah', '196309171994031003', '3/TNI/Polri', '1996-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197505102006042004', '8190573513', 'Leni Marlina', 2, 'Lundang', '1975-05-10', '1374025104571989', '', '3842753655300052', 3, 2, '', 1, 'Lundang', '0', '0', '', 'Lundang', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '188.45/276/821.13/KTPS/WSL/BKD-2006', '2006-04-01', '188.45/031/821.13/KPTS/WSL/BKD-2007', '2007-08-01', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Yurnida', 1, 'Rudi Arpono', '', 'Wiraswasta', '2007-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '480991330201000', 'INDONESIA', ''),
('195806161984000007', '7535865371', 'Lidya Puspita Sari', 2, 'Bukittinggi', '1984-08-05', '1374025104571989', '', '', 1, 1, '', 1, 'Jl.Kehamikam', '4', '2', '', 'Belakang Balok', 'Kec. Aur Birugo Tigo Baleh', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.290.SMA.3.Bkt-2010', '2010-07-01', 'Komite Sekolah', 1, '', 'Sekolah', 'Nurlela', 1, 'Abdurrohman Hasyim', '', 'Karyawan Swasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196608201993032006', '7473038696', 'Lili Suyani', 2, 'Agam', '1966-08-20', '1374025104571989', '', '8152744647300033', 3, 4, '', 1, 'simpang empat padang lua', '0', '0', 'padang lua', 'banuhampu', 'Kec. Banuhampu', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '271/IV.E/KWPK-1993', '1993-03-01', '3234/IV/KWPK-1994', '1994-06-01', 'Pemerintah Propinsi', 1, '', 'APBN', 'Erma', 1, 'Yonnofa Hendri', '', 'Petani', '1994-06-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196002071984031003', '9123029747', 'M.Nasir', 1, 'Bukittinggi', '1960-02-07', '1374025104571989', '', '5539738639200022', 3, 2, '', 1, 'Jl.H.Abdul Manan', '0', '0', '', 'Campago Ipuh', 'Kec. Mandiangin Koto Selayan', 26121, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '41607/c/KIV.I/84', '1984-03-01', '4267/III/KWPK-88', '1988-03-01', 'Pemerintah Propinsi', 1, '', 'APBN', 'Jani', 1, 'Azuhelmi', '', 'Tidak bekerja', '1986-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196412271989032005', '10926897207', 'Maria Magdalena', 2, 'Payakumbuh', '1964-12-27', '1374025104571989', '', '5559742644300043', 3, 2, '', 1, 'Koto Tuo Nagari Panyalaian', '0', '0', '', 'Koto Tuo', 'Kec. Sepuluh Koto', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '431/IV.E/KWPK-1989', '1989-03-01', '431/IV.E/KWPK-1989', '1989-03-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Nazria', 1, 'Dedy Fernando', '', 'Wiraswasta', '1989-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195903161984031001', '8361693528', 'Masrafli', 1, 'Padang', '1959-03-16', '1374025104571989', '', '1648737639200022', 3, 2, '', 1, 'Jl.Titih Padang Tarok', '0', '0', '', '-', 'Kec. Baso', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '30/01/1986', '1984-03-01', '42254/C/K.IV.1/84', '1984-03-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'SAIDAH', 1, 'ILHAM AZIZ', '', 'Tidak bekerja', '1986-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928164202000', 'INDONESIA', ''),
('195904031982021006', '10027776225', 'Masril Hakim', 1, 'Bukittinggi', '1959-04-03', '1374025104571989', '', '7735737638200022', 3, 2, '', 1, 'Sawah Sianik', '1', '1', '', 'Nan Balimo', 'Kec. Tanjung Harapan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '39863/C/2/82', '1982-02-01', '1052/III/KWPK/1994', '1994-04-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Upik Aji', 1, 'Deswita', '195412181982112001', '3/TNI/Polri', '1984-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470687202000', 'INDONESIA', ''),
('195806161984000008', '6150097274', 'Megawati', 2, 'Bukittinggi', '1985-02-28', '1374025104571989', '', '', 2, 2, '', 1, 'Jl. Prof. M. Yamin, SH', '1', '1', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26131, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.642.SMA.3 Bkt-2015', '2015-07-06', 'Kepala Sekolah', 1, '', 'Sekolah', 'Epi Anis', 1, 'Mondri Efendi', '198401162011011002', '3/TNI/Polri', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195608041980032002', '8301725723', 'Meiri Hasnetty', 2, 'Bukittinggi', '1956-08-04', '1374025104571989', '', '2136734635300013', 3, 2, '', 1, 'Jl. H. Abdul Manan', '3', '1', '', 'Campago Guguak Bulek', 'Kec. Mandiangin Koto Selayan', 26128, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '23800/C/2/1980', '1980-03-01', '238000/C/2/1980', '1980-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Rukayah', 1, 'Drs. Herman Ladri', '195911051979121001', '3/TNI/Polri', '1981-09-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928487202000', 'INDONESIA', ''),
('198710052010012011', '10789201352', 'Meliya Defrina', 2, 'Agam', '1987-10-05', '1374025104571989', '', '', 3, 1, '', 1, 'Jl.Perintis Kemerdekaan No.146', '1', '2', '', 'jati', 'Kec. Padang Timur', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/119-5D/BKD-2010', '2010-01-01', '821/159-3D/BKD-2011', '2011-05-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Ratna Ernita', 1, 'Muhamad Farid', '', 'Karyawan Swasta', '2011-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196403171988032004', '10137126327', 'Metraneliza', 2, 'Patapaian', '1964-03-17', '1374025104571989', '', '3649742643300042', 3, 2, '', 1, 'Komplek SMA Negeri 1 Bukittinggi', '0', '0', '', 'Pakan Kurai', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '975/IV.E/Kwpk-1988', '1988-03-01', '822/878/disdik.bkt/tu-2008', '2008-10-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Dahnuir', 1, 'YUSRIZAL', '196205111985121001', '3/TNI/Polri', '1988-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470877202000', 'INDONESIA', ''),
('197412162008012001', '6048892135', 'Mira Fujiati', 2, 'Guguk Tinggi', '1974-12-16', '1374025104571989', '', '7548752654300033', 3, 2, '', 1, 'Jl.Anggur No.2', '4', '3', '', 'Puhun Pintu Kabun', 'Kec. Mandiangin Koto Selayan', 26123, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/253/BKD-2008', '2008-01-01', '22 Tahun 2010', '2010-02-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Zulnani Z', 1, 'Tonrino Hendri', '', 'Wiraswasta', '2010-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196307311989032003', '7467649723', 'Misteti', 2, 'Bukittinggi', '1963-07-31', '1374025104571989', '', '7063741642300023', 3, 2, '', 1, 'Koto Katiak No. 20 Tigo Baleh', '1', '2', 'Koto Katiak No. 20 Tigo Baleh', 'Parit Antang', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah Sarpras', 1, '801/IV.E/KWPK-89', '1989-03-01', '2987/IV/Kwpk-1990', '1989-08-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Hj.Lisdar', 1, 'Yuswar', '-                 ', 'Pensiunan', '1990-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470711202000', 'INDONESIA', ''),
('197508102002122002', '6922436770', 'Murnita', 2, 'Padang Kudo', '1975-08-10', '1374025104571989', '', '7142753655300053', 3, 2, '', 1, 'Padang Kudo Kanagarian Batagak, Agam', '0', '0', '', 'Batagak', 'Kec. Sungai Pua', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah', 1, '870/045/5d/2002', '2002-12-30', '870/045/5d/2002', '2002-12-30', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Ramunas', 1, 'zul azmi', '', 'Petani', '2004-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470828202000', 'INDONESIA', ''),
('196301121987032005', '6574667062', 'Musniar', 2, 'Bukittinggi', '1963-01-12', '1374025104571989', '', '2444741642300032', 3, 2, '', 1, 'pakan kurai', '2', '4', '', 'tarok dipo', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '1108/8.E/KWPK-1987', '1987-03-01', '1108/8.E/KWPK-1987', '1987-03-01', 'Pemerintah Pusat', 1, '', 'APBN', 'ibu', 1, 'Idramayulis', '196104131987031005', '3/TNI/Polri', '1988-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476472980202000', 'INDONESIA', ''),
('195802141982021001', '6471457382', 'Naan', 1, 'Tanah Datar', '1958-02-14', '1374025104571989', '', '6546736638200022', 3, 2, '', 1, 'Jl.Puding Mas No. 20, Bukittinggi', '2', '3', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26131, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '39868/C/2/82', '1982-02-01', '686/III/Kwpk-93', '1993-04-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Halima', 1, 'Aminah', '', 'Lainnya', '1983-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195702161981032002', '6998718105', 'Nadra Juami', 2, 'Solok', '1957-02-16', '1374025104571989', '', '1548735637300012', 3, 2, '', 1, 'Mahkota Mas E.7 Garegeh, Bukittinggi', '3', '1', '', 'Garegeh', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '4739/C/K.IV.1/1984', '1984-01-25', '85476/A2.IV.1/C/1986', '1986-11-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Rostiam', 1, 'Joni Anwar, S.Pd.', '196507171993031010', '3/TNI/Polri', '1986-11-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928206202000', 'INDONESIA', ''),
('195709071984122001', '9944650762', 'Nilusmi', 2, 'Agam', '1957-09-07', '1374025104571989', '', '9239735637300013', 3, 2, '', 1, 'Perumahan Bukittinggi Indah No.3B', '0', '0', '', 'Pakan Labuah', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '823.4/1233/bd-2007', '2008-12-01', '823.4/1233/bd-2007', '2008-12-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Janiah', 1, '', '', 'Tidak bekerja', '2008-12-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('198411032008032001', '9823396230', 'Nofitatri Purnama', 2, 'Jakarta', '1984-11-03', '1374025104571989', '', '2435762663300063', 3, 4, '', 1, 'Kp Tangah', '0', '0', 'Jorong Tigo Kampuang', 'Salo', 'Kec. Baso', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813.3/49/KKD-SWL/2008', '2008-03-01', '821.3/49/KKD-SWL/2010', '2010-03-01', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Ibu', 1, 'Ryantoni', '', 'Wiraswasta', '2010-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149350621203000', 'INDONESIA', ''),
('195806161984000009', '7013893422', 'Nova Camelia', 2, 'Bukittinggi', '1991-11-15', '1374025104571989', '', '', 2, 3, '', 1, 'Panji Jorong Tigo SUrau', '0', '0', '', 'Koto Baru III Jorong', 'Kec. Baso', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '', '2015-07-13', 'Kepala Sekolah', 1, '', 'Sekolah', 'Jasnidar', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196107121984122002', '6599278626', 'Nurlaili', 2, 'Agam', '1961-07-12', '1374025104571989', '', '0044739641300053', 3, 2, '', 1, 'Perum Wisma Ganting Permai No.55F', '3', '0', '', 'Pulai Anak Air', 'Kec. Guguk Panjang', 26125, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '2783/IV.E/KWPK-1985', '1984-12-01', '2783/IV.E/KWPK-1985', '1984-12-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Nurma', 1, 'Sukardi', '196105201987021003', '3/TNI/Polri', '1986-05-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470752202000', 'INDONESIA', ''),
('198605012009011001', '6320145245', 'Oki Surya Ananda', 1, 'Kab.Agam', '1986-05-01', '1374025104571989', '', '7833764665110052', 3, 2, '', 1, 'Kampung Pisang Bansa', '0', '0', '', 'Kamang Mudiak', 'Kec. Kamang Magek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/146-5D/BKD-2009', '2009-01-01', '813/146-5D/BKD-2009', '2009-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Nawibar', 1, 'Fuji Rasyid', '198602212011012001', '3/TNI/Polri', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149385510202000', 'INDONESIA', ''),
('197910182002122002', '6168322730', 'Oktamira', 2, 'Bukittinggi', '1979-10-18', '1374025104571989', '', '3350757659300023', 3, 2, '', 1, 'Jakmesis', '0', '0', 'jr. Koto Marapak', 'Lambah', 'Kec. Ampek Angkek', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '870/013/5D/2002', '2002-12-01', '870/013/5D/2002', '2002-12-01', 'Pemerintah Kab/Kota', 1, '', 'APBN', 'Nurbeti', 1, 'Aswandi. A', '', 'Lainnya', '2004-12-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984000010', '6246610293', 'Putra Alfajri Wanto', 1, 'Bukittinggi', '1990-04-17', '1374025104571989', '', '', 2, 2, '', 1, 'Kayu Rantingan', '0', '0', '', 'Bukik Batabuah', 'Kec. Candung', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.459.SMA.3.BKT-2013', '2013-07-11', 'Kepala Sekolah', 1, '', 'Sekolah', 'Badri Mutia', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197709072003122004', '7093515658', 'Rahmawati', 2, 'Payakumbuh', '1977-09-07', '1374025104571989', '', '2239755656300033', 3, 2, '', 1, 'Jl.Dahlia No.86', '2', '2', '', 'Padang Tinggi', 'Kec. Payakumbuh Barat', 26224, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/050/5D-BKD/2003', '2003-12-01', '813/050/5D-BKD/2003', '2003-12-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Kamsinar', 1, 'Moh. Arief Hidayat', '197203062005011004', '3/TNI/Polri', '2005-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470885202000', 'INDONESIA', ''),
('198208182009012004', '11093179792', 'Rahmawitri', 2, 'Padang', '1982-08-18', '1374025104571989', '', '7150760661300073', 3, 2, '', 1, 'Jl.Terpadu No.19', '4', '4', '', 'Kalumbuk', 'Kec. Kuranji', 25155, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/152-5D/Bkd-2009', '2009-01-01', '813/152-5D/Bkd-2009', '2009-01-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Mariyetti', 1, 'Jonefri', '198106042005011009', '3/TNI/Polri', '2009-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149385551200200', 'INDONESIA', ''),
('196807021995122002', '8647080900', 'Rahmayenti Bustami', 2, 'Bukittinggi', '1968-07-02', '1374025104571989', '', '6034746649300003', 3, 2, '', 1, 'Jl.Sumur', '2', '1', '', 'Koto Selayan', 'Kec. Mandiangin Koto Selayan', 26126, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '65989/A2/Kp/1995', '1995-12-01', '3182/IV/KWPK-1997', '1997-07-07', 'Pemerintah Pusat', 1, '', 'APBN', 'Rosnizar', 1, 'Heri Warman', '', 'Petani', '1997-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476471727202000', 'INDONESIA', ''),
('196802131994032006', '10955865325', 'Rasti Mirza', 2, 'Agam', '1968-02-13', '1374025104571989', '', '2545746648300032', 3, 4, '', 1, 'Kapau', '0', '0', '', 'Kapau', 'Kec. Tilatang Kamang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '33/IV.E/KWPK/1994', '1994-03-01', '1484/IV/KWPK-1995', '1995-07-01', 'Pemerintah Propinsi', 1, '', 'APBN', 'Saemar', 1, 'Muhammad Syawal', '', 'Wiraswasta', '1995-07-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984000011', '9934380663', 'Rezki Putra', 1, 'Payakumbuh', '1987-02-15', '1374025104571989', '', '', 1, 1, '', 1, 'Jorong Padang Ambacang', '0', '0', 'Kenag SItujuah Banda Dalam', 'Kenag SItujuah Banda Dalam', 'Kec. Situjuah Limo Nagari', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.45.sma.3.bkt-2013', '2013-10-13', 'Kepala Sekolah', 1, '', 'Sekolah', 'Asma', 1, 'Marini', '198703012009012002', '3/TNI/Polri', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195806161984000012', '11169739723', 'Riadi', 1, 'Simarpinggan', '1974-10-04', '1374025104571989', '', '2336752656200003', 1, 1, '', 1, 'Komplek SMA Negeri 3 Bukittinggi', '4', '4', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 26117, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '800.669.sma.3.bkt-2012', '2012-09-07', '314/108/29.1/smu.02/kp-22', '2002-07-01', 'Kepala Sekolah', 1, '', 'Sekolah', 'Lasmi', 1, 'Overa Sisna', '', 'Tidak bekerja', '2002-01-07', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197706132006042010', '7141853359', 'Rini', 2, 'Bukittinggi', '1977-06-13', '1374025104571989', '', '2945755656300022', 3, 2, '', 1, 'Jl.Pintu Kabun Gang Kemuning', '2', '4', '', 'Puhun Pintu Kabun', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/091-5D/BKD-2006', '2006-04-01', '821/107-3D/Bkd-2007', '2008-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Zubaidar', 1, 'Ramayana', '', 'Karyawan Swasta', '2008-01-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928230202000', 'INDONESIA', ''),
('198302102009011003', '9834615652', 'Riry Mardiyan', 1, 'Bukittinggi', '1983-02-10', '1374025104571989', '', '9542761662200012', 3, 2, '', 1, 'Jl. Prof M Yamin SH Gang Mengkudu No. 32', '2', '2', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26123, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah Sarpras', 1, '822/498/Disdik-Bkt/KGB-2012', '2009-01-01', '813/172-5D/BKD-2009', '2009-01-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Yusnimar', 1, 'Nadia Fadhila', '', 'Lainnya', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '149385494202000', 'INDONESIA', ''),
('196109291986032004', '8843814922', 'Rismitri', 2, 'Maninjau', '1961-09-29', '1374025104571989', '', '3261739640300043', 3, 2, '', 1, 'Komplek RSAM', '1', '1', '', 'Bukit Apit Puhun', 'Kec. Guguk Panjang', 26114, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '2268/IV.E/Kwpk-1986', '1986-03-01', '2268/IV.E/Kwpk-1986', '1986-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Yulinar', 1, 'NAZDI', '195704131988031001', '3/TNI/Polri', '1988-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928396202000', 'INDONESIA', ''),
('195806161984000013', '9080660033', 'Rozi Kurniawan', 1, 'Sigiran', '1989-07-05', '1374025104571989', '', '', 2, 2, '', 1, 'Jl. Malalak-Sicincin', '0', '0', 'Jorong Sigiran', 'Malalak Utara', 'Kec. Malalak', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.459.SMA.3.Bkt-2013', '2013-07-11', 'Kepala Sekolah', 1, '', 'Sekolah', 'Midiar', 2, '', '', 'Tidak bekerja', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('195608281982032004', '6602719959', 'Salmah', 2, 'Bukittinggi', '1956-08-28', '1374025104571989', '', '', 3, 2, '', 1, 'Jl.H.Miskin No.61 B', '2', '5', '', 'Campago Ipuh', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '01/03/1982', '1982-03-01', '44/199c14/1982', '1983-03-01', 'Pemerintah Pusat', 1, '', 'APBN', 'Yulidar', 1, 'Syaibul Azmi', '', '3/TNI/Polri', '1983-03-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475471768202000', 'INDONESIA', ''),
('196701152014061002', '6771619899', 'Suhardiman', 1, 'Pasaman', '1967-01-15', '1374025104571989', '', '1034743653200003', 5, 1, '', 1, 'Komplek SMA Negeri 3 Bukittinggi', '4', '4', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/041-5D/BKT-2014', '2014-06-01', '30/II08.09.30.03/C-1984', '1984-07-01', 'Kepala Sekolah', 1, '', 'APBN', 'Kamidah', 1, 'Suningsih', '', 'Lainnya', '1984-01-07', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196109081984122001', '8415371999', 'Syamsiwarni', 2, 'Agam', '1961-09-08', '1374025104571989', '', '3240739641300043', 3, 2, '', 1, 'Jl.Cendrawasih I No.145 Perumnas KP.Nan Limo', '0', '0', '', 'Kubang Putih', 'Kec. Guguk Panjang', 26181, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/408/disdik-bkt/tu-08', '1984-12-01', '822/408/disdik-bkt/tu-08', '2008-12-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Upik Ini', 1, '', '', 'Tidak bekerja', '1986-12-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196412051989032005', '9492864858', 'Telfi Yendra', 2, 'Tanah Datar', '1964-12-05', '1374025104571989', '', '8537742644300033', 3, 2, '', 1, 'Jl.Lubuk Bawah No.07, Tangah Jua', '3', '3', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '1434/IVE/Kwpk-89', '1989-03-01', '1434/IVE/Kwpk-89', '1989-03-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Nurmayanis', 1, 'Zulkarnain Rivai', '0602              ', 'Pensiunan', '1990-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928263202000', 'INDONESIA', ''),
('197301032006042005', '9949072850', 'Tuti Triana', 2, 'Pakan Sinayan', '1973-01-03', '1374025104571989', '', '3435751651300002', 3, 2, '', 1, 'Jl.Gurun Panjang No.36G', '1', '6', '', 'Pakan Kurai', 'Kec. Guguk Panjang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/221/Disdik-Bkt/SKT-2011', '2011-01-06', '822/221/Disdik-Bkt/SKT-2011', '2011-01-06', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Chairani', 1, 'Sumarno', '', 'Wiraswasta', '2011-01-06', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928255202000', 'INDONESIA', ''),
('197001091994122001', '8997634237', 'Vera Tri Ningsih', 2, 'Maluku', '1970-01-09', '1374025104571989', '', '2441748649300032', 3, 2, '', 1, 'Jl. Melati 03 Komplek Inkorba', '1', '6', 'Sanjai', 'Campago Guguak Bulek', 'Kec. Mandiangin Koto Selayan', 26128, '0751461692', '081267771344', 'dankrez48@gmail.com', 'Wakil Kepala Sekolah', 1, '84347/A2/C/1994', '1994-12-01', '84347/A2/C/1994', '1994-12-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Hj. Erni Suhaimi', 1, 'Ir. Bambang Winarto', '', 'Wiraswasta', '1997-10-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '148612591204000', 'INDONESIA', ''),
('197906062009012002', '9506385015', 'Vivi Sunarti', 2, 'Balai Talang', '1979-06-06', '1374025104571989', '', '3938757659300042', 3, 2, '', 1, 'Balai Talang', '0', '0', '', 'Balai Talang', 'Kec. Guguak', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '448/108.23.2/SMU.01/KP-2003', '2003-07-17', '448/108.23.2/SMU.01/KP-2003', '2003-07-17', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Ermiati', 1, '', '', 'Tidak bekerja', '2010-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196107051985122003', '8269886920', 'Yelfina', 2, 'Bukittinggi', '1961-07-05', '1374025104571989', '', '0037739641300023', 3, 2, '', 1, 'Jl.Banuhampu Raya No. 306', '0', '0', '', 'Kambung Nan Limo', 'Kec. Banuhampu', 26186, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '12/IV.E/Kwpk-1986', '1985-12-01', '1434/IV/KWPK-1987', '1987-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Yulinar', 1, 'Jaman', '195908171987031004', '3/TNI/Polri', '1987-04-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196306101988032005', '7195711939', 'Yernita', 2, 'Magek', '1963-06-10', '1374025104571989', '', '4942741643300052', 3, 2, '', 1, 'Jl. Bukik Cangang', '1', '2', '', 'Bukik Cangang-Kayu Ramang', 'Kec. Guguk Panjang', 26116, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '279/IV.E/KWPK-88', '1988-03-01', '3839/III/KWPK/KP-1996', '1996-12-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Hj. Ajinar', 1, 'Muhsin Prawira', '', 'Wiraswasta', '1989-07-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470695202000', 'INDONESIA', ''),
('196201081985012001', '12168899139', 'Yetmaliar', 2, 'Lubuk Basung', '1962-01-08', '1374025104571989', '', '9440740641300032', 3, 2, '', 1, 'Parit Rantang Hilir Jorong III Sangkir', '0', '0', '', 'Lubuk Basung', 'Kec. Guguk Panjang', 26415, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '1864/IV.E/Kwpk-1985', '1985-01-01', '3925/IV/Kwpk-1986', '1986-09-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Nurema', 1, 'Asrizal. B', '196012292006041006', '3/TNI/Polri', '1986-09-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470778202000', 'INDONESIA', ''),
('195806161984000014', '7084520969', 'Yosnimar', 2, 'Bukittinggi', '1984-03-09', '1374025104571989', '', '4641762663300032', 1, 1, '', 1, 'Jl.Soekarno Hatta Gang Manunggal No.06, Jangkak', '1', '4', '', 'Campago Ipuh', 'Kec. Mandiangin Koto Selayan', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '800.669.sma.3.bkt-2012', '2012-09-07', '800.669.sma.3.bkt-2006', '2006-07-01', 'Kepala Sekolah', 1, '', 'Sekolah', 'Emi', 1, 'Ilyas Santoni', '', 'Lainnya', '2006-07-17', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('196107101984122001', '6550475455', 'Yulfah Yetti', 2, 'Agam', '1961-07-10', '1374025104571989', '', '1042739640300023', 3, 2, '', 1, 'Jl.Prof.M.Yamin,SH', '0', '0', '', 'Aur Kuning', 'Kec. Guguk Panjang', 26117, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/407/disdik.bkt/tu-2008', '2008-12-01', '822/407/disdik.bkt/tu-2008', '2008-12-01', 'Pemerintah Pusat', 1, '', 'Lainnya', 'Saridan', 1, 'Zamtiardi', '', 'Tidak bekerja', '2008-12-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '593529272202000', 'INDONESIA', ''),
('195806161984000015', '5864246749', 'Yulia Sari', 2, 'Bukittingi', '1986-01-27', '1374025104571989', '', '', 1, 1, '', 1, 'Jl.Padang Gamuak No.16 B', '1', '5', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 26117, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '', '0000-00-00', '800.041.sma.3.bkt-2012', '2012-02-06', 'Kepala Sekolah', 1, '', 'Sekolah', 'Lili Sri', 1, 'Julyanton', '', 'Karyawan Swasta', '0000-00-00', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', '');
INSERT INTO `rb_guru` (`nip`, `password`, `nama_guru`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `nik`, `niy_nigk`, `nuptk`, `id_status_kepegawaian`, `id_jenis_ptk`, `pengawas_bidang_studi`, `id_agama`, `alamat_jalan`, `rt`, `rw`, `nama_dusun`, `desa_kelurahan`, `kecamatan`, `kode_pos`, `telepon`, `hp`, `email`, `tugas_tambahan`, `id_status_keaktifan`, `sk_cpns`, `tanggal_cpns`, `sk_pengangkatan`, `tmt_pengangkatan`, `lembaga_pengangkatan`, `id_golongan`, `keahlian_laboratorium`, `sumber_gaji`, `nama_ibu_kandung`, `id_status_pernikahan`, `nama_suami_istri`, `nip_suami_istri`, `pekerjaan_suami_istri`, `tmt_pns`, `lisensi_kepsek`, `jumlah_sekolah_binaan`, `diklat_kepengawasan`, `mampu_handle_kk`, `keahlian_breile`, `keahlian_bahasa_isyarat`, `npwp`, `kewarganegaraan`, `foto`) VALUES
('195811111982022002', '10669807584', 'Yusnel', 2, 'Matur, Agam', '1958-11-11', '1374025104571989', '', '3443736638300043', 3, 2, '', 1, 'Perumahan Bukittinggi Indah No.B9', '1', '7', '', 'Pakan Labuah', 'Kec. Aur Birugo Tigo Baleh', 26134, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '42091/C/2/82', '1982-02-01', '767/II/C1983', '1983-10-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Raisah', 1, 'MARDIAS', '195710161982031007', '3/TNI/Polri', '1983-10-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '475928214202000', 'INDONESIA', ''),
('196208161990112001', '10218026586', 'Zaitun', 2, 'Matur', '1962-08-16', '1374025104571989', '', '7148740641300053', 3, 1, '', 1, 'Jl.Prof.M.Yamin,SH', '0', '0', '', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26131, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '822/359/DISDIK-B19/BKT-200', '2009-09-15', '1259IV-AKWPK-1990', '1990-11-01', 'Pemerintah Propinsi', 1, '', 'APBD Kabupaten/Kota', 'Syafiah', 1, 'Austani', '195808211986031007', 'Tidak bekerja', '2009-11-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470950202000', 'INDONESIA', ''),
('195801181985121001', '6811574735', 'Zetri Zainal', 1, 'Batu Taba', '1958-01-18', '1374025104571989', '', '5450736639200002', 3, 2, '', 1, 'Jorong Tanah Nyariang', '0', '0', '', 'Batu Taba', 'Kec. Ampek Angkek', 26191, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '119/IV.E/KWPK-86', '1985-12-01', '3095/III/KWPK-98', '1989-09-01', 'Pemerintah Pusat', 1, '', 'APBD Kabupaten/Kota', 'Rukiah', 1, 'Meriza', '', 'Lainnya', '1987-02-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470786202000', 'INDONESIA', ''),
('196911131994122001', '11038361946', 'Zulfiwadris', 2, 'Bukittinggi', '1969-11-13', '1374025104571989', '', '7445747649300023', 3, 2, '', 1, 'baringin', '0', '0', '', 'Gadut', 'Kec. Tilatang Kamang', 0, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '81903/A2/C/1994', '1994-12-01', '3646/IV/Kwpk-1997', '1997-07-01', 'Pemerintah Propinsi', 1, '', 'APBN', 'Rosni', 1, 'Muhammad Syawal', '', '3/TNI/Polri', '1997-07-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '', 'INDONESIA', ''),
('197712282006042005', '9218814438', 'Zulvanisma', 2, 'Situjuh Batur,50Kota', '1977-12-28', '1374025104571989', '', '3560755657300033', 3, 2, '', 1, 'Jl.Khatib Sulaiman, Situjuh Batur', '0', '0', '', 'Situjuah Batua', 'Kec. Situjuah Limo Nagari', 26263, '0751461692', '081267771344', 'dankrez48@gmail.com', '', 1, '813/005-5D/BKD-2006', '2006-04-01', '813/005-5D/BKD-2006', '2006-04-01', 'Pemerintah Kab/Kota', 1, '', 'APBD Kabupaten/Kota', 'Hj. Zulbaidah Ham', 1, 'Satria Irandi', '', 'Peternak', '2007-08-01', 'TIDAK', 0, 'TIDAK', '0', 'TIDAK', 'TIDAK', '476470836202000', 'INDONESIA', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_halaman`
--

CREATE TABLE `rb_halaman` (
  `id_halaman` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `judul_seo` varchar(255) NOT NULL,
  `isi_halaman` text NOT NULL,
  `username` varchar(50) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_halaman`
--

INSERT INTO `rb_halaman` (`id_halaman`, `judul`, `judul_seo`, `isi_halaman`, `username`, `status`) VALUES
(1, 'Selamat Datang di Sistem Pendaftaran Siswa Baru', 'selamat-datang-di-sistem-pendaftaran-siswa-baru', 'Sistem PSB online atau sistem informasi aplikasi penerimaan siswa baru online merupakan produk layanan aplikasi perangkat lunak  yang online real time dan 100%   berbasis web. Sistem   ini   berusaha   memenuhi kebutuhan   masyarakat khususnya  bagi orangtua  dan  calon  siswa  untuk  dapat melaksanakan  pendaftaran  ke sekolah dengan  aman  dan  tertib  dengan menyediakan  fitur  otomasi  proses penerimaan  siswa  baru secara  langsung  menggunakan  media internet,  mulai  dari proses pendaftaran, proses seleksi, hingga pengumuman hasil penerimaan siswa secara langsung nyata melalui internet.\r\n\r\nYayasan lokomedia.web.id didirikan di Padang dengan Akte Notaris Leurentia Siti Nyoman tertanggal 6 Maret 1996.Pada tahun pertama ini dibukalah taman kanak-kanak dan plygroup dengan murid berjumlah 73 orang dan kampusnya berlokasi di jalan Thamrin No.22-25', 'admin', 'psb'),
(2, 'Prosedur Pendaftaran Siswa Baru', 'prosedur-pendaftaran-siswa-baru', 'Melakukan  pendaftaran secara online melalui website psb.dek.sch.id\nMembayar uang pendaftaran sebesar Rp 60.000,00 ke Rekening Sekolah :\nNo Rekening : xxxxxxxxxxxxxx\nAtas Nama : BPN 010 SMAK PADANG\nBRI UNIT PASAR BARU PADANG\n\n<b>Note : Bagi Bapak/Ibuk yang sudah melakukan pembayaran dan konfirmasi harap segera megirim pesan ke nomor 082384116431</b>\n\nUntuk Metode Tansfer.\ndengan format pesan : [jenis metode pembaran] [no_rekening] [nama anak/nama pesera] [nomor_konfirmasi]\nContoh Pesan Metode Transfer : Transfer 111112318923 Annisa Mardatilah QC401\n\nUntuk Metode Setoran.\nInvite/Add ID What\'sApp dengan nomor 081267771344\ndengan format pesan : Kirim foto bukti slip setoran dan nama anak/peserta serta nomor konfirmasi\nContoh Format Pesan Whatsapp : [foto bukti slip setor] Annisa Mardatillah QC401\n\nMenyerahkan berkas dan ketentuan sebagai berikut apabila calon siswa dinyatakan lulus tes online.\nFoto kopi  rapor yang sudah dilegalisasi dari semester I - IV (1 rangkap)\nMemperlihatkan rapor asli\nSehat jasmani dan rohani (diperiksa di  SMK SMAK)\nTidak Buta Warna (diperiksa di SMK SMAK Padang)\nPas foto  warna terbaru ukuran 2x3 sebanyak 2 lembar dan 3X4 sebanyak 3 lembar', 'admin', 'psb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_identitas_sekolah`
--

CREATE TABLE `rb_identitas_sekolah` (
  `id_identitas_sekolah` int(5) NOT NULL,
  `nama_sekolah` varchar(255) NOT NULL,
  `npsn` varchar(50) NOT NULL,
  `nss` varchar(50) NOT NULL,
  `alamat_sekolah` text NOT NULL,
  `kode_pos` int(7) NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `kelurahan` varchar(255) NOT NULL,
  `kecamatan` varchar(255) NOT NULL,
  `kabupaten_kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_identitas_sekolah`
--

INSERT INTO `rb_identitas_sekolah` (`id_identitas_sekolah`, `nama_sekolah`, `npsn`, `nss`, `alamat_sekolah`, `kode_pos`, `no_telpon`, `kelurahan`, `kecamatan`, `kabupaten_kota`, `provinsi`, `website`, `email`) VALUES
(1, 'SMA NEGERI 1 LOKOMEDIA PADANG', '10301989', '4232322', 'JL. PRABOWO, S.Kom, M.Kom', 26175, '0751-190285', 'Linggar Jati', 'Padang Barat', 'Padang', 'Sumatera Barat', 'https://lokomedia.web.id', 'dankrez48@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jadwal_pelajaran`
--

CREATE TABLE `rb_jadwal_pelajaran` (
  `kodejdwl` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_pelajaran` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `paralel` varchar(10) NOT NULL,
  `jadwal_serial` varchar(10) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `hari` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jadwal_pelajaran`
--

INSERT INTO `rb_jadwal_pelajaran` (`kodejdwl`, `id_tahun_akademik`, `kode_kelas`, `kode_pelajaran`, `kode_ruangan`, `nip`, `paralel`, `jadwal_serial`, `jam_mulai`, `jam_selesai`, `hari`, `aktif`) VALUES
(5, 20161, 'X.MIPA.1', 'MK02', 'R003', '195806161984000001', '', '', '23:00:00', '23:30:00', 'Senin', 'Ya'),
(13, 20161, 'X.MIPA.1', 'MK01', 'R003', '195704111980032004', '', '', '09:00:00', '11:30:00', 'Senin', 'Ya'),
(14, 20161, 'X.MIPA.1', 'MK03', 'R004', '195806161984032002', '', '', '08:00:00', '10:30:00', 'Selasa', 'Ya'),
(33, 20162, 'X.MIPA.1', 'MK15', 'R001', '195806161984000002', '00', '00', '08:00:00', '10:00:00', 'Senin', 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jawaban_essai`
--

CREATE TABLE `rb_jawaban_essai` (
  `id_jawaban_essai` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_essai` int(10) NOT NULL,
  `jawaban_essai` text NOT NULL,
  `waktu_tugas` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jawaban_essai`
--

INSERT INTO `rb_jawaban_essai` (`id_jawaban_essai`, `nisn`, `id_pertanyaan_essai`, `jawaban_essai`, `waktu_tugas`) VALUES
(1, '0000261141', 1, 'abdurrahman wahid (Gus Dur)', '2016-03-05 14:16:15'),
(2, '0000261141', 2, '1. Udin Sedunia\r\n2. Sopan Sopian\r\n3. Inul Daratista\r\n4. Angelina Sondak\r\n5. Ruhut Sitompul', '2016-03-05 14:16:11'),
(3, '0000261141', 3, 'Di Kota Padang, Sumatera Barat Kota Padang', '2016-03-05 14:16:08'),
(4, '0000261141', 6, 'Wr Supratman', '2016-03-05 14:16:04'),
(5, '0000240365', 10, '359', '2016-03-05 14:15:41'),
(6, '0000240365', 9, 'PRABOWO, S.Kom, M.Kom', '2016-03-05 14:15:51'),
(7, '9991268756', 10, 'Jawaban dari soal no 1..', '2016-03-09 03:39:36'),
(8, '9991268756', 9, 'Jawaban soal no 2,..', '2016-03-09 03:39:46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jawaban_objektif`
--

CREATE TABLE `rb_jawaban_objektif` (
  `id_jawaban_objektif` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `id_pertanyaan_objektif` int(10) NOT NULL,
  `jawaban` varchar(2) NOT NULL,
  `waktu_objektif` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jawaban_objektif`
--

INSERT INTO `rb_jawaban_objektif` (`id_jawaban_objektif`, `nisn`, `id_pertanyaan_objektif`, `jawaban`, `waktu_objektif`) VALUES
(21, '0000261141', 5, 'a', '2016-03-05 14:16:54'),
(20, '0000261141', 1, 'b', '2016-03-05 14:16:51'),
(19, '0000261141', 2, 'c', '2016-03-05 14:16:48'),
(18, '0000240365', 6, 'a', '2016-03-05 14:22:49'),
(22, '0000240365', 8, 'e', '2016-03-05 14:16:40'),
(23, '9991268756', 8, 'a', '2016-03-09 03:39:51'),
(24, '9991268756', 6, 'b', '2016-03-09 03:39:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jenis_kelamin`
--

CREATE TABLE `rb_jenis_kelamin` (
  `id_jenis_kelamin` int(5) NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jenis_kelamin`
--

INSERT INTO `rb_jenis_kelamin` (`id_jenis_kelamin`, `jenis_kelamin`) VALUES
(1, 'Laki-laki'),
(2, 'Perempuan');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jenis_ptk`
--

CREATE TABLE `rb_jenis_ptk` (
  `id_jenis_ptk` int(5) NOT NULL,
  `jenis_ptk` varchar(100) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jenis_ptk`
--

INSERT INTO `rb_jenis_ptk` (`id_jenis_ptk`, `jenis_ptk`, `keterangan`) VALUES
(1, 'Tenaga Administrasi Sekolah', ''),
(2, 'Guru Mapel', ''),
(3, 'Guru BK', ''),
(4, 'Guru Kelas', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_journal_list`
--

CREATE TABLE `rb_journal_list` (
  `id_journal` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `hari` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `jam_ke` varchar(50) NOT NULL,
  `materi` text NOT NULL,
  `keterangan` text NOT NULL,
  `waktu_input` datetime NOT NULL,
  `users` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_journal_list`
--

INSERT INTO `rb_journal_list` (`id_journal`, `kodejdwl`, `hari`, `tanggal`, `jam_ke`, `materi`, `keterangan`, `waktu_input`, `users`) VALUES
(1, 33, 'Jumat', '2016-07-08', '1', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', 'Sebagai pendidik kita tentunya harus mempersiapkan segala sesuatu yang berhubungan dengan administrasi untuk mengajar...dalam kesempatan ini kami akan mencoba membuat draft jurnal kelas', '2016-07-08 08:08:37', '195806161984000002'),
(2, 33, 'Jumat', '2016-07-08', '2', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', 'Jurnal pembelajaran harian merupakan salah satu perangkat pembelajaran yang diperlukan oleh guru guna mencatat pelaksanaan pembelajaran setiap hari. jurnal pembelajaran dapat membantu proses sejauh mana kita telah mengajar serta menghandle siapa saja murid/guru yang tidak masuk atau yang tidak mengikuti proses KBM.', '2016-07-08 09:11:24', '195806161984000002'),
(5, 33, 'Jumat', '2016-07-08', '3', 'Berikut ini merupakan contoh dari enkripsi RSA dan dekripsinya. Parameter yang digunakan disini berupa bilangan kecil.', 'RSA di bidang kriptografi adalah sebuah algoritma pada enkripsi public key. RSA merupakan algoritma pertama yang cocok untuk digital signature seperti halnya ekripsi, dan salah satu yang paling maju dalam bidang kriptografi public key. RSA masih digunakan secara luas dalam protokol electronic commerce, dan dipercaya dalam mengamnkan dengan menggunakan kunci yang cukup panjang.', '2016-07-08 10:33:39', '1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_jurusan`
--

CREATE TABLE `rb_jurusan` (
  `kode_jurusan` varchar(10) NOT NULL,
  `nama_jurusan` varchar(255) NOT NULL,
  `nama_jurusan_en` varchar(255) NOT NULL,
  `bidang_keahlian` varchar(150) NOT NULL,
  `kompetensi_umum` varchar(150) NOT NULL,
  `kompetensi_khusus` varchar(150) NOT NULL,
  `pejabat` varchar(100) NOT NULL,
  `jabatan` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_jurusan`
--

INSERT INTO `rb_jurusan` (`kode_jurusan`, `nama_jurusan`, `nama_jurusan_en`, `bidang_keahlian`, `kompetensi_umum`, `kompetensi_khusus`, `pejabat`, `jabatan`, `keterangan`, `aktif`) VALUES
('MIPA', 'Ilmu Pengetahuan Alam', '', 'Biologi, Fisika, kimia', 'Menguasai Semua Bidang Keahlian', 'Menguasai Semua Bidang Biologi', 'Hasan Bin Mail', 'Ketua Jurusan', '', 'Ya'),
('IPS', 'Ilmu Pengetahuan Sosial', '', '', '', '', '', '', '', 'Ya'),
('BAHASA', 'Jurusan Bahasa', '', 'Bahasa Indonesia', '', '', '', '', '', 'Ya'),
('IBBU', 'Jurusan IBBU', '', '', '', '', '', '', '', 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kategori_elearning`
--

CREATE TABLE `rb_kategori_elearning` (
  `id_kategori_elearning` int(5) NOT NULL,
  `nama_kategori_elearning` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kategori_elearning`
--

INSERT INTO `rb_kategori_elearning` (`id_kategori_elearning`, `nama_kategori_elearning`) VALUES
(1, 'Bahan'),
(2, 'Tugas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kategori_quiz_ujian`
--

CREATE TABLE `rb_kategori_quiz_ujian` (
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kategori_quiz_ujian` varchar(50) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kategori_quiz_ujian`
--

INSERT INTO `rb_kategori_quiz_ujian` (`id_kategori_quiz_ujian`, `kategori_quiz_ujian`) VALUES
(1, 'Quiz Online'),
(2, 'Ujian Online');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kehadiran`
--

CREATE TABLE `rb_kehadiran` (
  `kode_kehadiran` varchar(5) NOT NULL,
  `nama_kehadiran` varchar(20) NOT NULL,
  `nilai` int(2) NOT NULL,
  `bobot` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kehadiran`
--

INSERT INTO `rb_kehadiran` (`kode_kehadiran`, `nama_kehadiran`, `nilai`, `bobot`) VALUES
('H', 'Hadir', 1, '1'),
('I', 'Izin', 1, '0.5'),
('S', 'Sakit', 1, '0.5'),
('A', 'Alpa', 0, '0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kelas`
--

CREATE TABLE `rb_kelas` (
  `kode_kelas` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `kode_ruangan` varchar(10) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kelas`
--

INSERT INTO `rb_kelas` (`kode_kelas`, `nip`, `kode_jurusan`, `kode_ruangan`, `nama_kelas`, `aktif`) VALUES
('X.MIPA.1', '195704111980032004', 'MIPA', 'R001', 'Kelas X IPA 1', 'Ya'),
('X.MIPA.2', '13653450011', 'IPS', 'R002', 'Kelas X IPA 2', 'Ya'),
('X.MIPA.3', '13653450022', 'MIPA', 'R003', 'Kelas X IPA 3', 'Ya'),
('X.MIPA.4', '634534533234', 'MIPA', 'R004', 'Kelas X IPA 4', 'Ya'),
('X.MIPA.5', '63453453354', 'IPS', 'R003', 'Kelas X IPA 5', 'Ya'),
('X.MIPA.6', '13653450022', 'IPS', 'R001', 'Kelas X IPA 6', 'Ya'),
('X.MIPA.7', '634534533234', 'IPS', 'R002', 'Kelas X IPA 7', 'Ya'),
('X.MIPA.8', '13653450011', 'IPS', 'R002', 'Kelas X IPA 8', 'Ya'),
('X.IPS.1', '13653450011', 'IPS', 'R002', 'Kelas X IPS 1', 'Ya'),
('X.IPS.2', '634534533234', 'MIPA', 'R004', 'Kelas X IPS 2', 'Ya'),
('X.IPS.3', '634534533234', 'MIPA', 'R004', 'Kelas X IPS 3', 'Ya'),
('X.IPS.4', '63453453354', 'MIPA', 'R001', 'Kelas X IPS 4', 'Ya'),
('X.IPS.5', '63453453354', 'MIPA', 'R001', 'Kelas X IPS 5', 'Ya'),
('X.IPS.6', '63453453354', 'IPS', 'R003', 'Kelas X IPS 6', 'Ya'),
('XI.MIPA.1', '13653450022', 'MIPA', 'R001', 'Kelas XI IPA 1', 'Ya'),
('XI.MIPA.2', '13653450022', 'MIPA', 'R002', 'Kelas XI IPA 2', 'Ya'),
('XI.MIPA.3', '13653450022', 'MIPA', 'R003', 'Kelas XI IPA 3', 'Ya'),
('XI.MIPA.4', '13653450022', 'MIPA', 'R004', 'Kelas XI IPA 4', 'Ya'),
('XI.MIPA.5', '13653450022', 'MIPA', 'R001', 'Kelas XI IPA 5', 'Ya'),
('XI.MIPA.6', '13653450022', 'MIPA', 'R002', 'Kelas XI IPA 6', 'Ya'),
('XI.IPS.1', '13653450022', 'IPS', 'R003', 'Kelas XI IPS 1', 'Ya'),
('XI.IPS.2', '13653450022', 'IPS', 'R004', 'Kelas XI IPS 2', 'Ya'),
('XI.IPS.3', '13653450022', 'IPS', 'R001', 'Kelas XI IPS 3', 'Ya'),
('XI.IPS.4', '13653450022', 'IPS', 'R002', 'Kelas XI IPS 4', 'Ya'),
('XII.MIPA.1', '13653450022', 'MIPA', 'R003', 'Kelas XII IPA 1', 'Ya'),
('XII.MIPA.2', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 2', 'Ya'),
('XII.MIPA.3', '13653450022', 'MIPA', 'R002', 'Kelas XII IPA 3', 'Ya'),
('XII.MIPA.4', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 4', 'Ya'),
('XII.MIPA.5', '13653450022', 'MIPA', 'R003', 'Kelas XII IPA 5', 'Ya'),
('XII.MIPA.6', '13653450022', 'MIPA', 'R004', 'Kelas XII IPA 6', 'Ya'),
('XII.MIPA.7', '13653450022', 'MIPA', 'R001', 'Kelas XII IPA 7', 'Ya'),
('XII.IPS.1', '13653450022', 'IPS', 'R002', 'Kelas XII IPS 1', 'Ya'),
('XII.IPS.2', '13653450022', 'IPS', 'R003', 'Kelas XII IPS 2', 'Ya'),
('XII.IPS.3', '13653450022', 'IPS', 'R001', 'Kelas XII IPS 3', 'Ya'),
('XII.IPS.4', '13653450022', 'IPS', 'R004', 'Kelas XII IPS 4', 'Ya'),
('XII.IPS.5', '13653450022', 'IPS', 'R002', 'Kelas XII IPS 5', 'Ya'),
('XI.BAHASA', '13653450022', 'BAHASA', 'R001', 'Kelas XI Bahasa', 'Ya'),
('X.IBBU', '13653450022', 'IBBU', 'R002', 'Kelas X IBBU', 'Ya'),
('ANU', '63453453354', 'MIPA', 'R001', 'Kelas X IPA 1', 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kelompok_mata_pelajaran`
--

CREATE TABLE `rb_kelompok_mata_pelajaran` (
  `id_kelompok_mata_pelajaran` int(5) NOT NULL,
  `jenis_kelompok_mata_pelajaran` varchar(50) NOT NULL,
  `nama_kelompok_mata_pelajaran` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kelompok_mata_pelajaran`
--

INSERT INTO `rb_kelompok_mata_pelajaran` (`id_kelompok_mata_pelajaran`, `jenis_kelompok_mata_pelajaran`, `nama_kelompok_mata_pelajaran`) VALUES
(1, 'A', 'Kelompok A (Umum)'),
(2, 'B', 'Kelompok B (Umum)'),
(3, 'C', 'Kelompok C (Peminatan)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kompetensi_dasar`
--

CREATE TABLE `rb_kompetensi_dasar` (
  `id_kompetensi_dasar` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `ranah` enum('pengetahuan','keterampilan','sikap') NOT NULL,
  `kompetensi_dasar` text NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kompetensi_dasar`
--

INSERT INTO `rb_kompetensi_dasar` (`id_kompetensi_dasar`, `kodejdwl`, `ranah`, `kompetensi_dasar`, `waktu_input`) VALUES
(1, 33, 'pengetahuan', 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisannn.', '2016-07-03 08:10:13'),
(2, 33, 'keterampilan', 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisane.', '2016-07-03 09:44:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_kurikulum`
--

CREATE TABLE `rb_kurikulum` (
  `kode_kurikulum` int(5) NOT NULL,
  `nama_kurikulum` varchar(255) NOT NULL,
  `status_kurikulum` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_kurikulum`
--

INSERT INTO `rb_kurikulum` (`kode_kurikulum`, `nama_kurikulum`, `status_kurikulum`) VALUES
(1, 'Kurikulum 2013', 'Ya'),
(2, 'Kurikulum 2016', 'Tidak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_mata_pelajaran`
--

CREATE TABLE `rb_mata_pelajaran` (
  `kode_pelajaran` varchar(20) NOT NULL,
  `id_kelompok_mata_pelajaran` int(3) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `nip` varchar(30) NOT NULL,
  `kode_kurikulum` int(5) NOT NULL,
  `namamatapelajaran` varchar(150) NOT NULL,
  `namamatapelajaran_en` varchar(150) NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kompetensi_umum` text NOT NULL,
  `kompetensi_khusus` text NOT NULL,
  `jumlah_jam` varchar(20) NOT NULL,
  `sesi` varchar(50) NOT NULL,
  `urutan` int(3) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_mata_pelajaran`
--

INSERT INTO `rb_mata_pelajaran` (`kode_pelajaran`, `id_kelompok_mata_pelajaran`, `kode_jurusan`, `nip`, `kode_kurikulum`, `namamatapelajaran`, `namamatapelajaran_en`, `tingkat`, `kompetensi_umum`, `kompetensi_khusus`, `jumlah_jam`, `sesi`, `urutan`, `aktif`) VALUES
('MK01', 1, 'MIPA', '195704111980032004', 1, 'Bahasa Indonesia', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK02', 1, 'IPS', '195806161984000001', 1, 'Matematika', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK03', 2, 'MIPA', '195806161984032002', 1, 'Bahasa Inggris', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK05', 1, 'MIPA', '195806161984000001', 1, 'Aritmatika Dasar', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK04', 3, 'MIPA', '196209051987031007', 1, 'Kalkulus', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK06', 3, 'MIPA', '195806161984000016', 1, 'Pengantar Teknologi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK07', 1, 'IPS', '195901241986032002', 1, 'Sejarah Indonesia', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK08', 1, 'IPS', '196703011992031006', 1, 'Pendidikan Pancasila', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK09', 1, 'IPS', '196812211997022002', 1, 'Pendidikan Agama', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK10', 2, 'IPS', '196312041987031000', 1, 'Seni Budaya', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK11', 2, 'IPS', '198406142009012003', 1, 'Pendidikan Olahraga', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK12', 2, 'MIPA', '198012112005012005', 1, 'Prakarya Kewirausahaan', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK13', 3, 'IPS', '196305141990032003', 1, 'Geografi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK14', 3, 'MIPA', '198312252009022007', 1, 'Ekonomi', '', '2 (SLTA)', 'Isikan Nama Kompetensi Umum', 'Isikan Nama Kompetensi Khusus', '2', '', 0, 'Ya'),
('MK15', 3, 'IPS', '195806161984000002', 1, 'Web Programming', '', '3 (SLTA)', 'Mengenal teknik Pembuatan Web', 'Menguasai Bahasa Pemrograman Web', '3', '', 0, 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_menu`
--

CREATE TABLE `rb_menu` (
  `id_menu` int(5) NOT NULL,
  `id_parent` int(5) NOT NULL DEFAULT 0,
  `nama_menu` varchar(30) NOT NULL,
  `icon` varchar(20) NOT NULL,
  `link` varchar(100) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL DEFAULT 'Ya',
  `urutan` int(3) NOT NULL,
  `status` enum('psb','journal') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_menu`
--

INSERT INTO `rb_menu` (`id_menu`, `id_parent`, `nama_menu`, `icon`, `link`, `aktif`, `urutan`, `status`) VALUES
(1, 0, 'Beranda', 'home', 'index.mu', 'Ya', 1, 'psb'),
(2, 0, 'Aturan & Prosedur', 'th-list', 'halaman-prosedur-pendaftaran-siswa-baru.mu', 'Ya', 2, 'psb'),
(3, 0, 'Jadwal Pelaksanaan', 'calendar', '#', 'Ya', 3, 'psb'),
(4, 0, 'Alur Pendaftaran', 'retweet', '#', 'Ya', 4, 'psb');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_extrakulikuler`
--

CREATE TABLE `rb_nilai_extrakulikuler` (
  `id_nilai_extrakulikuler` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kegiatan` text NOT NULL,
  `nilai` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_extrakulikuler`
--

INSERT INTO `rb_nilai_extrakulikuler` (`id_nilai_extrakulikuler`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `kegiatan`, `nilai`, `deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Mandi-mandii', 87, 'Kegiatan mandi-mandi dilaksanakan di lubuak minturun bersamaan dengan perayaan ulang tahun sekolah.', '1', '2016-04-29 10:11:10'),
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Bakar ayam.', 95, 'Memiliki keterampilan Mengidentifikasi, menyajikan model matematika dan menyelesaikan masalah keseharian.				', '1', '2016-04-29 07:08:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_keterampilan`
--

CREATE TABLE `rb_nilai_keterampilan` (
  `id_nilai_keterampilan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `nilai6` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_keterampilan`
--

INSERT INTO `rb_nilai_keterampilan` (`id_nilai_keterampilan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `nilai6`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 75, 70, 78, 85, 78, 72, 'Mengabstraksi teks cerita pendek, baik secara lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '1', 88, 90, 98, 96, 0, 0, '', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '1', 67, 98, 76, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '1', 87, 88, 0, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '1', 89, 0, 0, 90, 0, 0, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '1', 89, 80, 88, 0, 0, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 87, 90, 94, 93, 88, 83, 'Mengabstraksi teks cerita ulang, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '2', 88, 93, 90, 99, 0, 0, '', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '2', 78, 87, 89, 79, 0, 0, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 98, 95, 79, 77, 'Mengabstraksi teks pantun, baik secara lisan maupun tulisan', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '3', 78, 87, 89, 88, 0, 0, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '3', 70, 78, 87, 90, 0, 0, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 90, 89, 87, 90, 85, 90, 'Menginterpretasi makna teks pantun, baik secara lisan maupun tulisan ', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '4', 87, 88, 83, 89, 0, 0, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 99, 87, 98, 95, 96, 91, 'Menyunting teks cerita ulang, sesuai dengan struktur dan kaidah teks baik secara lisan maupun tulisan', '1', '2016-04-14 08:04:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_pengetahuan`
--

CREATE TABLE `rb_nilai_pengetahuan` (
  `id_nilai_pengetahuan` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kd` varchar(5) NOT NULL,
  `nilai1` float NOT NULL,
  `nilai2` float NOT NULL,
  `nilai3` float NOT NULL,
  `nilai4` float NOT NULL,
  `nilai5` float NOT NULL,
  `deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_pengetahuan`
--

INSERT INTO `rb_nilai_pengetahuan` (`id_nilai_pengetahuan`, `kodejdwl`, `nisn`, `kd`, `nilai1`, `nilai2`, `nilai3`, `nilai4`, `nilai5`, `deskripsi`, `user_akses`, `waktu`) VALUES
(1, 5, '9991268756', '4.1', 89, 90, 89, 95, 90, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(2, 5, '9998218087', '4.1', 90, 88, 90, 98, 96, 'Menganalisis teks cerita pendek, baik melalui lisan maupun tulisan ', '1', '2016-04-11 18:26:32'),
(3, 5, '9998215055', '', 98, 67, 98, 76, 90, '', '1', '2016-04-11 18:26:32'),
(4, 5, '9998214335', '', 88, 87, 88, 0, 0, '', '1', '2016-04-11 18:26:32'),
(5, 5, '9998214151', '', 0, 89, 0, 0, 90, '', '1', '2016-04-11 18:26:32'),
(6, 5, '9997515863', '', 80, 89, 80, 88, 0, '', '1', '2016-04-11 18:26:32'),
(7, 5, '9991268756', '4.2', 90, 87, 90, 94, 94, 'Membandingkan teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:03:27'),
(8, 5, '9998218087', '4.2', 93, 88, 93, 90, 99, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:27'),
(9, 5, '9998215055', '', 87, 78, 87, 89, 79, '', '1', '2016-04-14 08:03:27'),
(10, 5, '9991268756', '4.3', 89, 89, 89, 98, 95, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:03:57'),
(11, 5, '9998218087', '', 87, 78, 87, 89, 88, '', '1', '2016-04-14 08:03:57'),
(12, 5, '9998215055', '', 78, 70, 78, 87, 90, '', '1', '2016-04-14 08:03:57'),
(13, 5, '9991268756', '4.4', 89, 90, 89, 87, 90, 'Membandingkan teks cerita ulang, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:20'),
(14, 5, '9998218087', '', 88, 87, 88, 83, 89, '', '1', '2016-04-14 08:04:20'),
(15, 5, '9991268756', '4.5', 87, 90, 87, 78, 90, 'Menganalisis teks cerita ulang, baik melalui lisan maupun tulisan ', '1', '2016-04-14 08:04:36'),
(16, 5, '9998218087', '', 98, 99, 98, 89, 90, 'Menganalisis teks pantun, baik melalui lisan maupun tulisan', '1', '2016-04-14 08:04:36'),
(18, 5, '9991268756', '4.6', 90, 89, 90, 98, 78, 'Memahami struktur dan kaidah teks cerita pendek, baik melalui lisan maupun tulisan', '1', '2016-04-30 10:50:43');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_pertanyaan_essai`
--

CREATE TABLE `rb_nilai_pertanyaan_essai` (
  `id_nilai_pertanyaan_essai` int(5) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nilai_essai` int(3) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_pertanyaan_essai`
--

INSERT INTO `rb_nilai_pertanyaan_essai` (`id_nilai_pertanyaan_essai`, `id_quiz_ujian`, `nisn`, `nilai_essai`) VALUES
(1, 1, '0000261141', 80),
(2, 4, '0000240365', 70),
(4, 4, '9991268756', 80);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_prestasi`
--

CREATE TABLE `rb_nilai_prestasi` (
  `id_nilai_prestasi` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `jenis_kegiatan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_prestasi`
--

INSERT INTO `rb_nilai_prestasi` (`id_nilai_prestasi`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `jenis_kegiatan`, `keterangan`, `user_akses`, `waktu_input`) VALUES
(2, 20161, '9991268756', 'X.MIPA.1', 'Kegiatan Jalan-jalan sore', 'Memiliki keterampilan merencanakan dan melaksanakan percobaan interferensi gelombang cahaya 				', '1', '2016-04-29 08:09:42');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_sikap`
--

CREATE TABLE `rb_nilai_sikap` (
  `id_nilai_sikap` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `positif` text NOT NULL,
  `negatif` text NOT NULL,
  `deskripsi` text NOT NULL,
  `status` enum('spiritual','sosial') NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_sikap`
--

INSERT INTO `rb_nilai_sikap` (`id_nilai_sikap`, `kodejdwl`, `nisn`, `positif`, `negatif`, `deskripsi`, `status`, `user_akses`, `waktu`) VALUES
(1, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-18 16:38:53'),
(2, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-18 16:38:53'),
(3, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-18 16:39:53'),
(4, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', 'Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-18 16:39:53'),
(5, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:12:48'),
(6, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:12:48'),
(7, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(8, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:05'),
(9, 5, '9998218087', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:05'),
(10, 5, '9991268756', 'Nilai Positif,..', 'Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(11, 5, '0151379251', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(12, 5, '9998218087', 'Isi dengan Nilai Positif,..', 'Isi dengan Nilai Negatif,..', 'Deskripsi Nilai Sikap,..', 'spiritual', '1', '2016-04-29 20:13:34'),
(13, 5, '9999152999', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda', 'Ketaatan beribadah mulai berkembang', 'Selalu bersyukur dan selalu berdoa sebelum melakukan kegiatan serta memiliki toleran pada agama yang berbeda; ketaatan beribadah mulai berkembang', 'spiritual', '1', '2016-04-29 20:13:34'),
(14, 5, '9991268756', 'Isi dengan Nilai Sosial Posisitf 2,..', 'Isi dengan Nilai Sosial Negatif 2,..', 'Isi dengan Nilai Deskripsi Sosial 2,..', 'sosial', '1', '2016-04-29 20:14:07'),
(15, 5, '9998218087', 'Nilai Sosial Posisitf 2,..', 'Nilai Sosial Negatif 2,..', '', 'sosial', '1', '2016-04-29 20:14:07'),
(16, 5, '9999152999', 'Nilai Sosial Posisitf,..', 'Nilai Sosial Negatif,..', 'Nilai Deskripsi Sosial,..', 'sosial', '1', '2016-04-29 20:14:07');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_sikap_semester`
--

CREATE TABLE `rb_nilai_sikap_semester` (
  `id_nilai_sikap_semester` int(10) NOT NULL,
  `id_tahun_akademik` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `spiritual_predikat` varchar(2) NOT NULL,
  `spiritual_deskripsi` text NOT NULL,
  `sosial_predikat` varchar(2) NOT NULL,
  `sosial_deskripsi` text NOT NULL,
  `user_akses` varchar(50) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_sikap_semester`
--

INSERT INTO `rb_nilai_sikap_semester` (`id_nilai_sikap_semester`, `id_tahun_akademik`, `nisn`, `kode_kelas`, `spiritual_predikat`, `spiritual_deskripsi`, `sosial_predikat`, `sosial_deskripsi`, `user_akses`, `waktu_input`) VALUES
(1, 20161, '9991268756', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'B', 'Tingkatkan Nilai anda,..', '1', '2016-04-28 10:10:16'),
(2, 20161, '0151379251', 'X.MIPA.1', 'C', 'Tolong Perbaiki Sikap anda,..', 'D', 'Anda Tidak Berutak,..', '1', '2016-04-28 10:10:16'),
(3, 20161, '0004107204', 'X.MIPA.1', 'A', 'Pertahankan Nilai anda,..', 'C', 'Tolong Perbaiki Sikap anda,..', '1', '2016-04-28 10:10:50');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_nilai_uts`
--

CREATE TABLE `rb_nilai_uts` (
  `id_nilai_uts` int(10) NOT NULL,
  `kodejdwl` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `angka_pengetahuan` float NOT NULL,
  `deskripsi_pengetahuan` text NOT NULL,
  `angka_keterampilan` float NOT NULL,
  `deskripsi_keterampilan` text NOT NULL,
  `waktu_input_uts` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_nilai_uts`
--

INSERT INTO `rb_nilai_uts` (`id_nilai_uts`, `kodejdwl`, `nisn`, `angka_pengetahuan`, `deskripsi_pengetahuan`, `angka_keterampilan`, `deskripsi_keterampilan`, `waktu_input_uts`) VALUES
(1, 5, '9991268756', 85, '', 90, '', '2016-04-15 17:54:05'),
(2, 5, '9998218087', 74, '', 83, '', '2016-04-15 17:54:05'),
(3, 13, '9999152999', 89, '', 90, '', '2016-04-21 18:52:57'),
(4, 14, '9999152999', 85, '', 79, '', '2016-04-21 18:53:14');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pertanyaan_essai`
--

CREATE TABLE `rb_pertanyaan_essai` (
  `id_pertanyaan_essai` int(11) NOT NULL,
  `id_quiz_ujian` int(5) NOT NULL,
  `pertanyaan_essai` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pertanyaan_essai`
--

INSERT INTO `rb_pertanyaan_essai` (`id_pertanyaan_essai`, `id_quiz_ujian`, `pertanyaan_essai`) VALUES
(1, 1, 'Siapakah Nama Presiden ke 5 Indonesia ?'),
(2, 1, 'Sebutkan Nama-nama Pahlawan Revolusi ?'),
(3, 1, 'Dimanakah Terjadinya Perjanjian Linggarjati ?'),
(5, 2, 'Sebutkan Arti Sila Ke 2 ?'),
(6, 2, 'Siapa Nama Pencipta Lagu Indonesia Raya ?'),
(9, 4, 'Siapa Nama Kepa Sekolah Kita ?'),
(10, 4, 'Berapakah Hasil 234 + 125 ?'),
(11, 5, 'kbkbkjbkjbkbk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pertanyaan_objektif`
--

CREATE TABLE `rb_pertanyaan_objektif` (
  `id_pertanyaan_objektif` int(11) NOT NULL,
  `id_quiz_ujian` int(11) NOT NULL,
  `pertanyaan_objektif` text NOT NULL,
  `jawab_a` varchar(255) NOT NULL,
  `jawab_b` varchar(255) NOT NULL,
  `jawab_c` varchar(255) NOT NULL,
  `jawab_d` varchar(255) NOT NULL,
  `jawab_e` varchar(255) NOT NULL,
  `kunci_jawaban` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pertanyaan_objektif`
--

INSERT INTO `rb_pertanyaan_objektif` (`id_pertanyaan_objektif`, `id_quiz_ujian`, `pertanyaan_objektif`, `jawab_a`, `jawab_b`, `jawab_c`, `jawab_d`, `jawab_e`, `kunci_jawaban`) VALUES
(1, 1, 'Gubernur Tertua di Sumbar ?', 'Udin Sedunia', 'Saipul Jamil', 'Roma Irama', 'Fauzi Bahar', '', 'd'),
(2, 1, 'Nama-nama Pahlawan Indonesia ?', 'PRABOWO', 'Taufik Hidayat', 'Ahmad Yani', 'Jokowi', '', 'c'),
(3, 1, 'Dimana Terjadinya Pembunuhan Sukarno ?', 'Padang', 'Payakumbuh', 'Bukit Tinggi', 'Semua Benar', '', 'a'),
(5, 1, 'Sebutkan Arti Sila Ke 2 ?', 'Keadilan Bagi Indonedia', 'Kerakyatan yang dipimpin Ndeso', 'Berjuang Untuk Jadi Lebih Baik', 'Kemanusiaan yang adil dan Beradap', '', 'd'),
(6, 4, 'Siapa Nama Pencipta Lagu Indonesia Raya ?', 'Dewiit Safitri', 'Ahmad Dani', 'Aura Kasih', 'Wr.Supratman', '', 'd'),
(8, 4, 'Siapakah nama Presiden ke 2 Indonesia ?', 'Joko Widodo', 'Susilo Bambang Yudoyono', 'Abdulrahman Wahid', 'Megawati', 'Soeharto', 'e');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pertanyaan_penilaian`
--

CREATE TABLE `rb_pertanyaan_penilaian` (
  `id_pertanyaan_penilaian` int(5) NOT NULL,
  `pertanyaan` varchar(255) NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pertanyaan_penilaian`
--

INSERT INTO `rb_pertanyaan_penilaian` (`id_pertanyaan_penilaian`, `pertanyaan`, `status`, `waktu_input`) VALUES
(1, 'Bagaimana kenyamanan anda di sekolah ini pada |namamatapelajaran| ?', 'diri', '2016-07-03 04:17:29'),
(2, 'Bagaimana kenyamanan anda tehadap teman di sekolah ini ?', 'diri', '2016-07-03 08:12:17'),
(4, 'Apa perbuatan jahat yang pernah teman anda ini lakukan ?', 'teman', '2016-07-08 05:08:10'),
(5, 'Apakah dia teman yang baik?', 'teman', '2016-07-08 08:12:25');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_pertanyaan_penilaian_jawab`
--

CREATE TABLE `rb_pertanyaan_penilaian_jawab` (
  `id_pertanyaan_penilaian_jawab` int(10) NOT NULL,
  `id_pertanyaan_penilaian` int(10) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `nisn_teman` varchar(20) NOT NULL,
  `jawaban` text NOT NULL,
  `status` enum('diri','teman') NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `waktu_jawab` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_pertanyaan_penilaian_jawab`
--

INSERT INTO `rb_pertanyaan_penilaian_jawab` (`id_pertanyaan_penilaian_jawab`, `id_pertanyaan_penilaian`, `nisn`, `nisn_teman`, `jawaban`, `status`, `kode_kelas`, `waktu_jawab`) VALUES
(23, 2, '9991268756', '', 'jjjj', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(12, 4, '9991268756', '0151379251', 'fff', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(11, 5, '9991268756', '0151379251', 'eee', 'teman', 'X.MIPA.1', '2016-07-08 15:21:34'),
(15, 5, '9991268756', '0004107204', 'aaaa', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(16, 4, '9991268756', '0004107204', 'bbbb', 'teman', 'X.MIPA.1', '2016-07-08 15:23:05'),
(17, 5, '9991268756', '9998218087', 'ttt', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(18, 4, '9991268756', '9998218087', 'yyy', 'teman', 'X.MIPA.1', '2016-07-08 15:23:34'),
(24, 1, '9991268756', '', 'kkkk', 'diri', 'X.MIPA.1', '2016-07-08 15:57:55'),
(25, 5, '9991268756', '0007105659', 'hhh', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39'),
(26, 4, '9991268756', '0007105659', 'nnn', 'teman', 'X.MIPA.1', '2016-07-08 15:58:39');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_predikat`
--

CREATE TABLE `rb_predikat` (
  `id_predikat` int(5) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `nilai_a` int(3) NOT NULL,
  `nilai_b` int(3) NOT NULL,
  `grade` varchar(5) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_predikat`
--

INSERT INTO `rb_predikat` (`id_predikat`, `kode_kelas`, `nilai_a`, `nilai_b`, `grade`, `keterangan`) VALUES
(1, '0', 86, 100, 'A', 'Sangat Baik'),
(2, '0', 79, 85, 'B', 'Baik'),
(3, '0', 77, 78, 'C', 'Cukup'),
(4, '0', 0, 77, 'D', 'Kurang'),
(7, 'X.MIPA.1', 85, 100, 'A', 'Sangat Baik'),
(8, 'X.MIPA.1', 70, 84, 'B', 'Baik'),
(9, 'X.MIPA.1', 50, 69, 'C', 'Cukup'),
(10, 'X.MIPA.1', 0, 49, 'D', 'Kurang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_psb_aktivasi`
--

CREATE TABLE `rb_psb_aktivasi` (
  `id_aktivasi` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama_lengkap` varchar(150) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `proses` int(2) NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_psb_aktivasi`
--

INSERT INTO `rb_psb_aktivasi` (`id_aktivasi`, `kode_pendaftaran`, `nama_lengkap`, `status`, `proses`, `waktu_input`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'sma', 1, '2016-06-21 12:11:45'),
(2, 'SMK-20160701085110', 'Dewiit Safitri', 'smk', 1, '2016-06-21 15:04:57'),
(3, 'SMA-20160701085111', 'Tommy Utama', 'sma', 1, '2016-07-01 03:13:12'),
(4, 'SMP-20160701094107', 'Willy Fernando', 'smp', 0, '2016-07-01 09:27:54');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_psb_pendaftaran`
--

CREATE TABLE `rb_psb_pendaftaran` (
  `id_pendaftaran` int(10) NOT NULL,
  `kode_pendaftaran` varchar(50) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `nama_panggilan` varchar(120) NOT NULL,
  `no_induk` varchar(50) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `id_agama` int(5) NOT NULL,
  `anak_ke` varchar(10) NOT NULL,
  `jumlah_saudara` varchar(10) NOT NULL,
  `status_dalam_keluarga` varchar(100) NOT NULL,
  `alamat_siswa` text NOT NULL,
  `no_telpon` varchar(15) NOT NULL,
  `berat_badan` int(5) NOT NULL,
  `tinggi_badan` int(5) NOT NULL,
  `golongan_darah` varchar(5) NOT NULL,
  `penyakit_pernah_diderita` varchar(255) NOT NULL,
  `diterima_dikelas` varchar(50) NOT NULL,
  `diterima_tanggal` date NOT NULL,
  `sekolah_asal` varchar(255) NOT NULL,
  `alamat_sekolah_asal` text NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tempat_lahir_ayah` text NOT NULL,
  `tanggal_lahir_ayah` date NOT NULL,
  `agama_ayah` int(5) NOT NULL,
  `pendidikan_ayah` varchar(100) NOT NULL,
  `pekerjaan_ayah` varchar(255) NOT NULL,
  `alamat_rumah_ayah` text NOT NULL,
  `telpon_rumah_ayah` varchar(15) NOT NULL,
  `alamat_kantor_ayah` text NOT NULL,
  `telpon_kantor_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tempat_lahir_ibu` text NOT NULL,
  `tanggal_lahir_ibu` date NOT NULL,
  `agama_ibu` int(5) NOT NULL,
  `pendidikan_ibu` varchar(100) NOT NULL,
  `pekerjaan_ibu` varchar(255) NOT NULL,
  `alamat_rumah_ibu` text NOT NULL,
  `telpon_rumah_ibu` varchar(15) NOT NULL,
  `alamat_kantor_ibu` text NOT NULL,
  `telpon_kantor_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `alamat_wali` text NOT NULL,
  `no_telpon_wali` varchar(15) NOT NULL,
  `status` enum('sma','smk','smp') NOT NULL,
  `waktu_daftar` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_psb_pendaftaran`
--

INSERT INTO `rb_psb_pendaftaran` (`id_pendaftaran`, `kode_pendaftaran`, `nama`, `nama_panggilan`, `no_induk`, `id_jenis_kelamin`, `tempat_lahir`, `tanggal_lahir`, `id_agama`, `anak_ke`, `jumlah_saudara`, `status_dalam_keluarga`, `alamat_siswa`, `no_telpon`, `berat_badan`, `tinggi_badan`, `golongan_darah`, `penyakit_pernah_diderita`, `diterima_dikelas`, `diterima_tanggal`, `sekolah_asal`, `alamat_sekolah_asal`, `nama_ayah`, `tempat_lahir_ayah`, `tanggal_lahir_ayah`, `agama_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `alamat_rumah_ayah`, `telpon_rumah_ayah`, `alamat_kantor_ayah`, `telpon_kantor_ayah`, `nama_ibu`, `tempat_lahir_ibu`, `tanggal_lahir_ibu`, `agama_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `alamat_rumah_ibu`, `telpon_rumah_ibu`, `alamat_kantor_ibu`, `telpon_kantor_ibu`, `nama_wali`, `alamat_wali`, `no_telpon_wali`, `status`, `waktu_daftar`) VALUES
(1, 'SMA-20160701085110', 'PRABOWO', 'Robby', '5675345', 1, 'Padang', '1989-06-05', 1, '3', '5', 'Anak Kandung', 'Jl. Angkasa Puri, Perundam 4, Blok C No 2', '081267771344', 75, 170, 'O', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Nafnizon (Alm)', 'Payakumbuh', '1975-04-12', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461692', 'Muro Paiti, Kapur IX', '0752786512', 'Yeni Ermawaty', 'Padang', '1974-01-18', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461692', '-', '0', 'Tommy Utama', 'Jl.Ulak Karang Padang', '081266881226', 'sma', '2016-06-22 12:11:45'),
(3, 'SMK-20160701085110', 'Dewiit Safitri', 'Dewi', '5674322', 1, 'Gumarang', '1989-02-12', 1, '3', '5', 'Anak Kandung', 'Jl. Linggar Jati, Padang', '082173054501', 60, 170, 'AB', 'Tdak Pernah', '1', '2016-06-22', 'SMP N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sukarni', 'Gumarang', '1976-12-01', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0753456790', 'Muro Paiti, Kapur IX', '0753445566', 'Mama Dewi', 'Gumarang', '1973-11-11', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0753456790', '-', '0', 'Adeil Putra', 'Jl.Ulak Karang, Padang', '082190871234', 'smk', '2016-06-22 15:04:57'),
(5, 'SMA-20160701085111', 'Tommy Utama', 'Tommy', '5674327', 1, 'Padang', '1985-08-18', 1, '1', '5', 'Anak Kandung', 'Jl. Simpang DPR, Padang', '081266881226', 70, 160, 'AB', 'Tdak Pernah', '1', '2016-07-01', 'SMA N 2 Payakumbuh', 'Jl. Lingar Jati 6, No 16 C', 'Sunandar', 'Payakumbuh', '0004-12-05', 1, 'S1', 'PNS', 'Jl.Gatot Subroto 6, No 7a', '0752461645', 'Muro Paiti, Kapur IX', '0752897855', 'Yunimar', 'Padang', '0000-00-00', 1, 'S1', 'Rumah Tangga', 'Jl.Gatot Subroto 6, No 7a', '0752461645', '-', '0', 'Willy Fernando', 'Jl.Ulak Karang, Padang', '082167771233', 'sma', '2016-07-01 11:19:36');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_psb_pendaftaran_saudara`
--

CREATE TABLE `rb_psb_pendaftaran_saudara` (
  `id_saudara` int(10) NOT NULL,
  `id_pendaftaran` int(10) NOT NULL,
  `nama_saudara` varchar(150) NOT NULL,
  `umur_saudara` int(5) NOT NULL,
  `pendidikan_saudara` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_psb_pendaftaran_saudara`
--

INSERT INTO `rb_psb_pendaftaran_saudara` (`id_saudara`, `id_pendaftaran`, `nama_saudara`, `umur_saudara`, `pendidikan_saudara`) VALUES
(1, 1, 'Willy Fernando', 29, 'S1'),
(2, 1, 'Randy Komara', 25, 'SMA'),
(3, 1, 'Laura Hikmah Izzatin', 18, 'SMA'),
(4, 3, 'Lira Virna', 15, 'SMP'),
(5, 3, 'Airin Stewano', 13, 'SD'),
(10, 5, 'Randy Komara', 25, 'SMA'),
(9, 5, 'Willy Fernando', 28, 'S1'),
(11, 5, 'Laura Hikmah Izzatin', 19, 'SMA');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_quiz_ujian`
--

CREATE TABLE `rb_quiz_ujian` (
  `id_quiz_ujian` int(5) NOT NULL,
  `id_kategori_quiz_ujian` int(5) NOT NULL,
  `kodejdwl` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `batas_waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_quiz_ujian`
--

INSERT INTO `rb_quiz_ujian` (`id_quiz_ujian`, `id_kategori_quiz_ujian`, `kodejdwl`, `keterangan`, `batas_waktu`) VALUES
(4, 1, 5, 'Quiz Online Nilai Akhir Matematika', '2016-04-25 08:54:42'),
(5, 1, 5, 'hhhb', '2016-03-11 16:02:02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_ruangan`
--

CREATE TABLE `rb_ruangan` (
  `kode_ruangan` varchar(10) NOT NULL,
  `kode_gedung` varchar(10) NOT NULL,
  `nama_ruangan` varchar(100) NOT NULL,
  `kapasitas_belajar` int(5) NOT NULL,
  `kapasitas_ujian` int(5) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_ruangan`
--

INSERT INTO `rb_ruangan` (`kode_ruangan`, `kode_gedung`, `nama_ruangan`, `kapasitas_belajar`, `kapasitas_ujian`, `keterangan`, `aktif`) VALUES
('R001', 'G001', 'A.1', 35, 30, '', ''),
('R002', 'G001', 'A.2', 40, 35, '', ''),
('R003', 'G002', 'B.1', 34, 29, '', ''),
('R004', 'G002', 'B.2', 45, 40, '', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_sesi`
--

CREATE TABLE `rb_sesi` (
  `id_sesi` int(5) NOT NULL,
  `nama_sesi` varchar(100) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_sesi`
--

INSERT INTO `rb_sesi` (`id_sesi`, `nama_sesi`, `keterangan`, `aktif`) VALUES
(1, 'Semester 1', '', 'Ya'),
(2, 'Semester 2', '', 'Ya'),
(3, 'Semester 3', '', 'Ya'),
(4, 'Semester 4', '', 'Ya'),
(5, 'Semester 5', '', 'Ya'),
(6, 'Semester 6', '', 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_siswa`
--

CREATE TABLE `rb_siswa` (
  `id_siswa` int(10) NOT NULL,
  `nipd` varchar(10) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(120) NOT NULL,
  `id_jenis_kelamin` int(5) NOT NULL,
  `nisn` varchar(20) NOT NULL,
  `tempat_lahir` varchar(100) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `nik` varchar(50) NOT NULL,
  `id_agama` int(5) NOT NULL,
  `kebutuhan_khusus` varchar(20) NOT NULL,
  `alamat` text NOT NULL,
  `rt` varchar(5) NOT NULL,
  `rw` varchar(5) NOT NULL,
  `dusun` varchar(100) NOT NULL,
  `kelurahan` varchar(100) NOT NULL,
  `kecamatan` varchar(100) NOT NULL,
  `kode_pos` int(10) NOT NULL,
  `jenis_tinggal` varchar(100) NOT NULL,
  `alat_transportasi` varchar(100) NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `hp` varchar(15) NOT NULL,
  `email` varchar(150) NOT NULL,
  `skhun` varchar(50) NOT NULL,
  `penerima_kps` varchar(20) NOT NULL,
  `no_kps` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `nama_ayah` varchar(150) NOT NULL,
  `tahun_lahir_ayah` int(4) NOT NULL,
  `pendidikan_ayah` varchar(50) NOT NULL,
  `pekerjaan_ayah` varchar(100) NOT NULL,
  `penghasilan_ayah` varchar(100) NOT NULL,
  `kebutuhan_khusus_ayah` varchar(100) NOT NULL,
  `no_telpon_ayah` varchar(15) NOT NULL,
  `nama_ibu` varchar(150) NOT NULL,
  `tahun_lahir_ibu` int(4) NOT NULL,
  `pendidikan_ibu` varchar(50) NOT NULL,
  `pekerjaan_ibu` varchar(100) NOT NULL,
  `penghasilan_ibu` varchar(100) NOT NULL,
  `kebutuhan_khusus_ibu` varchar(100) NOT NULL,
  `no_telpon_ibu` varchar(15) NOT NULL,
  `nama_wali` varchar(150) NOT NULL,
  `tahun_lahir_wali` int(4) NOT NULL,
  `pendidikan_wali` varchar(50) NOT NULL,
  `pekerjaan_wali` varchar(100) NOT NULL,
  `penghasilan_wali` varchar(50) NOT NULL,
  `angkatan` int(5) NOT NULL,
  `status_awal` varchar(20) NOT NULL,
  `status_siswa` enum('Aktif','Tidak Aktif') NOT NULL,
  `tingkat` varchar(10) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_jurusan` varchar(10) NOT NULL,
  `id_sesi` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_siswa`
--

INSERT INTO `rb_siswa` (`id_siswa`, `nipd`, `password`, `nama`, `id_jenis_kelamin`, `nisn`, `tempat_lahir`, `tanggal_lahir`, `nik`, `id_agama`, `kebutuhan_khusus`, `alamat`, `rt`, `rw`, `dusun`, `kelurahan`, `kecamatan`, `kode_pos`, `jenis_tinggal`, `alat_transportasi`, `telepon`, `hp`, `email`, `skhun`, `penerima_kps`, `no_kps`, `foto`, `nama_ayah`, `tahun_lahir_ayah`, `pendidikan_ayah`, `pekerjaan_ayah`, `penghasilan_ayah`, `kebutuhan_khusus_ayah`, `no_telpon_ayah`, `nama_ibu`, `tahun_lahir_ibu`, `pendidikan_ibu`, `pekerjaan_ibu`, `penghasilan_ibu`, `kebutuhan_khusus_ibu`, `no_telpon_ibu`, `nama_wali`, `tahun_lahir_wali`, `pendidikan_wali`, `pekerjaan_wali`, `penghasilan_wali`, `angkatan`, `status_awal`, `status_siswa`, `tingkat`, `kode_kelas`, `kode_jurusan`, `id_sesi`) VALUES
(1, '14422', '9991268756', 'AAD SIROJUDIN', 1, '9991268756', 'BUKITTINGGI', '1999-11-14', '1306066910090000', 1, 'Tidak ada', 'PERUMNAS KUBANG PUTIH JL. MERPATI NO.301', '0', '0', '', 'KUBANG PUTIAH', 'Kec. Banuhampu', 26181, '', 'Sepeda motor', '0751-7835083', '082385418021', 'AAD.SIROJUDIN04@GMAIL.COM', '2-12-02-002-002-7   ', 'TIDAK', '', '', 'WASLIM', 1968, 'SMP / sederajat', 'Lainnya', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'TETI MURNI', 1973, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(63, '14423', '0151379251', 'AL FAJRI', 1, '0151379251', 'BUKITTINGGI', '2015-06-27', '1375012610990000', 1, 'Tidak ada', 'JALAN PANORAMA NO 4B', '4', '2', '', 'PANORAMA', 'Kec. Mandiangin Koto Selayan', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '75221487', '085766422330', 'AYI.ALFAJRI@YAHOO.COM', '2-12-02-001-007-2   ', 'TIDAK', '', '', 'EFDIWARMAN', 1964, 'SMA / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'ASYULIANTI', 1969, 'SMA / sederajat', '', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(105, '14424', '0004107204', 'ANDRE THOMOK SIDABUTAR', 1, '0004107204', 'LUBUK BASUNG', '2000-05-16', '', 1, 'Tidak ada', 'MANGGIS GANTING', '0', '0', '', 'MANGGIS', 'Kec. Mandiangin Koto Selayan', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'UNTUNG SARAGI SIDABUTAR', 1966, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'RONA TAMPUBOLON', 1977, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(143, '14425', '9998218087', 'ANNISA SERLINA', 2, '9998218087', 'PEKAN KAMIS', '2000-10-15', '1306095510000000', 1, 'Tidak ada', 'GANTING KOTO TANGAN', '0', '0', 'KOTO TANGAH', 'KOTO TANGAH', 'Kec. Tilatang Kamang', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180361912', '', '2/12/2002', 'TIDAK', '', '', 'NOVIARDI', 1965, 'SMA / sederajat', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'SESNIAR', 1966, 'SMA / sederajat', 'Lainnya', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(214, '14426', '0007105659', 'DAVIN FERDIANSYAH', 1, '0007105659', 'PADANG', '2000-09-06', '1312060609020000', 1, 'Tidak ada', 'JORONG KAMPUNG ALANG', '0', '0', '', 'MUARO KIAWAI', 'Kec. Gunung Tuleh', 26371, 'Kost', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'SYAHRIAL', 1962, 'S1', 'PNS/TNI/Polri', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'DESMINAR', 1965, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(242, '14427', '0000267795', 'DHINDA AMALIA KIFLIA', 2, '0000267795', 'Bukittinggi', '2000-03-01', '1375034103000000', 1, 'Tidak ada', 'JL.Puding Mas no.33-Tabek Gadang-Aur Kuning-Bukittinggi', '1', '2', 'Tabek Gadang', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '0752-31089', '081261631384', 'dhindaamaliakiflianainggolan@yahoo.co.id', '2/12/2002', 'TIDAK', '', '', 'Zulkifli Nainggolan', 1966, 'SMA / sederajat', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'Delfiani', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(335, '14428', '0007011100', 'FARID NAJAH ALDI', 1, '0007011100', 'Jakarta', '2000-04-12', '1306071204000000', 1, 'Tidak ada', 'Tanah  Nyariang', '0', '0', '', 'Batu Taba', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', '', '', '085263312034', '', '2/12/2002', 'TIDAK', '', '', 'endrisman', 1971, 'SMA / sederajat', 'Wiraswasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'Reni', 1972, 'D1', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(369, '14429', '0000261160', 'FELLYA KHAIRANI MONEVY', 2, '0000261160', 'BUKITTINGGI', '2000-07-07', '1306074707000000', 1, 'Tidak ada', 'JORONG PARIT PUTUS,NAGARI AMPANG GADANG,Kec.AMPEK ANGKEK,Kab.AGAM', '0', '0', 'PARIT PUTUS', 'AMPANG GADANG', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', 'Sepeda motor', '', '089629288677', 'FELLYAKHAIRANIMONEVY@YAHOO.co.id', '2-12-02-            ', 'TIDAK', '', '', 'MEDMON HAIKAL', 1969, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'EVI YENDRIANI', 1975, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(378, '14430', '9991261263', 'FERNANDO PRATAMA', 1, '9991261263', 'BUKITTINGGI', '1999-11-08', '1306060811990000', 1, 'Tidak ada', 'JLN.BANUHAMPU RAYA NO.246 PERUMNAS KUBANG PUTIH', '0', '0', '', 'KUBANG PUTIH', 'Kec. Banuhampu', 26181, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '0752-7835136', '08126695672', '', '2/12/2002', 'TIDAK', '', '', 'MUKHLIS', 1970, 'SMA / sederajat', 'Wiraswasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'NENY FEBRIDAL', 1974, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(391, '14431', '9994930260', 'FIRA WARZUKNI', 2, '9994930260', 'KAPECONG', '1999-10-23', '1306151606100010', 1, 'Tidak ada', 'TARUSAN JR HALALANG', '0', '0', '', 'TARUSAN', 'Kec. Kamang Magek', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180050317', '', '2/12/2002', 'TIDAK', '', '', 'JUFRIAL', 1967, 'SMP / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NURAINI', 1967, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(393, '14432', '9991262828', 'FISKA AGNESIA IVONNE', 2, '9991262828', 'BUKITTINGGI', '1999-08-17', '1375035708990000', 1, 'Tidak ada', 'JL BERMAWI GG SIKUMBANG NO.40', '1', '5', '', 'PAKAN LABUAH', 'Kec. Aur Birugo Tigo Baleh', 26134, 'Bersama orang tua', 'Sepeda motor', '0752-33128', '081270018525', 'fiskaivonne@yahoo.co.id', '2/12/2002', 'TIDAK', '', '', 'DOLLY IVONNE', 1972, 'S1', 'Wirausaha', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NERITA ROZA', 1972, 'S1', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(402, '14433', '9991261271', 'FRANKI MAYSI SAPUTRA', 1, '9991261271', 'BUKITTINGGI', '1999-12-22', '1375032212990000', 1, 'Tidak ada', 'JLN PROF M.YAMIN SH/GG.BAMBU KUNING', '1', '1', '', 'AUR KUNING', 'Kec. Aur Birugo Tigo Baleh', 26131, 'Bersama orang tua', 'Jalan kaki', '81267286572', '085835880099', '', '2/12/2002', 'TIDAK', '', '', 'SYAMSI', 1968, 'SMA / sederajat', 'Buruh', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'RAMAINI', 1976, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(425, '14434', '9998214151', 'HABIB NAZLAL FURQANI ZA', 1, '9998214151', 'BUKITTINGGI', '1999-12-25', '1306072512990000', 1, 'Tidak ada', 'SURAU GADANG', '0', '0', '', 'BATU TABA', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '082170223340', '', '2/12/2002', 'TIDAK', '', '', 'ZAINAL ABIDIN', 1973, '', 'Lainnya', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'MASNI KAUSAR', 1975, 'SMP / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(601, '14582', '0000282457', 'MAULANA IMAM MUTTAQIN', 1, '0000282457', 'BUKITTINGGI', '2000-11-23', '1375022311200000', 1, 'Tidak ada', 'JL LAMBAH', '0', '0', '', 'LAMBAH', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085263191812', '', '2/15/2008', 'TIDAK', '', '', 'AMUL HUSNI', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'INANG IDAWATI', 1960, 'D3', 'Sudah Meninggal', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(632, '14436', '0126523169', 'MIFTAHUL RIZKI', 1, '0126523169', 'BUKITTINGGI', '2012-07-11', '1375011108000000', 1, 'Tidak ada', 'JALAN BADAR MALANG,GURUN TANJUNG', '1', '5', '', 'PAKAN KURAI', 'Kec. Guguk Panjang', 26112, 'Bersama orang tua', 'Sepeda motor', '', '082390845212', '', '2/12/2002', 'TIDAK', '', '', 'ARMEN', 1971, 'SMA / sederajat', 'Pedagang Besar', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'SUSI LENI KAMLA', 1977, 'D3', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(713, '14437', '9997515863', 'MUHAMMAD IRSYAD', 1, '9997515863', 'KOTO PANJANG', '1999-03-27', '1306142703990000', 1, 'Tidak ada', 'KOTO PANJANG JORONG KUBANG DUO KOTO PANJANG', '0', '0', '', 'BUKIK BATABUAH', 'Kec. Candung', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081363189725', '', '2-15-08-08-326-048-9', 'TIDAK', '', '', 'GUSTIAR', 1963, 'S1', '', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'BUSRA LINDA YANI', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(743, '14438', '9991261719', 'MUSLIM NURHIDAYAT', 1, '9991261719', 'BUKITTINGGI', '1999-07-29', '1375012907990000', 1, 'Tidak ada', 'JL Diponegoro Parak Tinggi', '5', '4', '', 'Tarok Dipo', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Jalan kaki', '83180593526', '083180593526', '', '2/15/2008', 'TIDAK', '', '', 'erman', 1963, 'SD / sederajat', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'YURNALIS', 1972, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(760, '14439', '0000240365', 'NABILA PUTRI DEAN', 2, '0000240365', 'BUKITTINGGI', '2000-05-27', '1375018705000000', 1, 'Tidak ada', 'JL.JAMBAK MUKO', '0', '0', '', 'BUKIK APIK PUHUN', 'Kec. Guguk Panjang', 26114, 'Bersama orang tua', 'Jalan kaki', '752625226', '083180668265', '', '2/12/2002', 'TIDAK', '', '', 'ALDIAN RIYADI', 1973, 'SMA / sederajat', 'Pedagang Besar', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '082173054501', 'DEFNI ANOM', 1975, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'SILVIANA', 1979, 'SMA / sederajat', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(761, '14440', '9998214335', 'NABILA QOTHRUNNADAA', 2, '9998214335', 'Pasanehan', '1999-12-07', '1306076308030000', 1, 'Tidak ada', 'Pasanehan,Lasi,Kec.Candung', '0', '0', '', 'Lasi', 'Kec. Candung', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081363178970', '', '2/12/2002', 'TIDAK', '', '', 'Edi Karnadi S.pd', 1970, 'S1', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'NOVA', 1973, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(865, '14441', '9998215055', 'PRATIWI RAHMA MAGHFIRA', 2, '9998215055', 'BUKITTINGGI', '1999-12-18', '130606581299000', 1, 'Tidak ada', 'JORONG AIA KACIAK', '0', '0', '', 'KUBANG PUTIAH', 'Kec. Banuhampu', 26181, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085375748022', 'tiwimaghfira18@gmail.com', '2/12/2002', 'YA', '35ab1t26138A06', '', 'FIDDAFEN', 1962, 'SMA / sederajat', 'Petani', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'SUSI FEBRIANTI', 1972, 'SMA / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(873, '14442', '0002882643', 'PUTRI  UTARI', 2, '0002882643', 'BUKITTINGGI', '2000-01-23', '1306106301000000', 1, 'Tidak ada', 'Jorong Sungai Cubadak', '0', '0', 'Jl. Prof. M. Yamin .SH', 'Aur Kuning', 'Kec. Aur Birugo Tigo Baleh', 26117, 'Kost', 'Jalan kaki', '', '081374725376', 'putriazelra@yahoo.com', 'DN-08 DI 1710210    ', 'TIDAK', '', '', 'Dalneri', 1970, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'GUSNITA AHMAD', 1968, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(915, '14443', '0009170412', 'RAHMATNOFRIYANDI', 1, '0009170412', 'BUKITTINGGI', '2000-11-17', '1375011711000000', 1, 'Tidak ada', 'JL.SUTAN SYAHRIR NO.11C TAROK DIPO BUKITTINGGI', '2', '2', '', 'TAROK DIPO', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '082386228422', 'rahmat_novri_yandi@yahoo.com', '2-12-02-002-318-3   ', 'TIDAK', '', '', 'ASRIL', 1958, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'KASMABUTI', 1965, 'SD / sederajat', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(948, '14525', '0005405460', 'RAUDHATUL JANNAH', 2, '0005405460', 'Bukittinggi', '2000-06-15', '1375015506000000', 1, 'Tidak ada', 'Jalan Darussalam', '1', '5', '', 'Pakan Kurai', 'Kec. Guguk Panjang', 26112, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '081994204238', '', '2/12/2002', 'TIDAK', '', '', 'Sabir', 1959, 'SMA / sederajat', 'Pedagang Kecil', 'Kurang dari Rp. 500,000', 'Tidak ada', '', 'Husnimar', 1959, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'Nurlian', 1938, 'SMP / sederajat', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(961, '14445', '0007675125', 'RELA AUFALIA', 2, '0007675125', 'MEDAN', '2000-10-09', '1271104910000000', 1, 'Tidak ada', 'JL.ANGKU SALASAI NO.31 PINCURAN BARU JORONG LIMO KAMPUANG-SUNGAI PUA', '0', '0', 'JORONG LIMO KAMPUANG', 'SUNGAI PUA', 'Kec. Sungai Pua', 0, 'Wali', 'Angkutan umum/bus/pete-pete', '', '085206810208', '', '2/12/2002', 'TIDAK', '', '', 'SAHRIL KOTO', 1965, '', 'Wiraswasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', 'DESYETI SIKUMBANG', 1969, '', 'Tidak bekerja', '', 'Tidak ada', '', 'WIWIT', 1976, '', 'Tidak bekerja', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1057, '14446', '9991384898', 'SALIHUL FAJRI', 1, '9991384898', 'BUKITTINGGI', '1999-09-20', '1375022009990000', 1, 'Tidak ada', 'JL.H.MISKIN', '5', '3', 'PALOLOK', 'CAMPAGO IPUH', 'Kec. Mandiangin Koto Selayan', 26121, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085766069641', '', '2-12-02-001-255-2   ', 'TIDAK', '', '', 'SUYERMAN S SOS', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'MAYESTI SPD', 1963, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1077, '14447', '9991260829', 'SERGIO ROSARIANO WANGGE', 1, '9991260829', 'BUKITTINGGI', '1999-10-13', '1306071310990000', 1, 'Tidak ada', 'ranah jorong batang buo', '0', '0', '', 'biaro gadang', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Mobil pribadi', '', '081993589050', 'sergiowangge@gmail.com', '2-12-02-102-019-6   ', 'TIDAK', '', '', 'Patrisius Fransiskus Wangge', 1969, 'D1', 'Wiraswasta', 'Rp. 5,000,000 - Rp. 20,000,000', 'Tidak ada', '', 'Triwahyuni', 1971, 'S1', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1088, '14448', '0007011850', 'SHINTA TRIANA', 2, '0007011850', 'BUKITTINGGI', '2000-01-20', '1306076001000000', 1, 'Tidak ada', 'AMPANG GADANG,AMPEK ANGKEK,AGAM', '0', '0', 'AMPANG GADANG', 'DESA AMPANG GADANG', 'Kec. Ampek Angkek', 26191, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '7527834143', '081363343066', 'SHINTATRIANA11@YAHOO.CO.ID', '2/12/2002', 'TIDAK', '', '', 'EFENDI', 1961, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ERNAWATI', 1966, 'SMA / sederajat', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1115, '14528', '9993841192', 'SUCI RAHMA ANNISA', 2, '9993841192', 'Bukittinggi', '1999-08-11', '1306065108990000', 1, 'Tidak ada', 'koto baru kubang putiah', '0', '0', 'koto baru', 'kubang putiah', 'Kec. Banuhampu', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085364646559', '', '2/12/2002', 'YA', '35aazj26138A04', '', 'irwan ichsan(ALM)', 1960, 'Lainnya', 'Lainnya', '', 'Tidak ada', '', 'Yenni Aulia', 1968, 'SMA / sederajat', 'Tidak bekerja', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1139, '14450', '0000423077', 'SYIFA KEMALA', 2, '0000423077', 'BUKITTINGGI', '2000-04-06', '1375014604000000', 1, 'Tidak ada', 'JL.BUKITCANGANG NO 4C', '1', '4', '', 'BUKIK CANGANG KAYU RAMANG', 'Kec. Guguk Panjang', 26116, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083180016182', '', '2/12/2002', 'TIDAK', '', '', 'ANSAR', 1954, 'SMP / sederajat', 'Pedagang Besar', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'NOVI ERITA', 1966, 'S1', 'PNS/TNI/Polri', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', 'ANSAR', 1954, 'SMP / sederajat', 'Pedagang Besar', 'Rp. 1,000,000 - Rp. 1,999,999', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1151, '14452', '0000261542', 'THARIFA ANNSA ONNY', 2, '0000261542', 'BUKITTINGGI', '2000-09-13', '1375035309000000', 1, 'Tidak ada', 'JL.BIRUGO INDAH I', '2', '1', '', 'ABTB', 'Kec. Aur Birugo Tigo Baleh', 26138, '', 'Sepeda motor', '', '089621383202', '', '2/12/2002', 'TIDAK', '', '', 'ONNI BERLIAN', 1971, 'D3', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'YULIANTI SYAFRI', 1972, 'D3', 'Karyawan Swasta', 'Rp. 500,000 - Rp. 999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1171, '14453', '0002731714', 'ULFA RAHAYU', 2, '0002731714', 'PAYAKUMBUH', '2000-12-19', '1306075912000000', 1, 'Tidak ada', 'RANAH JORONG BATANG BUO', '0', '0', '', 'BIARO GADANG', 'Kec. Ampek Angkek', 26191, '', 'Angkutan umum/bus/pete-pete', '', '085263851637', '', '2/12/2002', 'TIDAK', '', '', 'ARMANSYAH', 1961, 'SMP / sederajat', 'Wiraswasta', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ALFI YETRI', 1965, 'SMA / sederajat', 'Karyawan Swasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1246, '14454', '0000282184', 'YULI ATHIYA SYAFITRI', 2, '0000282184', 'BUKITTINGGI', '2000-01-10', '1375035001000000', 1, 'Tidak ada', 'Jl. Prof. M. Yamin,SH Gang Kemuning No. 32 B', '2', '1', '', 'AUR KUNING', 'Kec. Aur Birugo Tigo Baleh', 26131, 'Bersama orang tua', 'Jalan kaki', '0752-32492', '082169885383', '', '2/12/2002', 'TIDAK', '', '', 'Drs. YUHARMEN', 1971, 'S1', 'Pedagang Kecil', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'SESMALINDA,SE', 1972, 'S1', 'Tidak bekerja', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1250, '14455', '9991263477', 'YULIA RAHMI', 2, '9991263477', 'BUKITTINGGI', '1999-07-31', '1375017107990000', 1, 'Tidak ada', 'JLN.SUTAN SYAHRIL NO62E', '1', '3', '', 'TAROK DIPO', 'Kec. Guguk Panjang', 26117, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '085364112596', '', '2/12/2002', 'TIDAK', '', '', 'SYAFRIL(ALM)', 0, '', '', '', 'Tidak ada', '', 'TENTIYENORA', 1957, 'SD / sederajat', 'Wiraswasta', 'Rp. 2,000,000 - Rp. 4,999,999', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1260, '14456', '9999152999', 'ZAMRATUL KHAIRANI', 2, '9999152999', 'BUKITTINGGI', '1999-10-18', '', 1, 'Tidak ada', 'BATANG BUO', '0', '0', '', 'AMPEK ANGKEK', 'Kec. Ampek Angkek', 0, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '', '', '2/12/2002', 'TIDAK', '', '', 'SYAMSURIZAL', 1963, 'SD / sederajat', 'Wiraswasta', 'Kurang dari Rp. 500,000', 'Tidak ada', '', 'NOVERNI', 1966, 'SD / sederajat', 'Tidak bekerja', '', 'Tidak ada', '', 'MASRIL HAKIM', 1959, 'S1', 'PNS/TNI/Polri', 'Rp. 5,000,000 - Rp. 20,000,000', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1),
(1268, '14457', '0000261141', 'ZILVA MARDHIYAH', 2, '0000261141', 'bukittinggi', '2000-05-21', '', 1, 'Tidak ada', 'gadut,pekan kamis,tilatang kamang', '0', '0', 'guguak', 'kambing 7', 'Kec. Tilatang Kamang', 26152, 'Bersama orang tua', 'Angkutan umum/bus/pete-pete', '', '083170943756', 'zilvamardhiyah80@gmail.com', '2/15/2008', 'TIDAK', '', '', 'DRS.AFRIZAL S.Si', 1960, '', '', 'Rp. 1,000,000 - Rp. 1,999,999', 'Tidak ada', '', 'ELFIMARIDA S.Pd', 1969, '', 'PNS/TNI/Polri', '', 'Tidak ada', '', '', 1900, '', '', '', 2014, 'Baru', 'Aktif', '(SLTA)', 'X.MIPA.1', 'MIPA', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_sms`
--

CREATE TABLE `rb_sms` (
  `id_sms` int(5) NOT NULL,
  `nohp` varchar(15) NOT NULL,
  `pesan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_sms_autoreply`
--

CREATE TABLE `rb_sms_autoreply` (
  `id_autoreply` int(5) NOT NULL,
  `keyword` varchar(100) NOT NULL,
  `isi_pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_sms_autoreply`
--

INSERT INTO `rb_sms_autoreply` (`id_autoreply`, `keyword`, `isi_pesan`, `waktu`) VALUES
(1, 'REG INFO', 'Diharapkan kepada semua orang tua lebih memperhatikan pergaulan anak-anaknya.', '2016-04-23 08:16:22'),
(2, 'REG KEGIATAN', 'Kegiatan Pramuka 27-04-2016, Kegiatan Paskibra 12-05-2016, Kegiatan Maraton Bersama Guru 16-05-2016.', '2016-04-23 09:23:34');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_sms_inbox`
--

CREATE TABLE `rb_sms_inbox` (
  `id` int(11) NOT NULL,
  `pesan` text DEFAULT NULL,
  `nohp` varchar(20) DEFAULT NULL,
  `waktu` datetime DEFAULT NULL,
  `modem` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_sms_outbox`
--

CREATE TABLE `rb_sms_outbox` (
  `id_outbox` int(5) NOT NULL,
  `nohp` varchar(20) NOT NULL,
  `pesan` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_status_keaktifan`
--

CREATE TABLE `rb_status_keaktifan` (
  `id_status_keaktifan` int(5) NOT NULL,
  `nama_status_keaktifan` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_status_keaktifan`
--

INSERT INTO `rb_status_keaktifan` (`id_status_keaktifan`, `nama_status_keaktifan`, `keterangan`) VALUES
(1, 'Aktif', ''),
(2, 'Tidak Aktif', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_status_kepegawaian`
--

CREATE TABLE `rb_status_kepegawaian` (
  `id_status_kepegawaian` int(5) NOT NULL,
  `status_kepegawaian` varchar(255) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_status_kepegawaian`
--

INSERT INTO `rb_status_kepegawaian` (`id_status_kepegawaian`, `status_kepegawaian`, `keterangan`) VALUES
(1, 'Tenaga Honor Sekolah\n', ''),
(2, 'Guru Honor Sekolah\n', ''),
(3, 'PNS\r\n', ''),
(4, 'GTY/PTY\r\n', ''),
(5, 'CPNS\r\n', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_status_pernikahan`
--

CREATE TABLE `rb_status_pernikahan` (
  `id_status_pernikahan` int(5) NOT NULL,
  `status_pernikahan` varchar(150) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_status_pernikahan`
--

INSERT INTO `rb_status_pernikahan` (`id_status_pernikahan`, `status_pernikahan`, `keterangan`) VALUES
(1, 'Menikah', ''),
(2, 'Belum Menikah', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_tahun_akademik`
--

CREATE TABLE `rb_tahun_akademik` (
  `id_tahun_akademik` int(5) NOT NULL,
  `nama_tahun` varchar(255) NOT NULL,
  `keterangan` text NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_tahun_akademik`
--

INSERT INTO `rb_tahun_akademik` (`id_tahun_akademik`, `nama_tahun`, `keterangan`, `aktif`) VALUES
(20151, 'Semester Ganjil 2015/2016', '2015/2016', 'Ya'),
(20152, 'Semester Genap 2015/2016', '2015/2016', 'Ya'),
(20161, 'Semester Ganjil 2016/2017', '2016/2017', 'Ya'),
(20162, 'Semester Genap 2016/2017', '2016/2017', 'Ya');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_users`
--

CREATE TABLE `rb_users` (
  `id_user` int(5) NOT NULL,
  `username` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `password` text COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telpon` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `jabatan` varchar(150) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'sekolah',
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data untuk tabel `rb_users`
--

INSERT INTO `rb_users` (`id_user`, `username`, `password`, `nama_lengkap`, `email`, `no_telpon`, `jabatan`, `level`, `aktif`) VALUES
(1, 'admin', 'bff0cc42103de1b4721370e84dc24f635a7afeca41198c9b3e03946a1b6b7191d14356408a5e57ce6daf77e6e800c66fac7ab0482d57d48d23e6808e4b562daa', 'Administrator', 'admin@sman3bukittinggi.sch.id', '081267771344', 'Kepala IT', 'superuser', 'Y'),
(2, '196209051987031007', '4f0a97824fd9e90d98c09e68bb726b3427937c8aca281839dc59288176f7f84e29a40706d5dba42b8be88a3734be353d34cd8257545b4828bc02b765fd6bb279', 'Drs. Amri Jaya, M.Pd', 'amri.jaya@gmail.com', '082173054501', 'Kepala Sekolah', 'kepala', 'Y');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rb_users_aktivitas`
--

CREATE TABLE `rb_users_aktivitas` (
  `id_users_aktivitas` int(10) NOT NULL,
  `identitas` varchar(50) NOT NULL,
  `ip_address` varchar(50) NOT NULL,
  `browser` varchar(50) NOT NULL,
  `os` varchar(50) NOT NULL,
  `status` enum('siswa','guru','superuser') NOT NULL,
  `jam` time NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `rb_users_aktivitas`
--

INSERT INTO `rb_users_aktivitas` (`id_users_aktivitas`, `identitas`, `ip_address`, `browser`, `os`, `status`, `jam`, `tanggal`) VALUES
(1, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '10:59:57', '2016-04-13'),
(2, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:00:27', '2016-04-13'),
(3, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:01:44', '2016-04-14'),
(4, '9975540740', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '11:20:43', '2016-04-14'),
(5, '195901241986032002', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '11:21:04', '2016-04-14'),
(6, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:18:06', '2016-04-15'),
(7, '195912121986021004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:32', '2016-04-15'),
(8, '197110292005011003', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:40', '2016-04-15'),
(9, '196109191988031006', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:18:49', '2016-04-16'),
(10, '196202191990032001', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '12:19:02', '2016-04-16'),
(11, '9999344284', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:24', '2016-04-16'),
(12, '9980725248', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:32', '2016-04-16'),
(13, '0006223671', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '12:19:42', '2016-04-16'),
(14, '2', '', ' Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:13:43', '2016-04-23'),
(15, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:15:28', '2016-04-23'),
(16, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:27:20', '2016-04-23'),
(17, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:34:28', '2016-04-23'),
(18, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:36:21', '2016-04-23'),
(19, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:37:05', '2016-04-23'),
(20, '9994030915', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '06:41:40', '2016-04-23'),
(21, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '06:43:49', '2016-04-23'),
(22, '9991268756', '::1', 'Firefox 46.0', 'Windows 7', 'siswa', '06:46:06', '2016-04-23'),
(23, '1', '', ' Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:02:03', '2016-04-23'),
(24, '9980708111', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:03', '2016-04-23'),
(25, '9980720559', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:21:21', '2016-04-23'),
(26, '9991268756', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:22:01', '2016-04-23'),
(27, '9999152999', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'siswa', '07:29:17', '2016-04-23'),
(28, '195704111980032004', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'guru', '08:40:14', '2016-04-23'),
(29, '1', '', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '08:45:52', '2016-04-23'),
(30, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-16'),
(31, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-15'),
(32, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '06:13:18', '2016-04-14'),
(33, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '03:12:26', '2016-04-13'),
(34, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '07:13:18', '2016-04-14'),
(35, '1', '::1', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '05:12:26', '2016-04-13'),
(36, '1', '36.68.12.49', 'Chrome 49.0.2623.112', 'Windows 7', 'superuser', '10:32:19', '2016-04-23'),
(48, '1', '114.4.79.250', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '15:08:36', '2016-04-27'),
(47, '1', '36.84.224.134', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:17:00', '2016-04-27'),
(40, '195704111980032004', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:50:45', '2016-04-27'),
(41, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:54:08', '2016-04-27'),
(42, '9980708111', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:08', '2016-04-27'),
(43, '9980722436', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '07:55:23', '2016-04-27'),
(44, '198605012009011001', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '07:55:38', '2016-04-27'),
(45, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '07:55:51', '2016-04-27'),
(46, '1', '114.4.21.153', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:01:10', '2016-04-27'),
(49, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '20:16:59', '2016-04-27'),
(50, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '08:27:54', '2016-04-28'),
(51, '198710052010012011', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:41:56', '2016-04-28'),
(52, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:42:15', '2016-04-28'),
(53, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '13:12:06', '2016-04-28'),
(54, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '13:30:48', '2016-04-28'),
(55, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '19:15:10', '2016-04-28'),
(56, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:02:22', '2016-04-29'),
(57, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '22:37:57', '2016-04-29'),
(58, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '22:41:40', '2016-04-29'),
(59, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:09:20', '2016-04-29'),
(60, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '23:20:06', '2016-04-29'),
(61, '195704111980032004', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:14:36', '2016-04-30'),
(62, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '06:14:55', '2016-04-30'),
(63, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:18:35', '2016-04-30'),
(64, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '06:19:47', '2016-04-30'),
(65, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:00:28', '2016-04-30'),
(66, '9991268756', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'siswa', '10:01:25', '2016-04-30'),
(67, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:01:44', '2016-04-30'),
(68, '2', '::1', 'Chrome 50.0.2661.87', 'Windows 7', '', '10:02:29', '2016-04-30'),
(69, '196209051987031007', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:02:51', '2016-04-30'),
(70, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '10:37:52', '2016-04-30'),
(71, '195806161984000001', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'guru', '10:58:18', '2016-04-30'),
(72, '1', '::1', 'Chrome 50.0.2661.87', 'Windows 7', 'superuser', '12:57:17', '2016-04-30'),
(74, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '20:17:11', '2016-05-04'),
(75, '1', '::1', 'Chrome 50.0.2661.94', 'Windows 7', 'superuser', '22:34:59', '2016-05-11'),
(76, '1', '::1', 'Chrome 50.0.2661.102', 'Windows 7', 'superuser', '07:21:10', '2016-06-02'),
(77, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '22:52:32', '2016-06-19'),
(78, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:06:29', '2016-06-22'),
(79, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:45:59', '2016-06-22'),
(80, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '07:40:52', '2016-06-23'),
(81, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:41:34', '2016-06-23'),
(82, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '04:56:37', '2016-06-29'),
(83, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:46:48', '2016-07-01'),
(84, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:32:49', '2016-07-02'),
(85, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:37:49', '2016-07-03'),
(86, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:24:00', '2016-07-04'),
(87, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '12:24:55', '2016-07-04'),
(88, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:38:17', '2016-07-04'),
(89, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '16:41:51', '2016-07-04'),
(90, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:45:25', '2016-07-05'),
(91, '195704111980032004', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '09:59:50', '2016-07-05'),
(92, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:12:22', '2016-07-05'),
(93, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '10:34:34', '2016-07-05'),
(94, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '08:09:08', '2016-07-08'),
(95, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '11:15:49', '2016-07-08'),
(96, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '11:32:28', '2016-07-08'),
(97, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:30:18', '2016-07-08'),
(98, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:31:00', '2016-07-08'),
(99, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '13:49:22', '2016-07-08'),
(100, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '13:50:02', '2016-07-08'),
(101, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '15:27:03', '2016-07-08'),
(102, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '15:54:51', '2016-07-08'),
(103, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:36:38', '2016-07-09'),
(104, '9991268756', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'siswa', '06:12:14', '2016-07-09'),
(105, '2', '::1', 'Chrome 51.0.2704.103', 'Windows 7', '', '06:18:50', '2016-07-09'),
(106, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:27:53', '2016-07-09'),
(107, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '06:57:52', '2016-07-09'),
(108, '195806161984000002', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'guru', '07:01:50', '2016-07-09'),
(109, '1', '::1', 'Chrome 51.0.2704.103', 'Windows 7', 'superuser', '05:41:14', '2016-07-10'),
(110, '195806161984000001', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'guru', '17:47:13', '2018-01-22'),
(111, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:51:31', '2018-01-22'),
(112, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '17:54:24', '2018-01-22'),
(113, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '12:50:32', '2018-01-24'),
(114, '1', '::1', 'Chrome 63.0.3239.132', 'Windows 7', 'superuser', '13:00:21', '2018-01-24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `rb_absensi_guru`
--
ALTER TABLE `rb_absensi_guru`
  ADD PRIMARY KEY (`id_absensi_guru`);

--
-- Indeks untuk tabel `rb_absensi_siswa`
--
ALTER TABLE `rb_absensi_siswa`
  ADD PRIMARY KEY (`id_absensi_siswa`);

--
-- Indeks untuk tabel `rb_agama`
--
ALTER TABLE `rb_agama`
  ADD PRIMARY KEY (`id_agama`);

--
-- Indeks untuk tabel `rb_elearning`
--
ALTER TABLE `rb_elearning`
  ADD PRIMARY KEY (`id_elearning`);

--
-- Indeks untuk tabel `rb_elearning_jawab`
--
ALTER TABLE `rb_elearning_jawab`
  ADD PRIMARY KEY (`id_elearning_jawab`);

--
-- Indeks untuk tabel `rb_forum_komentar`
--
ALTER TABLE `rb_forum_komentar`
  ADD PRIMARY KEY (`id_forum_komentar`);

--
-- Indeks untuk tabel `rb_forum_topic`
--
ALTER TABLE `rb_forum_topic`
  ADD PRIMARY KEY (`id_forum_topic`);

--
-- Indeks untuk tabel `rb_gedung`
--
ALTER TABLE `rb_gedung`
  ADD PRIMARY KEY (`kode_gedung`);

--
-- Indeks untuk tabel `rb_golongan`
--
ALTER TABLE `rb_golongan`
  ADD PRIMARY KEY (`id_golongan`);

--
-- Indeks untuk tabel `rb_guru`
--
ALTER TABLE `rb_guru`
  ADD PRIMARY KEY (`nip`);

--
-- Indeks untuk tabel `rb_halaman`
--
ALTER TABLE `rb_halaman`
  ADD PRIMARY KEY (`id_halaman`);

--
-- Indeks untuk tabel `rb_identitas_sekolah`
--
ALTER TABLE `rb_identitas_sekolah`
  ADD PRIMARY KEY (`id_identitas_sekolah`);

--
-- Indeks untuk tabel `rb_jadwal_pelajaran`
--
ALTER TABLE `rb_jadwal_pelajaran`
  ADD PRIMARY KEY (`kodejdwl`);

--
-- Indeks untuk tabel `rb_jawaban_essai`
--
ALTER TABLE `rb_jawaban_essai`
  ADD PRIMARY KEY (`id_jawaban_essai`);

--
-- Indeks untuk tabel `rb_jawaban_objektif`
--
ALTER TABLE `rb_jawaban_objektif`
  ADD PRIMARY KEY (`id_jawaban_objektif`);

--
-- Indeks untuk tabel `rb_jenis_kelamin`
--
ALTER TABLE `rb_jenis_kelamin`
  ADD PRIMARY KEY (`id_jenis_kelamin`);

--
-- Indeks untuk tabel `rb_jenis_ptk`
--
ALTER TABLE `rb_jenis_ptk`
  ADD PRIMARY KEY (`id_jenis_ptk`);

--
-- Indeks untuk tabel `rb_journal_list`
--
ALTER TABLE `rb_journal_list`
  ADD PRIMARY KEY (`id_journal`);

--
-- Indeks untuk tabel `rb_jurusan`
--
ALTER TABLE `rb_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indeks untuk tabel `rb_kategori_elearning`
--
ALTER TABLE `rb_kategori_elearning`
  ADD PRIMARY KEY (`id_kategori_elearning`);

--
-- Indeks untuk tabel `rb_kategori_quiz_ujian`
--
ALTER TABLE `rb_kategori_quiz_ujian`
  ADD PRIMARY KEY (`id_kategori_quiz_ujian`);

--
-- Indeks untuk tabel `rb_kehadiran`
--
ALTER TABLE `rb_kehadiran`
  ADD PRIMARY KEY (`kode_kehadiran`);

--
-- Indeks untuk tabel `rb_kelas`
--
ALTER TABLE `rb_kelas`
  ADD PRIMARY KEY (`kode_kelas`);

--
-- Indeks untuk tabel `rb_kelompok_mata_pelajaran`
--
ALTER TABLE `rb_kelompok_mata_pelajaran`
  ADD PRIMARY KEY (`id_kelompok_mata_pelajaran`);

--
-- Indeks untuk tabel `rb_kompetensi_dasar`
--
ALTER TABLE `rb_kompetensi_dasar`
  ADD PRIMARY KEY (`id_kompetensi_dasar`);

--
-- Indeks untuk tabel `rb_kurikulum`
--
ALTER TABLE `rb_kurikulum`
  ADD PRIMARY KEY (`kode_kurikulum`);

--
-- Indeks untuk tabel `rb_mata_pelajaran`
--
ALTER TABLE `rb_mata_pelajaran`
  ADD PRIMARY KEY (`kode_pelajaran`);

--
-- Indeks untuk tabel `rb_menu`
--
ALTER TABLE `rb_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indeks untuk tabel `rb_nilai_extrakulikuler`
--
ALTER TABLE `rb_nilai_extrakulikuler`
  ADD PRIMARY KEY (`id_nilai_extrakulikuler`);

--
-- Indeks untuk tabel `rb_nilai_keterampilan`
--
ALTER TABLE `rb_nilai_keterampilan`
  ADD PRIMARY KEY (`id_nilai_keterampilan`);

--
-- Indeks untuk tabel `rb_nilai_pengetahuan`
--
ALTER TABLE `rb_nilai_pengetahuan`
  ADD PRIMARY KEY (`id_nilai_pengetahuan`);

--
-- Indeks untuk tabel `rb_nilai_pertanyaan_essai`
--
ALTER TABLE `rb_nilai_pertanyaan_essai`
  ADD PRIMARY KEY (`id_nilai_pertanyaan_essai`);

--
-- Indeks untuk tabel `rb_nilai_prestasi`
--
ALTER TABLE `rb_nilai_prestasi`
  ADD PRIMARY KEY (`id_nilai_prestasi`);

--
-- Indeks untuk tabel `rb_nilai_sikap`
--
ALTER TABLE `rb_nilai_sikap`
  ADD PRIMARY KEY (`id_nilai_sikap`);

--
-- Indeks untuk tabel `rb_nilai_sikap_semester`
--
ALTER TABLE `rb_nilai_sikap_semester`
  ADD PRIMARY KEY (`id_nilai_sikap_semester`);

--
-- Indeks untuk tabel `rb_nilai_uts`
--
ALTER TABLE `rb_nilai_uts`
  ADD PRIMARY KEY (`id_nilai_uts`);

--
-- Indeks untuk tabel `rb_pertanyaan_essai`
--
ALTER TABLE `rb_pertanyaan_essai`
  ADD PRIMARY KEY (`id_pertanyaan_essai`);

--
-- Indeks untuk tabel `rb_pertanyaan_objektif`
--
ALTER TABLE `rb_pertanyaan_objektif`
  ADD PRIMARY KEY (`id_pertanyaan_objektif`);

--
-- Indeks untuk tabel `rb_pertanyaan_penilaian`
--
ALTER TABLE `rb_pertanyaan_penilaian`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian`);

--
-- Indeks untuk tabel `rb_pertanyaan_penilaian_jawab`
--
ALTER TABLE `rb_pertanyaan_penilaian_jawab`
  ADD PRIMARY KEY (`id_pertanyaan_penilaian_jawab`);

--
-- Indeks untuk tabel `rb_predikat`
--
ALTER TABLE `rb_predikat`
  ADD PRIMARY KEY (`id_predikat`);

--
-- Indeks untuk tabel `rb_psb_aktivasi`
--
ALTER TABLE `rb_psb_aktivasi`
  ADD PRIMARY KEY (`id_aktivasi`);

--
-- Indeks untuk tabel `rb_psb_pendaftaran`
--
ALTER TABLE `rb_psb_pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- Indeks untuk tabel `rb_psb_pendaftaran_saudara`
--
ALTER TABLE `rb_psb_pendaftaran_saudara`
  ADD PRIMARY KEY (`id_saudara`);

--
-- Indeks untuk tabel `rb_quiz_ujian`
--
ALTER TABLE `rb_quiz_ujian`
  ADD PRIMARY KEY (`id_quiz_ujian`);

--
-- Indeks untuk tabel `rb_ruangan`
--
ALTER TABLE `rb_ruangan`
  ADD PRIMARY KEY (`kode_ruangan`);

--
-- Indeks untuk tabel `rb_sesi`
--
ALTER TABLE `rb_sesi`
  ADD PRIMARY KEY (`id_sesi`);

--
-- Indeks untuk tabel `rb_siswa`
--
ALTER TABLE `rb_siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- Indeks untuk tabel `rb_sms`
--
ALTER TABLE `rb_sms`
  ADD PRIMARY KEY (`id_sms`);

--
-- Indeks untuk tabel `rb_sms_autoreply`
--
ALTER TABLE `rb_sms_autoreply`
  ADD PRIMARY KEY (`id_autoreply`);

--
-- Indeks untuk tabel `rb_sms_inbox`
--
ALTER TABLE `rb_sms_inbox`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `rb_sms_outbox`
--
ALTER TABLE `rb_sms_outbox`
  ADD PRIMARY KEY (`id_outbox`);

--
-- Indeks untuk tabel `rb_status_keaktifan`
--
ALTER TABLE `rb_status_keaktifan`
  ADD PRIMARY KEY (`id_status_keaktifan`);

--
-- Indeks untuk tabel `rb_status_kepegawaian`
--
ALTER TABLE `rb_status_kepegawaian`
  ADD PRIMARY KEY (`id_status_kepegawaian`);

--
-- Indeks untuk tabel `rb_status_pernikahan`
--
ALTER TABLE `rb_status_pernikahan`
  ADD PRIMARY KEY (`id_status_pernikahan`);

--
-- Indeks untuk tabel `rb_tahun_akademik`
--
ALTER TABLE `rb_tahun_akademik`
  ADD PRIMARY KEY (`id_tahun_akademik`);

--
-- Indeks untuk tabel `rb_users`
--
ALTER TABLE `rb_users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indeks untuk tabel `rb_users_aktivitas`
--
ALTER TABLE `rb_users_aktivitas`
  ADD PRIMARY KEY (`id_users_aktivitas`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `rb_absensi_guru`
--
ALTER TABLE `rb_absensi_guru`
  MODIFY `id_absensi_guru` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rb_absensi_siswa`
--
ALTER TABLE `rb_absensi_siswa`
  MODIFY `id_absensi_siswa` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rb_agama`
--
ALTER TABLE `rb_agama`
  MODIFY `id_agama` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_elearning`
--
ALTER TABLE `rb_elearning`
  MODIFY `id_elearning` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT untuk tabel `rb_elearning_jawab`
--
ALTER TABLE `rb_elearning_jawab`
  MODIFY `id_elearning_jawab` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_forum_komentar`
--
ALTER TABLE `rb_forum_komentar`
  MODIFY `id_forum_komentar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `rb_forum_topic`
--
ALTER TABLE `rb_forum_topic`
  MODIFY `id_forum_topic` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rb_golongan`
--
ALTER TABLE `rb_golongan`
  MODIFY `id_golongan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rb_halaman`
--
ALTER TABLE `rb_halaman`
  MODIFY `id_halaman` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_identitas_sekolah`
--
ALTER TABLE `rb_identitas_sekolah`
  MODIFY `id_identitas_sekolah` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `rb_jadwal_pelajaran`
--
ALTER TABLE `rb_jadwal_pelajaran`
  MODIFY `kodejdwl` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT untuk tabel `rb_jawaban_essai`
--
ALTER TABLE `rb_jawaban_essai`
  MODIFY `id_jawaban_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `rb_jawaban_objektif`
--
ALTER TABLE `rb_jawaban_objektif`
  MODIFY `id_jawaban_objektif` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `rb_jenis_kelamin`
--
ALTER TABLE `rb_jenis_kelamin`
  MODIFY `id_jenis_kelamin` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_jenis_ptk`
--
ALTER TABLE `rb_jenis_ptk`
  MODIFY `id_jenis_ptk` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_journal_list`
--
ALTER TABLE `rb_journal_list`
  MODIFY `id_journal` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_kategori_elearning`
--
ALTER TABLE `rb_kategori_elearning`
  MODIFY `id_kategori_elearning` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_kategori_quiz_ujian`
--
ALTER TABLE `rb_kategori_quiz_ujian`
  MODIFY `id_kategori_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_kelompok_mata_pelajaran`
--
ALTER TABLE `rb_kelompok_mata_pelajaran`
  MODIFY `id_kelompok_mata_pelajaran` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rb_kompetensi_dasar`
--
ALTER TABLE `rb_kompetensi_dasar`
  MODIFY `id_kompetensi_dasar` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_kurikulum`
--
ALTER TABLE `rb_kurikulum`
  MODIFY `kode_kurikulum` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rb_menu`
--
ALTER TABLE `rb_menu`
  MODIFY `id_menu` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=137;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_extrakulikuler`
--
ALTER TABLE `rb_nilai_extrakulikuler`
  MODIFY `id_nilai_extrakulikuler` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_keterampilan`
--
ALTER TABLE `rb_nilai_keterampilan`
  MODIFY `id_nilai_keterampilan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_pengetahuan`
--
ALTER TABLE `rb_nilai_pengetahuan`
  MODIFY `id_nilai_pengetahuan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_pertanyaan_essai`
--
ALTER TABLE `rb_nilai_pertanyaan_essai`
  MODIFY `id_nilai_pertanyaan_essai` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_prestasi`
--
ALTER TABLE `rb_nilai_prestasi`
  MODIFY `id_nilai_prestasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_sikap`
--
ALTER TABLE `rb_nilai_sikap`
  MODIFY `id_nilai_sikap` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_sikap_semester`
--
ALTER TABLE `rb_nilai_sikap_semester`
  MODIFY `id_nilai_sikap_semester` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `rb_nilai_uts`
--
ALTER TABLE `rb_nilai_uts`
  MODIFY `id_nilai_uts` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_pertanyaan_essai`
--
ALTER TABLE `rb_pertanyaan_essai`
  MODIFY `id_pertanyaan_essai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `rb_pertanyaan_objektif`
--
ALTER TABLE `rb_pertanyaan_objektif`
  MODIFY `id_pertanyaan_objektif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `rb_pertanyaan_penilaian`
--
ALTER TABLE `rb_pertanyaan_penilaian`
  MODIFY `id_pertanyaan_penilaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_pertanyaan_penilaian_jawab`
--
ALTER TABLE `rb_pertanyaan_penilaian_jawab`
  MODIFY `id_pertanyaan_penilaian_jawab` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT untuk tabel `rb_predikat`
--
ALTER TABLE `rb_predikat`
  MODIFY `id_predikat` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `rb_psb_aktivasi`
--
ALTER TABLE `rb_psb_aktivasi`
  MODIFY `id_aktivasi` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `rb_psb_pendaftaran`
--
ALTER TABLE `rb_psb_pendaftaran`
  MODIFY `id_pendaftaran` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_psb_pendaftaran_saudara`
--
ALTER TABLE `rb_psb_pendaftaran_saudara`
  MODIFY `id_saudara` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `rb_quiz_ujian`
--
ALTER TABLE `rb_quiz_ujian`
  MODIFY `id_quiz_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_sesi`
--
ALTER TABLE `rb_sesi`
  MODIFY `id_sesi` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rb_siswa`
--
ALTER TABLE `rb_siswa`
  MODIFY `id_siswa` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1270;

--
-- AUTO_INCREMENT untuk tabel `rb_sms`
--
ALTER TABLE `rb_sms`
  MODIFY `id_sms` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `rb_sms_autoreply`
--
ALTER TABLE `rb_sms_autoreply`
  MODIFY `id_autoreply` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_sms_inbox`
--
ALTER TABLE `rb_sms_inbox`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_sms_outbox`
--
ALTER TABLE `rb_sms_outbox`
  MODIFY `id_outbox` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `rb_status_keaktifan`
--
ALTER TABLE `rb_status_keaktifan`
  MODIFY `id_status_keaktifan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_status_kepegawaian`
--
ALTER TABLE `rb_status_kepegawaian`
  MODIFY `id_status_kepegawaian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `rb_status_pernikahan`
--
ALTER TABLE `rb_status_pernikahan`
  MODIFY `id_status_pernikahan` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rb_tahun_akademik`
--
ALTER TABLE `rb_tahun_akademik`
  MODIFY `id_tahun_akademik` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20163;

--
-- AUTO_INCREMENT untuk tabel `rb_users`
--
ALTER TABLE `rb_users`
  MODIFY `id_user` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=107;

--
-- AUTO_INCREMENT untuk tabel `rb_users_aktivitas`
--
ALTER TABLE `rb_users_aktivitas`
  MODIFY `id_users_aktivitas` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;
--
-- Database: `telemarketing`
--
CREATE DATABASE IF NOT EXISTS `telemarketing` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `telemarketing`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `status` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `customer`
--

INSERT INTO `customer` (`id`, `name`, `phone_number`, `status`, `employee_id`) VALUES
(1, 'Ridho', '089608046965', 1, 1),
(2, 'azizi tsel', '0895385160358', 1, 2);

-- --------------------------------------------------------

--
-- Struktur dari tabel `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `employee`
--

INSERT INTO `employee` (`id`, `name`, `username`, `password`) VALUES
(1, 'soleh', 'nursoleh33', 'sukses889'),
(2, 'azizi', 'azizi', '25januari');

-- --------------------------------------------------------

--
-- Struktur dari tabel `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `reason` text NOT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `report`
--

INSERT INTO `report` (`id`, `customer_id`, `reason`, `note`) VALUES
(1, 2, '', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
--
-- Database: `workshop_cii`
--
CREATE DATABASE IF NOT EXISTS `workshop_cii` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `workshop_cii`;

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa_tb`
--

CREATE TABLE `siswa_tb` (
  `id` int(11) NOT NULL,
  `nama` varchar(30) DEFAULT NULL,
  `jenis_kelamin` varchar(20) DEFAULT NULL,
  `jurusan` varchar(30) DEFAULT NULL,
  `alamat` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `siswa_tb`
--

INSERT INTO `siswa_tb` (`id`, `nama`, `jenis_kelamin`, `jurusan`, `alamat`) VALUES
(10, 'ZAZA', 'perempuan', 'MI', 'dfdsfsd'),
(12, 'KAKA', 'laki', 'TI', ''),
(13, 'sadasdsa', 'laki', 'SI', 'asdasd');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `siswa_tb`
--
ALTER TABLE `siswa_tb`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `siswa_tb`
--
ALTER TABLE `siswa_tb`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
