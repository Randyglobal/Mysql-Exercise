-- MySQL Script generated by MySQL Workbench
-- Fri Sep  8 16:02:33 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema restaurant_company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema restaurant_company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurant_company` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `restaurant_company` ;

-- -----------------------------------------------------
-- Table `restaurant_company`.`quoter`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`quoter` (
  `quoter_id` INT NOT NULL,
  PRIMARY KEY (`quoter_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`city`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`city` (
  `city_id` INT NOT NULL,
  PRIMARY KEY (`city_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`country`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`country` (
  `country_id` INT NOT NULL,
  PRIMARY KEY (`country_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`address` (
  `Address_id` INT NOT NULL,
  `quoter_quoter_id` INT NOT NULL,
  `city_city_id` INT NOT NULL,
  `country_country_id` INT NOT NULL,
  PRIMARY KEY (`Address_id`, `quoter_quoter_id`, `city_city_id`, `country_country_id`),
  INDEX `fk_address_quoter1_idx` (`quoter_quoter_id` ASC) VISIBLE,
  INDEX `fk_address_city1_idx` (`city_city_id` ASC) VISIBLE,
  INDEX `fk_address_country1_idx` (`country_country_id` ASC) VISIBLE,
  CONSTRAINT `fk_address_quoter1`
    FOREIGN KEY (`quoter_quoter_id`)
    REFERENCES `restaurant_company`.`quoter` (`quoter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_city1`
    FOREIGN KEY (`city_city_id`)
    REFERENCES `restaurant_company`.`city` (`city_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_address_country1`
    FOREIGN KEY (`country_country_id`)
    REFERENCES `restaurant_company`.`country` (`country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`dishes_prepared`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`dishes_prepared` (
  `Prepared_id` INT NOT NULL,
  `prepared_date` DATE NULL DEFAULT NULL,
  `Served_date` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`Prepared_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`dishes` (
  `Serial_number` INT NOT NULL,
  `Name` VARCHAR(25) NOT NULL,
  `Description` VARCHAR(25) NOT NULL,
  `Purchase_price` INT NOT NULL,
  `dishes_prepared_Prepared_id` INT NOT NULL,
  PRIMARY KEY (`Serial_number`, `dishes_prepared_Prepared_id`),
  INDEX `fk_dishes_dishes_prepared1_idx` (`dishes_prepared_Prepared_id` ASC) VISIBLE,
  CONSTRAINT `fk_dishes_dishes_prepared1`
    FOREIGN KEY (`dishes_prepared_Prepared_id`)
    REFERENCES `restaurant_company`.`dishes_prepared` (`Prepared_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`categorys`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`categorys` (
  `Category_id` INT NOT NULL,
  `Dessert` INT NOT NULL,
  `dishes_Serial_number` INT NOT NULL,
  `dishes_dishes_prepared_Prepared_id` INT NOT NULL,
  PRIMARY KEY (`Category_id`),
  INDEX `fk_categorys_dishes1_idx` (`dishes_Serial_number` ASC, `dishes_dishes_prepared_Prepared_id` ASC) VISIBLE,
  CONSTRAINT `fk_categorys_dishes1`
    FOREIGN KEY (`dishes_Serial_number` , `dishes_dishes_prepared_Prepared_id`)
    REFERENCES `restaurant_company`.`dishes` (`Serial_number` , `dishes_prepared_Prepared_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`customers` (
  `Customer_id` INT NOT NULL,
  `Firstname` VARCHAR(25) NOT NULL,
  `Lastname` VARCHAR(25) NOT NULL,
  `address_Address_id` INT NOT NULL,
  `address_quoter_quoter_id` INT NOT NULL,
  `address_city_city_id` INT NOT NULL,
  `address_country_country_id` INT NOT NULL,
  PRIMARY KEY (`Customer_id`, `address_Address_id`, `address_quoter_quoter_id`, `address_city_city_id`, `address_country_country_id`),
  INDEX `fk_customers_address1_idx` (`address_Address_id` ASC, `address_quoter_quoter_id` ASC, `address_city_city_id` ASC, `address_country_country_id` ASC) VISIBLE,
  CONSTRAINT `fk_customers_address1`
    FOREIGN KEY (`address_Address_id` , `address_quoter_quoter_id` , `address_city_city_id` , `address_country_country_id`)
    REFERENCES `restaurant_company`.`address` (`Address_id` , `quoter_quoter_id` , `city_city_id` , `country_country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`waiters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`waiters` (
  `Waiter_id` INT NOT NULL,
  `Surname` VARCHAR(25) NOT NULL,
  `Firstname` VARCHAR(25) NOT NULL,
  `Fixed_salary` INT NOT NULL,
  `address_Address_id` INT NOT NULL,
  `address_quoter_quoter_id` INT NOT NULL,
  `address_city_city_id` INT NOT NULL,
  `address_country_country_id` INT NOT NULL,
  PRIMARY KEY (`Waiter_id`, `address_Address_id`, `address_quoter_quoter_id`, `address_city_city_id`, `address_country_country_id`),
  INDEX `fk_waiters_address1_idx` (`address_Address_id` ASC, `address_quoter_quoter_id` ASC, `address_city_city_id` ASC, `address_country_country_id` ASC) VISIBLE,
  CONSTRAINT `fk_waiters_address1`
    FOREIGN KEY (`address_Address_id` , `address_quoter_quoter_id` , `address_city_city_id` , `address_country_country_id`)
    REFERENCES `restaurant_company`.`address` (`Address_id` , `quoter_quoter_id` , `city_city_id` , `country_country_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`orders` (
  `Order_id` INT NOT NULL,
  `waiters_Waiter_id` INT NOT NULL,
  `customers_Customer_id` INT NOT NULL,
  PRIMARY KEY (`Order_id`, `waiters_Waiter_id`),
  INDEX `fk_orders_waiters1_idx` (`waiters_Waiter_id` ASC) VISIBLE,
  INDEX `fk_orders_customers1_idx` (`customers_Customer_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_waiters1`
    FOREIGN KEY (`waiters_Waiter_id`)
    REFERENCES `restaurant_company`.`waiters` (`Waiter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_customers1`
    FOREIGN KEY (`customers_Customer_id`)
    REFERENCES `restaurant_company`.`customers` (`Customer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`restaurant`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`restaurant` (
  `Restaurant_id` INT NOT NULL,
  `waiters_Waiter_id` INT NOT NULL,
  PRIMARY KEY (`Restaurant_id`),
  INDEX `fk_restaurant_waiters1_idx` (`waiters_Waiter_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_waiters1`
    FOREIGN KEY (`waiters_Waiter_id`)
    REFERENCES `restaurant_company`.`waiters` (`Waiter_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`Restaurant_Dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`Restaurant_Dishes` (
  `Restaurant_Dishes_id` INT NOT NULL,
  `dishes_Serial_number` INT NOT NULL,
  `dishes_dishes_prepared_Prepared_id` INT NOT NULL,
  PRIMARY KEY (`Restaurant_Dishes_id`, `dishes_Serial_number`, `dishes_dishes_prepared_Prepared_id`),
  INDEX `fk_Restaurant_Dishes_dishes1_idx` (`dishes_Serial_number` ASC, `dishes_dishes_prepared_Prepared_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurant_Dishes_dishes1`
    FOREIGN KEY (`dishes_Serial_number` , `dishes_dishes_prepared_Prepared_id`)
    REFERENCES `restaurant_company`.`dishes` (`Serial_number` , `dishes_prepared_Prepared_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `restaurant_company`.`transfer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`transfer` (
  `Transfer_id` INT NOT NULL,
  `Transfer_date` DATE NOT NULL,
  `Delivererd` DATE NOT NULL,
  `Restaurant_Dishes_Restaurant_Dishes_id` INT NOT NULL,
  `Restaurant_Dishes_dishes_Serial_number` INT NOT NULL,
  `Restaurant_Dishes_dishes_dishes_prepared_Prepared_id` INT NOT NULL,
  PRIMARY KEY (`Transfer_id`),
  INDEX `fk_transfer_Restaurant_Dishes1_idx` (`Restaurant_Dishes_Restaurant_Dishes_id` ASC, `Restaurant_Dishes_dishes_Serial_number` ASC, `Restaurant_Dishes_dishes_dishes_prepared_Prepared_id` ASC) VISIBLE,
  CONSTRAINT `fk_transfer_Restaurant_Dishes1`
    FOREIGN KEY (`Restaurant_Dishes_Restaurant_Dishes_id` , `Restaurant_Dishes_dishes_Serial_number` , `Restaurant_Dishes_dishes_dishes_prepared_Prepared_id`)
    REFERENCES `restaurant_company`.`Restaurant_Dishes` (`Restaurant_Dishes_id` , `dishes_Serial_number` , `dishes_dishes_prepared_Prepared_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`restaurant_has_dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`restaurant_has_dishes` (
  `restaurant_Restaurant_id` INT NOT NULL,
  `dishes_Serial_number` INT NOT NULL,
  PRIMARY KEY (`restaurant_Restaurant_id`, `dishes_Serial_number`),
  INDEX `fk_restaurant_has_dishes_dishes1_idx` (`dishes_Serial_number` ASC) VISIBLE,
  INDEX `fk_restaurant_has_dishes_restaurant_idx` (`restaurant_Restaurant_id` ASC) VISIBLE,
  CONSTRAINT `fk_restaurant_has_dishes_restaurant`
    FOREIGN KEY (`restaurant_Restaurant_id`)
    REFERENCES `restaurant_company`.`restaurant` (`Restaurant_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_restaurant_has_dishes_dishes1`
    FOREIGN KEY (`dishes_Serial_number`)
    REFERENCES `restaurant_company`.`dishes` (`Serial_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `restaurant_company`.`orders_has_dishes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `restaurant_company`.`orders_has_dishes` (
  `orders_Order_id` INT NOT NULL,
  `dishes_Serial_number` INT NOT NULL,
  PRIMARY KEY (`orders_Order_id`, `dishes_Serial_number`),
  INDEX `fk_orders_has_dishes_dishes1_idx` (`dishes_Serial_number` ASC) VISIBLE,
  INDEX `fk_orders_has_dishes_orders1_idx` (`orders_Order_id` ASC) VISIBLE,
  CONSTRAINT `fk_orders_has_dishes_orders1`
    FOREIGN KEY (`orders_Order_id`)
    REFERENCES `restaurant_company`.`orders` (`Order_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_orders_has_dishes_dishes1`
    FOREIGN KEY (`dishes_Serial_number`)
    REFERENCES `restaurant_company`.`dishes` (`Serial_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
