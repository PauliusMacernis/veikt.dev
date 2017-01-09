SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

USE `veikt`;

-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.6.26-cll-lve - MySQL Community Server (GPL)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.4.0.5143
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table veikt.job
CREATE TABLE IF NOT EXISTS `job` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `file_datetime` datetime DEFAULT NULL,
  `datetime_updated` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `datetime_imported` datetime DEFAULT NULL,
  `file_browser_id` varchar(1000) DEFAULT NULL,
  `file_project` varchar(100) DEFAULT NULL,
  `file_url` varchar(2100) DEFAULT NULL,
  `file_id` varchar(10000) DEFAULT NULL,
  `file_content_static` mediumtext,
  `file_content_dynamic` text,
  `content_static_without_tags` mediumtext,
  `content_dynamic_without_tags` text,
  `is_published` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Data exporting was unselected.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
