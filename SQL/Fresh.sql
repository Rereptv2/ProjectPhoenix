-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.4.0.6659
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for projectphoenix
CREATE DATABASE IF NOT EXISTS `projectphoenix` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;
USE `projectphoenix`;

-- Dumping structure for table projectphoenix.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.apartments: ~1 rows (approximately)
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(3, 'apartment55839', 'apartment5', 'Fantastic Plaza 5839', 'REF10868');

-- Dumping structure for table projectphoenix.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table projectphoenix.bank_accounts: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.bank_accounts_new
CREATE TABLE IF NOT EXISTS `bank_accounts_new` (
  `id` varchar(50) NOT NULL,
  `amount` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  `auth` longtext DEFAULT '[]',
  `isFrozen` int(11) DEFAULT 0,
  `creator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.bank_accounts_new: ~11 rows (approximately)
INSERT INTO `bank_accounts_new` (`id`, `amount`, `transactions`, `auth`, `isFrozen`, `creator`) VALUES
	('ambulance', 0, '[]', '[]', 0, NULL),
	('ballas', 0, '[]', '[]', 0, NULL),
	('cardealer', 0, '[]', '[]', 0, NULL),
	('cartel', 0, '[]', '[]', 0, NULL),
	('families', 0, '[]', '[]', 0, NULL),
	('lostmc', 0, '[]', '[]', 0, NULL),
	('mechanic', 0, '[]', '[]', 0, NULL),
	('police', 50, '[{"trans_id":"1ef78fc4-354a-4731-a801-44cb59e51ee8","title":"Personal Account / RSF59658","time":1685903649,"message":"hewllo","trans_type":"deposit","receiver":"Law Enforcement","amount":50,"issuer":"Project Phoenix"}]', '[]', 0, NULL),
	('realestate', 0, '[]', '[]', 0, NULL),
	('triads', 0, '[]', '[]', 0, NULL),
	('vagos', 0, '[]', '[]', 0, NULL);

-- Dumping structure for table projectphoenix.bank_cards
CREATE TABLE IF NOT EXISTS `bank_cards` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cardNumber` varchar(50) DEFAULT NULL,
  `cardPin` varchar(50) DEFAULT NULL,
  `cardActive` tinyint(4) DEFAULT 1,
  `cardLocked` tinyint(4) DEFAULT 0,
  `cardType` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `record_id` (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table projectphoenix.bank_cards: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table projectphoenix.bank_statements: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.bans: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'qbit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.crypto: ~0 rows (approximately)
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('qbit', 1003, '[{"NewWorth":1000,"PreviousWorth":1007},{"NewWorth":1000,"PreviousWorth":1007},{"NewWorth":1000,"PreviousWorth":1007},{"PreviousWorth":1000,"NewWorth":1003}]');

-- Dumping structure for table projectphoenix.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.crypto_transactions: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.dealers: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Dumping data for table projectphoenix.dpkeybinds: ~0 rows (approximately)
INSERT INTO `dpkeybinds` (`id`, `keybind1`, `emote1`, `keybind2`, `emote2`, `keybind3`, `emote3`, `keybind4`, `emote4`, `keybind5`, `emote5`, `keybind6`, `emote6`) VALUES
	('license:77d729d6d03cc754a0cfae92ad5dfda1d7ad0244', 'num4', '', 'num5', '', 'num6', '', 'num7', '', 'num8', '', 'num9', '');

-- Dumping structure for table projectphoenix.fuel_stations
CREATE TABLE IF NOT EXISTS `fuel_stations` (
  `location` int(11) NOT NULL,
  `owned` int(11) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT NULL,
  `fuelprice` int(11) DEFAULT NULL,
  `balance` int(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.fuel_stations: ~27 rows (approximately)
INSERT INTO `fuel_stations` (`location`, `owned`, `owner`, `fuel`, `fuelprice`, `balance`, `label`) VALUES
	(1, 0, '0', 100000, 3, 0, 'Davis Avenue Ron'),
	(2, 0, '0', 100000, 3, 0, 'Grove Street LTD'),
	(3, 0, '0', 100000, 3, 0, 'Dutch London Xero'),
	(4, 0, '0', 100000, 3, 0, 'Little Seoul LTD'),
	(5, 0, '0', 100000, 3, 0, 'Strawberry Ave Xero'),
	(6, 0, '0', 100000, 3, 0, 'Popular Street Ron'),
	(7, 0, '0', 100000, 3, 0, 'Capital Blvd Ron'),
	(8, 0, '0', 100000, 3, 0, 'Mirror Park LTD'),
	(9, 0, '0', 100000, 3, 0, 'Clinton Ave Globe Oil'),
	(10, 0, '0', 100000, 3, 0, 'North Rockford Ron'),
	(11, 0, '0', 100000, 3, 0, 'Great Ocean Xero'),
	(12, 0, '0', 100000, 3, 0, 'Paleto Blvd Xero'),
	(13, 0, '0', 100000, 3, 0, 'Paleto Ron'),
	(14, 0, '0', 100000, 3, 0, 'Paleto Globe Oil'),
	(15, 0, '0', 100000, 3, 0, 'Grapeseed LTD'),
	(16, 0, '0', 100000, 3, 0, 'Sandy Shores Xero'),
	(17, 0, '0', 100000, 3, 0, 'Sandy Shores Globe Oil'),
	(18, 0, '0', 100000, 3, 0, 'Senora Freeway Xero'),
	(19, 0, '0', 100000, 3, 0, 'Harmony Globe Oil'),
	(20, 0, '0', 100000, 3, 0, 'Route 68 Globe Oil'),
	(21, 0, '0', 100000, 3, 0, 'Route 68 Workshop Globe O'),
	(22, 0, '0', 100000, 3, 0, 'Route 68 Xero'),
	(23, 0, '0', 100000, 3, 0, 'Route 68 Ron'),
	(24, 0, '0', 100000, 3, 0, 'Rex\'s Diner Globe Oil'),
	(25, 0, '0', 100000, 3, 0, 'Palmino Freeway Ron'),
	(26, 0, '0', 100000, 3, 0, 'North Rockford LTD'),
	(27, 0, '0', 99985, 3, 29, 'Alta Street Globe Oil');

-- Dumping structure for table projectphoenix.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.gloveboxitems: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(1) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.houselocations: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.house_plants: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `raceid` (`raceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.lapraces: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.management_funds: ~12 rows (approximately)
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');

-- Dumping structure for table projectphoenix.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_bolos: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_bulletin: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_clocking
CREATE TABLE IF NOT EXISTS `mdt_clocking` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) NOT NULL DEFAULT '',
  `firstname` varchar(255) NOT NULL DEFAULT '',
  `lastname` varchar(255) NOT NULL DEFAULT '',
  `clock_in_time` varchar(255) NOT NULL DEFAULT '',
  `clock_out_time` varchar(50) DEFAULT NULL,
  `total_time` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_clocking: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_convictions: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_data: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_impound: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_incidents: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_logs: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_reports: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  `points` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_vehicleinfo: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.mdt_weaponinfo
CREATE TABLE IF NOT EXISTS `mdt_weaponinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `serial` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `weapClass` varchar(50) DEFAULT NULL,
  `weapModel` varchar(50) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.mdt_weaponinfo: ~2 rows (approximately)
INSERT INTO `mdt_weaponinfo` (`id`, `serial`, `owner`, `information`, `weapClass`, `weapModel`, `image`) VALUES
	(1, '20VLA4PS009dMkb', 'Project Phoenix', 'Purchased at Ammunation', '1', 'Walther P99', 'https://cfx-nui-qb-inventory/html/images/weapon_pistol.png'),
	(2, '94pCT5Yx304eCeN', 'Project Phoenix', 'Purchased at Ammunation', '1', 'Knife', 'https://cfx-nui-qb-inventory/html/images/weapon_knife.png');

-- Dumping structure for table projectphoenix.newspaper
CREATE TABLE IF NOT EXISTS `newspaper` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `story_type` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(5000) NOT NULL DEFAULT '',
  `body` varchar(5000) NOT NULL DEFAULT '',
  `date` varchar(50) DEFAULT '',
  `jailed_player` varchar(50) DEFAULT NULL,
  `jailed_time` varchar(50) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `publisher` varchar(250) NOT NULL DEFAULT 'Los Santos Newspaper',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.newspaper: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.occasion_vehicles: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_chatrooms
CREATE TABLE IF NOT EXISTS `phone_chatrooms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_code` varchar(10) NOT NULL,
  `room_name` varchar(15) NOT NULL,
  `room_owner_id` varchar(20) DEFAULT NULL,
  `room_owner_name` varchar(60) DEFAULT NULL,
  `room_members` text DEFAULT '{}',
  `room_pin` varchar(50) DEFAULT NULL,
  `unpaid_balance` decimal(10,2) DEFAULT 0.00,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `room_code` (`room_code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_chatrooms: ~3 rows (approximately)
INSERT INTO `phone_chatrooms` (`id`, `room_code`, `room_name`, `room_owner_id`, `room_owner_name`, `room_members`, `room_pin`, `unpaid_balance`, `is_pinned`, `created`) VALUES
	(1, '411', '411', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-06-04 18:15:16'),
	(2, 'lounge', 'The Lounge', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-06-04 18:15:16'),
	(3, 'events', 'Events', 'official', 'Government', '{}', NULL, 0.00, 1, '2023-06-04 18:15:16');

-- Dumping structure for table projectphoenix.phone_chatroom_messages
CREATE TABLE IF NOT EXISTS `phone_chatroom_messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `room_id` int(10) unsigned DEFAULT NULL,
  `member_id` varchar(20) DEFAULT NULL,
  `member_name` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `is_pinned` tinyint(1) DEFAULT 0,
  `created` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_chatroom_messages: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table projectphoenix.phone_gallery: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_invoices: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  `time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_messages: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_note
CREATE TABLE IF NOT EXISTS `phone_note` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` text DEFAULT NULL,
  `text` text DEFAULT NULL,
  `lastupdate` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_note: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `type` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `tweetId` varchar(25) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.phone_tweets: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.players: ~1 rows (approximately)
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`) VALUES
	(61, 'REF10868', 1, 'license:77d729d6d03cc754a0cfae92ad5dfda1d7ad0244', 'Karxi', '{"cash":196,"crypto":0,"bank":7590}', '{"backstory":"placeholder backstory","account":"US05QBCore9362428694","birthdate":"1900-01-01","gender":0,"firstname":"Project","lastname":"Phoenix","phone":"3075991428","nationality":"UK","cid":"1"}', '{"onduty":true,"grade":{"name":"Chief","level":4},"label":"Law Enforcement","name":"police","type":"leo","isboss":true,"payment":150}', '{"name":"none","grade":{"level":0,"name":"none"},"label":"No Gang Affiliaton","isboss":false}', '{"x":1906.6549072265626,"y":2598.369140625,"z":45.7083740234375}', '{"commandbinds":[],"walletid":"QB-17171189","inlaststand":false,"isdead":false,"communityservice":0,"bloodtype":"A-","inside":{"apartment":[]},"ishandcuffed":false,"fingerprint":"ch322X28szZ3809","alias":"NO ALIAS","crypto":{"gne":0,"lme":0,"xcoin":0,"shung":0},"dealerrep":0,"jailitems":[],"fitbit":[],"armor":0,"stress":0,"thirst":100,"callsign":"NO CALLSIGN","attachmentcraftingrep":0,"licences":{"driver":true,"weapon":false,"business":false},"phonedata":{"SerialNumber":17975586,"InstalledApps":[]},"injail":0,"craftingrep":0,"tracker":false,"jobrep":{"trucker":0,"tow":0,"taxi":0,"hotdog":0},"hunger":100,"phone":[],"status":[],"criminalrecord":{"hasRecord":false}}', '[{"info":{"quality":99},"amount":1,"type":"item","created":1686048288,"name":"newspaper","slot":2},{"info":{"quality":97,"gasamount":25},"amount":1,"type":"item","created":1686002073,"name":"jerrycan","slot":3},{"info":{"firstname":"Project","birthdate":"1900-01-01","type":"Class C Driver License","quality":97,"lastname":"Phoenix"},"amount":1,"type":"item","created":1685990456,"name":"driver_license","slot":4},{"info":{"firstname":"Project","nationality":"UK","birthdate":"1900-01-01","gender":0,"citizenid":"REF10868","quality":97,"lastname":"Phoenix"},"amount":1,"type":"item","created":1685990403,"name":"id_card","slot":5},{"info":{"quality":98,"serie":"19uAv0JF383cTOB","ammo":0},"amount":1,"type":"weapon","created":1686004066,"name":"weapon_pistol","slot":6},{"info":{"quality":97},"amount":1,"type":"item","created":1686002188,"name":"phone","slot":25},{"info":{"quality":97,"gasamount":0},"amount":1,"type":"item","created":1686002153,"name":"syphoningkit","slot":13}]', '2023-06-06 13:05:35');

-- Dumping structure for table projectphoenix.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.playerskins: ~1 rows (approximately)
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(6, 'REF10868', '1885233650', '{"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hair":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"skinMix":0,"defaultSkinMix":0.0,"defaultShapeMix":0.0,"shapeMix":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"glass":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":8,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"moles":{"defaultTexture":0,"defaultItem":-1,"item":0,"texture":0},"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0}}', 1);

-- Dumping structure for table projectphoenix.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_contacts: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_houses: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.player_jobs
CREATE TABLE IF NOT EXISTS `player_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobname` varchar(50) DEFAULT NULL,
  `employees` text DEFAULT NULL,
  `maxEmployee` tinyint(11) DEFAULT 15,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_jobs: ~15 rows (approximately)
INSERT INTO `player_jobs` (`id`, `jobname`, `employees`, `maxEmployee`) VALUES
	(106, 'realestate', '[]', 15),
	(107, 'police', '{"REF10868":{"cid":"REF10868","name":"Project Phoenix","grade":4}}', 15),
	(108, 'judge', '[]', 15),
	(109, 'reporter', '[]', 15),
	(110, 'tow', '[]', 15),
	(111, 'taxi', '[]', 15),
	(112, 'bus', '[]', 15),
	(113, 'garbage', '[]', 15),
	(114, 'ambulance', '[]', 15),
	(115, 'lawyer', '[]', 15),
	(116, 'cardealer', '[]', 15),
	(117, 'trucker', '{"RSF59658":{"grade":0,"name":"Project Phoenix","cid":"RSF59658"}}', 15),
	(118, 'vineyard', '[]', 15),
	(119, 'mechanic', '[]', 15),
	(120, 'hotdog', '[]', 15);

-- Dumping structure for table projectphoenix.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_mails: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_outfits: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.player_transactions
CREATE TABLE IF NOT EXISTS `player_transactions` (
  `id` varchar(50) NOT NULL,
  `isFrozen` int(11) DEFAULT 0,
  `transactions` longtext DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_transactions: ~0 rows (approximately)
INSERT INTO `player_transactions` (`id`, `isFrozen`, `transactions`) VALUES
	('RSF59658', 0, '[{"trans_id":"1ef78fc4-354a-4731-a801-44cb59e51ee8","title":"Personal Account / RSF59658","time":1685903649,"message":"hewllo","trans_type":"withdraw","receiver":"Law Enforcement","amount":50,"issuer":"Project Phoenix"}]');

-- Dumping structure for table projectphoenix.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(50) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT NULL,
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  `balance` int(11) NOT NULL DEFAULT 0,
  `paymentamount` int(11) NOT NULL DEFAULT 0,
  `paymentsleft` int(11) NOT NULL DEFAULT 0,
  `financetime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_vehicles: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.player_warns
CREATE TABLE IF NOT EXISTS `player_warns` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `senderIdentifier` varchar(50) DEFAULT NULL,
  `targetIdentifier` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `warnId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.player_warns: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.scenes
CREATE TABLE IF NOT EXISTS `scenes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `creator` varchar(50) DEFAULT NULL,
  `text` mediumtext DEFAULT NULL,
  `color` mediumtext DEFAULT NULL,
  `viewdistance` int(11) DEFAULT NULL,
  `expiration` int(11) DEFAULT NULL,
  `fontsize` decimal(10,1) DEFAULT NULL,
  `fontstyle` int(11) DEFAULT NULL,
  `coords` mediumtext DEFAULT NULL,
  `date_creation` datetime DEFAULT NULL,
  `date_deletion` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- Dumping data for table projectphoenix.scenes: ~0 rows (approximately)

-- Dumping structure for table projectphoenix.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.stashitems: ~1 rows (approximately)
INSERT INTO `stashitems` (`id`, `stash`, `items`) VALUES
	(3, 'Container | 5307 | 3965 |', '[]');

-- Dumping structure for table projectphoenix.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL DEFAULT '[]',
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- Dumping data for table projectphoenix.trunkitems: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
