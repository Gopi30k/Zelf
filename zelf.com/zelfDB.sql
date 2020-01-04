DROP DATABASE IF EXISTS `zelf`;
CREATE DATABASE `zelf`;

USE `zelf`;


DROP TABLE IF EXISTS `zelf`.`resource`;
CREATE TABLE  `zelf`.`resource` (
  `resourceid` int(10) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(150) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `password` varchar(40) NOT NULL,
  `email` varchar(200) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `phonenumber` varchar(12) NOT NULL,
  `dob` date NOT NULL,  
  `address` varchar(100) DEFAULT NULL,
  `bioInfo` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`resourceid`,`username`)
);

DESC RESOURCE;

INSERT INTO RESOURCE (resourceid,firstname,lastname,username,password,EMAIL,gender,phonenumber,dob)
VALUES ('1011','Gopi','Krishnan','Gopi30k','testPass!','gopikrish3004@gmail.com','MALE','987654123','1996-04-30');

select * from RESOURCE;

