-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 20, 2025 at 08:35 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gestionfacture`
--
CREATE DATABASE IF NOT EXISTS `gestionfacture` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `gestionfacture`;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `telephone` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telephone` (`telephone`) USING BTREE,
  UNIQUE KEY `email` (`email`(250)) USING BTREE,
  KEY `ClientUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id`, `nom`, `address`, `email`, `telephone`, `idUser`) VALUES
(13, 'bilal3', 'hi', 'bilal@gmail.com', 8778, 32),
(14, 'mohammed', 'mex', 'xxx', 0, 32),
(15, 'client1', 'add1', 'f@g.com', 324433, 32),
(25, 'habib', '......u', 'bousselamhabibe@gmail.com', 680882193, 32),
(26, 'sami', 'RABAT ENIM', 'chahrokhkhan1965@gmail.com', 674090893, 32),
(27, 'ayoub', 'enim Rabat', 'adnane.achibane@enim.ac.ma', 67586947, 36);

-- --------------------------------------------------------

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `commandedate` date NOT NULL,
  `totalamount` float NOT NULL,
  `idClient` int NOT NULL,
  `statuePaiement` tinyint(1) NOT NULL,
  `idPaiement` int DEFAULT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CommandeClient` (`idClient`),
  KEY `CommandePaiement` (`idPaiement`),
  KEY `CommandeUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `commande`
--

INSERT INTO `commande` (`id`, `commandedate`, `totalamount`, `idClient`, `statuePaiement`, `idPaiement`, `idUser`) VALUES
(6, '2025-01-03', 30000, 15, 1, 4, 32),
(7, '2025-01-15', 7024.91, 13, 1, 3, 32),
(13, '2025-01-23', 827086, 25, 1, NULL, 32),
(14, '2025-01-03', 97092.4, 14, 1, NULL, 36),
(15, '2025-01-04', 531000, 26, 1, NULL, 36),
(16, '2025-01-09', 24000, 27, 1, NULL, 36),
(17, '2025-01-08', 36000, 26, 1, NULL, 37);

-- --------------------------------------------------------

--
-- Table structure for table `detailcommande`
--

DROP TABLE IF EXISTS `detailcommande`;
CREATE TABLE IF NOT EXISTS `detailcommande` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantite` int NOT NULL,
  `idProduit` int NOT NULL,
  `idCommande` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `DetailCommandeProduit` (`idProduit`),
  KEY `DetailCommandeCommande` (`idCommande`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `detailcommande`
--

INSERT INTO `detailcommande` (`id`, `quantite`, `idProduit`, `idCommande`) VALUES
(23, 70, 4, 13),
(24, 80, 5, 13),
(25, 80, 2, 13),
(26, 9, 3, 14),
(27, 6, 4, 14),
(28, 10, 5, 14),
(29, 20, 4, 15),
(30, 60, 5, 15),
(31, 10, 4, 16),
(32, 15, 4, 17);

-- --------------------------------------------------------

--
-- Table structure for table `facture`
--

DROP TABLE IF EXISTS `facture`;
CREATE TABLE IF NOT EXISTS `facture` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCommande` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FactureCommande` (`idCommande`),
  KEY `FactureUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `facture`
--

