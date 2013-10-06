-- Delete any existing wedding database

DROP DATABASE IF EXISTS wedding;
CREATE DATABASE wedding;
USE wedding;

-- Define the gifts table

CREATE TABLE `gifts` (
  `gift_id` SMALLINT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(255) NOT NULL,
  `shop` VARCHAR(100) NOT NULL,
  `quantity` SMALLINT NOT NULL,
  `color` VARCHAR(30) DEFAULT NULL,
  `price` VARCHAR(30) DEFAULT NULL,
  `username` VARCHAR(30) DEFAULT NULL,
  PRIMARY KEY  (`gift_id`)
);

-- Define the users table

CREATE TABLE `users` (
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(30) NOT NULL,
  PRIMARY KEY  (`username`)
);
