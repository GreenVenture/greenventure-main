DROP DATABASE IF EXISTS accountDB;

CREATE DATABASE IF NOT EXISTS accountDB;

use accountDB;

CREATE TABLE IF NOT EXISTS `ACCOUNT` (
    `userID` VARCHAR(50) NOT NULL,
    `name` VARCHAR(20),
    `email` VARCHAR(50),
    `accessToken` TEXT,
    CONSTRAINT account_pk PRIMARY KEY (`userID`)
);

DROP DATABASE IF EXISTS communityDB;

CREATE DATABASE IF NOT EXISTS communityDB;

USE communityDB;

CREATE TABLE IF NOT EXISTS `USERPOST`(
    `postID` INT AUTO_INCREMENT,
    `userID` varchar(50),
    `post_datetime` DATETIME,
    `post` VARCHAR(200),
    CONSTRAINT userpost_pk PRIMARY KEY (`postID`)
);

CREATE TABLE IF NOT EXISTS `POSTACTIVITY`(
    `postID` INT,
    `activity_datetime` DATETIME,
    `action_user` varchar(50),
    `activity` VARCHAR(20),
    `comment` VARCHAR(50),
    CONSTRAINT postactivity_pk PRIMARY KEY (`postID`, `activity_datetime`, `action_user`),
    CONSTRAINT postactivity_fk1 FOREIGN KEY (`postID`) REFERENCES `USERPOST` (`postID`)
);

NSERT INTO `POSTACTIVITY`
VALUES
    (
        '00001',
        '2023-01-03 00:23:24',
        '00002',
        'like',
        NULL
    );

INSERT INTO
    `POSTACTIVITY`
VALUES
    (
        '00001',
        '2023-01-02 00:23:30',
        '00002',
        'comment',
        'goodjob terry!'
    );

INSERT INTO
    `POSTACTIVITY`
VALUES
    (
        '00002',
        '2023-02-03 13:20:12',
        '00003',
        'like',
        NULL
    );

INSERT INTO
    `POSTACTIVITY`
VALUES
    (
        '00003',
        '2023-03-01 04:20:24',
        '00001',
        'like',
        NULL
    );

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

INSERT INTO
    `VOUCHER` (
        `value`,
        `merchant_name`,
        `voucher_name`,
        `voucher_code`,
        `description`,
        `pointsRequired`,
        `quantity`
    )
VALUES
    (
        5,
        'Fairprice',
        'Fairprice $5 Voucher',
        '2303FAIRPRICE5',
        '$5 OFF total spending, minimum spending of $30 is required',
        2000,
        5000
    );

INSERT INTO
    `VOUCHER` (
        `value`,
        `merchant_name`,
        `voucher_name`,
        `voucher_code`,
        `description`,
        `pointsRequired`,
        `quantity`
    )
VALUES
    (
        1,
        'GongCha',
        'GongCha $1 Voucher',
        '2303GONGCHA1',
        '$1 OFF total spending, minimum spending of $10 is required',
        1000,
        6700
    );

INSERT INTO
    `VOUCHER` (
        `value`,
        `merchant_name`,
        `voucher_name`,
        `voucher_code`,
        `description`,
        `pointsRequired`,
        `quantity`
    )
VALUES
    (
        2,
        'Liho',
        'Liho $2 Voucher',
        '2303LIHO2',
        '$2 OFF total spending, minimum spending of $10 is required',
        1500,
        10000
    );

INSERT INTO
    `VOUCHER` (
        `value`,
        `merchant_name`,
        `voucher_name`,
        `voucher_code`,
        `description`,
        `pointsRequired`,
        `quantity`
    )
VALUES
    (
        5,
        'Redmart',
        'Redmart $5 Voucher',
        '2303REDMART5',
        '$5 OFF total spending, minimum spending of $30 is required',
        1500,
        10000
    );

/******************************************************************************/
-- walletDB script
/******************************************************************************/
DROP DATABASE IF EXISTS walletDB;

CREATE DATABASE IF NOT EXISTS walletDB;

USE walletDB;

CREATE TABLE IF NOT EXISTS `WALLET`(
    `walletID` INT AUTO_INCREMENT,
    `userID` VARCHAR(50),
    `points_remaining` INT,
    CONSTRAINT wallet_pk PRIMARY KEY (`walletID`)
);

CREATE TABLE IF NOT EXISTS `WALLETVOUCHER`(
    `walletID` INT,
    `voucherID` VARCHAR(20),
    `voucher_code` VARCHAR(20),
    `used` boolean,
    CONSTRAINT walletvoucher_pk PRIMARY KEY (`walletID`, `voucherID`, `voucher_code`),
    CONSTRAINT walletvoucher_fk1 FOREIGN KEY (`walletID`) REFERENCES `WALLET` (`walletID`)
);

-- inserting mock data
INSERT INTO
    `WALLET` (`userID`, `points_remaining`)
VALUES
    ('162804203307686', 100);

INSERT INTO
    `WALLET` (`userID`, `points_remaining`)
VALUES
    ('162804203307687', 50);

INSERT INTO
    `WALLET` (`userID`, `points_remaining`)
VALUES
    ('162804203307689', 300);

INSERT INTO
    `WALLETVOUCHER`
VALUES
    ('00001', '00001', '2303FAIRPRICE5', false);

INSERT INTO
    `WALLETVOUCHER`
VALUES
    ('00001', '00002', '2303GONGCHA1', false);

INSERT INTO
    `WALLETVOUCHER`
VALUES
    ('00003', '00003', '2303LIHO2', false);