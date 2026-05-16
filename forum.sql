-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Värd: 127.0.0.1
-- Tid vid skapande: 16 maj 2026 kl 21:57
-- Serverversion: 10.4.32-MariaDB
-- PHP-version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Databas: `forum`
--

-- --------------------------------------------------------

--
-- Tabellstruktur `posts`
--

CREATE TABLE `posts` (
  `id` int(5) NOT NULL,
  `author` varchar(10) NOT NULL,
  `text` varchar(200) NOT NULL,
  `time` datetime NOT NULL,
  `topic_id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `posts`
--

INSERT INTO `posts` (`id`, `author`, `text`, `time`, `topic_id`) VALUES
(0, 'mackan', 'Potatisar växer under marken', '2026-05-16 21:09:56', 1),
(0, 'mackan', 'Häftigt!', '2026-05-16 21:10:07', 1),
(0, 'MB', 'Tja', '2026-05-16 21:36:29', 1);

-- --------------------------------------------------------

--
-- Tabellstruktur `topics`
--

CREATE TABLE `topics` (
  `id` int(5) NOT NULL,
  `title` varchar(100) NOT NULL,
  `creator` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `topics`
--

INSERT INTO `topics` (`id`, `title`, `creator`) VALUES
(1, 'Potatisar', 'mackan');

-- --------------------------------------------------------

--
-- Tabellstruktur `users`
--

CREATE TABLE `users` (
  `username` varchar(10) NOT NULL,
  `password` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `id` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumpning av Data i tabell `users`
--

INSERT INTO `users` (`username`, `password`, `email`, `id`) VALUES
('mackan', 'smörgås', 'marcus.bjuggren@skola.taby.se', 0),
('MB', 'smörgås', 'M@B.se', 0);

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Index för tabell `users`
--
ALTER TABLE `users`
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- AUTO_INCREMENT för dumpade tabeller
--

--
-- AUTO_INCREMENT för tabell `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
