-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Gene`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Gene` (
  `idGene` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `idMutation` INT NULL,
  PRIMARY KEY (`idGene`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Mutation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mutation` (
  `idMutation` INT NOT NULL,
  `chromosomal location` INT NULL,
  `idGene` INT NOT NULL,
  PRIMARY KEY (`idMutation`),
  INDEX `fk_Mutation_1_idx` (`idGene` ASC) VISIBLE,
  CONSTRAINT `fk_Mutation_1`
    FOREIGN KEY (`idGene`)
    REFERENCES `mydb`.`Gene` (`idGene`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Disease`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Disease` (
  `DiagnoseID` INT NOT NULL,
  `Diagnose` VARCHAR(45) NULL,
  `idMutation` INT NOT NULL,
  PRIMARY KEY (`DiagnoseID`),
  INDEX `fk_Disease_1_idx` (`idMutation` ASC) VISIBLE,
  CONSTRAINT `fk_Disease_1`
    FOREIGN KEY (`idMutation`)
    REFERENCES `mydb`.`Mutation` (`idMutation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `Patient_ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Sex` ENUM("M", "F") NULL,
  `age` INT NULL,
  `DiagnoseID` INT NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  INDEX `fk_Patient_1_idx` (`DiagnoseID` ASC) VISIBLE,
  CONSTRAINT `fk_Patient_1`
    FOREIGN KEY (`DiagnoseID`)
    REFERENCES `mydb`.`Disease` (`DiagnoseID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
