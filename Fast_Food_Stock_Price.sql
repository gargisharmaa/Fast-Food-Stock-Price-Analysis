CREATE DATABASE IF NOT EXISTS Stocks;
#drop database stocks;
USE Stocks;

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE IF NOT EXISTS `BRK-A` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'BRK-A'
);

CREATE TABLE IF NOT EXISTS `DNUT` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'DNUT' 
);

CREATE TABLE IF NOT EXISTS `DPZ` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'DPZ' 
);

CREATE TABLE IF NOT EXISTS `LKNCY` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'LKNCY'
);

CREATE TABLE IF NOT EXISTS `MCD` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'MCD'
);

CREATE TABLE IF NOT EXISTS `PZZA` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'PZZA' 
);

CREATE TABLE IF NOT EXISTS `QSR` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'QSR' 
);

CREATE TABLE IF NOT EXISTS `SBUX` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'SBUX' 
);

CREATE TABLE IF NOT EXISTS `WEN` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'WEN' 
);

CREATE TABLE IF NOT EXISTS `YUM` (
    `Date` DATE,
    `Open` DECIMAL(10, 2),
    `High` DECIMAL(10, 2),
    `Low` DECIMAL(10, 2),
    `Close` DECIMAL(10, 2),
    `Adj_Close` DECIMAL(10, 2),
    `Volume` INT,
    `Month` INT NULL,
    `Quarter` INT NULL,
    `Company` VARCHAR(20) DEFAULT 'YUM' 
);

CREATE TABLE IF NOT EXISTS stock_predictions (
    Company VARCHAR(10) NOT NULL,
    ds DATE NOT NULL,
    Predicted_Price FLOAT,
    Lower_Confidence_Interval FLOAT,
    Upper_Confidence_Interval FLOAT,
    PRIMARY KEY (Company, ds)
);

CREATE TABLE IF NOT EXISTS merged_stock_data (
    Date DATE,
    Open DECIMAL(10, 2),
    High DECIMAL(10, 2),
    Low DECIMAL(10, 2),
    Close DECIMAL(10, 2),
    Adj_Close DECIMAL(10, 2),
    Volume BIGINT,
    Company VARCHAR(20),
    Month INT,
    Quarter INT
);


INSERT INTO merged_stock_data (Date, Open, High, Low, Close, Adj_Close, Volume, Company)
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `BRK-A`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `DNUT`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `DPZ`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `LKNCY`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `MCD`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `PZZA`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `QSR`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `SBUX`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `WEN`
UNION ALL
SELECT Date, Open, High, Low, Close, Adj_Close, Volume, Company FROM `YUM`;
