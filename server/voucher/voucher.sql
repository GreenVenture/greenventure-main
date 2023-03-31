

/******************************************************************************/
-- voucherDB script
/******************************************************************************/

DROP DATABASE IF EXISTS voucherDB;
CREATE DATABASE IF NOT EXISTS voucherDB;

USE voucherDB;

CREATE TABLE IF NOT EXISTS `VOUCHER`(
    `voucherID` INT(5) AUTO_INCREMENT,
    `value` INT,
    `merchant_name` VARCHAR(50),
	`voucher_name` VARCHAR(50),
    `voucher_code` VARCHAR(50),
	`description` VARCHAR(100),
    `pointsRequired` INT,
    `quantity` INT,
    CONSTRAINT voucher_pk PRIMARY KEY (`voucherID`)

);

-- inserting mock data

INSERT INTO `VOUCHER` (`value`,`merchant_name`,`voucher_name`,`voucher_code`,`description`,`pointsRequired`,`quantity`) VALUES(5, 'Fairprice', 'Fairprice $5 Voucher','2303FAIRPRICE5', '$5 OFF total spending, minimum spending of $30 is required',2000,5000);
INSERT INTO `VOUCHER` (`value`,`merchant_name`,`voucher_name`,`voucher_code`,`description`,`pointsRequired`,`quantity`) VALUES(1, 'GongCha', 'GongCha $1 Voucher','2303GONGCHA1','$1 OFF total spending, minimum spending of $10 is required',1000,6700);
INSERT INTO `VOUCHER` (`value`,`merchant_name`,`voucher_name`,`voucher_code`,`description`,`pointsRequired`,`quantity`) VALUES(2, 'Liho', 'Liho $2 Voucher','2303LIHO2','$2 OFF total spending, minimum spending of $10 is required',1500,10000);
INSERT INTO `VOUCHER` (`value`,`merchant_name`,`voucher_name`,`voucher_code`,`description`,`pointsRequired`,`quantity`) VALUES(5, 'Redmart', 'Redmart $5 Voucher','2303REDMART5','$5 OFF total spending, minimum spending of $30 is required',1500,10000);
