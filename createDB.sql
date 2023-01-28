-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server Version:               10.6.5-MariaDB - mariadb.org binary distribution
-- Server Betriebssystem:        Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Exportiere Datenbank Struktur für m254
CREATE DATABASE IF NOT EXISTS `m254` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `m254`;

-- Exportiere Struktur von Tabelle m254.bets
CREATE TABLE IF NOT EXISTS `bets` (
  `bet_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(50) DEFAULT NULL,
  `team1` varchar(50) DEFAULT NULL,
  `team2` varchar(50) DEFAULT NULL,
  `status` varchar(25) DEFAULT NULL,
  `winner` varchar(25) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  PRIMARY KEY (`bet_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle m254.bets: ~3 rows (ungefähr)
/*!40000 ALTER TABLE `bets` DISABLE KEYS */;
INSERT INTO `bets` (`bet_id`, `category`, `team1`, `team2`, `status`, `winner`, `startTime`) VALUES
	(1, 'football', 'Barcelona', 'Real Madrid', 'finished', 'Barcelona', NULL),
	(2, 'basketball', 'Lakers', 'Barcelona', 'running', NULL, NULL),
	(3, 'football', 'Manchester United', 'Bayern Munich', 'running', NULL, '2023-01-27 23:50:00');
/*!40000 ALTER TABLE `bets` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle m254.bettings
CREATE TABLE IF NOT EXISTS `bettings` (
  `betting_id` int(11) NOT NULL AUTO_INCREMENT,
  `amount` int(11) NOT NULL DEFAULT 0,
  `user_fk` int(11) NOT NULL DEFAULT 0,
  `bet_fk` int(11) NOT NULL DEFAULT 0,
  `bet_for` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`betting_id`),
  KEY `user_fk` (`user_fk`),
  KEY `bet_fk` (`bet_fk`),
  CONSTRAINT `bet_fk` FOREIGN KEY (`bet_fk`) REFERENCES `bets` (`bet_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_fk` FOREIGN KEY (`user_fk`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle m254.bettings: ~6 rows (ungefähr)
/*!40000 ALTER TABLE `bettings` DISABLE KEYS */;
INSERT INTO `bettings` (`betting_id`, `amount`, `user_fk`, `bet_fk`, `bet_for`) VALUES
	(1, 100, 1, 1, 'Barcelona'),
	(2, 150, 1, 2, 'Lakers'),
	(3, 200, 2, 1, 'Barcelona'),
	(4, 300, 2, 3, 'team2'),
	(5, 20, 2, 2, 'team1'),
	(6, 10, 1, 1, 'Real Madrid');
/*!40000 ALTER TABLE `bettings` ENABLE KEYS */;

-- Exportiere Struktur von Tabelle m254.users
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `isAdmin` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Exportiere Daten aus Tabelle m254.users: ~1 rows (ungefähr)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`user_id`, `username`, `password`, `isAdmin`) VALUES
	(1, 'test', 'test', 0),
	(2, 'admin', 'admin', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
