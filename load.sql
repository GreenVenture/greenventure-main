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