DROP DATABASE IF EXISTS `test`;

CREATE DATABASE `test` DEFAULT CHARACTER SET utf8 collate utf8_general_ci;

use `test`;

CREATE TABLE `test` (
    `uid` VARCHAR(32) NOT NULL,
    UNIQUE (`uid`)
);


CREATE USER 'ctf'@'localhost' IDENTIFIED BY 'random_password';
GRANT all privileges ON test.* TO 'ctf'@'localhost';

CREATE USER 'backup'@'localhost' IDENTIFIED BY 'another_random_password';
GRANT SELECT ON test.* TO 'backup'@'localhost';
