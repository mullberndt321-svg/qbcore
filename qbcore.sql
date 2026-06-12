CREATE DATABASE IF NOT EXISTS `qbcore`;
USE `qbcore`;

-- PLAYERS
CREATE TABLE IF NOT EXISTS `players` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50) NOT NULL,
  `license` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  `money` LONGTEXT NOT NULL,
  `charinfo` LONGTEXT,
  `job` LONGTEXT NOT NULL,
  `gang` LONGTEXT,
  `position` LONGTEXT NOT NULL,
  `metadata` LONGTEXT NOT NULL,
  `inventory` LONGTEXT,
  `last_updated` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- INVENTORY
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(50) NOT NULL,
  `items` LONGTEXT,
  PRIMARY KEY (`id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PLAYER VEHICLES
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `license` VARCHAR(50),
  `citizenid` VARCHAR(50),
  `vehicle` VARCHAR(50),
  `plate` VARCHAR(20),
  `garage` VARCHAR(50),
  `fuel` INT DEFAULT 100,
  `engine` INT DEFAULT 1000,
  `body` INT DEFAULT 1000,
  `state` INT DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BANK ACCOUNTS
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50),
  `account_name` VARCHAR(50),
  `account_balance` INT DEFAULT 0,
  `account_type` VARCHAR(50),
  `users` LONGTEXT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BANK STATEMENTS
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50),
  `account_name` VARCHAR(50),
  `amount` INT,
  `reason` VARCHAR(255),
  `statement_type` VARCHAR(50),
  `date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- BANS
CREATE TABLE IF NOT EXISTS `bans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `license` VARCHAR(255),
  `discord` VARCHAR(255),
  `ip` VARCHAR(255),
  `reason` TEXT,
  `expire` INT,
  `bannedby` VARCHAR(255),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- APARTMENTS
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  `type` VARCHAR(255),
  `label` VARCHAR(255),
  `citizenid` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- DEALERS
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50),
  `coords` LONGTEXT,
  `time` LONGTEXT,
  `createdby` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- CRYPTO
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` VARCHAR(50) NOT NULL,
  `worth` INT DEFAULT 0,
  `history` LONGTEXT,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- PHONE
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50),
  `number` VARCHAR(50),
  `messages` LONGTEXT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50),
  `name` VARCHAR(50),
  `number` VARCHAR(50),
  `iban` VARCHAR(50),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `citizenid` VARCHAR(50),
  `sender` VARCHAR(50),
  `subject` VARCHAR(50),
  `message` LONGTEXT,
  `read` TINYINT DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
