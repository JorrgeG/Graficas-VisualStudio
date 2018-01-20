# --------------------------------------------------------
# Host:                         127.0.0.1
# Server version:               5.5.5-10.1.21-MariaDB
# Server OS:                    Win32
# HeidiSQL version:             6.0.0.3603
# Date/time:                    2018-01-20 18:32:04
# --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

# Dumping database structure for bdgraficas
CREATE DATABASE IF NOT EXISTS `bdgraficas` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bdgraficas`;


# Dumping structure for table bdgraficas.eleccioncarro
CREATE TABLE IF NOT EXISTS `eleccioncarro` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `marcafavorita` varchar(50) DEFAULT '0',
  `modelo` int(20) DEFAULT '0',
  `velocidad` int(20) DEFAULT '0',
  `estabilidad` varchar(50) DEFAULT '0',
  `precio` int(20) DEFAULT '0',
  `cantidad` int(20) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

# Data exporting was unselected.
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
