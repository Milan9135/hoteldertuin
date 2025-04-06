CREATE SCHEMA IF NOT EXISTS `HotelDerTuin` DEFAULT CHARACTER SET utf8;
USE `HotelDerTuin`;

-- -----------------------------------------------------
-- Table `HotelDerTuin`.`Rooms`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HotelDerTuin`.`Rooms`;

CREATE TABLE IF NOT EXISTS `HotelDerTuin`.`Rooms` (
  `Room_ID` INT NOT NULL AUTO_INCREMENT,
  `RoomNumber` INT NOT NULL,
  `Description` LONGTEXT NULL,
  `Price` DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  `Status` ENUM('available', 'booked') NULL,
  PRIMARY KEY (`Room_ID`)
);

-- -----------------------------------------------------
-- Table `HotelDerTuin`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HotelDerTuin`.`Users`;

CREATE TABLE IF NOT EXISTS `HotelDerTuin`.`Users` (
  `User_ID` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Password` VARCHAR(255) NOT NULL,
  `Role` ENUM('Customer', 'Employee') NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE INDEX `Email_UNIQUE` (`Email` ASC)
);

-- -----------------------------------------------------
-- Table `HotelDerTuin`.`Reservations`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HotelDerTuin`.`Reservations`;

CREATE TABLE IF NOT EXISTS `HotelDerTuin`.`Reservations` (
  `Reservation_ID` INT NOT NULL AUTO_INCREMENT,
  `User_ID` INT NOT NULL,
  `Room_ID` INT NOT NULL,
  `StartTime` DATE NOT NULL,
  `EndTime` DATE NOT NULL,
  PRIMARY KEY (`Reservation_ID`),
  INDEX `User_ID_idx` (`User_ID` ASC),
  INDEX `Room_ID_idx` (`Room_ID` ASC),
  CONSTRAINT `fk_User_ID`
    FOREIGN KEY (`User_ID`)
    REFERENCES `HotelDerTuin`.`Users` (`User_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room_ID`
    FOREIGN KEY (`Room_ID`)
    REFERENCES `HotelDerTuin`.`Rooms` (`Room_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
);
