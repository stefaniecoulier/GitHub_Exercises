-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema BIT05_Part6_Ex4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema BIT05_Part6_Ex4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BIT05_Part6_Ex4` ;
USE `BIT05_Part6_Ex4` ;

-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Specialist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Specialist` (
  `ID` INT NOT NULL,
  `Field_area` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Doctor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Doctor` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Salary` FLOAT NULL,
  `Medical_ID` FLOAT NOT NULL,
  `Specialist_ID` VARCHAR(45) NOT NULL,
  `Specialist_ID1` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Doctor_Specialist1_idx` (`Specialist_ID1` ASC),
  CONSTRAINT `fk_Doctor_Specialist1`
    FOREIGN KEY (`Specialist_ID1`)
    REFERENCES `BIT05_Part6_Ex4`.`Specialist` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Medical`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Medical` (
  `ID` INT NOT NULL,
  `Overtime_rate` FLOAT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Patient` (
  `ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `Phone_number` VARCHAR(45) NULL,
  `Date_of_birth` DATE NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Appointment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Appointment` (
  `ID` INT NULL,
  `Date` DATE NOT NULL,
  `Time` TIME NULL,
  `Doctor_ID` INT NOT NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`Date`),
  INDEX `fk_Appointment_Doctor1_idx` (`Doctor_ID` ASC),
  INDEX `fk_Appointment_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_Appointment_Doctor1`
    FOREIGN KEY (`Doctor_ID`)
    REFERENCES `BIT05_Part6_Ex4`.`Doctor` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Appointment_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `BIT05_Part6_Ex4`.`Patient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Payment` (
  `ID` INT NOT NULL,
  `Details` BLOB NULL,
  `Method` ENUM('Visa', 'Cash', 'Credit Card') NULL,
  `Patient_ID` INT NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_Payment_Patient1_idx` (`Patient_ID` ASC),
  CONSTRAINT `fk_Payment_Patient1`
    FOREIGN KEY (`Patient_ID`)
    REFERENCES `BIT05_Part6_Ex4`.`Patient` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Bill` (
  `ID` INT NOT NULL,
  `Total` FLOAT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `BIT05_Part6_Ex4`.`Payment_has_Bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `BIT05_Part6_Ex4`.`Payment_has_Bill` (
  `Payment_ID` INT NOT NULL,
  `Bill_ID` INT NOT NULL,
  PRIMARY KEY (`Payment_ID`, `Bill_ID`),
  INDEX `fk_Payment_has_Bill_Bill1_idx` (`Bill_ID` ASC),
  INDEX `fk_Payment_has_Bill_Payment1_idx` (`Payment_ID` ASC),
  CONSTRAINT `fk_Payment_has_Bill_Payment1`
    FOREIGN KEY (`Payment_ID`)
    REFERENCES `BIT05_Part6_Ex4`.`Payment` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Payment_has_Bill_Bill1`
    FOREIGN KEY (`Bill_ID`)
    REFERENCES `BIT05_Part6_Ex4`.`Bill` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