INSERT INTO `facture` (`id`, `idCommande`, `idUser`) VALUES
(16, 6, 32),
(17, 13, 32),
(18, 15, 36),
(19, 16, 36),
(20, 17, 37);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
CREATE TABLE IF NOT EXISTS `notification` (
  `id` int NOT NULL AUTO_INCREMENT,
  `typenotification` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `message` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `datemessage` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

-- --------------------------------------------------------

--
-- Table structure for table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `idCommande` int NOT NULL,
  `idUser` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PaiementCommand` (`idCommande`),
  KEY `PaiementUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `paiement`
--

INSERT INTO `paiement` (`id`, `date`, `idCommande`, `idUser`) VALUES
(3, '2025-01-03', 7, 32),
(4, '2025-01-03', 6, 32);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

DROP TABLE IF EXISTS `permissions`;
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idUser` int NOT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `PermissionUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `idUser`, `permission`) VALUES
(5, 32, 'CREATE_CLIENT'),
(6, 32, 'CREATE_FACTURE'),
(9, 34, 'CREATE_CLIENT'),
(10, 34, 'CREATE_FACTURE'),
(11, 35, 'CREATE_USER'),
(12, 35, 'READ_USER'),
(13, 35, 'UPDATE_USER'),
(14, 35, 'CREATE_CLIENT'),
(15, 35, 'READ_CLIENT'),
(16, 35, 'UPDATE_CLIENT'),
(17, 35, 'DELETE_CLIENT'),
(18, 36, 'CREATE_USER'),
(19, 36, 'UPDATE_USER'),
(20, 36, 'DELETE_USER'),
(21, 36, 'CREATE_CLIENT'),
(22, 37, 'CREATE_USER'),
(23, 37, 'READ_USER'),
(24, 37, 'UPDATE_USER'),
(25, 37, 'CREATE_CLIENT'),
(26, 37, 'READ_CLIENT'),
(27, 37, 'DELETE_COMMANDE'),
(28, 37, 'CREATE_PRODUIT'),
(29, 37, 'CREATE_PAIEMENT'),
(30, 37, 'MAIL');

-- --------------------------------------------------------

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
CREATE TABLE IF NOT EXISTS `produit` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `prix` float NOT NULL,
  `quantitéDisponible` int NOT NULL DEFAULT '0',
  `idUser` int NOT NULL,
  `tva` float NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nom` (`nom`(250)) USING BTREE,
  KEY `ProduitUser` (`idUser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `produit`
--

INSERT INTO `produit` (`id`, `nom`, `prix`, `quantitéDisponible`, `idUser`, `tva`) VALUES
(2, 'hhhh', 99.2, -118, 32, 90.1),
(3, 'lkkl', 232, 39, 32, 5),
(4, 'produit1', 2000, 1819, 34, 20),
(5, 'produit3', 7000, 4820, 34, 15);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `role` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`,`password`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `role`) VALUES
(32, 'mohammed', '$2a$10$im0x9Ub4bNGHu/GWzBWE9O0C/aIgNoZ/yibwNRbLgaLyFT6.N6ACW', 'UTILISATEUR'),
(34, 'bilal', '$2a$10$Qw3GcEiozlhifsX/pVFRQ.NPtWDuZYwfLvCljvhj8PgklR5lYmotu', 'ADMIN'),
(35, 'mo', '$2a$10$DTu1MJGRuCVQrYhVPpz0i.VbohioOXDInSa0T1T7KPO8UJBSVUN/q', 'User'),
(36, 'test', '$2a$10$wzGeujR4u3i4H8hLmYnZw.QaAHvouZk5L.be7wmhzyOaror9fPQG6', 'User'),
(37, 'ADNANE', '$2a$10$pnsWeQO8X41G5jGfK5wXrehCT1eCK8HFVxqZClCZ7/QRup6wWE3TG', 'Admin');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `ClientUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `CommandeClient` FOREIGN KEY (`idClient`) REFERENCES `client` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CommandePaiement` FOREIGN KEY (`idPaiement`) REFERENCES `paiement` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `CommandeUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `detailcommande`
--
ALTER TABLE `detailcommande`
  ADD CONSTRAINT `DetailCommandeCommande` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `DetailCommandeProduit` FOREIGN KEY (`idProduit`) REFERENCES `produit` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `FactureCommande` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `FactureUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `PaiementCommand` FOREIGN KEY (`idCommande`) REFERENCES `commande` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `PaiementUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `permissions`
--
ALTER TABLE `permissions`
  ADD CONSTRAINT `PermissionUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `produit`
--
ALTER TABLE `produit`
  ADD CONSTRAINT `ProduitUser` FOREIGN KEY (`idUser`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
