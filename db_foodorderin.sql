-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 06 Jul 2025 pada 11.09
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_foodorderin`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `nama_kategori` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kontak`
--

CREATE TABLE `kontak` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `pesan` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kontak`
--

INSERT INTO `kontak` (`id`, `nama`, `email`, `pesan`) VALUES
(1, 'Rivzan', 'harivzan01@gmail.com', 'Sukses Terus ya!');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nama_makanan` varchar(100) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `gambar` varchar(255) DEFAULT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`id`, `nama_makanan`, `harga`, `gambar`, `deskripsi`) VALUES
(1, '🍜 Mie Ayam Spesial', 18000, 'Mie-Ayam-Spesial.jpg', 'Mie kuning kenyal disiram kuah kaldu ayam gurih yang kaya rasa, lengkap dengan topping ayam manis, daun bawang segar, dan taburan bawang goreng yang harum.'),
(2, '🍛 Nasi Goreng Kampung', 20000, 'Nasi-Goreng-Kampung.jpg', 'Nasi goreng pedas gurih ala rumahan dengan aroma terasi yang khas, dilengkapi telur mata sapi dan kerupuk renyah.'),
(3, '🥟 Siomay Bandung', 17000, 'Siomay-Bandung.jpg', 'Siomay ikan tenggiri asli dengan tekstur lembut, disajikan bersama bumbu kacang kental yang manis-pedas, plus pelengkap tahu, kol, dan telur.'),
(4, '🍲Soto Betawi ', 25000, 'Soto-Betawi.jpg', 'Soto khas Jakarta dengan kuah santan gurih dan potongan daging sapi empuk. Disajikan hangat dengan kentang goreng, tomat, dan emping, menciptakan rasa creamy yang khas dan mengenyangkan.'),
(5, '🥩Sate Maranggi', 28000, 'Sate-Maranggi.jpg', 'Potongan daging sapi yang dimarinasi bumbu khas, dibakar hingga wangi dan berkaramel. Disajikan dengan nasi hangat dan sambal kecap segar, cocok buat kamu yang suka sate dengan cita rasa manis-gurih.'),
(6, '🥖Roti Bakar Coklat Keju', 13000, 'Roti-Bakar-Coklat-Keju.jpg', 'Roti panggang renyah berisi lelehan coklat dan parutan keju melimpah.'),
(7, '🍱Bento Ayam Katsu', 27000, 'Bento-Ayam-Katsu.jpg', 'Ayam fillet digoreng tepung garing khas Jepang, disajikan dengan nasi putih hangat, salad segar, dan saus katsu manis-gurih yang khas.'),
(8, '🍕Pizza Mini Mozzarella', 22000, 'Pizza-Mini-Mozzarella.jpg', 'Pizza ukuran personal dengan roti empuk, saus tomat homemade yang segar, dan keju mozzarella yang meleleh sempurna.'),
(9, '🌮Tacos Ayam Pedas', 18000, 'Tacos-Ayam-Pedas.jpg', 'Tortilla lembut isi ayam suwir pedas, selada, tomat, dan saus mayo spicy.'),
(10, '🍡Takoyaki Isi Gurita (4 pcs)', 16000, 'Takoyaki.jpg', 'Bola-bola adonan gurih dengan isian potongan gurita asli, disajikan dengan saus takoyaki, mayonaise, dan taburan bonito flakes di atasnya. Rasanya creamy, asin, dan gurih.'),
(11, '🐟Ikan Bakar Rica-Rica', 30000, 'Ikan-Bakar-Rica-rica.jpg', 'Ikan segar dibakar dengan bumbu rica-rica khas Manado yang super pedas dan harum.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `tanggal` datetime DEFAULT current_timestamp(),
  `status` varchar(20) DEFAULT 'Pending',
  `sudah_bayar` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','user') DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `role`) VALUES
(1, 'alif', '$2y$10$lpXA3LxwBmOIjUM5F.TSUO0l8saEaUKgI2GuFjwzX0tprYTQbdybG', 'user'),
(2, 'rivzan', '$2y$10$DZKqcbX5foT.qikUyuxt2OMxeLGyJcFJ3N3MwN89kkauS0H7pt7mi', 'user'),
(3, 'admin', '$2y$10$aoFV4wE80QfoNv1ZnhNLC.gjmH4sH/wGBxZhdu3X6dqQ6NQ12A5qu', 'admin'),
(4, 'admin', '$2y$10$aoFV4wE80QfoNv1ZnhNLC.gjmH4sH/wGBxZhdu3X6dqQ6NQ12A5qu', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kontak`
--
ALTER TABLE `kontak`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `menu_id` (`menu_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kontak`
--
ALTER TABLE `kontak`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `pesanan_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pesanan_ibfk_2` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
