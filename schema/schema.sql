SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `SysGym` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `SysGym` ;

-- -----------------------------------------------------
-- Table `SysGym`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`Empleado` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`Empleado` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(45) NOT NULL ,
  `password` BLOB NOT NULL ,
  `nombre` VARCHAR(50) NULL ,
  `direccion` VARCHAR(100) NULL ,
  `telefono_particular` VARCHAR(20) NULL ,
  `telefono_movil` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SysGym`.`General`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`General` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`General` (
  `variable` VARCHAR(20) NOT NULL ,
  `valor` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`variable`) ,
  UNIQUE INDEX `variable_UNIQUE` (`variable` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SysGym`.`Estado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`Estado` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`Estado` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SysGym`.`Categoria`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`Categoria` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`Categoria` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SysGym`.`Maquina`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`Maquina` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`Maquina` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descripcion` VARCHAR(100) NULL ,
  `Categoria_id` INT NULL ,
  `Estado_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) ,
  INDEX `fk_Maquina_Estado` (`Estado_id` ASC) ,
  INDEX `fk_Maquina_Categoria` (`Categoria_id` ASC) ,
  CONSTRAINT `fk_Maquina_Estado`
    FOREIGN KEY (`Estado_id` )
    REFERENCES `SysGym`.`Estado` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Maquina_Categoria`
    FOREIGN KEY (`Categoria_id` )
    REFERENCES `SysGym`.`Categoria` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SysGym`.`Socio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SysGym`.`Socio` ;

CREATE  TABLE IF NOT EXISTS `SysGym`.`Socio` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(90) NOT NULL ,
  `direccion` VARCHAR(45) NULL ,
  `telefono_movil` VARCHAR(45) NULL ,
  `telefono_particular` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `idSocio_UNIQUE` (`id` ASC) )
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
