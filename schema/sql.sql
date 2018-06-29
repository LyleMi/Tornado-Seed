DROP DATABASE IF EXISTS `test`;

CREATE DATABASE `test` DEFAULT CHARACTER SET utf8 collate utf8_general_ci;

use `test`;

CREATE TABLE `test` (
    `uid` VARCHAR(32) NOT NULL,
  `created` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`uid`)
);


CREATE USER 'test'@'localhost' IDENTIFIED BY 'random_password';
GRANT all privileges ON test.* TO 'test'@'localhost';

CREATE USER 'backup'@'localhost' IDENTIFIED BY 'another_random_password';
GRANT SELECT ON test.* TO 'backup'@'localhost';
