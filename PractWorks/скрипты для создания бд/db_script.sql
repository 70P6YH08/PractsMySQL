-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pr1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pr1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pr1` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `Pr1` ;

-- -----------------------------------------------------
-- Table `Pr1`.`Authors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pr1`.`Authors` (
  `author_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `country` VARCHAR(50) NOT NULL DEFAULT 'Россия',
  PRIMARY KEY (`author_id`),
  UNIQUE INDEX `surname_UNIQUE` (`surname` ASC, `name` ASC) INVISIBLE)
ENGINE = InnoDB
ROW_FORMAT = DEFAULT;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pr1`.`Books`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pr1`.`Books` (
  `book_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `author_id` INT UNSIGNED NOT NULL,
  `title` VARCHAR(50) NOT NULL,
  `genre` ENUM('проза', 'поэзия', 'другое') NOT NULL DEFAULT 'проза',
  `price` DECIMAL(6,2) UNSIGNED NOT NULL DEFAULT 0,
  `weight` DECIMAL(4,3) UNSIGNED NOT NULL DEFAULT 0,
  `pages` SMALLINT UNSIGNED NOT NULL DEFAULT 0,
  `public_year` SMALLINT UNSIGNED NULL,
  PRIMARY KEY (`book_id`),
  INDEX `fk_Books_Authors_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_Authors`
    FOREIGN KEY (`author_id`)
    REFERENCES `Pr1`.`Authors` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pr1`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pr1`.`Customers` (
  `customer_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(20) NOT NULL,
  `surname` VARCHAR(50) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `addres` VARCHAR(100) NOT NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC) VISIBLE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pr1`.`Orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pr1`.`Orders` (
  `order_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `customer_id` INT UNSIGNED NOT NULL,
  `datetime_order` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`order_id`),
  INDEX `fk_Orders_Customers1_idx` (`customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_Orders_Customers1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `Pr1`.`Customers` (`customer_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `Pr1`.`Structure`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pr1`.`Structure` (
  `book_id` INT UNSIGNED NOT NULL,
  `order_id` INT UNSIGNED NOT NULL,
  `count` TINYINT NULL DEFAULT 1
  CHECK(count > 0 AND count <= 100),
  PRIMARY KEY (`book_id`, `order_id`),
  INDEX `fk_Books_has_Orders_Books1_idx` (`book_id` ASC) INVISIBLE,
  INDEX `fk_Books_has_Orders_Orders1_idx` (`order_id` ASC) VISIBLE,
  CONSTRAINT `fk_Books_has_Orders_Books1`
    FOREIGN KEY (`book_id`)
    REFERENCES `Pr1`.`Books` (`book_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Books_has_Orders_Orders1`
    FOREIGN KEY (`order_id`)
    REFERENCES `Pr1`.`Orders` (`order_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
