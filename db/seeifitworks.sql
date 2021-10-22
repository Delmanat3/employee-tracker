-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `company` ;

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8 ;

USE `company` ;

-- -----------------------------------------------------
-- Table `company`.`department`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `company`.`department` ;

CREATE TABLE IF NOT EXISTS `company`.`department` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`role`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `company`.`role` ;

CREATE TABLE IF NOT EXISTS `company`.`role` (
  `id` INT NOT NULL,
  `title` VARCHAR(45) NOT NULL,
  `salary` DECIMAL NOT NULL,
  `department_id` INT NULL,
  INDEX `department.id_idx` (`department_id` ASC) VISIBLE,
  PRIMARY KEY (`id`),
  -- CONSTRAINT `department.id`
    FOREIGN KEY (`department_id`)
    REFERENCES `company`.`department` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`empolyee`
-- -----------------------------------------------------

DROP TABLE IF EXISTS `company`.`empolyee` ;

CREATE TABLE IF NOT EXISTS `company`.`empolyee` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `role_id` INT NOT NULL,
  `manager_id` INT NOT NULL,
  INDEX `role.id_idx` (`role_id` ASC) VISIBLE,
  INDEX `employee.id_idx` (`manager_id` ASC, `id` ASC) VISIBLE,
  -- CONSTRAINT `role.id`
    FOREIGN KEY (`role_id`)
    REFERENCES `company`.`role` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  -- CONSTRAINT `employee.id`
    FOREIGN KEY (`manager_id` , `id`)
    REFERENCES `company`.`empolyee` (`manager_id` , `id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
