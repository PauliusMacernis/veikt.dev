SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `veikt`
--

-- --------------------------------------------------------

--
-- Table structure for table `testing`
--

CREATE TABLE IF NOT EXISTS `testing` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1;

--
-- Dumping data for table `testing`
--

INSERT INTO `testing` (`name`) VALUES
('Test');

--
-- Table structure for table `job`
--

CREATE TABLE `job` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`project` VARCHAR(50) NULL DEFAULT NULL COMMENT 'Name of the project. The same as code directory, for example: \'cvbankas.lt\'',
	`idInSourceSystem` TEXT NULL COMMENT 'Id of the job ad in the source system, for example id of a job ad in cvbankas.lt could look like: "1-4268463"',
	`html` MEDIUMTEXT NULL COMMENT 'Job ad in raw HTML format. Just put here as found.',
	`url` VARCHAR(2083) NULL DEFAULT NULL COMMENT 'URL of job ad. The URL points to the original job.',
	`statistics` MEDIUMTEXT NULL COMMENT 'Statistics related to the job ad. Raw HTML format. Just put here as found. Statistics are not part of html column.',
	`created` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'When the entry was added to this DB',
	PRIMARY KEY (`id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
