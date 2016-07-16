-- -----------------------------------------------------
-- Schema rest
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `rest` DEFAULT CHARACTER SET utf8 ;
USE `rest` ;

-- -----------------------------------------------------
-- Table `rest`.`admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rest`.`admin` (
  `idadmin` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idadmin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rest`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rest`.`client` (
  `idclient` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idclient`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rest`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rest`.`menu` (
  `idmenu` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `price` DECIMAL(10,0) NULL DEFAULT NULL,
  PRIMARY KEY (`idmenu`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rest`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rest`.`order` (
  `idorder` INT(11) NOT NULL AUTO_INCREMENT,
  `idclient` INT(11) NULL DEFAULT NULL,
  `dataOrder` DATETIME NULL DEFAULT NULL,
  `idadmin` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idorder`),
  UNIQUE INDEX `idorder_UNIQUE` (`idorder` ASC),
  INDEX `idclient_idx` (`idclient` ASC),
  INDEX `idadmin_idx` (`idadmin` ASC),
  CONSTRAINT `idadmin`
    FOREIGN KEY (`idadmin`)
    REFERENCES `rest`.`admin` (`idadmin`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idclient`
    FOREIGN KEY (`idclient`)
    REFERENCES `rest`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `rest`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `rest`.`invoice` (
  `idinvoice` INT(11) NOT NULL AUTO_INCREMENT,
  `idmenu` INT(11) NULL DEFAULT NULL,
  `idorder` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idinvoice`),
  INDEX `idmenu_idx` (`idmenu` ASC),
  INDEX `idorder_idx` (`idorder` ASC),
  CONSTRAINT `idmenu`
    FOREIGN KEY (`idmenu`)
    REFERENCES `rest`.`menu` (`idmenu`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idorder`
    FOREIGN KEY (`idorder`)
    REFERENCES `rest`.`order` (`idorder`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;