-- MySQL Script generated by MySQL Workbench
-- Mon Apr  8 11:17:17 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema marketlog
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema marketlog
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `marketlog` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `marketlog` ;

-- -----------------------------------------------------
-- Table `marketlog`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketlog`.`member` (
  `member_no` INT(11) NOT NULL AUTO_INCREMENT,
  `email_id` VARCHAR(50) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `member_pw` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `member_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `joindate` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `postcode` INT(11) NULL DEFAULT NULL,
  `address` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT 'null',
  `detail_address` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT 'null',
  `phone1` INT(11) NULL DEFAULT '0',
  `phone2` INT(11) NULL DEFAULT '0',
  `phone3` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`member_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `marketlog`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketlog`.`address` (
  `address_no` INT(11) NOT NULL AUTO_INCREMENT,
  `member_no` INT(11) NOT NULL,
  `goods_address` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `shipping` INT(11) NULL DEFAULT '0',
  PRIMARY KEY (`address_no`),
  INDEX `member_no_idx` (`member_no` ASC),
  CONSTRAINT `member_no_s`
    FOREIGN KEY (`member_no`)
    REFERENCES `marketlog`.`member` (`member_no`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 12
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `marketlog`.`goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketlog`.`goods` (
  `address_no` INT(11) NOT NULL,
  `goods_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `goods_price` INT(11) NULL DEFAULT '0',
  `goods_no` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`address_no`, `goods_name`),
  CONSTRAINT `address_no`
    FOREIGN KEY (`address_no`)
    REFERENCES `marketlog`.`address` (`address_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `marketlog`.`order_info`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketlog`.`order_info` (
  `order_no` INT(11) NOT NULL AUTO_INCREMENT,
  `member_no` INT(11) NULL DEFAULT NULL,
  `address_no` INT(11) NULL DEFAULT NULL,
  `recipient` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `postcode` INT(11) NULL DEFAULT NULL,
  `address` VARCHAR(500) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `detail_address` VARCHAR(100) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `phone1` INT(11) NULL DEFAULT NULL,
  `phone2` INT(11) NULL DEFAULT NULL,
  `phone3` INT(11) NULL DEFAULT NULL,
  `memo` VARCHAR(600) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  `total_price` INT(11) NULL DEFAULT NULL,
  `order_time` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `order_status` TINYINT(4) NULL DEFAULT '0',
  PRIMARY KEY (`order_no`),
  INDEX `member_no_idx` (`member_no` ASC),
  INDEX `address_no_idx` (`address_no` ASC),
  CONSTRAINT `adress_no`
    FOREIGN KEY (`address_no`)
    REFERENCES `marketlog`.`address` (`address_no`),
  CONSTRAINT `member_no_b`
    FOREIGN KEY (`member_no`)
    REFERENCES `marketlog`.`member` (`member_no`))
ENGINE = InnoDB
AUTO_INCREMENT = 25
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


-- -----------------------------------------------------
-- Table `marketlog`.`order_goods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `marketlog`.`order_goods` (
  `order_no` INT(11) NOT NULL,
  `goods_name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NOT NULL,
  `goods_price` INT(11) NULL DEFAULT NULL,
  `amount` INT(11) NULL DEFAULT NULL,
  `memo` VARCHAR(1000) CHARACTER SET 'utf8' COLLATE 'utf8_bin' NULL DEFAULT NULL,
  INDEX `order_no_idx` (`order_no` ASC),
  PRIMARY KEY (`order_no`),
  CONSTRAINT `order_no`
    FOREIGN KEY (`order_no`)
    REFERENCES `marketlog`.`order_info` (`order_no`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_bin;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
