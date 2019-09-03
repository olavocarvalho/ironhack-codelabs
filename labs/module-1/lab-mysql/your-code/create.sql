USE lab_mysql;
CREATE TABLE `cars`(
  `id` INT,
  `vin` VARCHAR(255),
  `manufactured_year` INT,
  `model` VARCHAR(255),
  `manufacturer` VARCHAR(255),
  `color` VARCHAR(255),
  PRIMARY KEY (`vin`)
);

CREATE TABLE `customers`(
  `id` INT,
  `customer_id` INT,
  `name` VARCHAR(255),
  `phone_number` VARCHAR(255),
  `email` VARCHAR(255),
  `address` VARCHAR(255),
  `city` VARCHAR(255),
  `state` VARCHAR(255),
  `country` VARCHAR(255),
  `postal_code` VARCHAR(255),
  PRIMARY KEY (`customer_id`)
);

CREATE TABLE `salespersons`(
  `id` INT,
  `staff_id` INT,
  `name` VARCHAR(255),
  `store` VARCHAR(255),
  PRIMARY KEY (`staff_id`)
);

CREATE TABLE `invoices`(
  `id` INT,
  `invoice_number` VARCHAR(255) UNIQUE,
  `sell_date` date,
  `car` VARCHAR(255),
  `customer` INT,
  `salesperson` INT,
  PRIMARY KEY (`invoice_number`, `salesperson`)
);

ALTER TABLE `invoices` ADD FOREIGN KEY (`car`) REFERENCES `cars` (`vin`);
ALTER TABLE `invoices` ADD FOREIGN KEY (`customer`) REFERENCES `customers` (`customer_id`);
ALTER TABLE `invoices` ADD FOREIGN KEY (`salesperson`) REFERENCES `salespersons` (`staff_id`);