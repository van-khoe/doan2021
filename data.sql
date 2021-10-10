-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema medican
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema medican
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `medican` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `medican` ;

-- -----------------------------------------------------
-- Table `medican`.`taikhoan`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`taikhoan` (
  `username` VARCHAR(45) NOT NULL,
  `hoten` VARCHAR(45) NOT NULL,
  `matkhau` VARCHAR(45) NOT NULL,
  `diachi` VARCHAR(45) NOT NULL,
  `gioitinh` BIT(1) NOT NULL,
  `sdt` VARCHAR(45) NOT NULL,
  `ngaysinh` DATE NOT NULL,
  `trangthai` BIT(1) NOT NULL,
  PRIMARY KEY (`username`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`vaitro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`vaitro` (
  `idvaitro` VARCHAR(10) NOT NULL,
  `ten` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idvaitro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`capquyen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`capquyen` (
  `idcapquyen` INT NOT NULL AUTO_INCREMENT,
  `taikhoan_username` VARCHAR(45) NOT NULL,
  `vaitro_idvaitro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idcapquyen`, `taikhoan_username`, `vaitro_idvaitro`),
  INDEX `fk_capquyen_taikhoan_idx` (`taikhoan_username` ASC) VISIBLE,
  INDEX `fk_capquyen_vaitro1_idx` (`vaitro_idvaitro` ASC) VISIBLE,
  CONSTRAINT `fk_capquyen_taikhoan`
    FOREIGN KEY (`taikhoan_username`)
    REFERENCES `medican`.`taikhoan` (`username`),
  CONSTRAINT `fk_capquyen_vaitro1`
    FOREIGN KEY (`vaitro_idvaitro`)
    REFERENCES `medican`.`vaitro` (`idvaitro`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`vacxin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`vacxin` (
  `idvacxin` VARCHAR(45) NOT NULL,
  `tenvacxin` VARCHAR(45) NOT NULL,
  `tenhang` VARCHAR(45) NOT NULL,
  `tenquocgia` VARCHAR(45) NOT NULL,
  `thoigianmui2` INT NOT NULL,
  PRIMARY KEY (`idvacxin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`dangkytiemchung`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`dangkytiemchung` (
  `iddangkytiemchung` INT NOT NULL AUTO_INCREMENT,
  `hoten` VARCHAR(45) NOT NULL,
  `ngaysinh` DATE NOT NULL,
  `gioitinh` BIT(1) NOT NULL,
  `cmnd` VARCHAR(45) NOT NULL,
  `ngaytiem` DATE NOT NULL,
  `tiensubenh` VARCHAR(100) NOT NULL,
  `vacxin_idvacxin` VARCHAR(45) NOT NULL,
  `taikhoan_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddangkytiemchung`, `vacxin_idvacxin`, `taikhoan_username`),
  INDEX `fk_dangkytiemchung_vacxin1_idx` (`vacxin_idvacxin` ASC) VISIBLE,
  INDEX `fk_dangkytiemchung_taikhoan1_idx` (`taikhoan_username` ASC) VISIBLE,
  CONSTRAINT `fk_dangkytiemchung_taikhoan1`
    FOREIGN KEY (`taikhoan_username`)
    REFERENCES `medican`.`taikhoan` (`username`),
  CONSTRAINT `fk_dangkytiemchung_vacxin1`
    FOREIGN KEY (`vacxin_idvacxin`)
    REFERENCES `medican`.`vacxin` (`idvacxin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`dottiem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`dottiem` (
  `iddottiem` VARCHAR(50) NOT NULL,
  `ngaytiem` DATE NOT NULL,
  `diadiemtiem` VARCHAR(100) NOT NULL,
  `thoigiandienra` TIME NOT NULL,
  `vacxin_idvacxin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddottiem`, `vacxin_idvacxin`),
  INDEX `fk_dottiem_vacxin1_idx` (`vacxin_idvacxin` ASC) VISIBLE,
  CONSTRAINT `fk_dottiem_vacxin1`
    FOREIGN KEY (`vacxin_idvacxin`)
    REFERENCES `medican`.`vacxin` (`idvacxin`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`khaibaoyte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`khaibaoyte` (
  `idkhaibaoyte` BIGINT NOT NULL AUTO_INCREMENT,
  `hoten` VARCHAR(50) NOT NULL,
  `cmnd` VARCHAR(50) NOT NULL,
  `ngaysinh` DATE NOT NULL,
  `gioitinh` BIT(1) NOT NULL,
  `diachi` VARCHAR(100) NOT NULL,
  `bieuhien` VARCHAR(100) NOT NULL,
  `tiepxuc` VARCHAR(100) NOT NULL,
  `khaiho` BIT(1) NOT NULL,
  `taikhoan_username` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idkhaibaoyte`, `taikhoan_username`),
  INDEX `fk_khaibaoyte_taikhoan1_idx` (`taikhoan_username` ASC) VISIBLE,
  CONSTRAINT `fk_khaibaoyte_taikhoan1`
    FOREIGN KEY (`taikhoan_username`)
    REFERENCES `medican`.`taikhoan` (`username`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`nhanvien`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`nhanvien` (
  `idnhanvien` VARCHAR(45) NOT NULL,
  `hoten` VARCHAR(45) NOT NULL,
  `sdt` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `hinhanh` VARCHAR(45) NOT NULL,
  `trangthai` BIT(1) NOT NULL,
  PRIMARY KEY (`idnhanvien`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`lichsutiem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`lichsutiem` (
  `idlichsutiem` BIGINT NOT NULL AUTO_INCREMENT,
  `ngaytiem` DATE NOT NULL,
  `loso` VARCHAR(45) NOT NULL,
  `dottiem_iddottiem` VARCHAR(50) NOT NULL,
  `dangkytiemchung_iddangkytiemchung` INT NOT NULL,
  `nhanvien_idnhanvien` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idlichsutiem`, `dottiem_iddottiem`, `dangkytiemchung_iddangkytiemchung`, `nhanvien_idnhanvien`),
  INDEX `fk_lichsutiem_dottiem1_idx` (`dottiem_iddottiem` ASC) VISIBLE,
  INDEX `fk_lichsutiem_dangkytiemchung1_idx` (`dangkytiemchung_iddangkytiemchung` ASC) VISIBLE,
  INDEX `fk_lichsutiem_nhanvien1_idx` (`nhanvien_idnhanvien` ASC) VISIBLE,
  CONSTRAINT `fk_lichsutiem_dangkytiemchung1`
    FOREIGN KEY (`dangkytiemchung_iddangkytiemchung`)
    REFERENCES `medican`.`dangkytiemchung` (`iddangkytiemchung`),
  CONSTRAINT `fk_lichsutiem_dottiem1`
    FOREIGN KEY (`dottiem_iddottiem`)
    REFERENCES `medican`.`dottiem` (`iddottiem`),
  CONSTRAINT `fk_lichsutiem_nhanvien1`
    FOREIGN KEY (`nhanvien_idnhanvien`)
    REFERENCES `medican`.`nhanvien` (`idnhanvien`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`lichtestcd`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`lichtestcd` (
  `idlichtestcd` INT NOT NULL AUTO_INCREMENT,
  `ngaytest` DATE NOT NULL,
  `soluongnguoitest` INT NOT NULL,
  `mauamtinh` INT NOT NULL,
  `mauduongtinh` INT NOT NULL,
  PRIMARY KEY (`idlichtestcd`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `medican`.`phieudangkylichhen`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `medican`.`phieudangkylichhen` (
  `idphieudangkylichhen` BIGINT NOT NULL AUTO_INCREMENT,
  `cosoyte` VARCHAR(45) NOT NULL,
  `diachi` VARCHAR(45) NOT NULL,
  `ngaytiem` DATE NOT NULL,
  `giotiem` TIME NOT NULL,
  `phidichvu` FLOAT NOT NULL,
  `dangkytiemchung_iddangkytiemchung` INT NOT NULL,
  PRIMARY KEY (`idphieudangkylichhen`, `dangkytiemchung_iddangkytiemchung`),
  INDEX `fk_phieudangkylichhen_dangkytiemchung1_idx` (`dangkytiemchung_iddangkytiemchung` ASC) VISIBLE,
  CONSTRAINT `fk_phieudangkylichhen_dangkytiemchung1`
    FOREIGN KEY (`dangkytiemchung_iddangkytiemchung`)
    REFERENCES `medican`.`dangkytiemchung` (`iddangkytiemchung`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
