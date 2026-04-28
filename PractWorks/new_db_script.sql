-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
SHOW WARNINGS;
-- -----------------------------------------------------
-- Schema new_pr1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema new_pr1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `new_pr1` DEFAULT CHARACTER SET utf8mb3 ;
SHOW WARNINGS;
USE `new_pr1` ;

-- -----------------------------------------------------
-- Table `pr1`.`authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`authors` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(50) NOT NULL DEFAULT 'Россия',
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `surname_UNIQUE` (`surname` ASC, `name` ASC) INVISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 35
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`books` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `genre` ENUM('проза', 'поэзия', 'другое') NOT NULL DEFAULT 'проза',
  `price` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT '0.00',
  `weight` DECIMAL(4,3) UNSIGNED NOT NULL DEFAULT '0.000',
  `pages` SMALLINT UNSIGNED NOT NULL DEFAULT '0',
  `public_year` SMALLINT UNSIGNED NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_Books_Authors_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `new_pr1`.`authors` (`author_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 53
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`books_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`books_info` (
  `book_id` INT NOT NULL AUTO_INCREMENT,
  `book_title` VARCHAR(50) NULL DEFAULT NULL,
  `author_surname` VARCHAR(50) NULL DEFAULT NULL,
  `author_name` VARCHAR(50) NULL DEFAULT NULL,
  `public_year` SMALLINT NULL DEFAULT NULL,
  `book_price` DECIMAL(6,2) NULL DEFAULT NULL,
  `count_pages` SMALLINT NULL DEFAULT NULL,
  PRIMARY KEY (`book_id`),
  UNIQUE INDEX `unique_tsn` (`book_title` ASC, `author_surname` ASC, `author_name` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `addres` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 10
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `new_pr1`.`games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`games` (
  `idGame` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `description` VARCHAR(500) NULL DEFAULT NULL,
  `category` VARCHAR(50) NOT NULL,
  `price` DECIMAL(18,2) NOT NULL,
  PRIMARY KEY (`idGame`),
  FULLTEXT INDEX `description` (`description`) VISIBLE,
  FULLTEXT INDEX `description_name` (`name`, `description`) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `new_pr1`.`my_event_table`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`my_event_table` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `eventTime` DATETIME NULL DEFAULT NULL,
  `eventName` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 129
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `datetime_order` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  INDEX `fk_Orders_Customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `new_pr1`.`customers` (`customer_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
AUTO_INCREMENT = 7
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`structure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`structure` (
  `book_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `count` TINYINT NULL DEFAULT '1',
  PRIMARY KEY (`book_id`, `order_id`),
  INDEX `fk_Books_has_Orders_Books1_idx` (`book_id` ASC) INVISIBLE,
  INDEX `fk_Books_has_Orders_Orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_has_Orders_Books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `new_pr1`.`books` (`book_id`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Books_has_Orders_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `new_pr1`.`orders` (`order_id`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`tempbooks`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`tempbooks` (
  `surname` VARCHAR(50) NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `title_book` VARCHAR(50) NULL DEFAULT NULL,
  `price_book` DECIMAL(6,2) NULL DEFAULT NULL)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`video_games`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`video_games` (
  `Title` VARCHAR(200) NULL DEFAULT NULL,
  `MaxPlayers` TINYINT NULL DEFAULT NULL,
  `Genres` VARCHAR(100) NULL DEFAULT NULL,
  `Release Console` VARCHAR(100) NULL DEFAULT NULL,
  `ReleaseYear` SMALLINT NULL DEFAULT NULL,
  FULLTEXT INDEX `genre` (`Genres`) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `pr1`.`shipment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `new_pr1`.`shipment` (
  `shipment_id` INT NOT NULL,
  `book_id` INT UNSIGNED NOT NULL,
  `count` SMALLINT UNSIGNED NOT NULL,
  `shipment_date` SMALLINT NULL,
  PRIMARY KEY (`shipment_id`),
  INDEX `fk_shipment_books1_idx` (`book_id` ASC) VISIBLE,
  CONSTRAINT `fk_shipment_books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `new_pr1`.`books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
